extends Area2D


func _on_body_entered(body: Node2D) -> void:
	SceneTransition.change_scene("res://level_3.tscn")
