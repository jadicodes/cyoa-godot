class_name Act
extends Resource

@export var picture : CompressedTexture2D
@export var text_queue : Array[String]
@export var option1 : Act
@export var option2 : Act


func get_array_size() -> int:
	return text_queue.size()
