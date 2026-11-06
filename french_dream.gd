extends Node

const MOD_DIR := "totobono4-french_dream"
const LOG_NAME := "totobono4-french_dream:Main"

var mod_dir_path := ModLoaderMod.get_unpacked_dir().path_join(MOD_DIR)
var scripts_dir_path := mod_dir_path.path_join("scripts")
var extensions_dir_path := mod_dir_path.path_join("extensions")
var translations_dir_path := mod_dir_path.path_join("lang")
var resources_dir_path := mod_dir_path.path_join("resources")

var flag_fr := load(resources_dir_path.path_join("flag-fr-atlas.tres"))

func _ready() -> void:
	get_tree().node_added.connect(on_node_added)

func on_node_added(node: Node):
	match node.name:
		"option_language":
			node.get("variant").push_back(flag_fr)
