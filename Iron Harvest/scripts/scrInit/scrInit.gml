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
	dialogue : {
		dialogue_1 : "",
		dialogue_2 : "",
	}
	scenes : {
		scene_one : new Scene([char_1], [char_2], dialogue_1, scene_two),
	},
		
}

/// @function Scene(_speaker, _audience, _dialogue, _next);
/// @param {array} _speaker An array of strings, where the string is a character reference
/// @param {array} _audience An array of strings, where the string is a character reference
/// @param {array} _dialogue An array of strings, where the strings are text for dialogue.
/// @param {struct} _next A struct containing what to do next after this current scene is done. Eg play another scene, or open a mini game etc

function Scene(_speaker, _audience, _dialogue, _next) constructor{
	speaker = _speaker;
	audience = _audience;
	dialogue = _dialogue;
	next = _next; //@Rob We might not want there to be a next scene, or it might be a minigame instead
}