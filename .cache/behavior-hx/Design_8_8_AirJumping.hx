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



class Design_8_8_AirJumping extends ActorScript
{
	public var _PreventAirJump:Bool;
	public var _CurrentJumps:Float;
	public var _CanJump:Bool;
	public var _ElapsedTime:Float;
	public var _OldY:Float;
	public var _MaxJumps:Float;
	public var _JumpKey:String;
	public var _MustBeRising:Bool;
	public var _JumpForce:Float;
	public var _JumpRightAnimation:String;
	public var _JumpLeftAnimation:String;
	public var _AnimationCategory:String;
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("Actor", "actor");
		nameMap.set("Prevent Air Jump?", "_PreventAirJump");
		_PreventAirJump = false;
		nameMap.set("Current Jumps", "_CurrentJumps");
		_CurrentJumps = 0.0;
		nameMap.set("Can Jump?", "_CanJump");
		_CanJump = false;
		nameMap.set("Elapsed Time", "_ElapsedTime");
		_ElapsedTime = 0.0;
		nameMap.set("Old Y", "_OldY");
		_OldY = 0.0;
		nameMap.set("Max Jumps", "_MaxJumps");
		_MaxJumps = 999.0;
		nameMap.set("Jump Key", "_JumpKey");
		nameMap.set("Must Be Rising?", "_MustBeRising");
		_MustBeRising = false;
		nameMap.set("Jump Force", "_JumpForce");
		_JumpForce = 50.0;
		nameMap.set("Jump Right Animation", "_JumpRightAnimation");
		nameMap.set("Jump Left Animation", "_JumpLeftAnimation");
		nameMap.set("Animation Category", "_AnimationCategory");
		_AnimationCategory = "Air Jumping";
		
	}
	
	override public function init()
	{
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}