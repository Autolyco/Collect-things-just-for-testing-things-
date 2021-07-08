extends KinematicBody2D



var movement : Vector2
const speed = 450

var score:int = 0

export var debug_mod:bool


func _ready():
	
	_interface_animations()
	
#	print("Player has spawned")
#
#	print("Debug mod : " + str(debug_mod))
	
	if debug_mod:
		$CanvasLayer/Interface/debug_state_input.visible = true
	else :
		$CanvasLayer/Interface/debug_state_input.visible = false


func _data_manager_attributes():
	DataManager.global_position = self.global_position
	DataManager.score = self.score

func _physics_process(delta):
	
	_data_manager_attributes()
	
	var dirx = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	var diry = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
	if dirx or diry != 0:
		$AnimationPlayer.play("movement")
	
	
	movement.x = speed * dirx
	movement.y = speed * diry
	
	_debug_mod()
	
	$CanvasLayer/Interface/UI/lbl_score_value.text = str(score)
	
	
	
	movement = move_and_slide(movement)

func _add_score():
	score += 10
	$CanvasLayer/Interface/animation_score_value_effect.play("new_score_effect")
	


func _interface_animations():
	$CanvasLayer/Interface/animation_score_stance.play("Stance")
	$CanvasLayer/Interface/animation_score_value_stance.play("Stance_score")



func _debug_mod():
	
	$CanvasLayer/Interface/debug_state_input/positions_elements/lbl_global_position.text = str(self.global_position)
	$CanvasLayer/Interface/debug_state_input/positions_elements/lbl_vector_position.text = str(movement)
	
	if Input.is_action_just_pressed("ui_right"):
		$CanvasLayer/Interface/debug_state_input/input_elements/lbl_right.visible = true
	elif Input.is_action_just_released("ui_right"):
		$CanvasLayer/Interface/debug_state_input/input_elements/lbl_right.visible = false
	
	if Input.is_action_just_pressed("ui_left"):
		$CanvasLayer/Interface/debug_state_input/input_elements/lbl_left.visible = true
	elif Input.is_action_just_released("ui_left"):
		$CanvasLayer/Interface/debug_state_input/input_elements/lbl_left.visible = false
	
	if Input.is_action_just_pressed("ui_up"):
		$CanvasLayer/Interface/debug_state_input/input_elements/lbl_up.visible = true
	elif Input.is_action_just_released("ui_up"):
		$CanvasLayer/Interface/debug_state_input/input_elements/lbl_up.visible = false
	
	if Input.is_action_just_pressed("ui_down"):
		$CanvasLayer/Interface/debug_state_input/input_elements/lbl_down.visible = true
	elif Input.is_action_just_released("ui_down"):
		$CanvasLayer/Interface/debug_state_input/input_elements/lbl_down.visible = false
	
