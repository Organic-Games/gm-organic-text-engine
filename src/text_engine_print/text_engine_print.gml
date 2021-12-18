function text_engine_print(text, x, y, textspeed, font, size, limit, color, style, newlinechar, sound, advancedtext, otherdata) {
	
	/* Passes the arguments to the created textEngine instance. */

	textEngine = instance_create_depth(x,y,-100,obj_textengine);

	textEngine.toprint = text;
	textEngine.textspeed = textspeed;
	textEngine.font = font;
	textEngine.size = size;
	textEngine.limit = limit;
	textEngine.textcolor = color;
	textEngine.textstyle = style;
	textEngine.newlinechar = newlinechar;
	textEngine.sound = sound;
	textEngine.advancedtext = advancedtext;
	textEngine.otherdata = otherdata;
	
	//Style table
	textEngine.styletable[0]=[font,color,style,otherdata];
	
	return textEngine;
	
}