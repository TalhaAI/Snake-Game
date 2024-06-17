# Snake Game

This repository contains the project for the course "Computer Methods in Chemical Engineering." The objective of this project is to develop a Snake Game using MATLAB, where the snake moves within a 30 by 30 playing field, grows in size upon consuming targets, and the game ends when the snake collides with itself or the walls.

## Table of Contents

- [Objective](#objective)
- [Method](#method)
  - [Functions](#functions)
- [Results](#results)
- [Discussion](#discussion)
- [Appendices](#appendices)

## Objective

Our objective is to create a Snake Game with a 30 by 30 playing field. The starting point of the snake is fixed at point (15,15). The target (food) randomly changes its position after every bite by the snake. The game ends when the snake collides with its body or the wall of the playing field. A score counter is initialized at the start of the game to measure the score, which is displayed when the game is over.

## Method

The Snake Game is divided into multiple functions, each performing a specified operation. The main function is `snake()`, and it contains all the other functions required for the game. Each function is called at intervals to perform its operation.

### Functions

- `snake()`: Main function
- `gameSetup()`: Sets up the playing field
- `keypress(~, evt)`: Handles key press events
- `StartGame(evt.Key)`: Starts the game upon key press
- `playing(mov)`: Handles the snake's movement based on arrow key input
- `checkBody()`: Checks for collisions with the snake's body
- `gameEnded()`: Ends the game and displays the score
- `ScoreCounter()`: Updates the score and increases the snake's size upon consuming food
- `stopGame()`: Stops the game

### Function Descriptions

1. **`snake()`**:
   - Defines the 30 by 30 playing field and initializes the starting point of the snake at (15,15).
   - Initializes variables such as `scoreCounter`, `scoreFlag`, and `game_end`.

2. **`gameSetup()`**:
   - Sets up the playing field and ensures the target (food) is not placed at the same position as the snake.
   - Uses `randi` function to give random coordinates for the target.

3. **`keypress(~, evt)`**:
   - Listens for key press events and starts the game by calling `StartGame(evt.Key)`.

4. **`StartGame(mov)`**:
   - Calls the `playing(mov)` function to start the game and updates the game state.

5. **`playing(mov)`**:
   - Handles the snake's movement based on the arrow key input using a switch case structure.

6. **`checkBody()`**:
   - Checks if the snake collides with its own body and ends the game if a collision is detected.

7. **`gameEnded()`**:
   - Ends the game and displays the final score.

8. **`ScoreCounter()`**:
   - Increases the snake's size and updates the score upon consuming food.

9. **`stopGame()`**:
   - Stops all game functions and displays the game over message.

## Results

Every function performs its operation well. The game starts when an arrow key is pressed, and the snake moves in the specified direction. The game ends when the snake collides with the walls or itself. The score is displayed in the command window after the game is over.

**Start of Snake Game:**

![Start of Snake Game](images/start_game.png)

**Game Over Screen:**

![Game Over Screen](images/game_over.png)

## Discussion

The game starts when any arrow key is pressed, and the snake moves in the direction of the arrow key. The game stops when the snake collides with the walls or itself. There is no option to pause the game. After the game is over, the score is displayed in the command window, showing the number of targets consumed by the snake.
