extends Node2D

func _ready():
	print("hi")


func _input(_event):
	if _event is InputEventKey:
		var _s = get_tree().change_scene("res://Scenes/World.tscn")
