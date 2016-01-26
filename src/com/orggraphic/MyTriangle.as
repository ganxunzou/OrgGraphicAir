package com.orggraphic
{
	import flash.geom.Point;
	
	import mx.core.UIComponent;

	public class MyTriangle extends UIComponent
	{
		public function MyTriangle()
		{
			super();
		}
		
		//箭头的大小
		public var Radius:int=6;
		public var FromPoint:Point;
		public var ToPoint:Point;
		//线性的颜色
		public var LineColor:uint=0x000000;
		//是否需要画箭头
		public var NeedArrow:Boolean=true;
		
		private function GetAngle():int
		{
			var  tmpx:int=ToPoint.x-FromPoint.x ;
			var tmpy:int=FromPoint.y -ToPoint.y ;
			var angle:int= Math.atan2(tmpy,tmpx)*(180/Math.PI);
			return angle;
		}
		
		//绘制线
		public function Draw():void
		{
			this.graphics.clear();
			this.graphics.lineStyle(1,LineColor,1);
			this.graphics.moveTo(FromPoint.x,FromPoint.y);
			this.graphics.lineTo(ToPoint.x,ToPoint.y);
			
			if(NeedArrow)
			{
				var angle:int =GetAngle();
				var centerX:int=ToPoint.x-Radius * Math.cos(angle *(Math.PI/180)) ;
				var centerY:int=ToPoint.y+Radius * Math.sin(angle *(Math.PI/180)) ;
				var topX:int=ToPoint.x ;
				var topY:int=ToPoint.y  ;
				
				var leftX:int=centerX + Radius * Math.cos((angle +120) *(Math.PI/180))  ;
				var leftY:int=centerY - Radius * Math.sin((angle +120) *(Math.PI/180))  ;
				
				var rightX:int=centerX + Radius * Math.cos((angle +240) *(Math.PI/180))  ;
				var rightY:int=centerY - Radius * Math.sin((angle +240) *(Math.PI/180))  ;
				
				this.graphics.beginFill(LineColor,1);
				
				this.graphics.lineStyle(1,LineColor,1);
				
				this.graphics.moveTo(topX,topY);
				this.graphics.lineTo(leftX,leftY);
				
				this.graphics.lineTo(centerX,centerY);
				
				this.graphics.lineTo(rightX,rightY);
				this.graphics.lineTo(topX,topY);
				
				this.graphics.endFill();
			}
		}
		
		
	}
}