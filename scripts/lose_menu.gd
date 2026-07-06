extends Control


func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	
	


func _on_back_to_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
