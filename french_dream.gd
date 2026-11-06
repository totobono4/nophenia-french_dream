extends Node

const MOD_DIR := "totobono4-french_dream"
const LOG_NAME := "totobono4-french_dream:Main"

var mod_dir_path := ModLoaderMod.get_unpacked_dir().path_join(MOD_DIR)
var scripts_dir_path := mod_dir_path.path_join("scripts")
var overrides_dir_path := mod_dir_path.path_join("overrides")
var translations_dir_path := mod_dir_path.path_join("lang")
var resources_dir_path := mod_dir_path.path_join("resources")

var flag_fr := load(resources_dir_path.path_join("flag-fr-atlas.tres"))
var frdream_pause_menu := load(overrides_dir_path.path_join("frdream_pause_menu.gd"))

var pause_menu : Node
var option_language : Node

func _ready() -> void:
	get_tree().node_added.connect(on_node_added)
	game.config_updated.connect(_on_apply_config)

func on_node_added(node: Node):
	match node.name:
		"pause_menu":
			pause_menu = node
		"option_language":
			option_language = node
			
			option_language.get("variant").push_back(flag_fr)
			
			print("OPTION LANGUAGE DETECTED")
			for signal_connection in option_language.get_signal_connection_list("pressed"):
				if signal_connection.callable.get_method() == "_on_option_language_pressed":
					option_language.disconnect(signal_connection.signal.get_name(), signal_connection.callable)
			option_language.connect("pressed", _on_option_language_pressed)

func _on_apply_config() -> void:
	match config.language:
		4: TranslationServer.set_locale("fr")

func _on_option_language_pressed() -> void :
	config.language = (config.language + 1) % 5
	pause_menu.call("_upd_option_language")
	game.apply_config()
