extends Control


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")




func _on_quit_game_pressed() -> void:
	get_tree().quit()


func _on_hightest_score_pressed() -> void:
	print("It Will Be Added Sone")
