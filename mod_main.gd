extends Node

const MOD_DIR := "totobono4-french_dream"
const LOG_NAME := "totobono4-french_dream:Log "

var mod_dir_path := "res://mods-unpacked/totobono4-french_dream"
var translations_dir_path := mod_dir_path.path_join("lang")
var resources_dir_path := mod_dir_path.path_join("resources")

var flag_fr := load(resources_dir_path.path_join("flag-fr-atlas.tres"))
var translation : OptimizedTranslation = load(translations_dir_path.path_join("french_dream.fr.translation"))

func _ready() -> void:
	print(LOG_NAME, "Looking for API to add Translation..")
	
	var mods = get_parent().get_children()
	for mod in mods:
		match mod.name:
			"totobono4-dream_translator_api":
				print(LOG_NAME, "Found API !")
				mod.add_dream_translation(flag_fr, translation)
