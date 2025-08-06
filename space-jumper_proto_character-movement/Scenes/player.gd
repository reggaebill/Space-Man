extends CharacterBody2D


const SPEED = 300.0
const MAX_JUMP_VELOCITY = -1000.0
const JUMP_FORCE_INCREMENT = 1000.0

var current_jump_velocity: float = 0.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_pressed("jump") and is_on_floor():
		current_jump_velocity = move_toward(current_jump_velocity, MAX_JUMP_VELOCITY, delta * JUMP_FORCE_INCREMENT)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _input(event: InputEvent):
	if event.is_action_released("jump"):
		velocity.y = current_jump_velocity
		current_jump_velocity = 0.0
