extends CharacterBody3D


const UP_DOWN_SPEED = 145.0
const FORWARD_SPEED = 165.0
const FORWARD_IDLE = 15.0
const BACKWARD_SPEED = 35.0
const JUMP_VELOCITY = 4.5
const SPEED = 45.0
const ACCELERATION = 5
const FRICTION = 2

var laser = load("res://laser.tscn")
var instance
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var backlimit = $"../BackLimit"


func _physics_process(delta):
	# Add the gravity.
	#if not is_on_floor():
	#	velocity.y -= gravity * delta

	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, -input_dir.y)).normalized()
	if direction:
		if direction.x > 0:
			velocity.z = move_toward(velocity.z ,direction.x * FORWARD_SPEED,ACCELERATION)
		if direction.x < 0:
			velocity.z = move_toward(velocity.z ,direction.x * BACKWARD_SPEED, ACCELERATION)
		if backlimit.position.z > position.z:
			position.z = backlimit.position.z
		velocity.y = move_toward(velocity.y,direction.z * UP_DOWN_SPEED,ACCELERATION)
	else:
		velocity.z = move_toward(velocity.z, FORWARD_IDLE, FRICTION)
		velocity.y = move_toward(velocity.y, 0, FRICTION)
		if backlimit.position.z > position.z:
			position.z = backlimit.position.z
	if Input.is_action_just_pressed("shoot"):
		instance = laser.instantiate()
		instance.position = position
		print("shooting")
		print(instance.position)
		get_parent().add_child(instance)
		
		

	move_and_slide()
