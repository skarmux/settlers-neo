extends Node2D

@export var settler_scene: PackedScene

@onready var grid_map: TileMap = %GridMap
@onready var settlers: Node2D = %Settlers

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("LeftClick"):
		var settler: Settler = settler_scene.instantiate()
		settler.global_position = Vector2(grid_map.hovered_tile)
		settler.global_target_position = Vector2(grid_map.hovered_tile)
		settlers.add_child(settler)
