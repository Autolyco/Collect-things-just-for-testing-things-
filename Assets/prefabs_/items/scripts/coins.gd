extends Area2D



func _ready():
	pass



func _process(delta):
	self.rotation_degrees += 2.5
	
	$Animations.play("rotation")
