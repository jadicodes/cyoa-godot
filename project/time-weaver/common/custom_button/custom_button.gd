class_name CustomButton
extends Button

signal act_selected

var act: Act


func set_act(new_act: Act) -> void:
	act = new_act


func get_act() -> Act:
	return act


func _on_pressed() -> void:
	act_selected.emit()
