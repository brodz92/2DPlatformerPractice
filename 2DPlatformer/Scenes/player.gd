extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -820.0
const COYOTE_TIME: float = 0.1
@onready var frog: AnimatedSprite2D = %Frog
var on_ground = true
var just_jumped: bool = false
var time_since_grounded: float = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

func just_left_floor():
	var just_left_floor: bool = false
	if (!is_on_floor()):
		just_left_floor = true;

func _process(delta):
	if is_on_floor():
		on_ground = true
		just_jumped = false
		time_since_grounded = 0
	else:
		on_ground = false
		time_since_grounded += delta

func _physics_process(delta: float) -> void:
	#Animations
	if (velocity.x > 1 || velocity.x < -1):
		%Frog.animation = "Running"
	else:
		%Frog.animation = "idle"
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		%Frog.animation = "Jumping"
	

	# Handle jump.
	if (Input.is_action_just_pressed("jump") and time_since_grounded <= COYOTE_TIME):
		velocity.y = JUMP_VELOCITY
		just_jumped = true
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 100)

	move_and_slide()
	
	var isLeft = velocity.x < 0
	%Frog.flip_h = isLeft
	


