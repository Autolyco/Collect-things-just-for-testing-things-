extends Node2D


var player = load("res://Assets/prefabs_/player/player.tscn")


func _ready():
	
	print('Initalized player')
	var p = player.instance()
	p.global_position = Vector2(256,512)
	self.add_child(p)
