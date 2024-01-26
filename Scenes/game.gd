extends Node2D

@onready var spawn_timer = $SpawnTimer
@onready var kid_spawnner = $KidSpawnner

func _ready():
	spawn_timer.start()


func _physics_process(delta):
	pass

func _on_spawn_timer_timeout():
	kid_spawnner.spawn_kid_insideView()
	spawn_timer.start()
	pass # Replace with function body.
