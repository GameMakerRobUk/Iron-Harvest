/// @function Scene(_background, _speaker, _audience, _dialogue_name, _next);
/// @param {string} _background the reference name of a background to use
/// @param {array} _dialogue_name Reference to an array of strings, where the strings are text for dialogue.
/// @param {struct} _next A struct containing what to do next after this current scene is done. Eg play another scene, or open a mini game etc

function Scene(_background, _dialogue_name, _next = undefined) constructor{
	
	background = get_background(_background);
	dialogue = get_dialogue(_dialogue_name);
	dialogue_index = 0;
	text_index = 0;
	
	next = _next; //@Rob We might not want there to be a next scene, or it might be a minigame instead
	
	static get_next_dialogue_element = function(){
		
		if (dialogue_index + 1 >= array_length(dialogue)){
			show_debug_message("There are no more dialogue elements left");
			text_index --;
			exit;
		}
		
		dialogue_index ++;
		text_index = 0;
	}
	
	static get_next_text_element = function(){
		text_index ++;
		
		show_debug_message("get_next_text_element");
		show_debug_message("dialogue[dialogue_index]: " + string(dialogue[dialogue_index]));
		
		var _text_array = dialogue[dialogue_index].text;
		
		if (text_index >= array_length(_text_array)){
			show_debug_message("There are no more text elements left");
			get_next_dialogue_element();	
		}
	}
	
	static step = function(){
		if (mouse_check_button_pressed(mb_left)){
			show_debug_message("Scene step clicking LMB");	
			get_next_text_element();
		}
	}
	
	static draw = function(){
		//show_debug_message("Scene draw");
		
		draw_sprite(background.sprite, 0, 0, 0);
		
		//Speakers
		var _current_dialogue = dialogue[dialogue_index];
		var _speaker = _current_dialogue.speakers[0];
		var _speaker_x = sprite_get_xoffset(_speaker.sprite);
		var _speaker_y = 1080;
		
		draw_sprite(_speaker.sprite, 0, _speaker_x, _speaker_y);
		
		//Audience
		var _audience = _current_dialogue.audience[0];
		var _audience_x = 1920 - sprite_get_xoffset(_speaker.sprite);
		var _audience_y = 1080;
		
		draw_sprite(_audience.sprite, 0, _audience_x, _audience_y);
		
		#region Text
		
		var _text = _current_dialogue.text[text_index];
		
		var _spr_w = sprite_get_width(spr_text_box);
		var _spr_h = sprite_get_height(spr_text_box);
		var _textbox_xscale = 960 / _spr_w;
		var _textbox_yscale = 270 / _spr_h;
		var _textbox_x = (room_width / 2);
		var _textbox_y = (room_height - (_spr_h * _textbox_yscale * 0.75));
		var _textbox_w = _spr_w * _textbox_xscale;
		var _textbox_h = _spr_h * _textbox_yscale;
		
		draw_sprite_ext(spr_text_box, 0, _textbox_x, _textbox_y, _textbox_xscale, _textbox_yscale, 0, c_white, 1);
		
		draw_set_font(fnt_dialogue_text);
		draw_set_colour(c_white);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		
		var _font_size = font_get_size(fnt_dialogue_text);
		
		var _text_x = _textbox_x - (_textbox_w * 0.45);
		var _text_y = _textbox_y - (_textbox_h * 0.4);
		
		
		draw_text_ext(_text_x, _text_y, _text, (_font_size * 1.5), _textbox_w * 0.9);
		
		#endregion
		
		#region Speaker
		
		var _speaker_name_w = string_width(_speaker.name);
		
		var _font_size_character_name = font_get_size(fnt_character_name);
		var _namebox_xscale = (_speaker_name_w * 1.2) / _spr_w;
		var _namebox_yscale = (_font_size_character_name * 2) / _spr_h;
		var _namebox_h = _spr_h * _namebox_yscale;
		
		var _namebox_x = _textbox_x;
		var _namebox_y = _textbox_y - ((_textbox_h * 0.5) + (_namebox_h * 0.5));
		
		draw_sprite_ext(spr_text_box, 0, _namebox_x, _namebox_y, _namebox_xscale, _namebox_yscale, 0, c_white, 1);
		
		draw_set_color(c_grey);
		draw_set_font(fnt_character_name);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		
		draw_text(_namebox_x, _namebox_y, _speaker.name);
		
		#endregion
	}
}