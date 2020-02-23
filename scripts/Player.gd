extends KinematicBody

var velocity = Vector3(0, 0, 0)
var camera
var sensitivity = 0.2
var acceleration = 2
const SPEED = 6

func _ready():
	camera = $Camera
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		var movement = event.relative
		camera.rotation.x += -deg2rad(movement.y * sensitivity)
		camera.rotation.x = clamp(camera.rotation.x, deg2rad(-90), deg2rad(90))
		rotation.y += -deg2rad(movement.x * sensitivity)

func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()

func _physics_process(delta):
	var direction = Vector2(0, 0)
	
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1 
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	
	direction = direction.normalized().rotated(-rotation.y)
	
	velocity.x = lerp(velocity.x, direction.x * SPEED, acceleration * delta)
	velocity.z = lerp(velocity.z, direction.y * SPEED, acceleration * delta)

	move_and_slide(velocity, Vector3.UP)
