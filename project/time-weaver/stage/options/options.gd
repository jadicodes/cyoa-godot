extends CanvasLayer

signal new_act_selected

const CUSTOM_BUTTON = preload("res://common/custom_button/custom_button.tscn")
var _act: Act

@onready var _button_container = %ButtonContainer


func create_new_button(act: Act, desc: String) -> void:
	var _new_button = CUSTOM_BUTTON.instantiate()
	_button_container.add_child(_new_button)
	_new_button.act_selected.connect(_select_act.bind(_new_button))
	_new_button.set_act(act)
	_new_button.text = desc


func delete_old_options() -> void:
	for child in _button_container.get_children():
		child.queue_free()


func _select_act(new_button: CustomButton) -> void:
	_act = new_button.get_act()
	new_act_selected.emit()


func get_act() -> Act:
	return _act
