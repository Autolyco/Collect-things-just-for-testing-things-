extends Node


var score:int = 0
var global_position 



var path_save = 'user://save.dat'

func _ready():
	print("data handler initialized")
	


func data_for_save():
	var data_to_save={
		'score': score,
		'global_position': global_position
	}
	
	var file = File.new()
	file.open(path_save, file.WRITE)
	file.store_var(data_to_save)
	file.close()
	
	
	print('Data is saved')

func load_data():
	var file = File.new()
	if file.file_exists(path_save):
		var error = file.open(path_save,File.READ)
		if error == OK :
			var data_read = file.get_var(true)
			
			global_position = data_read.global_position
			score = data_read.score
			
			
			Player.global_position = global_position
			Player.score = score

