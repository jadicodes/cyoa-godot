extends Control


@export var _act : Act

@onready var _picture = %Picture
@onready var _textbox = %Textbox


func _ready():
	_set_properties()


func _set_properties():
	_set_picture()
	_set_text()


func _set_picture():
	if _act.picture != null:
		_picture.texture = _act.picture


func _set_text():
	if _act.text != null:
		_textbox.set_text(_act.text)
