extends KinematicBody

var velocity = Vector3(0,0,0)
const SPEED = 6

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity.x = SPEED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_and_slide(velocity)
