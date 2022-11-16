# godot-fake-planet-demo
a small demo which uses shaders to fake a spherical game world in Godot
![image](https://user-images.githubusercontent.com/82258270/202103141-9f8687b0-35bd-4ad9-8cdb-a2653f1105a4.png)
[online version](https://moth.monster/randomfiles/smallworld/)  
(wasd to move, tab to toggle the effect)

all source files are inside the [src](src) folder.

## how does it work?

the world is warped around the player to make it look as if it is spherical.  
if the player walks too far, they are warped to the other side.  
internally, the game world is a flat plane, and is rendered as a parabola.
