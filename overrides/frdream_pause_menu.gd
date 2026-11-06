extends "res://gdscript/ui/pause_menu.gd"

func _on_option_language_pressed() -> void :
	config.language = (config.language + 1) % 5
	_upd_option_language()
	game.apply_config()
