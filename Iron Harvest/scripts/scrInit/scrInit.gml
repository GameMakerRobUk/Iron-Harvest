global.text[0] = [
					"This is the text for dialogue_1.", 
					"This is the second line for dialogue_1.", 
					"This is the third line for dialogue_1."
				];
global.text[1] = [
					"The speaker and audience has now switched.",
					"This is the second line for the switched dialogue",
					"This is the third line for the switched dialogue",
				];

global.data = {
	backgrounds : {
		bg_1 : new Background(bg_village, "Village 1"),
		bg_2 : new Background(bg_village_2, "Village 2"),
		bg_3 : new Background(bg_village_3, "Village 3"),
		bg_4 : new Background(bg_village_4, "Village 4"),
		bg_5 : new Background(bg_charming_village, "Charming Village"),
		bg_6 : new Background(bg_kim_youngju_day, "Kim Youngju Day"),
	},
	characters : {
		char_1 : new Character(spr_char_1, "Character 1"),
		char_4 : new Character(spr_char_4, "Character 4"),
		char_6 : new Character(spr_char_6, "Character 6"),
		char_7 : new Character(spr_char_7, "Character 7"),
		char_8 : new Character(spr_char_8, "Character 8"),
		char_9 : new Character(spr_char_9, "Character 9"),
		char_11 : new Character(spr_char_11, "Character 11"),
		char_12 : new Character(spr_char_12, "Character 12"),
		char_13 : new Character(spr_char_13, "Character 13"),
		char_16 : new Character(spr_char_16, "Character 16"),
	},
}

global.data.dialogue = {
	dialogue_1 : 
	[
		new Dialogue(["char_1"], ["char_4"], global.text[0]), //The text will clear after all of this text has been shown (and a button is pressed)
		new Dialogue(["char_4"], ["char_1"], global.text[1]), //The text will clear after all of this text has been shown (and a button is pressed)
	],
};

global.data.scenes = {
	scene_one : new Scene("bg_1", "dialogue_1"),
	scene_two : undefined,
}

show_debug_message("global.data: " + string(global.data));

enum STATES {scene};

set_scene("scene_one");