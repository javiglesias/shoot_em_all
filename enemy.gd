extends KinematicBody2D


# Declare member variables here. Examples:
var life: int = 1 #hits
var speed: int = 200
var vel: Vector2 = Vector2()
var screen_width = ProjectSettings.get_setting("display/window/size/width")
var screen_height = ProjectSettings.get_setting("display/window/size/height")
onready var sprite: Sprite = get_node("enemy_spaceship")
onready var user_interface: Node = get_node("/root/main_scene/canvas_ui/user_interface")
onready var bullet = get_node("/root/bullet")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _draw():
	pass
func _notification(what):
	#match what:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	vel.y = 0
	if position.y < screen_height:
		vel.y += speed
	elif position.y >= screen_height:
		restart()
	var collision_info = move_and_collide(vel * delta)
	if collision_info:
		if collision_info.collider.name.find("bullet",0) != -1:
			user_interface.score_up(1)
			hit()
		elif collision_info.collider.name.find("player",0) != -1:
			user_interface.score_down(1)
			restart()
func hit():
	restart()
	
func restart():
	life = 2
	position.y = 0
	position.x = randi()%screen_width
	pass
