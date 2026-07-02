extends CharacterBody2D
@export_group("Movement Settings")
@export var gravity: float = 1000.0
@export var jump_force: float = 400.0

func _physics_process(delta):
	velocity.y += gravity * delta
	move_and_slide()

func _input(event):
	if event.is_action_pressed(&"jump"):
		jump()

	elif event is InputEventScreenTouch and event.pressed:
		jump()

func jump():
	velocity.y = -jump_force
