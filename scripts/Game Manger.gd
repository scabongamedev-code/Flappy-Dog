extends Node

@onready var score: Label = $"Game UI/Score"

@export var game_data : GameData


func _update_score_label():
	score.text = str(Global.score)

func _ready() -> void:
	game_data = ResourceLoader.load("user://flappydogdata.res")
	print(game_data.higest_score)

func _process(delta: float) -> void:
	_update_score_label()
	if Global.score > game_data.higest_score:
		game_data.higest_score = Global.score
		ResourceSaver.save(game_data, "user://flappydogdata.res")
