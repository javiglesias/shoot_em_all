extends Control


# Declare member variables here. Examples:
onready var score_text = get_node("score")
var score: int = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	score_text.set_text(str(score))
	
func score_up(score_inc: int):
	score += score_inc
	score_text.text = str(score)
	
func score_down(score_dec: int):
	score -= score_dec
	score_text.text = str(score)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if score == 150: #end
		pass
func get_score():
	return score
