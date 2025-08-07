extends CharacterBody2D

@export var rotation_speed = 5.0
@export var grapple_script : Node2D
@onready var gc := $GrappleController
const SPEED = 300.0
const MAX_JUMP_VELOCITY = -450.0
const JUMP_FORCE_INCREMENT = 300.0
var current_jump_velocity: float = 0.0
#var target_away = grapple_script.handle_grapple()
func _ready():
	if Input.is_action_just_pressed("r"):
		get_tree().reload_current_scene()
		
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if Input.is_action_pressed("left"):
		rotation = lerp(rotation, (rotation + 10.0), rotation_speed * delta)
	#if Input.is_action_just_released("left"):
		#rotation = lerp(rotation, (rotation + 5.0), 0.5)
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

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
	#if velocity.y <= -1.0:
		#velocity.x = 0.0

	move_and_slide()

func _input(event: InputEvent):
	if event.is_action_released("jump") and is_on_floor():
		velocity.y = current_jump_velocity
		current_jump_velocity = 0.0
