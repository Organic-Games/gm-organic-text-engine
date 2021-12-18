#region Drawing characters
	var i;
	for(i=0; i < array_length(characters); i++;){
		if(is_string(characters[i])){
			var exdata = styletable[i][3];
			draw_set_font(styletable[i][0]);
			draw_set_color(styletable[i][1]);
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			
			switch(styletable[i][2]){
				case 0: //Normal
					draw_text_transformed(x+characterx[i],y+charactery[i],characters[i],size,size,0);
				break;
				
				case 1: //Shaky
					draw_text_transformed(x+characterx[i]+random_range(0,exdata),y+charactery[i]+random_range(0,exdata),characters[i],size,size,0);
				break;
				
				case 2: //Wavy Vertical
					draw_text_transformed(x+characterx[i],y+charactery[i]+sin((sintimer+i*5)/exdata)*10,characters[i],size,size,0);
				break;
				
				case 3: //Wavy Horizontal
					draw_text_transformed(x+characterx[i]+sin((sintimer+i*5)/exdata)*10,y+charactery[i],characters[i],size,size,0);
				break;
			}
		}
	}
#endregion

type_char(true);

sintimer++;