extends CharacterBody2D
signal kid_removed

@export var speed = 100
@onready var progress_bar = $ProgressBar
@onready var score
var dificulty =1

const MAX_SCORE = 100.0
const SADNESS_DEPLETE_RATE = 5



func _ready():
	score = MAX_SCORE
	if velocity == Vector2.ZERO:
		velocity = Vector2.RIGHT.rotated(randf_range(0,TAU)) * speed * dificulty


func remove_kid():
	emit_signal("kid_removed")
	queue_free()

func _physics_process(delta):
	
	if score <= 0.0:
		remove_kid()
	else:
		score -= SADNESS_DEPLETE_RATE*delta*dificulty
		progress_bar.value = score
		print("Score",score)
		print("Bar",progress_bar.value)
	
	
	var collision = move_and_collide(velocity*delta)
	
	if collision: 
		var bounce_velocity = velocity.bounce(collision.get_normal())
		velocity = bounce_velocity
	print("dificulty:",dificulty)

func setDifficulty(cant):
	dificulty = cant

