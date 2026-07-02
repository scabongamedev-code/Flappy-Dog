extends Node2D

@export var pipe_speed : float = 100.0

func _process(delta: float) -> void:
	position += Vector2.LEFT * pipe_speed * delta
	
	if position.x < -400:
		queue_free()
		print("some pipe has been distroyed")


func _on_score_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Global.score += 1
