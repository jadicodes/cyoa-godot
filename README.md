# An Interdimensional Murder Mystery!
This is a Choose Your Own Adventure style murder mystery, where you follow the many pathways of one situation in order to find clues that will solve the murder.

## Technical Framework
This project uses Godot 4.3 and is written in GDScript.

## How To Install/Play

## Mechanics
To create nodes, I created an "Acts" Resource. Resources are data containers specific to Godot. For the base Resource, I wrote a script that exports the following variables: 
- a picture
- a text queue (an array of Strings)
- option titles (an array of Strings)
- options (an array of Beats)

Exporting variables means you can edit them from the Inspector rather than having to edit them within code. For each act, I can insert a picture, an array of text that will be shown, 
an array of option titles that will display when giving the player options, and an array of Acts, which will then replace the data already in the scene.

The main scene of the game is called the Stage [stage.tscn]. The two most important mechanisms inside of the stage are Textbox and Options. Using the text queue, text is displayed in the text box until the queue is empty. 
When the queue is empty, Options is prompted and will display the options the player has to choose from.

## Reflection
    Reflection on what you have learned
    Please also explain any parts of the project you are particularly proud of
    Also consider things you would have liked to get to
