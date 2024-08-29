extends Control

const _STARTING_ACT = preload("res://acts/prologue/office_neutral.tres")

@export var _act : Act

@onready var _picture = %Picture
@onready var _textbox = %Textbox
@onready var _options = %Options


# On ready, set text properties

func _ready() -> void:
	_set_text_properties()


# Reset the game when an ending is reached

func _reset_game():
	_act = _STARTING_ACT
	_textbox.reset_queue_index()
	_set_text_properties()


# Set textbox and picture data to data recieved from _act

func _set_text_properties() -> void:
	_set_picture()
	_set_text_queue()
	_set_text()


func _set_text_queue() -> void:
	_textbox.set_queue(_act.get_array_size())


func _set_text() -> void:
	if _act.text_queue != null:
		_textbox.set_text(_act.text_queue[_textbox.get_queue_index()])


func _set_picture() -> void:
	if _act.picture != null:
		_picture.texture = _act.picture


# Manages signals recieved from textbox

func _on_textbox_finished_current_text() -> void:
	_set_text()


func _on_textbox_finished_all_text() -> void:
	if _act.is_game_over == true:
		_reset_game()
	else:
		_set_options_properties()
		_textbox.hide_textbox()


# Set Options panel to have the proper titles and to take you to the right act

func _set_options_properties() -> void:
	_set_options()
	_options.show()


func _set_options() -> void:
	for index in _act.option_titles.size():
		_options.create_new_button(_act.options[index], _act.option_titles[index])


# Manages signal recieved from player selecting new act

func _on_options_new_act_selected() -> void:
	_act = _options.get_act()
	_options.hide()
	_set_text_properties()
	_options.delete_old_options()
