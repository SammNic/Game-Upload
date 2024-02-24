extends ProgressBar

var health
@onready var anim = get_node("AnimatedSprite2D")

func _ready():
	anim.play("5hp")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	health = (get_node("../../Player/Player").health)
	if health == 5:
		anim.play("5hp")
	elif health == 4:
		anim.play("4hp")
	elif health == 3:
		anim.play("3hp")
	elif health == 2:
		anim.play("2hp")
	elif health == 1:
		anim.play("1hp")
	else:
		anim.play("0hp")
