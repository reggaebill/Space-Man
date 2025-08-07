extends CanvasLayer
@onready var animation = $AnimationPlayer

func change_scene(target: String) -> void:
	animation.play("scene_transition")
	await animation.animation_finished
	get_tree().change_scene_to_file(target)
	animation.play_backwards("scene_transition")

func reset():
	animation.play("try_again")
	await animation.animation_finished
	get_tree().reload_current_scene()
	animation.play_backwards("try_again")
