# Rally-X
## Summary
Your car's gas pedal is stuck, but that's the least of your concerns! You must collect all 10 flags in 2 maps, all while avoiding 3 enemy cars chasing you and dodging rocks that block the road! Your fuel is also slowly running out, so you gotta be fast!

## Controls and Navigation
- Press the corresponding `START` key to begin the game.
- Press the corresponding `A` key while in game to unleash a smoke barrage.
- Pressing `START` while in-game will pause the game. Press `START` again while in this phase to resume.
- Pressing `START` while in the win or lose screen will return you to the main menu.
- Use the corresponding `LEFT`, `RIGHT`, `UP`, and `DOWN` keys to move the car!

## Tips
1. Use your smoke wisely! Enemies that come in contact with the smoke are blinded and can't move for 6 seconds! Keep in mind that the smoke depletes your fuel faster, so use it sparingly. If you run out of lives fuel before finishing the level, you lose!
2. Enemies move slower than you, but they can still corner you with numbers! Path carefully.
3. Rocks and enemies are both dangerous - a single collision and you will lose a life! 3 hits and you're out.
4. Your car will keep moving even if you don't give a directional input! For best control though, it is recommended to keep holding the movement keys.
5. Your fuel and lives reset upon each level - collect all 10 flags in a level to progress!
6. Enemies spawn in the other 3 corners of the map, keep that in mind when starting a game!
7. Rocks spawn randomly, but they can be tricky! They might look like they don't block a path, but actually still do! Or maybe they spawn right next to you, making you lose all 3 lives easily, or maybe even they spawn on top of a flag you need to collect - don't let this discourage you, blame the RNG!
8. The faster you finish a level, the less fuel you use. The excess fuel for each level is converted into bonus score upon winning! Keep in mind this bonus only applies for both levels upon finishing the second level, so try to finish it!
9. Enemy cars can pass through rocks - don't let them get the jump on you through that!
9. If you're struggling to complete the game, press `SELECT` while playing to turn off map collisions - you will still be able to lose lives from enemies and rocks, so be careful!


---

## No-nonsense Section for the TAs
For ease of grading, I have provided the feature requirements as listed below:
1. Player car: it doesn't stop moving (unless it hits a wall), has 4 frame animations for 4 directions, has 3 lives, and can use a smokscreen attack
2. Smoke screen: Enemies that collide with the smoke are unable to move temporarily, the smoke has a sprite that appears behind the player, and it depletes fuel when used
3. At least 3 enemy cars: 3 red enemy cars spawn in each other corner of the map, and they try to close the distance on the player both through and y values, and cause the player to lose a life when colliding
4. At least 3 rocks: 3 rocks are generated in a non-collision area at random positions each time
5. 10 flags scattered: there are 10 flags that are also randomly generated in non-collision areas
6. Fuel system: there is a fuel indicator on the top right that slowly depletes over time, or when player uses the smoke, the fuel resets on each level
7. Score display: The score is displayed on the top left, increments whenever the player gets a flag, and accumulates between levels
8. Lives tracker: There are 3 car icons on the bottom left to indicate lives, one is hidden each time the player loses a life
9. Transparency in sprites: Sprites all use the 0th index palette to show transparency
10. At least 2 levels: There are 2 levels present in the game with different tilemaps and collisionmaps
11. State machine: There is a state machine with the Start, Pause, Game1, Game2, Win, and Lose states
12. Tile map: All tilemaps were made with Tiled using the default provided tileset, and are 512x512 in size
13. Collision map: Both levels use a collision map of 2 colors, made in Usenti to detect collisions between cars and the map walls
14. Written in Mode 0: The code uses Mode 0 and sprites
15. Good organization: Code is sectioned where they best belong, including main.c, game.c, and game.h
16. Meaningful comments: Comments were added where necessary to provide clarity
17. README.md file: You're reading it right now!