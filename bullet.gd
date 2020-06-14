extends KinematicBody2D

# Declare member variables here. Examples:
var speed = 400
var vel: Vector2 = Vector2()
var screen_width = ProjectSettings.get_setting("display/window/size/width")
var screen_height = ProjectSettings.get_setting("display/window/size/height")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	vel.y = 0
	vel.y -=speed
	vel = move_and_slide(vel, Vector2.UP)
	pass
