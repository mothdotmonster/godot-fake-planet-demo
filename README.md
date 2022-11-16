# godot-fake-planet-demo
a small demo which uses shaders to fake a spherical game world in Godot

all source files are inside the [src](src) folder.

## how does it work?

the world is warped around the player to make it look as if it is spherical.  
if the player walks too far, they are warped to the other side.  
internally, the game world is a flat plane, and is rendered as a parabola.
