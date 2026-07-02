extends Node

@export_group("Pipe Settings")
@export var max_y_position : float = 250
@export var min_y_position : float = 80
@export var pipe_scene : PackedScene

@onready var timer: Timer = $Timer



func _spwan_pipe():
	var new_pipe = pipe_scene.instantiate()
	new_pipe.position = Vector2(1200.0 , randf_range(min_y_position , max_y_position))
	add_child(new_pipe)
	

func _on_timer_timeout() -> void:
	_spwan_pipe()
	timer.wait_time = randf_range(2.0, 2.5)
