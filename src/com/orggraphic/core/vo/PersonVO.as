package com.orggraphic.core.vo
{
	import com.orggraphic.enums.NodeType;

	/**
	 * TODO:
	 * @autor ganxz
	 * 2016-1-24
	 */
	public class PersonVO extends NodeVO
	{
		public var head:String;
		public var job:FontVO;
		public var name:FontVO;
		public var w:Number=60;
		public var h:Number=70;
		
		public function PersonVO()
		{
			super();
			type = NodeType.TYPE_PERSON;
		}
	}
}