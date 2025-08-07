extends Node2D

func _process(delta: float) -> void:
	pass


func _on_goal_body_entered(body: Node2D) -> void:
	print("goal!")
	SceneTransition.change_scene("res://Scenes/level_2.tscn")
