extends Node


var score:int = 0
var global_position 




func _ready():
	print("data handler initialized")
	


func save_data():
	var elements_to_save = get_tree().get_nodes_in_group("to_save")
	
	for elements in elements_to_save:
		print(elements)


func load_data():
	pass




