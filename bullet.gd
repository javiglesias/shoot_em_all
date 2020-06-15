extends Area2D

var speed = 50

func _process(delta):
	position.y -= speed


func _on_bullet_body_entered(body):
	if body.name.find("enemy",0) != -1:
		body.hit()
		queue_free()
