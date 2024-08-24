extends CanvasLayer

const CHAR_READ_RATE = 0.06

@onready var _textbox = %TextboxContainer
@onready var _start_symbol = %StartSymbol
@onready var _text = %Label
@onready var _end_symbol = %EndSymbol


func _ready():
	set_text("This is placeholder text! Wow!")


func show_textbox():
	_start_symbol = "*"
	_textbox.show()


func hide_textbox():
	_start_symbol.text = ""
	_text.text = ""
	_end_symbol = ""
	_text.visible_ratio = 0.0
	_textbox.hide()


func set_text(text):
	_text.text = text
	show_textbox()
	var tween = get_tree().create_tween()
	tween.tween_property(_text, "visible_ratio", 1.0, len(text) * CHAR_READ_RATE).set_trans(Tween.TRANS_LINEAR)
