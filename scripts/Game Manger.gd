extends Node

@onready var score: Label = $"Game UI/Score"

@export var game_data : GameData
@onready var death_area: Area2D = $"Death Area"

@onready var die_sound: AudioStreamPlayer = $"die sound"
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	game_data = ResourceLoader.load("user://flappydogdata.res")
	print(game_data.higest_score)
	Global.death.connect(_on_death)


func _update_score_label():
	score.text = str(Global.score)


func _process(delta: float) -> void:
	_update_score_label()
	if Global.score > game_data.higest_score:
		game_data.higest_score = Global.score
		ResourceSaver.save(game_data, "user://flappydogdata.res")

func _on_death():
	die_sound.play()
	await die_sound.finished
	animation_player.play("death")
	await animation_player.animation_finished
	get_tree().change_scene_to_file("res://scenes/lose_menu.tscn")
