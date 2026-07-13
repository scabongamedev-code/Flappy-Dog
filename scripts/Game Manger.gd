extends Node

@onready var score: Label = $"Game UI/Score"

@onready var death_area: Area2D = $"Death Area"

@onready var die_sound: AudioStreamPlayer = $"die sound"
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var is_dead : bool = false 


func _ready() -> void:

	Global.death.connect(_on_death)
	Global.score = 0
	

func _update_score_label():
	score.text = str(Global.score)


func _process(delta: float) -> void:
	_update_score_label()


		
	
func _on_death():
	if is_dead:
		return
	
	is_dead = true
	
	die_sound.play()
	await die_sound.finished
	animation_player.play("death")
	await animation_player.animation_finished
	get_tree().change_scene_to_file("res://scenes/lose_menu.tscn")
	
