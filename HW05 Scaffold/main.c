#include "gba.h"
#include "mode0.h"
#include "print.h"
#include "sprites.h"
#include "tileset.h"
#include "tilemap.h"
#include "spritesheet.h"
#include "game.h"
#include "losescreen.h"
#include "tilemap2.h"
#include "winScreen.h"

void testTilemap();
void goToGame();

unsigned short oldButtons;
unsigned short buttons;

int hOff;
int vOff;

// function prototypes
void initialize();
void goToStart();
void start();
void goToPause();
void pause();
void goToGame1();
void game1();
void goToGame2();
void game2();
void goToWin();
void win();
void goToLose();
void lose();

// state machine
enum {
    START,
    PAUSE,
    GAME1,
    GAMETRANSITION,
    GAME2,
    WIN,
    LOSE
};
int state;

int rSeed;

int main() {
    mgba_open();
    mgba_printf("Debug Log Initialized!");

    initialize();
    // goToGame();

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        switch (state) {
            case START:
                start();
                break;
            case PAUSE:
                pause();
                break;
            case GAME1:
                game1();
                break;
            case GAMETRANSITION:
                gameTransition();
                break;
            case GAME2:
                game2();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }

        // code to check if tilemap has been loaded in correctly
        testTilemap();
    }
}
// initialize function
void initialize() {
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;

    //load in level 1, level 2, win background, and lose background
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_LARGE;
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(27) | BG_SIZE_SMALL;
    REG_BG2CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(23) | BG_SIZE_LARGE;
    REG_BG3CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(20) | BG_SIZE_SMALL;

    DMANow(3, winscreenTiles, &CHARBLOCK[2], sizeof(winscreenTiles)/2);
    DMANow(3, winscreenPal, PALETTE, sizeof(winscreenPal)/2);
    DMANow(3, winscreenMap, &SCREENBLOCK[20], winscreenMapLen / 2);

    DMANow(3, losescreenTiles, &CHARBLOCK[1], sizeof(losescreenTiles)/2);
    DMANow(3, losescreenPal, PALETTE, 32);
    DMANow(3, losescreenMap, &SCREENBLOCK[27], losescreenMapLen / 2);

    // dma the tileset, palette, and tilemap
    DMANow(3, tilesetTiles, &CHARBLOCK[0], sizeof(tilesetTiles)/2); // loading tileset into charblock 0
    DMANow(3, tilesetPal, PALETTE, sizeof(tilesetPal)/2); // loading palette (note: if recoloring, change this palette)
    DMANow(3, tilemapMap, &SCREENBLOCK[28], tilemapMapLen / 2);

    DMANow(3, tilemap2Map, &SCREENBLOCK[23], tilemap2MapLen / 2);



    // dma the sprites
    DMANow(3, spritesheetPal, &SPRITEPALETTE[0], spritesheetPalLen / 2);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);

    buttons = REG_BUTTONS;
    oldButtons = 0;

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);
    goToStart();
}

void goToStart() {
    state = START;
    rSeed = 0;

    hideSprites();
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;

    // show the game logo
    shadowOAM[1].attr0 = ATTR0_Y((SCREENHEIGHT - 24) / 2) | ATTR0_WIDE;
    shadowOAM[1].attr1 = ATTR1_X((SCREENWIDTH - 64) / 2) | ATTR1_LARGE;
    shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 0);
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);
}

void start() {
    rSeed++;
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        hideLogo();
        time = 0;
        srand(rSeed);
        initGame();
        goToGame1();
    }
}

void goToGame1() {
    state = GAME1;
}

void game1() {
    updateGame();
    waitForVBlank();
    drawGame();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }

    if (gameOver) {
        goToLose();
    }

    if (score == 10) {
        goToGame2();
    }
}

void goToPause() {
    // show the pause sprite
    shadowOAM[26].attr0 = ATTR0_Y((SCREENHEIGHT - 8) / 2) | ATTR0_WIDE;
    shadowOAM[26].attr1 = ATTR1_X((SCREENWIDTH - 32) / 2) | ATTR1_SMALL;
    shadowOAM[26].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(16, 2);

    // hide the player car that blocks the pause icon
    shadowOAM[0].attr0 |= ATTR0_HIDE;
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);
    state = PAUSE;
}

void pause() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        shadowOAM[26].attr0 |= ATTR0_HIDE;
        waitForVBlank();
        DMANow(3, shadowOAM, OAM, 512);
        if (score >= 10) {
            state = GAME2;
        } else {
            state = GAME1;
        }
    }
}

void goToLose() {
    REG_DISPCTL = MODE(0) | BG_ENABLE(1) | SPRITE_ENABLE;
    hideSprites();

    // hundreds digit sprite
    shadowOAM[23].attr0 = ATTR0_Y(87) | ATTR0_TALL;
    shadowOAM[23].attr1 = ATTR1_X(120) | ATTR1_TINY;
    shadowOAM[23].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(score1 + 16, 0);

    // tens digit sprite
    shadowOAM[24].attr0 = ATTR0_Y(87) | ATTR0_TALL;
    shadowOAM[24].attr1 = ATTR1_X(130) | ATTR1_TINY;
    shadowOAM[24].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(score2 + 16, 0);

    // ones digit sprite
    shadowOAM[25].attr0 = ATTR0_Y(87) | ATTR0_TALL;
    shadowOAM[25].attr1 = ATTR1_X(140) | ATTR1_TINY;
    shadowOAM[25].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(score3 + 16, 0);

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);
    state = LOSE;
}

void lose() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToGame2() {
    REG_DISPCTL = MODE(0) | BG_ENABLE(2) | SPRITE_ENABLE;
    hideSprites();

    // show the level 2 icon sprite
    shadowOAM[30].attr0 = ATTR0_Y((SCREENHEIGHT - 24) / 2) | ATTR0_WIDE;
    shadowOAM[30].attr1 = ATTR1_X((SCREENWIDTH - 64) / 2) | ATTR1_LARGE;
    shadowOAM[30].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(16, 3);

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    state = GAMETRANSITION;
}

void gameTransition() {
    // press to start level 2
    if (BUTTON_PRESSED(BUTTON_START)) {
        shadowOAM[30].attr0 |= ATTR0_HIDE;
        initGame2();
        state = GAME2;
    }
}

void game2() {
    updateGame();
    waitForVBlank();
    drawGame();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }

    if (gameOver) {
        goToLose();
    }

    if (score == 20) {
        goToWin();
    }
}

void goToWin() {
    REG_DISPCTL = MODE(0) | BG_ENABLE(3) | SPRITE_ENABLE;
    hideSprites();

    // show the flags collected
    shadowOAM[23].attr0 = ATTR0_Y(73) | ATTR0_TALL;
    shadowOAM[23].attr1 = ATTR1_X(130) | ATTR1_TINY;
    shadowOAM[23].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(score1 + 16, 0);

    shadowOAM[24].attr0 = ATTR0_Y(73) | ATTR0_TALL;
    shadowOAM[24].attr1 = ATTR1_X(140) | ATTR1_TINY;
    shadowOAM[24].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(score2 + 16, 0);

    shadowOAM[25].attr0 = ATTR0_Y(73) | ATTR0_TALL;
    shadowOAM[25].attr1 = ATTR1_X(150) | ATTR1_TINY;
    shadowOAM[25].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(score3 + 16, 0);

    int bonusScore11 = (bonusScore1 / 100) % 10;
    int bonusScore12 = (bonusScore1 / 10) % 10;
    int bonusScore13 = (bonusScore1 % 10);
    int bonusScore21 = (bonusScore2 / 100) % 10;
    int bonusScore22 = (bonusScore2 / 10) % 10;
    int bonusScore23 = (bonusScore2 % 10);
    int totalScore = score + bonusScore1 + bonusScore2;
    int totalScore1 = (totalScore / 100) % 10;
    int totalScore2 = (totalScore / 10) % 10;
    int totalScore3 = totalScore % 10;
    
    // show the fuel bonus score for level 1
    shadowOAM[31].attr0 = ATTR0_Y(90) | ATTR0_TALL;
    shadowOAM[31].attr1 = ATTR1_X(140) | ATTR1_TINY;
    shadowOAM[31].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(bonusScore11 + 16, 0);

    shadowOAM[32].attr0 = ATTR0_Y(90) | ATTR0_TALL;
    shadowOAM[32].attr1 = ATTR1_X(150) | ATTR1_TINY;
    shadowOAM[32].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(bonusScore12 + 16, 0);

    shadowOAM[33].attr0 = ATTR0_Y(90) | ATTR0_TALL;
    shadowOAM[33].attr1 = ATTR1_X(160) | ATTR1_TINY;
    shadowOAM[33].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(bonusScore13 + 16, 0);

    // show the bonus fuel for level 2
    shadowOAM[34].attr0 = ATTR0_Y(107) | ATTR0_TALL;
    shadowOAM[34].attr1 = ATTR1_X(140) | ATTR1_TINY;
    shadowOAM[34].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(bonusScore21 + 16, 0);

    shadowOAM[35].attr0 = ATTR0_Y(107) | ATTR0_TALL;
    shadowOAM[35].attr1 = ATTR1_X(150) | ATTR1_TINY;
    shadowOAM[35].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(bonusScore22 + 16, 0);

    shadowOAM[36].attr0 = ATTR0_Y(107) | ATTR0_TALL;
    shadowOAM[36].attr1 = ATTR1_X(160) | ATTR1_TINY;
    shadowOAM[36].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(bonusScore23 + 16, 0);

    // show the final sum score
    shadowOAM[37].attr0 = ATTR0_Y(124) | ATTR0_TALL;
    shadowOAM[37].attr1 = ATTR1_X(140) | ATTR1_TINY;
    shadowOAM[37].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(totalScore1 + 16, 0);

    shadowOAM[38].attr0 = ATTR0_Y(124) | ATTR0_TALL;
    shadowOAM[38].attr1 = ATTR1_X(150) | ATTR1_TINY;
    shadowOAM[38].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(totalScore2 + 16, 0);

    shadowOAM[39].attr0 = ATTR0_Y(124) | ATTR0_TALL;
    shadowOAM[39].attr1 = ATTR1_X(160) | ATTR1_TINY;
    shadowOAM[39].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(totalScore3 + 16, 0);

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);
    state = WIN;
}

void win() {
    // restart the game when finished
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void testTilemap() {
    // if (BUTTON_HELD(BUTTON_RIGHT) && (512-240-hOff > 0)) hOff++;
    // if (BUTTON_HELD(BUTTON_LEFT) && (hOff > 0)) hOff--;
    // if (BUTTON_HELD(BUTTON_UP) && (vOff > 0)) vOff--;
    // if (BUTTON_HELD(BUTTON_DOWN) && (512-160-vOff > 0)) vOff++;
    // waitForVBlank();
    // REG_BG0HOFF = hOff;
    // REG_BG0VOFF = vOff;
}