extends Area2D

# Death area script




func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Global.is_dead = true
		Global.death.emit()
