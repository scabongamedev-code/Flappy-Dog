extends Area2D

@onready var die_sound: AudioStreamPlayer = $"die sound"

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		die_sound.play()
		await die_sound.finished
		get_tree().quit()
