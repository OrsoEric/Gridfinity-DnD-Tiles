// 		2025-10-15 Tile Constants
//	Now I have a multicolor printer, so I can do mixed colors
//	Lowest level is white for the base
//	I get an optional water level
//	Then I get a terrain level
//	Then I get the mountain building level
//	Lower minimum Z height from 5 to 4.8


//------------------------------------------------------------------------------
//	GRIDFINITY CONSTANTS
//------------------------------------------------------------------------------

//Spacing between tiles
gw_gridfinity_spacing = 42.0;
//width of a gridfinity tile
gw_gridfinity = 41.5;
gw_gridfinity_half_pitch = gw_gridfinity/2;

//height above which I can put geometry without interfering with the gridfinity socket
gz_gridfinity_socket_offset = 4.8;

//Rounding radious of the corners
gr_gridfinity_rounding = 3.75;

//------------------------------------------------------------------------------
//	DIRT CONSTANTS
//------------------------------------------------------------------------------
//	taller smoother than grass

gz_dirt_base = 0;
gz_dirt_top = 2;

gz_dirt_consistency = 0.9;
gn_dirt_erosion = 2;
