class_name Player
extends KinematicBody2D

export(float) var gravity : float = 1
export(float) var flap : float = 10

const GRAVITY = 1.5
const FLAP = 3.0
const ACCELERATION = 600
const MAX_SPEED = 100
const FRICTION = 800

var velocity : Vector2 = Vector2.ZERO
var lastVelocity : Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass 

func _process(_delta):
	var _i = readMovement()
	if Input.is_action_just_pressed("ui_accept"):
		_i.y -= flap
	if _i.x != 0:
		lastVelocity = _i
	_i.y += gravity	
	velocity = move_and_slide(_i * MAX_SPEED)


func readMovement() -> Vector2:
	var _i = Vector2.ZERO
	
	_i.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	# _i.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		
	# normalize vector fixes fast/distorted diagonals
	_i = _i.normalized()
	return _i
