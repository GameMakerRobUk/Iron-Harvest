function get_character(_character_name){
	return struct_get(global.data.characters, _character_name);	
}

function get_background(_background_name){
	return struct_get(global.data.backgrounds, _background_name);	
}

function get_dialogue(_dialogue_name){
	return struct_get(global.data.dialogue, _dialogue_name);	
}

function get_characters(_array_of_character_names){
	show_debug_message("get_characters | _array_of_character_names: " + string(_array_of_character_names));
	var _a = [];
	
	for (var i = 0; i < array_length(_array_of_character_names); i ++){
		var _character_name = _array_of_character_names[i];
		array_push(_a, get_character(_character_name));
	}
	show_debug_message("_a: " + string(_a));
	return _a;
}

function set_scene(_scene_name){
	global.state = STATES.scene;
	global.scene = struct_get(global.data.scenes, _scene_name);
	show_debug_message("global.scene: " + string(global.scene));
}