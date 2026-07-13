extends Node2D

@export var pipe_speed: float = 100.0
@export var speed_increase: float = 5.0
@export var increase_time: float = 10.0

@onready var point_sound: AudioStreamPlayer = $"point sound"

var time_passed := 0.0

func _process(delta: float) -> void:
	position += Vector2.LEFT * pipe_speed * delta

	time_passed += delta

	if time_passed >= increase_time:
		time_passed = 0.0
		_increase_difficulty()

	if position.x < -400:
		queue_free()


func _increase_difficulty():
	pipe_speed += speed_increase
	print("Pipe speed:", pipe_speed)


func _on_score_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		point_sound.play()
		Global.score += 1
