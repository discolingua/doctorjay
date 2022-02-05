class_name Player
extends RigidBody2D

const HORIZONTAL_FORCE=10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass 

func _integrate_forces(s):
	var lv = s.get_linear_velocity()
	var i = readMovement()
	var delta = s.get_step()

	if Input.is_action_just_pressed("ui_accept"):
		print("flap")
	if i.x != 0:
		lv.x += i.x * delta * HORIZONTAL_FORCE

func readMovement() -> Vector2:
	var _i = Vector2.ZERO
	
	_i.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	_i.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		
	# normalize vector fixes fast/distorted diagonals
	_i = _i.normalized()
	return _i
