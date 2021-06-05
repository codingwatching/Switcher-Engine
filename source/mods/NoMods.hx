package options;

import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;

using StringTools;

class NoMods extends MusicBeatState
{
	var logoBl:FlxSprite;

	var text:FlxText;


	override function create()
	{

		// LOAD MUSIC

		// LOAD CHARACTERS

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('funkin','shared'));
		
		logoBl = new FlxSprite(-150, -100);
		logoBl.antialiasing = true;
		logoBl.updateHitbox();
		logoBl.screenCenter();
		logoBl.y = logoBl.y - 100;

		text = new FlxText(0, 0, 0, "You don't have any mods installed, press A to download the patch or b to exit.", 64);
		text.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, RIGHT);
		text.screenCenter();
		text.y = text.y - 150;

		add(bg);
		add(text);

        #if mobileC
        addVirtualPad(NONE, A_B);
        #end

 
		super.create();
	}


	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		#if mobileC
		if (FlxG.android.justReleased.BACK || controls.BACK)
		{
			FlxG.switchState(new OtherState());
		}
        if (controls.ACCEPT)
        {
            FlxG.openURL('https://github.com/KlavierGayming/Switcher-Engine');
        }
		#end

	}

}