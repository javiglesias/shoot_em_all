extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var enemy_scene = load("res://enemy.tscn")
var screen_width = ProjectSettings.get_setting("display/window/size/width")
var screen_height = ProjectSettings.get_setting("display/window/size/height")
var start: bool = false
onready var player = get_node("player")
onready var collision_area = get_node("collision_area")
onready var user_interface = get_node("canvas_ui/user_interface")
onready var instructions = get_node("canvas_ui/instructions")
onready var win_screen = get_node("canvas_ui/win_screen")
onready var lose_screen = get_node("canvas_ui/lose_screen")
onready var sfx_player: Node = get_node("/root/main_scene/audio_player")
export var objective: int = 150

var enemies = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if start:
		user_interface.start_time()
		var enemy = enemy_scene.instance()
		enemy.position.x = randi()%screen_width
		enemy.position.y = 0
		enemy.scale.x = 0.3
		enemy.scale.y = 0.3
		if enemies.size() < 10:
			enemies.append(enemy)
			add_child(enemy)
		if user_interface.get_score() >= objective:
			win_screen.visible = true
			sfx_player.win()
			get_tree().paused = true
		elif user_interface.get_score() <= 0:
			lose_screen.visible = true
			get_tree().paused = true
	else:
		sfx_player.start()
func _input(ev):
	if Input.is_action_pressed("action"):
		if !start:
			instructions.queue_free()
			start = true
	elif Input.is_action_pressed("escape"):
		sfx_player.lose()
		get_tree().quit(0)
