extends CharacterBody2D

@export var rotation_speed = 5.0
@export var grapple_script : Node2D
@onready var gc := $GrappleController
const SPEED = 300.0
const MAX_JUMP_VELOCITY = -450.0
const JUMP_FORCE_INCREMENT = 300.0
var current_jump_velocity: float = 0.0
		
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if Input.is_action_pressed("left") and not is_on_floor():
		rotation = lerp(rotation, (rotation + 10.0), rotation_speed * delta)
		
	if Input.is_action_pressed("right") and not is_on_floor():
		rotation = lerp(rotation, (rotation - 10.0), rotation_speed * delta)
		
	if Input.is_action_just_pressed("r"):
		SceneTransition.reset()

	#if Input.is_action_pressed("grapple_shoot"):
		#var mouse_position = get_global_mouse_position()
		#var direction = (mouse_position - global_position).normalized()
		#var target_angle = direction.angle()
		#var rotation_speed = 5.0
		#rotation = lerp_angle(rotation, target_angle, rotation_speed * delta)
		
		#look_at(global_position + grapple_script. * 10)
		#make grapple pull pls
	#if Input.is_action_just_pressed("grapple_pull") && (is_on_floor() || gc.launched):
		#velocity.y += MAX_JUMP_VELOCITY
		#gc.retract()

	# Handle jump.
	if Input.is_action_pressed("jump") and (is_on_floor() or is_on_ceiling()):
		current_jump_velocity = move_toward(current_jump_velocity, MAX_JUMP_VELOCITY, delta * JUMP_FORCE_INCREMENT)

	move_and_slide()

func _input(event: InputEvent):
	if event.is_action_released("jump") and is_on_floor():
		velocity.y = current_jump_velocity
		current_jump_velocity = 0.0
		
