extends VBoxContainer

@onready var fps_counter: Label = %FPS

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	fps_counter.text = "FPS: {0}".format([Engine.get_frames_per_second()])
