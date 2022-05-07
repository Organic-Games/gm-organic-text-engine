///@description Init variables

toprint = "";
onchar = 1;
textX = 0;
textY = 0;

characters[0] = string_char_at(toprint,onchar);
characterx[0] = textX;
charactery[0] = textY;

delay = 0;
sintimer = 0;

stylestring = "";
stringwidth = 0;

randsound = undefined;
char = undefined;
finished = false;

//Customization
font = undefined;
limit = undefined;
size = undefined;
textspeed = undefined;
sound = undefined;
textcolor = undefined;
textstyle = undefined;
newlinechar = undefined;
otherdata = undefined;
advancedtext = undefined;

#region Split string
	function split_string(str,delimiter){
		var counter = 0;
		var index = 1;
		var array = [];
		var word = "";
		for(var i = 1; i < string_length(str)+1; i++;){
			if string_char_at(str,i) == delimiter {
				array[counter] = word;
				counter ++;
				index = 1;
				word = "";
			} else {
				word = string_insert(string_char_at(str,i),word,index);
				index ++;
			}
		}
		if(counter > 0) array[counter] = word;
		return array;
	}
#endregion

#region Get command parameter
	function get_command_param(str,command){
		var s;
		s = string_replace(str,command,"");
		s = string_delete(s,1,string_last_pos(" ",s));
		return s;
	}
#endregion

#region Get color
	function get_color_string(str) {
		switch(str) {
			case "aqua":    return c_aqua; break;
			case "black":   return c_black; break;
			case "blue":    return c_blue; break;
			case "dkgray":  return c_dkgray; break;
			case "fuchsia": return c_fuchsia; break;
			case "gray":    return c_gray; break;
			case "green":   return c_green; break;
			case "lime":    return c_lime; break;
			case "ltgray":  return c_ltgray; break;
			case "maroon":  return c_maroon; break;
			case "navy":    return c_navy; break;
			case "olive":   return c_olive; break;
			case "orange":  return c_orange; break;
			case "purple":  return c_purple; break;
			case "red":     return c_red; break;
			case "silver":  return c_silver; break;
			case "teal":    return c_teal; break;
			case "white":   return c_white; break;
			case "yellow":  return c_yellow; break;
		}
	}
#endregion

#region Style check
	function style_check(){
		onchar++;
		char = string_char_at(toprint,onchar);
		
		while(char != "]"){
			styletable[onchar-1] = [font,textcolor,textstyle,otherdata];
			stylestring += char;
			onchar++;
			char = string_char_at(toprint,onchar);
		}
		
		styletable[onchar-1] = [font,textcolor,textstyle,otherdata];
		onchar++;
		
		var strs = split_string(stylestring,",");
		if(array_length(strs) == 0) strs = [stylestring];
		
		//Commands
		for(var i = 0; i < array_length(strs); i++){
			if(string_pos("style",strs[i]) != 0)
				textstyle = int64(get_command_param(strs[i],"style"));
			if(string_pos("color",strs[i]) != 0)
				textcolor = get_color_string(get_command_param(strs[i],"color"));
			if(string_pos("extra",strs[i]) != 0)
				otherdata = int64(get_command_param(strs[i],"extra"));
		}
		
		stylestring = "";
	}
#endregion

#region Typing characters
	function type_char(enable_sound){
		if(onchar < string_length(toprint)+1){
			if(delay == 0){
				draw_set_font(styletable[onchar-1][0]);
				char = string_char_at(toprint,onchar);
			
				if(advancedtext and char == "[" and (string_char_at(toprint,onchar-1) != "\\" or onchar == 1)){
					style_check();
					delay = textspeed;
				} else {
					if(char == "\\" and string_char_at(toprint,onchar-1) != "\\") {
						onchar++;
						delay = textspeed;
					} else {
						if(randsound != undefined) audio_stop_sound(randsound);
						
						if(string_char_at(toprint,onchar-1) == " " and stringwidth+string_width(string_copy(toprint,onchar-1,string_pos_ext(" ",toprint,onchar)-onchar-1))*size >= limit){
							//Reached limit
							stringwidth = 0;
							textX = 0;
							textY += string_height(char)*size;
							delay = textspeed;
						}
						if(char == newlinechar){
							//Newline
							stringwidth = 0;
							textX = 0;
							textY += string_height(char)*size;
							characters[onchar-1] = "";
							characterx[onchar-1] = textX;
							charactery[onchar-1] = textY;
							onchar++;
							delay = textspeed;
						} else {
							//Non-newline
							characters[onchar-1] = char;
							characterx[onchar-1] = textX;
							charactery[onchar-1] = textY;
							
							onchar++;
							
							if(char=="!" or char=="?" or char=="." or char==",") delay=textspeed*10;
							else delay = textspeed;
							
							if(char!=" " and array_length(sound)>0 and enable_sound){
								randsound = sound[random_range(0,array_length(sound))];
								audio_sound_pitch(randsound,1);
								audio_play_sound(randsound,0,false);
							}
							
							textX += string_width(char)*size;
							stringwidth += string_width(char)*size;
						}
					}
				}
				//Style table
				styletable[onchar-1] = [font,textcolor,textstyle,otherdata];
			}
			delay--;
		} else finished = true;
	}
#endregion