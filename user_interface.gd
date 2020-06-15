extends Control


# Declare member variables here. Examples:
onready var score_text = get_node("score")
onready var timer_label = get_node("timer_label")

var score: int = 100
var time: float = 0
var start_timer: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	score_text.set_text(str(score))
	timer_label.set_text("0")
	
func score_up(score_inc: int):
	score += score_inc
	score_text.text = str(score)
	
func score_down(score_dec: int):
	score -= score_dec
	score_text.text = str(score)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if start_timer:
		time += delta
		timer_label.set_text(str(time))
func get_score():
	return score
func start_time():
	start_timer = true
