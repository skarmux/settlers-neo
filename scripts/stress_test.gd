extends Node2D

@export var settler_scene: PackedScene

@onready var fps_counter: Label = %FpsCounter
@onready var settlers: Node2D = %Settlers

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in 10000:
		var settler: Settler = settler_scene.instantiate()
		settler.global_position = _random_pos()
		settler.global_target_position = _random_pos()
		settlers.add_child(settler)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	fps_counter.text = "FPS: {0}".format([Engine.get_frames_per_second()])

func _random_pos() -> Vector2:
	return Vector2(randi() % 1366, randi() % 768)
