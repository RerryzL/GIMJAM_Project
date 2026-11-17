extends Node2D
signal on_block_matching_solved

@onready var canvas_layer: CanvasLayer = $CanvasLayer

var player_on_collision : bool = false
var accessible : bool = false
var puzzle_solved : bool = false

var available_phases : Array = ["Kid"]

func _ready() -> void:
	for phase in available_phases:
		if phase == GameManager.current_phase:
			accessible = true
	
	
func _input(event: InputEvent) -> void:
	if !accessible or !player_on_collision or puzzle_solved: return
	
	if event.is_action_pressed("e_accept"):
		GameManager.on_task = true
		GameManager.interact = false
		canvas_layer.visible = true
	elif event.is_action_pressed("ui_cancel"):
		GameManager.on_task = false
		GameManager.interact = true
		canvas_layer.visible = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GameManager.on_task = false
		GameManager.interact = true
		player_on_collision = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		GameManager.interact = false
		player_on_collision = false
