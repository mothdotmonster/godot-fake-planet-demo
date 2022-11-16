extends KinematicBody

export var max_speed = 10

var gravity = -30
var mouse_sensitivity = 0.005 # (radians/pixel)

var velocity = Vector3()

onready var camera = $Pivot/Camera

func get_input():
	var movedir = Vector3()
	if Input.is_action_pressed("move_forward"):
		movedir += -self.global_transform.basis.z
	if Input.is_action_pressed("move_back"):
		movedir += self.global_transform.basis.z
	if Input.is_action_pressed("move_left"):
		movedir += -self.global_transform.basis.x
	if Input.is_action_pressed("move_right"):
		movedir += self.global_transform.basis.x
	movedir = movedir.normalized()
	return movedir
	
func _unhandled_input(event):
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)
		$Pivot.rotate_x(-event.relative.y * mouse_sensitivity)
		$Pivot.rotation.x = clamp($Pivot.rotation.x, -1.2, 0.6)

func _physics_process(delta):
	velocity.y += gravity * delta
	var desired_velocity = get_input() * max_speed
	
	velocity.x = desired_velocity.x
	velocity.z = desired_velocity.z
	velocity = move_and_slide(velocity, Vector3.UP, true)
	
	if transform.origin.x > 50:
		transform.origin.x = -50
	if transform.origin.x < -50:
		transform.origin.x = 50
	if transform.origin.z > 50:
		transform.origin.z = -50
	if transform.origin.z < -50:
		transform.origin.z = 50
