extends Node2D




var item = load("res://Assets/prefabs_/items/coins.tscn")




func _ready():
	pass



func _add_score():
	pass


func _spawn_item_logic():
	
	randomize()
	var map_x = rand_range(128,1152)
	var map_y = rand_range(128,912)
	
	var i = item.instance()
	i.global_position.x = map_x
	i.global_position.y = map_y
	add_child(i)


func _on_timer_spawn_item_timeout():
	randomize()
	
	var timer_value = rand_range(0,2)
	
	_spawn_item_logic()
	$timer_spawn_item.start(float(timer_value))
