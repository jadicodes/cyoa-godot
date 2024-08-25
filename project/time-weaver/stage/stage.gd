extends Control


@export var _act : Act

@onready var _picture = %Picture
@onready var _textbox = %Textbox

@onready var _options = %Options


func _ready() -> void:
	_set_text_properties()


func _set_text_properties() -> void:
	_set_picture()
	_set_text_queue()
	_set_text()


func _set_picture() -> void:
	if _act.picture != null:
		_picture.texture = _act.picture


func _set_text_queue() -> void:
	_textbox.set_queue(_act.get_array_size())


func _set_text() -> void:
	if _act.text_queue != null:
		_textbox.set_text(_act.text_queue[_textbox.get_queue_index()])


func _on_textbox_finished_current_text() -> void:
	_set_text()


func _on_textbox_finished_all_text() -> void:
	_set_options_properties()
	_textbox.hide_textbox()


func _set_options_properties() -> void:
	_set_options()
	_options.show()


func _set_options():
	for index in _act.option_titles.size():
		_options.create_new_button(_act.options[index], _act.option_titles[index])


func _on_options_new_act_selected() -> void:
	_act = _options.get_act()
	_options.hide()
	_set_text_properties()
	_options.delete_old_options()
