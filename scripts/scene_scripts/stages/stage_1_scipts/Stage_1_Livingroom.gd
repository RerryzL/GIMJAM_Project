extends Node2D

@onready var door_1: Area2D = $Door_1
@onready var door_2: Area2D = $Door_2
@onready var hud: CanvasLayer = $Hud
@onready var player: CharacterBody2D = $Player

const SpawnLocation = preload("res://scripts/Spawn_Location.gd")
var current_room : String = "Livingroom"


func _ready() -> void:
	GameManager.current_room = current_room
	
	print("Hello Stage 1 Livingroom")
	hud.room_label.text = current_room
	door_1.on_door_pressed.connect(door_1_pressed)
	door_2.on_door_pressed.connect(door_2_pressed)
	player.position = GameManager.spawn_position



## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
	
func door_1_pressed():
	GameManager.load_stage_1_Bedroom(SpawnLocation.locations["Stage_1(livingroom-bedroom)"])
	
func door_2_pressed():
	GameManager.load_stage_1_Park(SpawnLocation.locations["Stage_1(livingroom-park)"])
