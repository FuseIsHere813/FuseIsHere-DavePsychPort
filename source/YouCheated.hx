package;
#if sys
import sys.io.File;
import sys.io.Process;
#end
import flixel.*;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class YouCheated extends MusicBeatState
{

    public function new()
    {
        super();
    }

    override public function create():Void
    {
        super.create();
        var FuckingDumbassBullshitFuckYOU:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('dave/cheater_lol'));
        FuckingDumbassBullshitFuckYOU.screenCenter();
        add(FuckingDumbassBullshitFuckYOU);
        FlxG.sound.playMusic(Paths.music('YouCheated'),1,true);
    }

    override public function update(elapsed:Float):Void
    {
		super.update(elapsed);
        
        if (FlxG.keys.justPressed.ENTER)
        #if release
        ughWhyDoesThisHaveToFuckingExist();
        #else
        FlxG.switchState(new SusState());
        #end
    }
    
    public function ughWhyDoesThisHaveToFuckingExist()
    {
        
    FlxG.switchState(new SusState());
    trace('hello');

    }
    
}