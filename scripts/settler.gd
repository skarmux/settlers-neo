class_name Settler
extends Node2D

const SPEED = 20.0

var global_target_position:Vector2

func _ready():
	global_target_position = global_position

func _process(delta: float):
	global_position = global_position.move_toward(global_target_position, delta * SPEED)
	if global_position.distance_to(global_target_position) < SPEED:
		set_process(false)
