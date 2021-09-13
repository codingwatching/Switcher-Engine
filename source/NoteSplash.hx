package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import Paths;
import Song;
import Conductor;
import Math;
import openfl.geom.Matrix;
import openfl.display.BitmapData;
import openfl.utils.AssetType;
import lime.graphics.Image;
import flixel.graphics.FlxGraphic;
import openfl.utils.AssetManifest;
import openfl.utils.AssetLibrary;
import flixel.system.FlxAssets;
import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxObject;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import lime.utils.Assets;
import openfl.geom.Matrix;
import openfl.display.BitmapData;
import openfl.utils.AssetType;
import lime.graphics.Image;
import flixel.graphics.FlxGraphic;
import flixel.animation.FlxAnimation;

import openfl.utils.AssetManifest;
import openfl.utils.AssetLibrary;

#if cpp
import Sys;
import sys.FileSystem;
#end


using StringTools;

class NoteSplash extends FlxSprite
{
	

    override public function new()
    {
    	super();
    	frames = Paths.getSparrowAtlas("noteSplashes",'shared');
    	//impact 1
    	animation.addByPrefix("note1-0", "note splash blue 1", 24, false);
    	animation.addByPrefix("note2-0", "note splash green 1", 24, false);
    	animation.addByPrefix("note0-0", "note splash purple 1", 24, false);
    	animation.addByPrefix("note3-0", "note splash red 1", 24, false);
    	//impact 2
    	animation.addByPrefix("note1-1", "note splash blue 2", 24, false);
    	animation.addByPrefix("note2-1", "note splash green 2", 24, false);
    	animation.addByPrefix("note0-1", "note splash purple 2", 24, false);
    	animation.addByPrefix("note3-1", "note splash red 2", 24, false);
    }

    public function setupNoteSplash(xPos:Float, yPos:Float, note:Int)
    {
    	if(note == 0)
    	{
    		note = 0;
    	}
    	x = xPos;
    	y = yPos;
    	alpha = 0.6;
    	animation.play("note" + note + "-" + FlxG.random.int(0, 1), true);
    	var a:FlxAnimation = animation.curAnim;
		try {
    	a.frameRate = a.frameRate + FlxG.random.int(-2, 2);
    	updateHitbox();
		}
		catch(e) {
			trace('prenis');
		}
    	offset.set(0.3 * width, 0.3 * height);
    }

    override public function update(elapsed:Float)
    {
    	
    	if(animation.curAnim.finished == true)
    	{
    		kill();
    	}
    	super.update(elapsed);
    }
}