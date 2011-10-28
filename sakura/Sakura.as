package  {
	//import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.filters.BlurFilter;
	
	
	public class Sakura extends MovieClip {
		var wind;
		var deltaX, deltaY, deltaR;
		var bg;	// 画面の大きさ、サイズを得る
		
		
		
		public function Sakura(container, i, scale, argWind, argBg) {
			trace(scale, argWind);
			this.wind = argWind;
			this.bg = argBg;
			
			container.addChild(this);
			
			init();
			this.y = Math.random() * this.stage.stageHeight;
			this.scaleX = this.scaleY = scale / 100;
			this.rotation = Math.random() * 360;
			
			var maxAngle = 30;	// ランダムに生成する降下角度の最大幅
			var r = ((Math.random() - 0.5) * 2 * maxAngle / 360 * 2 * Math.PI);	
			var speed = 0.12;	// 移動速度
			deltaX = speed * Math.sin(r) * scale;
			deltaY = speed * Math.cos(r) * scale;
			deltaR = (Math.random() - 0.5) * 20;
			
			 
			var blur:BlurFilter = new BlurFilter();
			var maxBlur = 6;
			blur.blurX = maxBlur * scale / 100; 
			blur.blurY = maxBlur * scale / 100;
			blur.quality = 3; 
			this.filters = [blur];
			this.alpha = -(5/7) * scale + 121;
			
			this.addEventListener(Event.ENTER_FRAME, fall);
		}
		
		
		
		function fall(event:Event) {
			// if (this.y <= this.stage.stageHeight) {
			if (this.y <= bg.y + bg.height - 50) {
				this.y += deltaY;
				this.x += deltaX + wind;
				this.rotation += deltaR;
			}
			else {
				//this.parent.removeChild(this);
				init();
			}
		}
		
		
		
		function init() {
			this.x = this.stage.stageWidth * Math.random() - wind * 50;
			this.y = bg.y + 50;
		}
		
	}
}
