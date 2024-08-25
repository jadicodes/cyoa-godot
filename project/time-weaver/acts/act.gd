class_name Act
extends Resource

@export var picture : CompressedTexture2D
@export var text_queue : Array[String]
@export var option_titles : Array[String]
@export var options : Array[Act]


func get_array_size() -> int:
	return text_queue.size()
