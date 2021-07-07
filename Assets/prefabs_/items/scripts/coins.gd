extends Area2D




var is_collected:bool = false


func _ready():
	pass



func _process(delta):
	self.rotation_degrees += 2.5
	
	if !is_collected :
		$Animations.play("stance")
	else :
		$CollisionShape2D.disabled = true
		$Animations.play("collected")



func _on_coins_collected(body):
	
	if body.name == 'Player':
		emit_signal("coin_collected")
		body._add_score()
		print('Coin collected')
		is_collected = true


func _on_collected_animation_finished(anim_name):
	anim_name == "collected"
	
	queue_free()
