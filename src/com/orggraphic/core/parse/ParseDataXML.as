package com.orggraphic.core.parse
{
	import com.orggraphic.core.vo.CircleVO;
	import com.orggraphic.core.vo.FontVO;
	import com.orggraphic.core.vo.LineVO;
	import com.orggraphic.core.vo.PersonVO;
	import com.orggraphic.enums.NodeType;
	
	import mx.controls.Alert;
	import mx.utils.StringUtil;

	/**
	 * XML 解析类
	 * @autor ganxz
	 * 2016-1-24
	 */
	public class ParseDataXML
	{
		public static var dataXML:XML;
		
		public static const DATA_PATH:String="Data.xml";
		
		public static function parseXML():void
		{
			try
			{
				dataXML = new XML(FileUtils.readFile(DATA_PATH));
			} 
			catch(error:Error) 
			{
				Alert.show(DATA_PATH+"不是有效的XML文件");
			}
			
			doParse();
		}
		
		private static function doParse():void
		{
			doParseFont(dataXML.child("Fonts"));
			doParseNode(dataXML.child("Nodes"));
			doParseLine(dataXML.child("Lines"));
		}
		
		private static function doParseNode(nXmlList:XMLList):void
		{
			
			var cVo:CircleVO;
			var pVo:PersonVO;
			for each(var node:Object in nXmlList.children())
			{
				var type:String = node.@type;
				var id:String = node.@id;
				if(type == NodeType.TYPE_CIRCLE)
				{
					//圆圈
					cVo = new CircleVO();
					cVo.id = id;
					cVo.bgColor = node.@bgColor;
					cVo.borderColor = node.@borderColor;
					cVo.radius = node.@radius;
					cVo.x = node.@x;
					cVo.y = node.@y;
					cVo.corp = StringUtil.trim(node.@corp)!=""?GlobalInfo.fontMap[node.@corp.toString()]:null;
					cVo.desc = StringUtil.trim(node.@desc)!=""?GlobalInfo.fontMap[node.@desc.toString()]:null;

					GlobalInfo.nodeMap[id] = cVo;
				}
				else
				{
					//人	
					pVo = new PersonVO();
					pVo.id = id;
					pVo.job = StringUtil.trim(node.@job) != ""?GlobalInfo.fontMap[node.@job.toString()]:null;
					pVo.name = StringUtil.trim(node.@name) != ""?GlobalInfo.fontMap[node.@name.toString()]:null;
					pVo.x = node.@x;
					pVo.y = node.@y;
					pVo.head = node.@head;
					
					GlobalInfo.nodeMap[id] = pVo;
				}
			}
				
		}
		
		private static function doParseLine(lXmlList:XMLList):void
		{
			var lVo:LineVO;
			for each(var line:Object in lXmlList.children())
			{
				var id:String = line.@id;
				lVo = new LineVO();
				lVo.id = id;
				lVo.color = line.@color;
				lVo.thickness = line.@thickness;
				lVo.endArrow = StringUtil.trim(line.@endArrow)=="true"?true:false;
				lVo.startArrow =  StringUtil.trim(line.@startArrow)=="true"?true:false;
				lVo.fromNode = StringUtil.trim(line.@fromNode)!=""?GlobalInfo.nodeMap[line.@fromNode.toString()]:null;
				lVo.fromNodeX = line.@fx;
				lVo.fromNodeY = line.@fy;
				lVo.ToNode = StringUtil.trim(line.@toNode)!=""?GlobalInfo.nodeMap[line.@toNode.toString()]:null;
				lVo.ToNodeX = line.@tx;
				lVo.ToNodeY = line.@ty;
				
				if(StringUtil.trim(line.@bottomDesc) !="")
				{
					lVo.bottomDesc = StringUtil.trim(line.@bottomDesc)!=""?GlobalInfo.fontMap[line.@bottomDesc.toString()]:null;
				}
				
				if(StringUtil.trim(line.@topDesc) !="")
				{
					lVo.topDesc = StringUtil.trim(line.@topDesc)!=""?GlobalInfo.fontMap[line.@topDesc.toString()]:null;
				}
				
				GlobalInfo.lineMap[id] = lVo;
			}
		}
		
		private static function doParseFont(fXmlList:XMLList):void
		{
			var fVo:FontVO;
			for each(var font:Object in fXmlList.children())
			{
				var id:String = font.@id;
				fVo = new FontVO();
				fVo.id = id;
				fVo.color = font.@color;
				fVo.rotate = font.@rotate;
				fVo.size = font.@size;
				fVo.text = font.@text;
				fVo.weight = font.@weight;
				
				GlobalInfo.fontMap[id] = fVo;
			}
		}
		
		
	}
}