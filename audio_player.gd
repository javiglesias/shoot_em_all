extends AudioStreamPlayer2D


# Declare member variables here. Examples:
var shot_sfx = preload("res://resources/shoot.tres")
var damage_sfx = preload("res://resources/damage.tres")
var player_win = preload("res://resources/player_win.tres")
var player_lose = preload("res://resources/player_lose.tres")
var start = preload("res://resources/start.tres")

func shoot():
	stream = shot_sfx
	play()
func damage():
	stream = damage_sfx
	play()
func win():
	stream = player_win
	play()
func lose():
	stream = player_lose
	play()
func start():
	stream = start
	play()
