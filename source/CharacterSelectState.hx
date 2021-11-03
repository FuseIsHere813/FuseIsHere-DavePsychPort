package;

#if desktop
import Discord.DiscordClient;
#end
import Section.SwagSection;
import Song.SwagSong;
import WiggleEffect.WiggleEffectType;
import flixel.FlxBasic;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;
import flixel.addons.effects.chainable.FlxEffectSprite;
import flixel.addons.effects.chainable.FlxWaveEffect;
import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.atlas.FlxAtlas;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxBar;
import flixel.util.FlxCollision;
import flixel.util.FlxColor;
import flixel.util.FlxSort;
import flixel.util.FlxStringUtil;
import flixel.util.FlxTimer;
import haxe.Json;
import lime.utils.Assets;
import openfl.display.BlendMode;
import openfl.display.StageQuality;
import openfl.filters.ShaderFilter;
import openfl.utils.Assets as OpenFlAssets;
import editors.ChartingState;
import editors.CharacterEditorState;
import Achievements;
import StageData;
import FunkinLua;

#if sys
import sys.FileSystem;
#end


using StringTools;

class TestState extends MusicBeatState
{
    public static var character:String = 'bf';
    // var length = characters.length;
    var cur_section:Int = 0;
    var text:FlxText = new FlxText(0, 0, FlxG.width, "Character select", 20);
    var cur_character = new FlxText(0, 70, FlxG.width, "bfc-playable");
    var logoBl:FlxSprite;
    var moving:Bool = false;

    var characters:Array<String> = [
        'bf',
        'bf-christmas',
        'bf-pixel',
        'dave',
        'dave_insanity',
        'dave_finale',
        'dave-3d'
    ];
    var iconP1 = new HealthIcon('bf', true);                                                       
    override public function create():Void
        {
            var bg:FlxSprite = new FlxSprite(0, -50).loadGraphic(Paths.image('menuBG'));

            text.setFormat(null,30,FlxColor.WHITE,FlxTextAlign.CENTER);
            cur_character.setFormat("VCR OSD Mono",30,FlxColor.BLACK,FlxTextAlign.CENTER);
            cur_character.text = characters[cur_section];
            add(bg);
            add(text);
            add(cur_character);
            add(iconP1);
            iconP1.y = 4;
            iconP1.x = 340;
            logoBl = new FlxSprite(130, 140);
            logoBl.frames = Paths.getSparrowAtlas('logoBumpin');
            logoBl.antialiasing = ClientPrefs.globalAntialiasing;
            logoBl.animation.addByPrefix('bump', 'logo bumpin', 24);
            logoBl.animation.play('bump');
            logoBl.updateHitbox();
            add(logoBl);
            // logoBl.screenCenter();
            // logoBl.color = FlxColor.BLACK;
            super.create();

        }
    
    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
        if (controls.UI_UP_P)
            {
                if (moving)
                    {
                        logoBl.y = logoBl.y - 10;
                        trace("X:" + logoBl.x + " Y: " + logoBl.y + " Song: " + PlayState.SONG.song.toLowerCase());
                    } else {
                       changeSelection(-1);
                    }


               
            }
            if (controls.UI_DOWN_P)
            {
                if (moving)
                {
                    logoBl.y = logoBl.y + 10;
                    trace("X:" + logoBl.x + " Y: " + logoBl.y + " Song: " + PlayState.SONG.song.toLowerCase());
                } else
                {
                    changeSelection(1);
                }


                
            }
        // if (controls.UI_LEFT_P)
        //     {
        //         logoBl.x = logoBl.x - 10;
        //         trace("X:" + logoBl.x + " Y: " + logoBl.y + " Song: " + PlayState.SONG.song.toLowerCase());
        //     }
        //     if (controls.UI_RIGHT_P)
        //     {
        //         logoBl.x = logoBl.x + 10;
        //         trace("X:" + logoBl.x + " Y: " + logoBl.y + " Song: " + PlayState.SONG.song.toLowerCase());
        //     }
        // if (FlxG.keys.justReleased.P)
        //     {
        //         // The left arrow key has just been released
        //         // This code is only executed once, on the frame immediately after the key has been released
        //         if (moving){
        //             moving = false;
        //         } else {
        //             moving = true;
        //         }
        //     }

            if (controls.ACCEPT)
            {
                if(PlayState.SONG == null){
                    FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
                }
                // switch (PlayState.SONG)
                // {
                //     case senpai:
                //         character = 'bf-pixel';
                // }
                FlxG.sound.play(Paths.sound('confirmMenu'));
                FlxTween.tween(iconP1, {x: 3000}, 0.5, 
                    {
                        type: FlxTween.ONESHOT,
                        ease: FlxEase.quadIn,
                    });
                FlxTween.tween(cur_character, {x: 3000}, 0.5, 
                    {
                        type: FlxTween.ONESHOT,
                        ease: FlxEase.elasticOut,
                    });
                FlxTween.tween(logoBl, {y: 4}, 5, 
                {
                    ease: FlxEase.elasticOut,
                    startDelay: 2,
                    onComplete: function(twn:FlxTween)
                        {
                        // LoadingState.loadAndSwitchState(new PlayState(), true);
                        // FreeplayState.destroyFreeplayVocals();
                        new FlxTimer().start(0.7, function(tmr:FlxTimer)
                            {
                                FlxG.camera.fade(FlxColor.BLACK, 1.3, false, function()
                                {
                                    LoadingState.loadAndSwitchState(new PlayState(), true);
                                    FreeplayState.destroyFreeplayVocals();
                                });
                            });
                        }
                });
                
            }
            if (controls.BACK){
                if (PlayState.isStoryMode){
                    MusicBeatState.switchState(new StoryMenuState());
                    PlayState.SONG = null; 
                    PlayState.isStoryMode = false;
                }
                else
                    MusicBeatState.switchState(new MainMenuState());
                    PlayState.SONG = null;
                    PlayState.isStoryMode = false;
            }

    }
    function changeSelection(change:Int = 0)
        {
            FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
    
            cur_section += change;
    
            if (cur_section < 0)
                cur_section = characters.length - 1;
            if (cur_section >= characters.length)
                cur_section = 0;
            trace("dacharacter is: " + characters[cur_section]);
            character = characters[cur_section];
            cur_character.text = characters[cur_section];
            iconP1.changeIcon(characters[cur_section]);
        }

}