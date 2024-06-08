extends TileMap

var hovered_tile: Vector2i
var astar_grid = AStarGrid2D.new()
var start
var end

const main_layer = 0
const bubble_layer = 1
const main_source = 1

# Tile atlas coordinates
const bubble_atlas_coord = Vector2i(2,1)

# Called when the node enters the scene tree for the first time.
func _ready():
	astar_grid.region = Rect2i(-1000, -1000, 2000, 2000)
	astar_grid.cell_size = Vector2(32, 16)
	astar_grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	#astar_grid.jumping_enabled = true
	astar_grid.update()
	for cell in get_used_cells(main_layer):
		astar_grid.set_point_solid(cell, is_solid_tile(cell))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT && event.pressed:
			var pos_clicked = local_to_map(event.position)
			if start == null:
				start = pos_clicked
				set_cell(bubble_layer, start, main_source, bubble_atlas_coord)
			elif end == null && pos_clicked != start:
				end = pos_clicked
				show_path(start,end)
			else:
				clear_layer(bubble_layer)
				start = pos_clicked
				set_cell(bubble_layer, start, main_source, bubble_atlas_coord)
				end = null

func show_path(start,end):
	var path_taken = astar_grid.get_id_path(start, end)
	for cell in path_taken:
		set_cell(bubble_layer, cell, main_source, bubble_atlas_coord)
		
func is_solid_tile(pos:Vector2i) -> bool:
	return get_cell_tile_data(main_layer, pos).get_custom_data("is_solid")
