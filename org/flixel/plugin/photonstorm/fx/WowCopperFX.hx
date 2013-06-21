/**
* WowCopperFX - Special FX Plugin
* -- Part of the Flixel Power Tools set
* 
* v1.0 First release
* 
* @version 1.4 - May 8th 2011
* @link http://www.photonstorm.com
* @author Original by Mathew Nolan / Flashtro.com
* @author Ported with permission by Richard Davey / Photon Storm
*/

package org.flixel.plugin.photonstorm.fx; 

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.geom.Matrix;
import flash.geom.Rectangle;
import org.flixel.FlxSprite;

/**
 * Creates a WOW Copper effect FlxSprite
 */

class WowCopperFX extends BaseFX
{
	private var colors:Array<Int>;
	#if flash
	private var step:UInt;
	private var span:UInt;
	#else
	private var step:Int;
	private var span:Int;
	#end
	
	private var bmp_databg:BitmapData;
	//private var bmp_objbg : Bitmap = new Bitmap( bmp_databg , PixelSnapping.AUTO , false);
	private var bg2:Sprite;

	private var amount:Int;
	private var tab:Int;
	private var del:Int;
	private var max:Int;
	
	public function new()
	{
		step = 0;
		bmp_databg = new BitmapData(1, 64, false, 0x00000100);
		bg2 = new Sprite();
		amount = 8;
		tab = 0;
		del = 0;
		max = 136;
		
		super();
	}
	
	#if flash
	public function create(x:Int, y:Int, width:UInt, height:UInt):FlxSprite
	#else
	public function create(x:Int, y:Int, width:Int, height:Int):FlxSprite
	#end
	{
		sprite = new FlxSprite(x, y).makeGraphic(width, height, 0x0);
		
		colors = [0x110011,
		0x220022,
		0x330033,
		0x440044,
		0x550055,
		0x660066,
		0x770077,
		0x880088,
		0x990099,
		0xaa00aa,
		0xbb00bb,
		0xcc00cc,
		0xdd00dd,
		0xee00ee,
		0xff00ff,
		0xff00ff,
		0xee00ee,
		0xdd00dd,
		0xcc00cc,
		0xbb00bb,
		0xaa00aa,
		0x990099,
		0x880088,
		0x770077,
		0x660066,
		0x550055,
		0x440044,
		0x330033,
		0x220022,
		0x110011,
		0x000001,
		0x000001,
		0x000001,
		0x000001,
		0x000001,
		0x000001,
		0x000001,
		0x000001,
		0x000001,
		0x000001,
		0x111100,
		0x222200,
		0x333300,
		0x444400,
		0x555500,
		0x666600,
		0x777700,
		0x888800,
		0x999900,
		0xaaaa00,
		0xbbbb00,
		0xcccc00,
		0xdddd00,
		0xeeee00,
		0xffff00,
		0xffff00,
		0xeeee00,
		0xdddd00,
		0xcccc00,
		0xbbbb00,
		0xaaaa00,
		0x999900,
		0x888800,
		0x777700,
		0x666600,
		0x555500,
		0x444400,
		0x333300,
		0x222200,
		0x111100,
		0x000001,
		0x000001,
		0x000001,
		0x000001,
		0x000001,
		0x000001,
		0x000001,
		0x000001,
		0x000001,
		0x000001,
		0x001111,
		0x002222,
		0x003333,
		0x004444,
		0x005555,
		0x006666,
		0x007777,
		0x008888,
		0x009999,
		0x00aaaa,
		0x00bbbb,
		0x00cccc,
		0x00dddd,
		0x00eeee,
		0x00ffff,
		0x00ffff,
		0x00eeee,
		0x00dddd,
		0x00cccc,
		0x00bbbb,
		0x00aaaa,
		0x009999,
		0x008888,
		0x007777,
		0x006666,
		0x005555,
		0x004444,
		0x003333,
		0x002222,
		0x001111,
		0x000001,
		0x000001,
		0x000001,
		0x000001,
		0x000001,
		0x000001,
		0x000001,
		0x000001,
		0x000001,
		0x000001,
		0x111111,
		0x222222,
		0x333333,
		0x444444,
		0x555555,
		0x666666,
		0x777777,
		0x888888,
		0x999999,
		0xaaaaaa,
		0xbbbbbb,
		0xcccccc,
		0xdddddd,
		0xeeeeee,
		0xffffff,
		0xffffff,
		0xeeeeee,
		0xdddddd,
		0xcccccc,
		0xbbbbbb,
		0xaaaaaa,
		0x999999,
		0x888888,
		0x777777,
		0x666666,
		0x555555,
		0x444444,
		0x333333,
		0x222222,
		0x111111,
		0x000001,
		0x000001,
		0x000001,
		0x000001,
		0x000001,
		0x000001,
		0x000001,
		0x000001,
		0x000001,
		0x000001];
		
		//canvas = new BitmapData(1, 64 , false , 0x00000100);
		canvas = new BitmapData(width, height, true, 0x0);

		active = true;
		
		return sprite;
	}
	
	public function draw():Void
	{
		if (step < 10)
		{
			//trace(step, tpos1, tpos2, tpos3, tpos4, pos1, pos2, pos3, pos4, index);
			step++;
		}
		
		//canvas.setPixel(0, 31, colors[tab]);
		bmp_databg.setPixel(0, 31, colors[tab]);
		
		del++;
		
		if (del >= 2)
		{
			bmp_databg.scroll(0, -1);
			tab++;
			del = 0;
		}
		
		if (tab >= colors.length)
		{
			tab = 0;
		}
		
		bg2.graphics.clear();
		
		var bbcb:Matrix = new Matrix();
		
		var i:Int = 0;
		while (i < max)
		{
			bg2.graphics.beginBitmapFill(bmp_databg, bbcb, true, false);
			bg2.graphics.moveTo(0, i);
			bg2.graphics.lineTo(0, i + amount);
			bg2.graphics.lineTo(320, i + amount );
			bg2.graphics.lineTo(320, i);
			bg2.graphics.endFill();
			bbcb.translate(0, 7);
			
			i += amount;
		}
		
		canvas.draw(bg2);
		
		sprite.pixels = canvas;
		sprite.dirty = true;
		
		/*
		bmp_databg.setPixel(0,31,cols[tab])
		del++
		if(del>=2){
			bmp_databg.scroll(0,-1)
		tab++
		del=0
		}
		if(tab>=cols.length){
			tab=0
		}
			bg2.graphics.clear()
		var bbcb = new flash.geom.Matrix();
		for (var i:uint=0; i<max; i+=amount) {
			
			
			
			//m.ty =0
			
			bg2.graphics.beginBitmapFill(bmp_databg, bbcb,true,false);
			bg2.graphics.moveTo(0, i);
			bg2.graphics.lineTo(0, i+amount);
			bg2.graphics.lineTo(320, i+amount );
			bg2.graphics.lineTo(320, i);
			bg2.graphics.endFill();
			bbcb.translate(0,7)
				
		}
		*/
		
		
		//canvas.setPixel32(x, y, colours[index]);
				
		//sprite.pixels = canvas;
		//sprite.dirty = true;
		
	}
	
}