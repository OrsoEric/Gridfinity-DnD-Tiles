//Credits to 2022 Jamie MIT License <vector76@gmail.com>
//Repo: https://github.com/vector76/gridfinity_openscad
include <gridfinity_modules.scad>

//Credits to
//https://www.printables.com/@Anachronist
//https://www.printables.com/model/129126-procedural-weathered-fractal-terrain-in-openscad/files
//Heavily modified to make boxes of consistent height and roll on maximum height instead of scaling factors
include <terrain.scad>

//Tile Constants
include <tile_constants.scad>

include <url.scad>

module tile_dirt
(
	//Number of gridfinity bases
	inx = 1,
	iny = 1
)
{
	//The fractal resolution should increase with tile size
	in_fractal_resolution = 4 +floor(inx/2 +iny/2);

	x_size = inx<=1?gw_gridfinity:gw_gridfinity+(inx-1)*gw_gridfinity_spacing;
	y_size = iny<=1?gw_gridfinity:gw_gridfinity+(iny-1)*gw_gridfinity_spacing;

	x_offset = inx<=1?0:gw_gridfinity*0+(inx-1)*gw_gridfinity_spacing/2;
	y_offset = iny<=1?0:gw_gridfinity*0+(iny-1)*gw_gridfinity_spacing/2;

	difference()
	{
		union()
		{
			//Instance a gridfinity base tile
			color("#ffffff")
			grid_block
			(
				num_x=inx,
				num_y=iny,
				num_z=0.14,
				magnet_diameter=0,
				screw_depth=0
			);
			//Instance fractal terrain
			translate
			([
				x_offset,
				y_offset,
				gz_gridfinity_socket_offset
			])
			color("#b03030")
			terrain
			(
				in_max_levels = in_fractal_resolution,
				ix_size = x_size,
				iy_size = y_size,
				iz_min_surface_height = gz_dirt_base,
				iz_max_surface_height = gz_dirt_top,
				in_height_roll = gz_dirt_consistency,
				ir_corner_rounding = gr_gridfinity_rounding,
				in_erosion = gn_dirt_erosion
			);
			
		}
		union()
		{
			//rotate([180,180,180])
			//qr_render( gnn_qr_data, iz_height = 0.5 );
			translate
			([
				-0.7*gw_gridfinity/2,
				-0.0*gw_gridfinity/2,
				+0.5
			])
			rotate([180,0,0])
			project_url(in_size = 3,iz_height = 0.5);
		}
	}
}

module grid_of_tiles(rows, cols, spacing)
{
    for (x = [0:cols-1])
    for (y = [0:rows-1])
    {
        translate([x * spacing, y * spacing, 0])
			children();
            //tile_dirt();
    }
}

// Set rows, columns, and spacing
//grid_of_tiles(rows = 1, cols = 1, spacing = 42);

if (false)
translate([0,0,0])
tile_dirt( 1, 1 );

if (false)
translate([2.5*gw_gridfinity,0,0])
tile_dirt( 2, 2 );

if (false)
translate([5.5*gw_gridfinity,0,0])
tile_dirt( 3, 3 );


grid_of_tiles(1,1,2.2*gw_gridfinity)
tile_dirt( 2, 2 );