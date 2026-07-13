extends Control

@onready var highest_score_label: Label = $"Panel/Highest Score Label"

@export var game_data: GameData

const SAVE_PATH := "user://flappydogdata.tres"


func _ready() -> void:
	# Check if save file exists
	if ResourceLoader.exists(SAVE_PATH):
		game_data = load(SAVE_PATH)
	else:
		game_data = GameData.new()
		game_data.higest_score = 0

		var err := ResourceSaver.save(game_data, SAVE_PATH)
		if err != OK:
			print("Failed to create save file. Error: ", err)

	# Safety check
	if game_data == null:
		game_data = GameData.new()
		game_data.higest_score = 0

	print("Highest Score: ", game_data.higest_score)
	highest_score_label.text = "Your Highest Score Is: " + str(game_data.higest_score)


func _process(delta: float) -> void:
	if game_data == null:
		return

	if Global.score > game_data.higest_score:
		game_data.higest_score = Global.score
		highest_score_label.text = "Your Highest Score Is: " + str(game_data.higest_score)

		var err := ResourceSaver.save(game_data, SAVE_PATH)
		if err != OK:
			print("Failed to save. Error: ", err)


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
