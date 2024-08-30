# Punks in the Parallel
This is a Choose Your Own Adventure style murder mystery, where you have been murdered in some timelines, but not all. Your goal is to go through the different timelines and deduce who you think your killer is.

## Technical Framework
This project uses Godot 4.3 and is written in GDScript.

## How To Play
Punks in the Parallel is available to play on the web!*

Use ENTER or SPACE to scroll through the text. Use LEFT MOUSE BUTTON and MOUSE CURSOR to select an option.

### [Play here!](https://prismatoad.itch.io/punks-in-the-parallel)

*It may not work correctly on MacOS on Chromium browsers. [Godot 4's HTML5 exports currently cannot run on macOS due to upstream bugs with SharedArrayBuffer and WebGL 2.0.](https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_web.html). Non-Chromium browsers like Firefox seem to work on both Mac and Windows.


## Nodes and Transitions
To create story nodes, I created an "Acts" Resource. Resources are data containers specific to Godot. For the base Resource, I wrote a script that exports the following variables: 
- a picture
- a text queue (an array of Strings)
- option titles (an array of Strings)
- options (an array of Acts)

Exporting variables means you can edit them from the Inspector rather than having to edit them in script. For each Act, I can insert a picture and a text queue that will be iterated through and displayed. I also created an options system that displays the options title and the corresponding act that will replace the current act.

The main scene of the game is called the Stage [stage.tscn]. The two most important mechanisms inside of the stage are Textbox [textbox.tcsn] and Options [options.tscn]. Using the text queue from each Act, text is displayed in the text box until the queue is empty. When the queue is empty, Options is prompted and will display the options the player has to choose from. This creates the correct amount of buttons (1 or 2), inputs the correct title that the button should display, and links the button to the correct Act. When an options button is pressed, the Stage replaces the previous scene with data from the new scene.

## Reflection

I've used state before in games I have made previously, but this project solified that it is useful even on a very small scale. On top of implementing the Act Resources to act as different states, the textbox.gd script uses a simple state manager in an enum to know whether the text is READY, READING, or FINISHED. Having a small state manager inside the textbox allowed the animations to behave smoothly and the player to skip through the different states as they wish. I also learned how much I am capable of in a week. I added a bunch of extra juice to this that was not needed and it never overwhelmed me. Part of that is because I am very familiar with Godot, but also that I have been practicing making weekly games all summer. I've improved a lot!

I am particularly proud of the textbox system. First of all, I love that it automatically knows when the text queue has been emptied and prompts the options menu. Building this that way allowed me to then focus on the story and art. Secondly, the text scrolling across the screen is a really nice visual effect. I had never done something like that before, and before this project, textboxes in games were mystical to me.

I would have liked to add a feature where you actually guess who the killer is and you are told whether you got it right or wrong. As of now, you rotate through the storylines and it never ends. You can mentally solve the murder, but it is never verified. Seeing as this project was already out of the scope compared to what it could have been (I was really excited to work on a CYOA), I decided to cut that and leave it as is.
