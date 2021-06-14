# **Organic Text Engine**
## An easy and customizable text engine for GameMaker:Studio 2
---
## **Usage**
### **Install**
The text engine comes as a package for GMS2. Simply create a project, click on the Tools menu, and click *Import Local Package*. Select the *OrganicTextEngine.yymps* file you downloaded.
### **Making Text**
The package includes a script named *text_engine_print*. Try it out.

First, you'll need to import a font. *Right click the Fonts folder in the asset manager > Create > Font*. Choose any font from your computer. Next, create a room *(make sure it is the first room that opens when you start the game)*. Finally, open the room editor for the room you created, and click *Creation Code*, and type this: *(replace NAME_OF_FONT with the asset name of the font you created)*

    text_engine_print("TEST!", 50, 50, 2, NAME_OF_FONT, c_white, 0, "\n", [], false, 0);

#### **Explanation**
*"TEST!"* - The text to write

*50, 50* - The starting X and Y position of the text

*2* - Text type speed (Number of frames to wait between letters; lower is faster)

*NAME_OF_FONT* - The font for the text

*c_white* - The color of the text

*0* - The style of the text (Go to [**Fancy Text**](#fancy-text))

*"\n"* - The character to use as a newline

*[]* - The sounds to play when typing the text (Picked at random from the array)

*false* - Advanced text mode (Go to [**Fancier Text**](#fancier-text))

*0* - Extra data (Go to [**Fancy Text**](#fancy-text))

---

#### ***Syntax***

    text_engine_print(text, x, y, speed, font, color, style, newlinechar, sounds, advancedtext, extradata);

---

### **Fancy Text**

You can change the ```style``` parameter to make some fancy text! You can use the ```extradata``` parameter to further customize the effect.

|Style number |Name | Extra data |
--- | --- | ---
|0|Normal|N/A
|1|Shaky|Shake amount
|2|Wavy vertical|Wave speed
|3|Wavy horizontal|Wave speed

---

### **Fancier Text**

If the ```advancedtext``` parameter is ```true```, you can have some ***REALLY*** fancy text. You can use control codes to change the style of your text mid-string. Control codes begin and end with the ```§``` character. *(```OPTION+6``` on Mac, ```ALT+0+1+6+7``` on Windows)*

|Letter|Description | Parameter |
--- | --- | ---
|S |Change style|Style number
|C |Change text color|Any GMS2 color asset (without the ```c_```)
|X |Change extra data|Any number

Parameters are typed right after the control code *(**without** spaces)*. 

Example: ```Hello§S1§§X3§§Cred§Goodbye``` would look like this:

![Example](example.gif)

```§S1§``` turns the style to Shaky, ```§X3§``` changes the extra data (shakiness amount) to 3, and ```§Cred§``` changes the color to red.

---

## Created by Chase Peck
v1.0.0