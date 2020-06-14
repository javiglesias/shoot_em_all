extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var enemy_scene = load("res://enemy.tscn")
var bullet_scene = load("res://bullet.tscn")
var screen_width = ProjectSettings.get_setting("display/window/size/width")
var screen_height = ProjectSettings.get_setting("display/window/size/height")
var start: bool = false
onready var player = get_node("player")
onready var collision_area = get_node("collision_area")
onready var user_interface = get_node("canvas_ui/user_interface")
onready var instructions = get_node("canvas_ui/instructions")
onready var win_screen = get_node("canvas_ui/win_screen")
onready var lose_screen = get_node("canvas_ui/lose_screen")

var enemies = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if start:
		var enemy = enemy_scene.instance()
		enemy.position.x = randi()%screen_width
		enemy.position.y = 0
		enemy.scale.x = 0.3
		enemy.scale.y = 0.3
		if enemies.size() < 10:
			enemies.append(enemy)
			add_child(enemy)
		if user_interface.get_score() >= 150:
			
			win_screen.visible = true
			get_tree().paused = true
		elif user_interface.get_score() <= 0:
			lose_screen.visible = true
			get_tree().paused = true
	else:
		pass
func _input(ev):
	if Input.is_action_pressed("action"):
		if start:
			var bullet = bullet_scene.instance()
			bullet.position.x = player.position.x
			bullet.position.y = player.position.y - 50
			bullet.scale.y = 0.3
			bullet.scale.x = 0.3
			add_child(bullet)
		else:
			instructions.queue_free()
			start = true
	elif Input.is_action_pressed("escape"):
		get_tree().quit(0)
