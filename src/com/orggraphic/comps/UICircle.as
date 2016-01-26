package com.orggraphic.comps
{
	/**
	 * UICirCle
	 * @autor ganxz
	 * 2016-1-18
	 */
	import com.orggraphic.core.vo.CircleVO;
	import com.orggraphic.skins.UICircleSkin;
	
	import spark.components.supportClasses.SkinnableComponent;
	
	public class UICircle extends SkinnableComponent
	{
	
		private var _circleVo:CircleVO;
		
		
		public function UICircle()
		{
			super();
			
			setStyle("skinClass",UICircleSkin);
		}
		
		public function get circleVo():CircleVO
		{
			return _circleVo;
		}

		public function set circleVo(value:CircleVO):void
		{
			if(_circleVo == value)
				return;
			
			_circleVo = value;
			if(skin)
			{
				skin.invalidateDisplayList();
			}
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			var w:Number = _circleVo.radius * 2;
			var h:Number = _circleVo.radius * 2;
			setActualSize(w,h);
			super.updateDisplayList(w,h);
			
		}
	}
}