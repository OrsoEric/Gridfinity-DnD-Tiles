# Gridfinity D&D Tiles

Modular Tiles for D&D Campaign using gridfinity Tiling

# Tiles

- Paved road tile 1x1
- Dirt Road Tile
	- Full
	- Grass
	- Grain
- Field tile
	- Grass
	- Grain (tall with hole in center to let the miniature inside the grain)
	

# OpenSCAD

I started from my medieval tiles work that was already intended to serve as D&D.

Fractal generation works fine, but I need to tidy it up, I want a library for each type of fractal generation pattern. I would like to tidy up the libraries as well, but I have fixed the boxes and minimum dimension and can be flush down, I have diminishing returns tidying them up, so I start making the actual tiles and see how they work.

After completing the board game I incorporated a number of fixes, like tidying down dimensions and making tiles lower down and save space and material

A big change is allow bigger tiles. Many dungeon components can be bigger than 1x1.

## Tile Dirt

This tile represents dirt, it's a base tile where I can add more features

 ```scad
//Minimum height of the fractal terrain above the gridfinity base (gz_gridfinity_socket_offset)
gz_dirt_base = 0.5;
//Maximum height of the fractal terrain above the gridfinity base (gz_gridfinity_socket_offset)
gz_dirt_top = 3;
//Variation in maximum height. 0 maximum variation. 1 minimum variation, maximum height is the same for all tile
gz_dirt_consistency = 1.0;
//After generation, smooth out. 
gn_dirt_erosion = 1;
```

Below OpenSCAD generation. Each time you render, fractal terrain is generated differently, meaning all tiles are unique.

![](/image/tile_dirt_2x2_openscad.png)

Below Using Creality slicer, gave color based on height, with the K2 with four rolls and automatic filament change. Adds an engraving on bot for the github repo.

![](/image/tile_dirt_2x2_slicer_bot.png)
	
