extends Node2D


func spawn_kid_outsideView():
	var kid = preload("res://Scenes/pibito.tscn").instantiate()
	var kid_spawn_location = $OutsideSpawnPath/SpawnLocation
	kid_spawn_location.progress_ratio = randf()
	
	kid.position = kid_spawn_location.position
	get_parent().add_child(kid)


func spawn_kid_insideView():
	var kid = preload("res://Scenes/pibito.tscn").instantiate()
	var viewport_size = get_viewport_rect().size

# Generate random coordinates within the viewport
	var random_x = randi() % int(viewport_size.x)
	var random_y = randi() % int(viewport_size.y)

	
	kid.position = Vector2(random_x, random_y)
	
	get_parent().add_child(kid)
