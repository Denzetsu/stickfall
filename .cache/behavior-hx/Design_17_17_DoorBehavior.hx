package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;
import com.stencyl.graphics.ScaleMode;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.Script.*;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;
import com.stencyl.models.Joystick;

import com.stencyl.Config;
import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.motion.*;
import com.stencyl.utils.Utils;

import openfl.ui.Mouse;
import openfl.display.Graphics;
import openfl.display.BlendMode;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.TouchEvent;
import openfl.net.URLLoader;

import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.joints.B2Joint;

import com.stencyl.graphics.shaders.BasicShader;
import com.stencyl.graphics.shaders.GrayscaleShader;
import com.stencyl.graphics.shaders.SepiaShader;
import com.stencyl.graphics.shaders.InvertShader;
import com.stencyl.graphics.shaders.GrainShader;
import com.stencyl.graphics.shaders.ExternalShader;
import com.stencyl.graphics.shaders.InlineShader;
import com.stencyl.graphics.shaders.BlurShader;
import com.stencyl.graphics.shaders.SharpenShader;
import com.stencyl.graphics.shaders.ScanlineShader;
import com.stencyl.graphics.shaders.CSBShader;
import com.stencyl.graphics.shaders.HueShader;
import com.stencyl.graphics.shaders.TintShader;
import com.stencyl.graphics.shaders.BloomShader;



class Design_17_17_DoorBehavior extends ActorScript
{
	public var _RequireMovementKeytobePressed:Bool;
	public var _DirectionalKey:String;
	public var _NextScene:Scene;
	public var _XEnterPosition:Float;
	public var _YEnterPosition:Float;
	public var _CreatePlayerinNextScene:Bool;
	public var _PlayerActorType:ActorType;
	public var _FadeOutTime:Float;
	public var _FadeInTime:Float;
	public var _CreatedActor:Bool;
	public var _PlayerGroup:Group;
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("Actor", "actor");
		nameMap.set("Require Directional Key to be Pressed?", "_RequireMovementKeytobePressed");
		_RequireMovementKeytobePressed = false;
		nameMap.set("Directional Key", "_DirectionalKey");
		nameMap.set("Next Scene", "_NextScene");
		nameMap.set("X Enter Position", "_XEnterPosition");
		_XEnterPosition = 0.0;
		nameMap.set("Y Enter Position", "_YEnterPosition");
		_YEnterPosition = 0.0;
		nameMap.set("Create Player in Next Scene", "_CreatePlayerinNextScene");
		_CreatePlayerinNextScene = false;
		nameMap.set("Player Actor Type", "_PlayerActorType");
		nameMap.set("Fade Out Time", "_FadeOutTime");
		_FadeOutTime = 1.0;
		nameMap.set("Fade In Time", "_FadeInTime");
		_FadeInTime = 1.0;
		nameMap.set("Created Actor", "_CreatedActor");
		_CreatedActor = false;
		nameMap.set("Player Group", "_PlayerGroup");
		
	}
	
	override public function init()
	{
		
		/* ======================== Something Else ======================== */
		addCollisionListener(actor, function(event:Collision, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(isTransitioning())
				{
					return;
				}
				if((internalGetGroup(event.otherActor, event.otherShape, event) == _PlayerGroup))
				{
					if(_RequireMovementKeytobePressed)
					{
						if(isKeyDown(_DirectionalKey))
						{
							if(_CreatePlayerinNextScene)
							{
								switchScene(_NextScene.getID(), createFadeOut(_FadeOutTime), createFadeIn(_FadeInTime));
								if(!(_CreatedActor))
								{
									_CreatedActor = true;
									createActorInNextScene(_PlayerActorType, _XEnterPosition, _YEnterPosition, Script.FRONT);
								}
							}
							else
							{
								switchScene(_NextScene.getID(), createFadeOut(_FadeOutTime), createFadeIn(_FadeInTime));
							}
						}
					}
					else
					{
						if(_CreatePlayerinNextScene)
						{
							switchScene(_NextScene.getID(), createFadeOut(_FadeOutTime), createFadeIn(_FadeInTime));
							if(!(_CreatedActor))
							{
								_CreatedActor = true;
								createActorInNextScene(_PlayerActorType, _XEnterPosition, _YEnterPosition, Script.FRONT);
							}
						}
						else
						{
							switchScene(_NextScene.getID(), createFadeOut(_FadeOutTime), createFadeIn(_FadeInTime));
						}
					}
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}