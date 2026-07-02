extends Node2D

@export var pipe_speed : float = 100.0

func _process(delta: float) -> void:
	position += Vector2.LEFT * pipe_speed * delta
