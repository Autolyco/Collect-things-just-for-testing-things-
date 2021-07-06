extends KinematicBody2D



var movement : Vector2
const speed = 150


func _ready():
	print("Player has spawned")


func _physics_process(delta):
	
	var dirx = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	var diry = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
	
	
	movement.x = speed * dirx
	movement.y = speed * diry
	
#	print(movement)
	
	movement = move_and_slide(movement)
	
	
