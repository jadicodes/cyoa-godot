extends TextureRect

var current_queue_index : int


#func rotate_picture_queue():
	#current_queue_index += 1
		#if current_queue_index <= _queue - 1:
		#else:
			#reset_queue_index()
