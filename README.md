# modifiedSpaceInvaders

ABOUT THE PROJECT

I created an engaging gameplay environment by taking inspiration from videogame named Space Invaders. I used a VGA interface to construct the primary screen with resolution 640 x 480. In the game, the player controls a central spaceship on a game field.This spaceship can rotate and fire projectiles to defend against incoming enemies that appear from the boundaries of the field. These enemies deliberately approach your spaceship, testing your ability to maneuver strategically. It is imperative that you destroy these enemies before they manage to breach your defenses, as failure to do so will result in a game over. To play this game, the player uses an FPGA board, specifically the DE1-SoC Development Kit, which is built around the Altera System-on-Chip FPGA model 5CSEMA5F31C6.

Controls:

**Player can rotate the spaceship with the buttons BUTTON 0 and BUTTON 1 and they can shoot the enemy with the firing button BUTTON 3.
**There is also a switch key(SW[9]) in order to change the shooting mode.

ABOUT FILES

-BACKGROUND.V

In this file, there are VGA codes in order to display the game. The code in this file is very basic, it can be developed by researching about VGA display. There is also another module which increases the enemy trajectories.

-DEBOUNCE.V

This file is used to eliminate or reduce the noise or glitches that occur when a mechanical switch or button is pressed or released. When a button is pressed, the mechanical contacts inside may not transition cleanly, resulting in multiple unwanted transitions. This module helps to stabilize the button input.

-GAMELOGIC.V

This is the most crucial file in the project. It contains the enemy counter module (for score tracking and new enemy generation), random enemy spawn modules (for continuous gameplay), trajectory and life assignment modules, and button modules (for firing and rotation). The output from this module is directly sent to the VGA file (background.v).

-PROJECT.V

This file handles the pin configurations and manages the data flow between the different modules.

-VGA_TIMER.V

This file divides the FPGA clock. The original frequency is too high for the game logic, so a basic frequency division is implemented here.
