extends Area2D

@onready var anim = get_node("AnimationPlayer")
var collision = false

func _process(delta):
		if Input.is_action_just_pressed("press_e"):
			queue_free()

func _on_body_entered(body):
	if body.name == "Player":
		anim.play("SwordHlight")
		collision = true


func _on_body_exited(body):
	if body.name == "Player":
		anim.play("SwordStone")
		collision = false
