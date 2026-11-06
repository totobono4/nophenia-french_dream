extends Node

const MOD_DIR := "totobono4-french_dream"
const LOG_NAME := "totobono4-french_dream:master"

var mod_dir_path := ""
var extensions_dir_path := ""
var translations_dir_path := ""
var resources_dir_path := ""

func _init() -> void:
	ModLoaderLog.info("Init", LOG_NAME)
	mod_dir_path = ModLoaderMod.get_unpacked_dir().path_join(MOD_DIR)
	extensions_dir_path = mod_dir_path.path_join("extensions")
	translations_dir_path = mod_dir_path.path_join("lang")
	resources_dir_path = mod_dir_path.path_join("resources")

	install_script_extensions()
	install_scene_extentions()
	add_translations()

func install_scene_extentions() -> void:
	ModLoaderMod.extend_scene("res://resource/pause_menu.tscn", pause_menu_flags_injection)

func pause_menu_flags_injection(pause_menu: Node) -> Node:
	pause_menu.get_node("%option_language").get("variant").push_back(load(resources_dir_path.path_join("flag-fr-atlas.tres")))
	return pause_menu

func install_script_extensions() -> void:
	ModLoaderMod.install_script_extension(extensions_dir_path.path_join("frdream_pause_menu.gd"))
	ModLoaderMod.install_script_extension(extensions_dir_path.path_join("frdream_global_game.gd"))

func add_translations() -> void:
	ModLoaderMod.add_translation(translations_dir_path.path_join("french_dream.fr.translation"))

func _ready() -> void:
	ModLoaderLog.info("Ready", LOG_NAME)
