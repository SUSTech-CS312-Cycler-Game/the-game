extends KinematicBody

var gravity = -12.0  # strength of gravity Vector3.DOWN * 12
var speed = 4  # movement speed
var jump_speed = 6  # jump strength
var spin = 0.1  # rotation speed

var velocity = Vector3()
var jump = false

func get_input():
	velocity.x = 0
	velocity.z = 0
	if Input.is_action_pressed("ui_down"):
		velocity.z -= speed
	if Input.is_action_pressed("ui_up"):
		velocity.z += speed
	if Input.is_action_pressed("ui_left"):
		velocity.x += speed
	if Input.is_action_pressed("ui_right"):
		velocity.x -= speed

func _physics_process(delta):
	velocity.y += gravity * delta
	get_input()
	velocity = move_and_slide(velocity, Vector3.UP)
