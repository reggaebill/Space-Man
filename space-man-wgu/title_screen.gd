extends Control

func _on_start_button_pressed() -> void:
	print("start")
	SceneTransition.change_scene("res://Scenes/main.tscn")
	


func _on_quit_button_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
