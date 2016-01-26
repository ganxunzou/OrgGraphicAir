package com.orggraphic.core.vo
{
	/**
	 * FontVO
	 * @autor ganxz
	 * 2016-1-24
	 */
	public class FontVO extends BaseVO
	{
		/**
		 * 大小 
		 * 默认12px
		 */		
		public var size:Number=12;
		/**
		 * 颜色
		 * 默认黑色
		 */		
		public var color:String = "0x000000";
		/**
		 * 文字旋转 
		 * 默认0
		 */		
		public var rotate:Number=0;
		
		/**
		 *文字内容
		 * 默认"" 
		 */		
		public var text:String="";
		
		public var weight:String="normal";
	}
}