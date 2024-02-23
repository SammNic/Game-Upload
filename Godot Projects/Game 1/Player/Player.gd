extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var anim = get_node("AnimationPlayer")
var facingRight = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		if Input.is_action_pressed("move_right"):
			facingRight = true
			anim.play("Run")
		elif Input.is_action_pressed("move_left"):
			facingRight = false
			anim.play("RunLeft")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if facingRight:
			anim.play("IdleRight")
		else:
			anim.play("IdleLeft")

	move_and_slide()
