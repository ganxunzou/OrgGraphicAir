package com.orggraphic.comps
{
	/**
	 * TODO:
	 * @autor ganxz
	 * 2016-1-18
	 */
	import com.orggraphic.core.vo.PersonVO;
	import com.orggraphic.skins.UIPersonSkin;
	
	import spark.components.supportClasses.SkinnableComponent;
	
	public class UIPerson extends SkinnableComponent
	{
		private var _personVo:PersonVO;
		
		public function UIPerson()
		{
			super();
			setStyle("skinClass",UIPersonSkin);
		}

		public function get personVo():PersonVO
		{
			return _personVo;
		}
		
		override public function set x(value:Number):void
		{
			_personVo.x = value;
			super.x = value;
		}
		
		override public function set y(value:Number):void
		{
			_personVo.y = value;
			super.y = value;
		}

		public function set personVo(value:PersonVO):void
		{
			if(_personVo == value)
				return;
			
			_personVo = value;
			if(skin)
			{
				skin.invalidateDisplayList();
			}
		}
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			setActualSize(personVo.w,personVo.w);
			
			super.updateDisplayList(personVo.w,personVo.w);
		}
	}
}