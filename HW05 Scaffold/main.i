# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "gba.h" 1





typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;






extern volatile unsigned short *videoBuffer;
# 39 "gba.h"
void waitForVBlank();
# 56 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 72 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 104 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 2 "main.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct { u16 tileData[16]; } TILE;
typedef TILE charblock[512];



typedef struct {
 u16 tilemap[1024];
} screenblock;
# 3 "main.c" 2
# 1 "print.h" 1
# 25 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 26 "print.h" 2
# 35 "print.h"

# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 4 "main.c" 2
# 1 "sprites.h" 1
# 10 "sprites.h"
typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];
# 63 "sprites.h"
void hideSprites();


typedef struct {
    int x;
    int y;
    int xDel;
    int yDel;
    int width;
    int height;
    int framesPassed;
    int direction;
    int aniState;
    int aniFrame;
    int numFrames;
    int hide;
} SPRITE;
# 5 "main.c" 2
# 1 "tileset.h" 1
# 9 "tileset.h"
extern const unsigned short tilesetTiles[384];


extern const unsigned short tilesetPal[16];
# 6 "main.c" 2
# 1 "tilemap.h" 1







extern const unsigned short tilemapMap[4096];
# 7 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 8 "main.c" 2
# 1 "game.h" 1
# 9 "game.h"
typedef struct {
    int mainX;
    int mainY;
    int remainingFuel;
    int fuelTimer;
    int depleteX;
    int depleteY;
} FUELBAR;

typedef struct {
    int firstX;
    int firstY;
    int secondX;
    int secondY;
    int thirdX;
    int thirdY;
    int smokeTimer;
    int smokeCooldown;
    int smokeFired;
    int firstHide;
    int secondHide;
    int thirdHide;
} SMOKESCREEN;

typedef struct {
    int x;
    int y;
    int hide;
} ROCK;

typedef struct {
    int lives;
    int oneX;
    int oneY;
    int twoX;
    int twoY;
    int threeX;
    int threeY;
    int oneHide;
    int twoHide;
    int threeHide;
} LIVES;

typedef struct {
    int x;
    int y;
    int hide;
    int collected;
} FLAG;

typedef struct {
    int score1;
    int score2;
    int score3;
} SCORE;

typedef struct {
    int x;
    int y;
    int xDel;
    int yDel;
    int width;
    int height;
    int framesPassed;
    int direction;
    int aniState;
    int aniFrame;
    int numFrames;
    int hide;
    int smoked;
    int smokeTimer;
} ENEMY;




void initGame();
void updateGame();
void drawGame();

void initGame2();

void initFuel();
void initSmoke();
void updatePlayer();
void initRocks();
void initLives();
void initFlags();
void initScore();
void initEnemies();
void updateEnemies();

int canMoveLeft();
int canMoveRight();
int canMoveUp();
int canMoveDown();

void movePlayer();
void animatePlayer();

void hideLogo();

extern int hOff;
extern int vOff;
extern int time;
extern int gameOver;
extern int score;
extern int score1;
extern int score2;
extern int score3;
extern int bonusScore1;
extern int bonusScore2;
# 9 "main.c" 2
# 1 "losescreen.h" 1
# 22 "losescreen.h"
extern const unsigned short losescreenTiles[1472];


extern const unsigned short losescreenMap[1024];


extern const unsigned short losescreenPal[256];
# 10 "main.c" 2
# 1 "tilemap2.h" 1







extern const unsigned short tilemap2Map[4096];
# 11 "main.c" 2
# 1 "winScreen.h" 1
# 22 "winScreen.h"
extern const unsigned short winscreenTiles[2960];


extern const unsigned short winscreenMap[1024];


extern const unsigned short winscreenPal[256];
# 12 "main.c" 2

void testTilemap();
void goToGame();

unsigned short oldButtons;
unsigned short buttons;

int hOff;
int vOff;


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


    while (1) {
        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);

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


        testTilemap();
    }
}

void initialize() {
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);


    (*(volatile unsigned short*)0x4000008) = ((0) << 2) | ((28) << 8) | (3<<14);
    (*(volatile unsigned short*)0x400000A) = ((1) << 2) | ((27) << 8) | (0<<14);
    (*(volatile unsigned short*)0x400000C) = ((0) << 2) | ((23) << 8) | (3<<14);
    (*(volatile unsigned short*)0x400000E) = ((2) << 2) | ((20) << 8) | (0<<14);

    DMANow(3, winscreenTiles, &((charblock *)0x06000000)[2], sizeof(winscreenTiles)/2);
    DMANow(3, winscreenPal, ((unsigned short *)0x5000000), sizeof(winscreenPal)/2);
    DMANow(3, winscreenMap, &((screenblock *)0x6000000)[20], 2048 / 2);

    DMANow(3, losescreenTiles, &((charblock *)0x06000000)[1], sizeof(losescreenTiles)/2);
    DMANow(3, losescreenPal, ((unsigned short *)0x5000000), 32);
    DMANow(3, losescreenMap, &((screenblock *)0x6000000)[27], 2048 / 2);


    DMANow(3, tilesetTiles, &((charblock *)0x06000000)[0], sizeof(tilesetTiles)/2);
    DMANow(3, tilesetPal, ((unsigned short *)0x5000000), sizeof(tilesetPal)/2);
    DMANow(3, tilemapMap, &((screenblock *)0x6000000)[28], (8192) / 2);

    DMANow(3, tilemap2Map, &((screenblock *)0x6000000)[23], (8192) / 2);




    DMANow(3, spritesheetPal, &((u16 *)0x5000200)[0], 512 / 2);
    DMANow(3, spritesheetTiles, &((charblock *)0x06000000)[4], 32768 / 2);

    buttons = (*(volatile unsigned short *)0x04000130);
    oldButtons = 0;

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    goToStart();
}

void goToStart() {
    state = START;
    rSeed = 0;

    hideSprites();
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);


    shadowOAM[1].attr0 = (((160 - 24) / 2) & 0xFF) | (1<<14);
    shadowOAM[1].attr1 = (((240 - 64) / 2) & 0x1FF) | (3<<14);
    shadowOAM[1].attr2 = (((0) & 0xF) <<12) | (((0)*32+(8)) & 0x3FF);
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}

void start() {
    rSeed++;
    waitForVBlank();
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
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

    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
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

    shadowOAM[26].attr0 = (((160 - 8) / 2) & 0xFF) | (1<<14);
    shadowOAM[26].attr1 = (((240 - 32) / 2) & 0x1FF) | (1<<14);
    shadowOAM[26].attr2 = (((0) & 0xF) <<12) | (((2)*32+(16)) & 0x3FF);


    shadowOAM[0].attr0 |= (2<<8);
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    state = PAUSE;
}

void pause() {
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        shadowOAM[26].attr0 |= (2<<8);
        waitForVBlank();
        DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
        if (score >= 10) {
            state = GAME2;
        } else {
            state = GAME1;
        }
    }
}

void goToLose() {
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (1 % 4))) | (1 << 12);
    hideSprites();


    shadowOAM[23].attr0 = ((87) & 0xFF) | (2<<14);
    shadowOAM[23].attr1 = ((120) & 0x1FF) | (0<<14);
    shadowOAM[23].attr2 = (((0) & 0xF) <<12) | (((0)*32+(score1 + 16)) & 0x3FF);


    shadowOAM[24].attr0 = ((87) & 0xFF) | (2<<14);
    shadowOAM[24].attr1 = ((130) & 0x1FF) | (0<<14);
    shadowOAM[24].attr2 = (((0) & 0xF) <<12) | (((0)*32+(score2 + 16)) & 0x3FF);


    shadowOAM[25].attr0 = ((87) & 0xFF) | (2<<14);
    shadowOAM[25].attr1 = ((140) & 0x1FF) | (0<<14);
    shadowOAM[25].attr2 = (((0) & 0xF) <<12) | (((0)*32+(score3 + 16)) & 0x3FF);

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    state = LOSE;
}

void lose() {
    waitForVBlank();
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToStart();
    }
}

void goToGame2() {
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (2 % 4))) | (1 << 12);
    hideSprites();


    shadowOAM[30].attr0 = (((160 - 24) / 2) & 0xFF) | (1<<14);
    shadowOAM[30].attr1 = (((240 - 64) / 2) & 0x1FF) | (3<<14);
    shadowOAM[30].attr2 = (((0) & 0xF) <<12) | (((3)*32+(16)) & 0x3FF);

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    state = GAMETRANSITION;
}

void gameTransition() {

    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        shadowOAM[30].attr0 |= (2<<8);
        initGame2();
        state = GAME2;
    }
}

void game2() {
    updateGame();
    waitForVBlank();
    drawGame();

    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
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
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (3 % 4))) | (1 << 12);
    hideSprites();


    shadowOAM[23].attr0 = ((73) & 0xFF) | (2<<14);
    shadowOAM[23].attr1 = ((130) & 0x1FF) | (0<<14);
    shadowOAM[23].attr2 = (((0) & 0xF) <<12) | (((0)*32+(score1 + 16)) & 0x3FF);

    shadowOAM[24].attr0 = ((73) & 0xFF) | (2<<14);
    shadowOAM[24].attr1 = ((140) & 0x1FF) | (0<<14);
    shadowOAM[24].attr2 = (((0) & 0xF) <<12) | (((0)*32+(score2 + 16)) & 0x3FF);

    shadowOAM[25].attr0 = ((73) & 0xFF) | (2<<14);
    shadowOAM[25].attr1 = ((150) & 0x1FF) | (0<<14);
    shadowOAM[25].attr2 = (((0) & 0xF) <<12) | (((0)*32+(score3 + 16)) & 0x3FF);

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


    shadowOAM[31].attr0 = ((90) & 0xFF) | (2<<14);
    shadowOAM[31].attr1 = ((140) & 0x1FF) | (0<<14);
    shadowOAM[31].attr2 = (((0) & 0xF) <<12) | (((0)*32+(bonusScore11 + 16)) & 0x3FF);

    shadowOAM[32].attr0 = ((90) & 0xFF) | (2<<14);
    shadowOAM[32].attr1 = ((150) & 0x1FF) | (0<<14);
    shadowOAM[32].attr2 = (((0) & 0xF) <<12) | (((0)*32+(bonusScore12 + 16)) & 0x3FF);

    shadowOAM[33].attr0 = ((90) & 0xFF) | (2<<14);
    shadowOAM[33].attr1 = ((160) & 0x1FF) | (0<<14);
    shadowOAM[33].attr2 = (((0) & 0xF) <<12) | (((0)*32+(bonusScore13 + 16)) & 0x3FF);


    shadowOAM[34].attr0 = ((107) & 0xFF) | (2<<14);
    shadowOAM[34].attr1 = ((140) & 0x1FF) | (0<<14);
    shadowOAM[34].attr2 = (((0) & 0xF) <<12) | (((0)*32+(bonusScore21 + 16)) & 0x3FF);

    shadowOAM[35].attr0 = ((107) & 0xFF) | (2<<14);
    shadowOAM[35].attr1 = ((150) & 0x1FF) | (0<<14);
    shadowOAM[35].attr2 = (((0) & 0xF) <<12) | (((0)*32+(bonusScore22 + 16)) & 0x3FF);

    shadowOAM[36].attr0 = ((107) & 0xFF) | (2<<14);
    shadowOAM[36].attr1 = ((160) & 0x1FF) | (0<<14);
    shadowOAM[36].attr2 = (((0) & 0xF) <<12) | (((0)*32+(bonusScore23 + 16)) & 0x3FF);


    shadowOAM[37].attr0 = ((124) & 0xFF) | (2<<14);
    shadowOAM[37].attr1 = ((140) & 0x1FF) | (0<<14);
    shadowOAM[37].attr2 = (((0) & 0xF) <<12) | (((0)*32+(totalScore1 + 16)) & 0x3FF);

    shadowOAM[38].attr0 = ((124) & 0xFF) | (2<<14);
    shadowOAM[38].attr1 = ((150) & 0x1FF) | (0<<14);
    shadowOAM[38].attr2 = (((0) & 0xF) <<12) | (((0)*32+(totalScore2 + 16)) & 0x3FF);

    shadowOAM[39].attr0 = ((124) & 0xFF) | (2<<14);
    shadowOAM[39].attr1 = ((160) & 0x1FF) | (0<<14);
    shadowOAM[39].attr2 = (((0) & 0xF) <<12) | (((0)*32+(totalScore3 + 16)) & 0x3FF);

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    state = WIN;
}

void win() {

    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToStart();
    }
}

void testTilemap() {







}
