#ifndef GAME_H
#define GAME_H

#include "gba.h"
#include "sprites.h"
#include "mode0.h"

// structs
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

#define MAPWIDTH 512
#define MAPHEIGHT 512

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

#endif