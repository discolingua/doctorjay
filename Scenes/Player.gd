class_name Player
extends RigidBody2D

export(Vector2) var thrust : Vector2 = Vector2(0,-5000)
export(float) var torque : float = 20000

var leftThrust : Vector2 = Vector2(-300,-100)
var rightThrust : Vector2 = Vector2(300, -100)
var downThrust : Vector2 = Vector2(0,6000)

export(float) var gravity : float = 1
export(float) var flap : float = 10

var velocity : Vector2 = Vector2.ZERO
var lastVelocity : Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass 

func _integrate_forces(_state):
	if Input.is_action_just_pressed("ui_accept"):
		applied_force = thrust
	else:
		applied_force /= 2
	if Input.is_action_just_pressed("ui_down"):
		applied_force = downThrust
	if Input.is_action_pressed("ui_left"):
		applied_force = leftThrust
	if Input.is_action_pressed("ui_right"):
		applied_force = rightThrust
	
