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

func _integrate_forces(_state):
	if Input.is_action_just_pressed("ui_accept"):
		applied_force = thrust
		WorldAudio.play("res://Sounds/flap.wav")
	else:
		applied_force /= 2
	if Input.is_action_just_pressed("ui_down"):
		applied_force = downThrust
	if Input.is_action_pressed("ui_left"):
		applied_force = leftThrust
		$playerSprite.set_flip_h (false)
	if Input.is_action_pressed("ui_right"):
		applied_force = rightThrust
		$playerSprite.set_flip_h (true)
