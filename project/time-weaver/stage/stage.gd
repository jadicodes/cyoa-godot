extends Control


@export var _act : Act

@onready var _picture = %Picture
@onready var _textbox = %Textbox


func _ready() -> void:
	_set_properties()


func _set_properties() -> void:
	_set_picture()
	_set_text_queue()
	_set_text()


func _set_picture() -> void:
	if _act.picture != null:
		_picture.texture = _act.picture


func _set_text_queue():
	_textbox.set_queue(_act.get_array_size())
	

func _set_text() -> void:
	if _act.text_queue != null:
		_textbox.set_text(_act.text_queue[_textbox.get_queue_index()])


func _on_textbox_finished_current_text() -> void:
	_set_text()
