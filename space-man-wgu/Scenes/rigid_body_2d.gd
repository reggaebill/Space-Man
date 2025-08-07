extends StaticBody2D

@export var rotation_speed = 1.0 # Degrees per second

func _process(delta):
	rotation_degrees += rotation_speed * delta
	
