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



class Design_14_14_WallSliding extends ActorScript
{
	public var _CanSlide:Bool;
	public var _CollidingLeft:Bool;
	public var _CollidingRight:Bool;
	public var _CollidedLeft:Bool;
	public var _CollidedRight:Bool;
	public var _OldY:Float;
	public var _LeftKey:String;
	public var _RightKey:String;
	public var _SlideSpeed:Float;
	public var _SlideRightAnimation:String;
	public var _SlideLeftAnimation:String;
	public var _LimittoTiles:Bool;
	public var _PreventWallSlide:Bool;
	public var _AnimationCategory:String;
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("Actor", "actor");
		nameMap.set("Can Slide?", "_CanSlide");
		_CanSlide = false;
		nameMap.set("Colliding Left?", "_CollidingLeft");
		_CollidingLeft = false;
		nameMap.set("Colliding Right?", "_CollidingRight");
		_CollidingRight = false;
		nameMap.set("Collided Left?", "_CollidedLeft");
		_CollidedLeft = false;
		nameMap.set("Collided Right?", "_CollidedRight");
		_CollidedRight = false;
		nameMap.set("Old Y", "_OldY");
		_OldY = 0.0;
		nameMap.set("Left Key", "_LeftKey");
		nameMap.set("Right Key", "_RightKey");
		nameMap.set("Slide Speed", "_SlideSpeed");
		_SlideSpeed = 7.0;
		nameMap.set("Slide Right Animation", "_SlideRightAnimation");
		nameMap.set("Slide Left Animation", "_SlideLeftAnimation");
		nameMap.set("Limit to Tiles?", "_LimittoTiles");
		_LimittoTiles = false;
		nameMap.set("Prevent Wall Slide?", "_PreventWallSlide");
		_PreventWallSlide = false;
		nameMap.set("Animation Category", "_AnimationCategory");
		_AnimationCategory = "Wall Sliding";
		
	}
	
	override public function init()
	{
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}