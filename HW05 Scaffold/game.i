# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "game.h" 1



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
# 5 "game.h" 2
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
# 6 "game.h" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct { u16 tileData[16]; } TILE;
typedef TILE charblock[512];



typedef struct {
 u16 tilemap[1024];
} screenblock;
# 7 "game.h" 2


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
# 2 "game.c" 2
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
# 3 "game.c" 2

# 1 "collisionmap.h" 1
# 21 "collisionmap.h"
extern const unsigned short collisionmapBitmap[131072];


extern const unsigned short collisionmapPal[256];
# 5 "game.c" 2
# 1 "collisionmap2.h" 1
# 21 "collisionmap2.h"
extern const unsigned short collisionmap2Bitmap[131072];


extern const unsigned short collisionmap2Pal[256];
# 6 "game.c" 2

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
    shadowOAM[1].attr0 |= (2<<8);
}


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


void initFuel() {
    fuel.mainX = 240 - 32;
    fuel.mainY = 6;
    fuel.remainingFuel = 32;
    fuel.fuelTimer = 0;
    fuel.depleteX = 240;
    fuel.depleteY = 6;
}


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


void initScore() {
    scoreDisplay.score1 = 0;
    scoreDisplay.score2 = 0;
    scoreDisplay.score3 = 0;
}


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
    enemies[0].y = 512 - 54 - enemies[0].height - 2;
    enemies[1].x = 512 - 54 - enemies[1].width - 2;
    enemies[1].y = 512 - 54 - enemies[1].height - 2;
    enemies[2].x = 512 - 54 - enemies[2].width - 2;
    enemies[2].y = 48;
}


void updateGame() {
    if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
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


    scoreDisplay.score1 = (score / 100) % 10;
    scoreDisplay.score2 = (score / 10) % 10;
    scoreDisplay.score3 = score % 10;
    score1 = scoreDisplay.score1;
    score2 = scoreDisplay.score2;
    score3 = scoreDisplay.score3;


    time++;
}

void updatePlayer() {

    if (time % 8 == 0) {
        oldX = player.x;
        oldY = player.y;
    }

    if (time != 0 && time % 300 == 0) {
        fuel.depleteX--;
    }
    if (smoke.smokeCooldown != 0) {
        smoke.smokeCooldown--;
    } else {
        smoke.smokeFired = 0;
        if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0))))) {
            smoke.smokeFired = 1;
            smoke.smokeTimer = 0;
            smoke.smokeCooldown = 240;
            fuel.depleteX -= 3;
        }
    }


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


    for (int i = 0; i < 3; i++) {
        if (collision(rocks[i].x, rocks[i].y, 16, 16, player.x, player.y, player.width, player.height)) {
            life.lives--;
            player.x = 48;
            player.y = 48;
        }
    }


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


void updateEnemies(ENEMY* e) {

    if (collision(e->x, e->y, e->width, e->height, player.x, player.y, player.width, player.height)) {
        life.lives--;
        player.x = 48;
        player.y = 48;
    }

    if (collision(e->x, e->y, e->width, e->height, smoke.firstX, smoke.firstY, 16, 16) ||
        collision(e->x, e->y, e->width, e->height, smoke.secondX, smoke.secondY, 16, 16) ||
        collision(e->x, e->y, e->width, e->height, smoke.thirdX, smoke.thirdY, 16, 16)) {
        e->smoked = 1;
        e->smokeTimer = 360;
    }


    if (e->smoked) {
        e->smokeTimer--;
        if (e->smokeTimer == 0) {
            e->smoked = 0;
        }
    } else {

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


void drawGame() {
    if (player.hide) {
        shadowOAM[0].attr0 |= (2<<8);
    } else {
        shadowOAM[0].attr0 = ((player.y - vOff) & 0xFF) | (0<<14);
        shadowOAM[0].attr1 = ((player.x - hOff) & 0x1FF) | (1<<14);
        shadowOAM[0].attr2 = (((0) & 0xF) <<12) | (((player.aniFrame * 2)*32+(player.direction * 2)) & 0x3FF);
    }

    if (score >= 10) {
        (*(volatile unsigned short *)0x04000018) = hOff;
        (*(volatile unsigned short *)0x0400001A) = vOff;
    } else {
        (*(volatile unsigned short *)0x04000010) = hOff;
        (*(volatile unsigned short *)0x04000012) = vOff;
    }

    if (smoke.firstHide || smoke.firstY - vOff + 16 < 0 || smoke.firstY - vOff > 160) {
        shadowOAM[6].attr0 |= (2<<8);
    } else {
        shadowOAM[6].attr0 = ((smoke.firstY - vOff) & 0xFF) | (0<<14);
        shadowOAM[6].attr1 = ((smoke.firstX - hOff) & 0x1FF) | (1<<14);
        shadowOAM[6].attr2 = (((0) & 0xF) <<12) | (((6)*32+(8)) & 0x3FF);
    }

    if (smoke.secondHide || smoke.secondY - vOff + 16 < 0 || smoke.secondY - vOff > 160) {
        shadowOAM[5].attr0 |= (2<<8);
    } else {
        shadowOAM[5].attr0 = ((smoke.secondY - vOff) & 0xFF) | (0<<14);
        shadowOAM[5].attr1 = ((smoke.secondX - hOff) & 0x1FF) | (1<<14);
        shadowOAM[5].attr2 = (((0) & 0xF) <<12) | (((6)*32+(8)) & 0x3FF);
    }

    if (smoke.thirdHide || smoke.thirdY - vOff + 16 < 0 || smoke.thirdY - vOff > 160) {
        shadowOAM[4].attr0 |= (2<<8);
    } else {
        shadowOAM[4].attr0 = ((smoke.thirdY - vOff) & 0xFF) | (0<<14);
        shadowOAM[4].attr1 = ((smoke.thirdX- hOff) & 0x1FF) | (1<<14);
        shadowOAM[4].attr2 = (((0) & 0xF) <<12) | (((6)*32+(8)) & 0x3FF);
    }

    for (int i = 7; i < 10; i++) {
        if (rocks[i - 7].hide || rocks[i - 7].y - vOff + 16 < 0 || rocks[i - 7].y - vOff > 160) {
            shadowOAM[i].attr0 |= (2<<8);
        } else {
            shadowOAM[i].attr0 = ((rocks[i - 7].y - vOff) & 0xFF) | (0<<14);
            shadowOAM[i].attr1 = ((rocks[i - 7].x - hOff) & 0x1FF) | (1<<14);
            shadowOAM[i].attr2 = (((0) & 0xF) <<12) | (((6)*32+(10)) & 0x3FF);
        }
    }

    if (life.oneHide) {
        shadowOAM[10].attr0 |= (2<<8);
    } else {
        shadowOAM[10].attr0 = ((life.oneY) & 0xFF) | (0<<14);
        shadowOAM[10].attr1 = ((life.oneX) & 0x1FF) | (1<<14);
        shadowOAM[10].attr2 = (((0) & 0xF) <<12) | (((0)*32+(0)) & 0x3FF);
    }

    if (life.twoHide) {
        shadowOAM[11].attr0 |= (2<<8);
    } else {
        shadowOAM[11].attr0 = ((life.twoY) & 0xFF) | (0<<14);
        shadowOAM[11].attr1 = ((life.twoX) & 0x1FF) | (1<<14);
        shadowOAM[11].attr2 = (((0) & 0xF) <<12) | (((0)*32+(0)) & 0x3FF);
    }

    if (life.threeHide) {
        shadowOAM[12].attr0 |= (2<<8);
    } else {
        shadowOAM[12].attr0 = ((life.threeY) & 0xFF) | (0<<14);
        shadowOAM[12].attr1 = ((life.threeX) & 0x1FF) | (1<<14);
        shadowOAM[12].attr2 = (((0) & 0xF) <<12) | (((0)*32+(0)) & 0x3FF);
    }

    for (int i = 13; i < 23; i++) {
        if (flags[i - 13].hide || flags[i - 13].y - vOff + 16 < 0 || flags[i - 13].y - vOff > 160) {
            shadowOAM[i].attr0 |= (2<<8);
        } else {
            shadowOAM[i].attr0 = ((flags[i - 13].y - vOff) & 0xFF) | (0<<14);
            shadowOAM[i].attr1 = ((flags[i - 13].x - hOff) & 0x1FF) | (1<<14);
            shadowOAM[i].attr2 = (((0) & 0xF) <<12) | (((6)*32+(12)) & 0x3FF);
        }
    }

    shadowOAM[3].attr0 = ((fuel.mainY) & 0xFF) | (1<<14);
    shadowOAM[3].attr1 = ((fuel.mainX) & 0x1FF) | (1<<14);
    shadowOAM[3].attr2 = (((0) & 0xF) <<12) | (((4)*32+(8)) & 0x3FF);

    shadowOAM[2].attr0 = ((fuel.depleteY) & 0xFF) | (1<<14);
    shadowOAM[2].attr1 = ((fuel.depleteX) & 0x1FF) | (1<<14);
    shadowOAM[2].attr2 = (((0) & 0xF) <<12) | (((5)*32+(8)) & 0x3FF);

    shadowOAM[23].attr0 = ((2) & 0xFF) | (2<<14);
    shadowOAM[23].attr1 = ((2) & 0x1FF) | (0<<14);
    shadowOAM[23].attr2 = (((0) & 0xF) <<12) | (((0)*32+(scoreDisplay.score1 + 16)) & 0x3FF);

    shadowOAM[24].attr0 = ((2) & 0xFF) | (2<<14);
    shadowOAM[24].attr1 = ((12) & 0x1FF) | (0<<14);
    shadowOAM[24].attr2 = (((0) & 0xF) <<12) | (((0)*32+(scoreDisplay.score2 + 16)) & 0x3FF);

    shadowOAM[25].attr0 = ((2) & 0xFF) | (2<<14);
    shadowOAM[25].attr1 = ((22) & 0x1FF) | (0<<14);
    shadowOAM[25].attr2 = (((0) & 0xF) <<12) | (((0)*32+(scoreDisplay.score3 + 16)) & 0x3FF);

    for (int i = 27; i < 30; i++) {
        if (enemies[i - 27].hide || enemies[i - 27].y - vOff + 16 < 0 || enemies[i - 27].y - vOff > 160) {
            shadowOAM[i].attr0 |= (2<<8);
        } else {
            shadowOAM[i].attr0 = ((enemies[i - 27].y - vOff) & 0xFF) | (0<<14);
            shadowOAM[i].attr1 = ((enemies[i - 27].x - hOff) & 0x1FF) | (1<<14);
            shadowOAM[i].attr2 = (((0) & 0xF) <<12) | (((8 + (enemies[i - 27].aniFrame * 2))*32+(enemies[i - 27].direction * 2)) & 0x3FF);
        }
    }

    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}


inline unsigned char colorAt(int x, int y) {
    return collisionMap[((y) * (512) + (x))];
}

int canMoveLeft() {
    if (!collisionsEnabled) return 1;

    int left = player.x;

    int top = player.y;
    int bottom = player.y + player.height - 1;

    return colorAt(left - player.xDel, top + 2) && colorAt(left - player.xDel, bottom - 2);
}

int canMoveRight() {
    if (!collisionsEnabled) return 1;


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


    return colorAt(left + 2, top - player.yDel) && colorAt(right - 2, top - player.yDel);
}

int canMoveDown() {
    if (!collisionsEnabled) return 1;

    int left = player.x;
    int right = player.x + player.width - 1;

    int bottom = player.y + player.height - 1;

    return colorAt(left + 2, bottom + player.yDel) && colorAt(right - 2, bottom + player.yDel);
}

void movePlayer() {

    if ((!(~(buttons) & ((1<<7))) && !(~(buttons) & ((1<<6))) && !(~(buttons) & ((1<<5))) && !(~(buttons) & ((1<<4)))) ||
        ((~(buttons) & ((1<<7))) && !canMoveDown()) || ((~(buttons) & ((1<<6))) && !canMoveUp()) ||
        ((~(buttons) & ((1<<5))) && !canMoveLeft()) || ((~(buttons) & ((1<<4))) && !canMoveRight())) {
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
    } else {
        if ((~(buttons) & ((1<<5))) && canMoveLeft()) {
            player.x -= player.xDel;
        }

        if ((~(buttons) & ((1<<4))) && canMoveRight()) {
            player.x += player.xDel;
        }

        if ((~(buttons) & ((1<<6))) && canMoveUp()) {
            player.y -= player.yDel;
        }

        if ((~(buttons) & ((1<<7))) && canMoveDown()) {
            player.y += player.yDel;
        }
    }


    hOff = player.x - (240 - player.width) / 2;
    vOff = player.y - (160 - player.height) / 2;


    if (player.x < 48) player.x = 48;
    if (player.y < 48) player.y = 48;
    if (score >= 10) {
        if (player.x > 512 - 56 - player.width) player.x = 512 - 56 - player.width;
        if (player.y > 512 - 56 - player.height + 24) player.y = 512 - 56 - player.height + 24;
    } else {
        if (player.x > 512 - 56 - player.width) player.x = 512 - 56 - player.width;
        if (player.y > 512 - 56 - player.height) player.y = 512 - 56 - player.height;
    }


    if (hOff < 0) hOff = 0;
    if (vOff < 0) vOff = 0;
    if (hOff > 512 - 240) hOff = 512 - 240;
    if (vOff > 512 - 160) vOff = 512 - 160;
}


void animatePlayer() {
    if ((~(buttons) & ((1<<6))) && canMoveUp()) {
        player.aniState = 1;
        player.direction = UP;
    }

    if ((~(buttons) & ((1<<7))) && canMoveDown()) {
        player.aniState = 1;
        player.direction = DOWN;
    }

    if ((~(buttons) & ((1<<5))) && canMoveLeft()) {
        player.aniState = 1;
        player.direction = LEFT;
    }

    if ((~(buttons) & ((1<<4))) && canMoveRight()) {
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
