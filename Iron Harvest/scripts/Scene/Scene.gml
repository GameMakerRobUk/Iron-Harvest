/// @function Scene(_background, _speaker, _audience, _dialogue_name, _next);
/// @param {string} _background the reference name of a background to use
/// @param {array} _speakers An array of strings, where the string is a character reference
/// @param {array} _audience An array of strings, where the string is a character reference
/// @param {array} _dialogue_name Reference to an array of strings, where the strings are text for dialogue.
/// @param {struct} _next A struct containing what to do next after this current scene is done. Eg play another scene, or open a mini game etc

function Scene(_background, _speakers, _audience, _dialogue_name, _next = undefined) constructor{
	
	show_debug_message("Scene | " + string({bg : _background, speakers : _speakers, audience : _audience, dialogue_name : _dialogue_name}))
	
	background = get_background(_background);
	speakers = get_characters(_speakers);
	audience = get_characters(_audience);
	dialogue = get_dialogue(_dialogue_name);
	
	next = _next; //@Rob We might not want there to be a next scene, or it might be a minigame instead
}