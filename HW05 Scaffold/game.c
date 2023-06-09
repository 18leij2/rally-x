#include "game.h"
#include "print.h"
#include "sprites.h"
#include "collisionmap.h"
#include "collisionmap2.h"

inline unsigned char colorAt(int x, int y);

int hOff;
int vOff;
int time;
int score;
int score1;
int score2;
int score3;
int bonusScore1;
int bonusScore2;

int oldX;
int oldY;

int gameOver;
int flagsCollected;

unsigned char* collisionMap;
int collisionsEnabled;

SPRITE player;
FUELBAR fuel;
SMOKESCREEN smoke;
ROCK rocks[3];
LIVES life;
FLAG flags[10];
SCORE scoreDisplay;
ENEMY enemies[3];

enum { UP, RIGHT, DOWN, LEFT, IDLE };

void hideLogo() {
    shadowOAM[1].attr0 |= ATTR0_HIDE;
}

// initializes level 1
void initGame() {
    collisionsEnabled = 1;
    collisionMap = (unsigned char*) collisionmapBitmap;

    hOff = 0;
    vOff = 0;
    time = 0;
    score = 0;
    score1 = 0;
    score2 = 0;
    score3 = 0;
    gameOver = 0;
    bonusScore1 = 0;
    bonusScore2 = 0;
    flagsCollected = 0;

    player.x = 48;
    player.y = 48;
    player.xDel = 2;
    player.yDel = 2;
    player.width = 16;
    player.height = 16;
    player.direction = UP;
    player.aniState = 1;
    player.framesPassed = 0;
    player.aniFrame = 0;
    player.numFrames = 4;
    player.hide = 0;

    oldX = player.x;
    oldY = player.y;
    
    initFuel();
    initSmoke();
    initRocks();
    initlives();
    initFlags();
    initScore();
    initEnemies();
}

// initializes level 2
void initGame2() {
    collisionsEnabled = 1;
    collisionMap = (unsigned char*) collisionmap2Bitmap;

    hOff = 0;
    vOff = 0;
    time = 0;

    gameOver = 0;
    flagsCollected = 0;

    player.x = 48;
    player.y = 48;
    player.xDel = 2;
    player.yDel = 2;
    player.width = 16;
    player.height = 16;
    player.direction = UP;
    player.aniState = 1;
    player.framesPassed = 0;
    player.aniFrame = 0;
    player.numFrames = 4;
    player.hide = 0;

    oldX = player.x;
    oldY = player.y;

    initFuel();
    initSmoke();
    initRocks();
    initlives();
    initFlags();
    initEnemies();
}

// initializes 2 sprites to indicate fuel and remaining fuel
void initFuel() {
    fuel.mainX = SCREENWIDTH - 32;
    fuel.mainY = 6;
    fuel.remainingFuel = 32;
    fuel.fuelTimer = 0;
    fuel.depleteX = SCREENWIDTH;
    fuel.depleteY = 6;
}

// initializes smokescreen ability
void initSmoke() {
    smoke.firstX = 0;
    smoke.firstY = 0;
    smoke.secondX = 0;
    smoke.secondY = 0;
    smoke.thirdX = 0;
    smoke.thirdY = 0;
    smoke.smokeTimer = 0;
    smoke.smokeCooldown = 0;
    smoke.smokeFired = 0;
    smoke.firstHide = 1;
    smoke.secondHide = 1;
    smoke.thirdHide = 1;
}

//initializes random rock placement
void initRocks() {
    for (int i = 0; i < 3; i++) {
        do {
            rocks[i].x = rand() % 512;
            rocks[i].y = rand() % 512;
            rocks[i].hide = 0;
        } while (!(colorAt(rocks[i].x, rocks[i].y) && colorAt(rocks[i].x + 15, rocks[i].y) &&
            colorAt(rocks[i].x, rocks[i].y + 15) && colorAt(rocks[i].x + 15, rocks[i].y + 15)));
    }
}

// initializes lives
void initlives() {
    life.oneX = 5;
    life.oneY = 140;
    life.twoX = 25;
    life.twoY = 140;
    life.threeX = 45;
    life.threeY = 140;
    life.lives = 3;
    life.oneHide = 0;
    life.twoHide = 0;
    life.threeHide = 0;
}

// initializes flags in random places
void initFlags() {
    for (int i = 0; i < 10; i++) {
        do {
            flags[i].x = rand() % 512;
            flags[i].y = rand() % 512;
            flags[i].hide = 0;
            flags[i].collected = 0;
        } while (!(colorAt(flags[i].x, flags[i].y) && colorAt(flags[i].x + 15, flags[i].y) &&
            colorAt(flags[i].x, flags[i].y + 15) && colorAt(flags[i].x + 15, flags[i].y + 15)));
    }
}

// initializes score to 0
void initScore() {
    scoreDisplay.score1 = 0;
    scoreDisplay.score2 = 0;
    scoreDisplay.score3 = 0;
}

// initialize 3 enemies in each corner
void initEnemies() {
    for (int i = 0; i < 3; i++) {
        enemies[i].xDel = 1;
        enemies[i].yDel = 1;
        enemies[i].width = 16;
        enemies[i].height = 16;
        enemies[i].direction = 2;
        enemies[i].aniState = 1;
        enemies[i].framesPassed = 0;
        enemies[i].aniFrame = 0;
        enemies[i].numFrames = 4;
        enemies[i].hide = 0;
        enemies[i].smoked = 0;
    }
    enemies[0].x = 48;
    enemies[0].y = MAPHEIGHT - 54 - enemies[0].height - 2;
    enemies[1].x = MAPWIDTH - 54 - enemies[1].width - 2;
    enemies[1].y = MAPHEIGHT - 54 - enemies[1].height - 2;
    enemies[2].x = MAPWIDTH - 54 - enemies[2].width - 2;
    enemies[2].y = 48;
}

// called every frame
void updateGame() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        collisionsEnabled = !collisionsEnabled;
    }

    movePlayer(&player);
    updatePlayer();
    for (int i = 0; i < 3; i++) {
        updateEnemies(&enemies[i]);
    }
    animatePlayer(&player);

    if (life.lives == 2) {
        life.threeHide = 1;
    } else if (life.lives == 1) {
        life.twoHide = 1;
    } else if (life.lives == 0) {
        life.oneHide = 1;
        gameOver = 1;
    }

    if (fuel.depleteX == fuel.mainX) {
        gameOver = 1;
    }

    // display the score
    scoreDisplay.score1 = (score / 100) % 10;
    scoreDisplay.score2 = (score / 10) % 10;
    scoreDisplay.score3 = score % 10;
    score1 = scoreDisplay.score1;
    score2 = scoreDisplay.score2;
    score3 = scoreDisplay.score3;

    // mgba_printf("Position: (%d, %d)", player.x, player.y);
    time++;
}

void updatePlayer() {
    // every 8 frames, keep track of player's previous position for smokescreen
    if (time % 8 == 0) {
        oldX = player.x;
        oldY = player.y;
    }
    // Every 5 seconds, deplete 1/32 of the fuel
    if (time != 0 && time % 300 == 0) {
        fuel.depleteX--;
    }
    if (smoke.smokeCooldown != 0) {
        smoke.smokeCooldown--;
    } else {
        smoke.smokeFired = 0;
        if (BUTTON_PRESSED(BUTTON_A)) {
            smoke.smokeFired = 1;
            smoke.smokeTimer = 0;
            smoke.smokeCooldown = 240;
            fuel.depleteX -= 3;
        }
    }

    // when the player uses smoke ability, generate smoke for 3 tiles
    if (smoke.smokeFired) {
        if (smoke.smokeTimer == 0) {
            smoke.firstX = oldX;
            smoke.firstY = oldY;
            smoke.firstHide = 0;
        } else if (smoke.smokeTimer == 8) {
            smoke.secondX = oldX;
            smoke.secondY = oldY;
            smoke.secondHide = 0;
        } else if (smoke.smokeTimer == 16) {
            smoke.thirdX = oldX;
            smoke.thirdY = oldY;
            smoke.thirdHide = 0;
        } else if (smoke.smokeTimer == 180) {
            smoke.firstHide = 1;
            smoke.secondHide = 1;
            smoke.thirdHide = 1;
            smoke.firstX = 0;
            smoke.secondX = 0;
            smoke.thirdX = 0;
        }
        smoke.smokeTimer++;
    }

    // when hitting a rock, take away a life and reset player position
    for (int i = 0; i < 3; i++) {
        if (collision(rocks[i].x, rocks[i].y, 16, 16, player.x, player.y, player.width, player.height)) {
            life.lives--;
            player.x = 48;
            player.y = 48;
        }
    }

    // when getting a flag, set it as collected, increase score, and hide flag
    for (int i = 0; i < 10; i++) {
        if (!flags[i].collected && collision(flags[i].x, flags[i].y, 16, 16, player.x, player.y, player.width, player.height)) {
            flagsCollected++;
            flags[i].collected = 1;
            flags[i].hide = 1;
            score++;
            if (score == 10) {
                bonusScore1 = fuel.depleteX - fuel.mainX;
            }
            if (score == 20) {
                bonusScore2 = fuel.depleteX - fuel.mainX;
            }
            mgba_printf("Score: %d", score);
        }
    }
}

// update the enemies
void updateEnemies(ENEMY* e) {
    // if hitting a player, reset player position and subtract lives
    if (collision(e->x, e->y, e->width, e->height, player.x, player.y, player.width, player.height)) {
        life.lives--;
        player.x = 48;
        player.y = 48;
    }
    // if hitting the smoke, stops moving for 6 seconds
    if (collision(e->x, e->y, e->width, e->height, smoke.firstX, smoke.firstY, 16, 16) ||
        collision(e->x, e->y, e->width, e->height, smoke.secondX, smoke.secondY, 16, 16) ||
        collision(e->x, e->y, e->width, e->height, smoke.thirdX, smoke.thirdY, 16, 16)) {
        e->smoked = 1;
        e->smokeTimer = 360;
    }

    // if touched smoke, do the counter, otherwise follow the player
    if (e->smoked) {
        e->smokeTimer--;
        if (e->smokeTimer == 0) {
            e->smoked = 0;
        }
    } else {
        // enemies will move towards player in both x and y directions when possible
        int left = e->x + 1;
        int right = e->x + e->width - 1 - 1;
        int top = e->y + 1;
        int bottom = e->y + e->height - 1 - 1;
        if (player.y - e->y > 0) {
            if (colorAt(left, bottom + e->yDel) && colorAt(right, bottom + player.yDel)) {
                e->y += e->yDel;
                e->direction = DOWN;
            }
        } else if (player.y - e->y < 0) {
            if (colorAt(left, top - e->yDel) && colorAt(right, top - e->yDel)) {
                e->y -= e->yDel;
                e->direction = UP;
            }
        }
        if (player.x - e->x > 0) {
            if (colorAt(right + e->xDel, top) && colorAt(right + e->xDel, bottom)) {
                e->x += e->xDel;
                e->direction = RIGHT;
            }
            return colorAt(right + player.xDel, top + 2) && colorAt(right + player.xDel, bottom - 2);
        } else if (player.x - e->x < 0) {
            if (colorAt(left - e->xDel, top) && colorAt(left - e->xDel, bottom)) {
                e->x -= e->xDel;
                e->direction = LEFT;
            }
        }
    }
}

// draws and hides the sprites depending on settings 
void drawGame() {
    if (player.hide) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[0].attr0 = ATTR0_Y(player.y - vOff) | ATTR0_SQUARE;
        shadowOAM[0].attr1 = ATTR1_X(player.x - hOff) | ATTR1_SMALL;
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.direction * 2, player.aniFrame * 2);
    }

    if (score >= 10) {
        REG_BG2HOFF = hOff;
        REG_BG2VOFF = vOff;
    } else {
        REG_BG0HOFF = hOff;
        REG_BG0VOFF = vOff;
    }

    if (smoke.firstHide || smoke.firstY - vOff + 16 < 0 || smoke.firstY - vOff > 160) {
        shadowOAM[6].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[6].attr0 = ATTR0_Y(smoke.firstY - vOff) | ATTR0_SQUARE;
        shadowOAM[6].attr1 = ATTR1_X(smoke.firstX - hOff) | ATTR1_SMALL;
        shadowOAM[6].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 6);
    }

    if (smoke.secondHide || smoke.secondY - vOff + 16 < 0 || smoke.secondY - vOff > 160) {
        shadowOAM[5].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[5].attr0 = ATTR0_Y(smoke.secondY - vOff) | ATTR0_SQUARE;
        shadowOAM[5].attr1 = ATTR1_X(smoke.secondX - hOff) | ATTR1_SMALL;
        shadowOAM[5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 6);
    }

    if (smoke.thirdHide || smoke.thirdY - vOff + 16 < 0 || smoke.thirdY - vOff > 160) {
        shadowOAM[4].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[4].attr0 = ATTR0_Y(smoke.thirdY - vOff) | ATTR0_SQUARE;
        shadowOAM[4].attr1 = ATTR1_X(smoke.thirdX- hOff) | ATTR1_SMALL;
        shadowOAM[4].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 6);
    }

    for (int i = 7; i < 10; i++) {
        if (rocks[i - 7].hide || rocks[i - 7].y - vOff + 16 < 0 || rocks[i - 7].y - vOff > 160) {
            shadowOAM[i].attr0 |= ATTR0_HIDE;
        } else {
            shadowOAM[i].attr0 = ATTR0_Y(rocks[i - 7].y - vOff) | ATTR0_SQUARE;
            shadowOAM[i].attr1 = ATTR1_X(rocks[i - 7].x - hOff) | ATTR1_SMALL;
            shadowOAM[i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(10, 6);
        }
    }

    if (life.oneHide) {
        shadowOAM[10].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[10].attr0 = ATTR0_Y(life.oneY) | ATTR0_SQUARE;
        shadowOAM[10].attr1 = ATTR1_X(life.oneX) | ATTR1_SMALL;
        shadowOAM[10].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 0);
    }

    if (life.twoHide) {
        shadowOAM[11].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[11].attr0 = ATTR0_Y(life.twoY) | ATTR0_SQUARE;
        shadowOAM[11].attr1 = ATTR1_X(life.twoX) | ATTR1_SMALL;
        shadowOAM[11].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 0);
    }

    if (life.threeHide) {
        shadowOAM[12].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[12].attr0 = ATTR0_Y(life.threeY) | ATTR0_SQUARE;
        shadowOAM[12].attr1 = ATTR1_X(life.threeX) | ATTR1_SMALL;
        shadowOAM[12].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 0);
    }

    for (int i = 13; i < 23; i++) {
        if (flags[i - 13].hide || flags[i - 13].y - vOff + 16 < 0 || flags[i - 13].y - vOff > 160) {
            shadowOAM[i].attr0 |= ATTR0_HIDE;
        } else {
            shadowOAM[i].attr0 = ATTR0_Y(flags[i - 13].y - vOff) | ATTR0_SQUARE;
            shadowOAM[i].attr1 = ATTR1_X(flags[i - 13].x - hOff) | ATTR1_SMALL;
            shadowOAM[i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(12, 6);
        }
    }

    shadowOAM[3].attr0 = ATTR0_Y(fuel.mainY) | ATTR0_WIDE;
    shadowOAM[3].attr1 = ATTR1_X(fuel.mainX) | ATTR1_SMALL;
    shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 4);

    shadowOAM[2].attr0 = ATTR0_Y(fuel.depleteY) | ATTR0_WIDE;
    shadowOAM[2].attr1 = ATTR1_X(fuel.depleteX) | ATTR1_SMALL;
    shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 5);

    shadowOAM[23].attr0 = ATTR0_Y(2) | ATTR0_TALL;
    shadowOAM[23].attr1 = ATTR1_X(2) | ATTR1_TINY;
    shadowOAM[23].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(scoreDisplay.score1 + 16, 0);

    shadowOAM[24].attr0 = ATTR0_Y(2) | ATTR0_TALL;
    shadowOAM[24].attr1 = ATTR1_X(12) | ATTR1_TINY;
    shadowOAM[24].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(scoreDisplay.score2 + 16, 0);   

    shadowOAM[25].attr0 = ATTR0_Y(2) | ATTR0_TALL;
    shadowOAM[25].attr1 = ATTR1_X(22) | ATTR1_TINY;
    shadowOAM[25].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(scoreDisplay.score3 + 16, 0);

    for (int i = 27; i < 30; i++) {
        if (enemies[i - 27].hide || enemies[i - 27].y - vOff + 16 < 0 || enemies[i - 27].y - vOff > 160) {
            shadowOAM[i].attr0 |= ATTR0_HIDE;
        } else {
            shadowOAM[i].attr0 = ATTR0_Y(enemies[i - 27].y - vOff) | ATTR0_SQUARE;
            shadowOAM[i].attr1 = ATTR1_X(enemies[i - 27].x - hOff) | ATTR1_SMALL;
            shadowOAM[i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(enemies[i - 27].direction * 2, 8 + (enemies[i - 27].aniFrame * 2));
        }
    }  

    DMANow(3, shadowOAM, OAM, 512);
}

// inline function for collision detection
inline unsigned char colorAt(int x, int y) {
    return collisionMap[OFFSET(x, y, MAPWIDTH)];
}

int canMoveLeft() {
    if (!collisionsEnabled) return 1;

    int left = player.x;
    // int right = player.x + player.width - 1;
    int top = player.y;
    int bottom = player.y + player.height - 1;

    return colorAt(left - player.xDel, top + 2) && colorAt(left - player.xDel, bottom - 2);
}

int canMoveRight() {
    if (!collisionsEnabled) return 1;

    // int left = player.x;
    int right = player.x + player.width - 1;
    int top = player.y;
    int bottom = player.y + player.height - 1;

    return colorAt(right + player.xDel, top + 2) && colorAt(right + player.xDel, bottom - 2);
}

int canMoveUp() {
    if (!collisionsEnabled) return 1;

    int left = player.x;
    int right = player.x + player.width - 1;
    int top = player.y;
    // int bottom = player.y + player.height - 1;

    return colorAt(left + 2, top - player.yDel) && colorAt(right - 2, top - player.yDel);
}

int canMoveDown() {
    if (!collisionsEnabled) return 1;

    int left = player.x;
    int right = player.x + player.width - 1;
    //int top = player.y;
    int bottom = player.y + player.height - 1;

    return colorAt(left + 2, bottom + player.yDel) && colorAt(right - 2, bottom + player.yDel);
}

void movePlayer() {
    // if no button is held, move forward unless colliding
    if ((!BUTTON_HELD(BUTTON_DOWN) && !BUTTON_HELD(BUTTON_UP) && !BUTTON_HELD(BUTTON_LEFT) && !BUTTON_HELD(BUTTON_RIGHT)) ||
        (BUTTON_HELD(BUTTON_DOWN) && !canMoveDown()) || (BUTTON_HELD(BUTTON_UP) && !canMoveUp()) ||
        (BUTTON_HELD(BUTTON_LEFT) && !canMoveLeft()) || (BUTTON_HELD(BUTTON_RIGHT) && !canMoveRight())) {
        if (player.direction == UP && canMoveUp()) {
            player.y -= player.yDel;
        }

        if (player.direction == DOWN && canMoveDown()) {
            player.y += player.yDel;
        }

        if (player.direction == LEFT && canMoveLeft()) {
            player.x -= player.xDel;
        }

        if (player.direction == RIGHT && canMoveRight()) {
            player.x += player.xDel;
        }
    } else { // if a button is held, move in that direction if no collision
        if (BUTTON_HELD(BUTTON_LEFT) && canMoveLeft()) {
            player.x -= player.xDel;
        }

        if (BUTTON_HELD(BUTTON_RIGHT) && canMoveRight()) {
            player.x += player.xDel;
        }

        if (BUTTON_HELD(BUTTON_UP) && canMoveUp()) {
            player.y -= player.yDel;
        }

        if (BUTTON_HELD(BUTTON_DOWN) && canMoveDown()) {
            player.y += player.yDel;
        }
    }

    // adjust the background offset
    hOff = player.x - (SCREENWIDTH - player.width) / 2;
    vOff = player.y - (SCREENHEIGHT - player.height) / 2;

    // keep player within bounds
    if (player.x < 48) player.x = 48;
    if (player.y < 48) player.y = 48;
    if (score >= 10) {
        if (player.x > MAPWIDTH - 56 - player.width) player.x = MAPWIDTH - 56 - player.width;
        if (player.y > MAPHEIGHT - 56 - player.height + 24) player.y = MAPHEIGHT - 56 - player.height + 24;
    } else {
        if (player.x > MAPWIDTH - 56 - player.width) player.x = MAPWIDTH - 56 - player.width;
        if (player.y > MAPHEIGHT - 56 - player.height) player.y = MAPHEIGHT - 56 - player.height;
    }
    
    // keep screen in bounds
    if (hOff < 0) hOff = 0;
    if (vOff < 0) vOff = 0;
    if (hOff > MAPWIDTH - SCREENWIDTH) hOff = MAPWIDTH - SCREENWIDTH;
    if (vOff > MAPHEIGHT - SCREENHEIGHT) vOff = MAPHEIGHT - SCREENHEIGHT;
}

// animates the player and
void animatePlayer() {
    if (BUTTON_HELD(BUTTON_UP) && canMoveUp()) {
        player.aniState = 1;
        player.direction = UP;
    }

    if (BUTTON_HELD(BUTTON_DOWN) && canMoveDown()) {
        player.aniState = 1;
        player.direction = DOWN;
    }

    if (BUTTON_HELD(BUTTON_LEFT) && canMoveLeft()) {
        player.aniState = 1;
        player.direction = LEFT;
    }

    if (BUTTON_HELD(BUTTON_RIGHT) && canMoveRight()) {
        player.aniState = 1;
        player.direction = RIGHT;
    }

    if (player.aniState) {
        player.framesPassed++;
        if (player.framesPassed == 10) {
            player.framesPassed = 0;
            player.aniFrame = (player.aniFrame + 1) % player.numFrames;
        }
    } else {
        player.aniFrame = 0;
        player.framesPassed = 0;
    }

    for (int i = 0; i < 3; i++) {
        enemies[i].framesPassed++;
        if (enemies[i].framesPassed == 10) {
            enemies[i].framesPassed = 0;
            enemies[i].aniFrame = (enemies[i].aniFrame + 1) % enemies[i].numFrames;
        }
    }
}