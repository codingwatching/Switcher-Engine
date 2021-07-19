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
import flixel.util.FlxTimer;

using StringTools;

class AboutState extends MusicBeatState
{
	var logoBl:FlxSprite;

	var text:FlxText;
	var funnyIcons:FlxSprite;
	var nextFunnyIcon:Int = 1;


	override function create()
	{

		// LOAD MUSIC

		// LOAD CHARACTERS

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.color = 0xFFff00dd;
		bg.screenCenter();
		add(bg);

		var ass:FlxText = new FlxText(0, 0, "Friday Night Funkin' Android Port made by Luckydog7 and Zack'sGamerz\nSwitcher Engine Made By Klavier Gayming\nFriday Night Funkin Made By:\nninjamuffin99, PhantomArcade, evilsk8r, Kawai Sprite\n", 20);
		ass.setFormat(Paths.font("funkin.otf"), 40, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE,FlxColor.BLACK);
		ass.screenCenter();
		add(ass);
		
		funnyIcons = new FlxSprite(550, 0);
		funnyIcons.frames = Paths.getSparrowAtlas('elcredits','shared');
		funnyIcons.screenCenter(X);
		funnyIcons.animation.addByPrefix('icon1','luck',0,false);
		funnyIcons.animation.addByPrefix('icon2','zack',0,false);
		funnyIcons.animation.addByPrefix('icon3','me!',0,false);
		funnyIcons.animation.addByPrefix('icon4','muffin',0,false);
		funnyIcons.animation.addByPrefix('icon5','thefuniartist',0,false);
		funnyIcons.animation.addByPrefix('icon6','theotherartist',0,false);
		funnyIcons.animation.addByPrefix('icon7','themusician',0,false);
		funnyIcons.animation.play('icon1');
		funnyIcons.setGraphicSize(Std.int(funnyIcons.width * 1.25));
		add(funnyIcons);

		if (FlxG.random.bool(10) || FlxG.keys.pressed.P)
		{
			var video = new VideoPlayer(0, 0,'videos/amogus.webm');
			video.finishCallback = () -> {
				remove(video);
			}
			video.setGraphicSize(Std.int(video.width * 2));
			video.ownCamera();
			video.updateHitbox();
			add(video);
			video.play();
		}

		

		#if mobileC
		addVirtualPad(NONE, A);
		#end
		idrk();
		super.create();
	}


	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		if (controls.ACCEPT || controls.BACK)
		{
			FlxG.switchState(new OptionsMenu());
		}

		#if android
		if (FlxG.android.justReleased.BACK)
		{
			FlxG.switchState(new OptionsMenu());
		}
        #end
	}

	function idrk():Void {
		new FlxTimer().start(1, function(tmr:FlxTimer){
			nextFunnyIcon += 1;
			if (nextFunnyIcon > 7)
				nextFunnyIcon = 1;
			if (nextFunnyIcon < 1)
				nextFunnyIcon = 7;
			funnyIcons.animation.play('icon' + Std.string(nextFunnyIcon), false);
			if (FlxG.random.bool(20) || FlxG.keys.justPressed.H)
				FlxG.sound.play(Paths.sound('vineboom','shared'));
			tmr.reset(1);
		});
	}

}