extends KinematicBody2D

var speed: int = 200
var bullet_speed: int = 200
var vel: Vector2 = Vector2()
onready var sprite: Sprite = get_node("spaceship") #only runs when the game is launched

func _physics_process(delta):
	vel.x = 0
	vel.y = 0
	if Input.is_action_pressed("left_spaceship"):
		vel.x -= speed
	if Input.is_action_pressed("right_spaceship"):
		vel.x += speed
	if Input.is_action_pressed("forward_spaceship"):
		vel.y -= speed/2
	if Input.is_action_pressed("backward_spaceship"):
		vel.y += speed/2
	#if Input.is_action_pressed("escape"):
		
	vel = move_and_slide(vel, Vector2.UP)
	if vel.x < 0:
		sprite.flip_h = true
	elif vel.x > 0:
		sprite.flip_h = false
