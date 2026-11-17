extends Node
# Game_Manager = script yang selalu di run di semua scene. (Kalau mau diubah, kasih tau semua yang lain)
# Game_Managernya udah ku add sebagai AutoLoad. Jadi bisa dipanggil discene mana aja (ex : GameManager.load_main_menu())

var game_paused : bool =  false
var on_task : bool = false
var current_phase : String = "Kid"
var current_room : String = ""
var interact : bool = false
var spawn_position : Vector2 = Vector2.ZERO

# UI LOAD
const main_menu_scene : PackedScene = preload("res://UI/Main_Menu.tscn")
func load_main_menu():
	get_tree().change_scene_to_packed(main_menu_scene)


# STAGE 1 LOAD
const stage_1_bedroom_scene : PackedScene = preload("res://scenes/stages/stage_1/Stage_1_Bedroom.tscn")
func load_stage_1_Bedroom(spawn : Vector2):
	spawn_position = spawn
	get_tree().change_scene_to_packed(stage_1_bedroom_scene)

const stage_1_Livingroom_scene : PackedScene = preload("res://scenes/stages/stage_1/Stage_1_Livingroom.tscn")
func load_stage_1_Livingroom(spawn : Vector2):
	spawn_position = spawn
	get_tree().change_scene_to_packed(stage_1_Livingroom_scene)

const stage_1_Park_scene : PackedScene = preload("res://scenes/stages/stage_1/Stage_1_Park.tscn")
func load_stage_1_Park(spawn : Vector2):
	spawn_position = spawn
	get_tree().change_scene_to_packed(stage_1_Park_scene)


# GAME QUIT
func quit_game():
	get_tree().quit()
