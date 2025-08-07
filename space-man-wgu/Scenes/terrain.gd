extends Node2D

#func _ready():
	#var grapple = get_path("") # Or use $NodeB if it's a direct chil
	#var target = grapple.get("target")


func _on_area_barrier_2d_body_entered(body: Node2D) -> void:
	SceneTransition.reset()
