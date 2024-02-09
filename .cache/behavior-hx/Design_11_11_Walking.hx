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



class Design_11_11_Walking extends ActorScript
{
	public var _MoveRightKey:String;
	public var _MoveLeftKey:String;
	public var _Acceleration:Float;
	public var _MaxWalkingSpeed:Float;
	public var _LimitSpeed:Bool;
	public var _WalkRightAnimation:String;
	public var _WalkLeftAnimation:String;
	public var _IdleRightAnimation:String;
	public var _IdleLeftAnimation:String;
	public var _PreventWalking:Bool;
	public var _DisableStatuses:Array<Dynamic>;
	public var _AnimationCategory:String;
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("Actor", "actor");
		nameMap.set("Move Right Key", "_MoveRightKey");
		nameMap.set("Move Left Key", "_MoveLeftKey");
		nameMap.set("Acceleration", "_Acceleration");
		_Acceleration = 85.0;
		nameMap.set("Max Walking Speed", "_MaxWalkingSpeed");
		_MaxWalkingSpeed = 20.0;
		nameMap.set("Limit Speed?", "_LimitSpeed");
		_LimitSpeed = false;
		nameMap.set("Walk Right Animation", "_WalkRightAnimation");
		nameMap.set("Walk Left Animation", "_WalkLeftAnimation");
		nameMap.set("Idle Right Animation", "_IdleRightAnimation");
		nameMap.set("Idle Left Animation", "_IdleLeftAnimation");
		nameMap.set("Prevent Walking?", "_PreventWalking");
		_PreventWalking = false;
		nameMap.set("Disable Statuses", "_DisableStatuses");
		nameMap.set("Animation Category", "_AnimationCategory");
		_AnimationCategory = "Walking";
		
	}
	
	override public function init()
	{
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}