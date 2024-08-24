extends CanvasLayer

const CHAR_READ_RATE = 0.06

enum state {
	READY,
	READING,
	FINISHED
}

var current_state = state.READY

@onready var _textbox = %TextboxContainer
@onready var _start_symbol = %StartSymbol
@onready var _text = %Label
@onready var _end_symbol = %EndSymbol


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("select") and current_state == state.FINISHED:
		_change_state(state.READY)
		hide_textbox()


func show_textbox() -> void:
	_start_symbol = "*"
	_textbox.show()


func hide_textbox() -> void:
	_text.visible_ratio = 0.0
	_textbox.hide()


func set_text(text) -> void:
	_text.text = text
	_change_state(state.READING)
	show_textbox()
	var tween = create_tween()
	tween.tween_property(_text, "visible_ratio", 1.0, len(text) * CHAR_READ_RATE).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.connect("finished", _on_tween_finished)


func _on_tween_finished() -> void:
	_end_symbol.text = "*"
	_change_state(state.FINISHED)


func _change_state(new_state):
	current_state = new_state
	match current_state:
		state.READY:
			print("Changing state to READY")
		state.READING:
			print("Changing state to READING")
		state.FINISHED:
			print("Changing state to FINISHED")
