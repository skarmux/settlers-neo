class_name Settler
extends Node2D

var target_pos : Vector2

const MOVE_SPEED := 20.0

func _ready() -> void:
	global_position = _random_pos()
	target_pos = _random_pos()


func _process(delta: float) -> void:
	global_position = global_position.move_toward(target_pos, delta * MOVE_SPEED)
	if global_position.distance_to(target_pos) < MOVE_SPEED:
		target_pos = _random_pos()


func _random_pos() -> Vector2:
	return Vector2(randi() % 1366, randi() % 768)
