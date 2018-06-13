<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<!-- <head>
<meta charset="utf-8">
<meta name="renderer" content="webkit" />
<title>长沙海关湘府办公室</title>
<meta name="keywords" content="关键词">
<meta name="description" content="描述">
<link rel="shortcut icon" href="favicon.ico">
</head> -->
<!-- 引入css样式 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/stand_screen.css"/>

<!-- 引入js -->
<script src="${pageContext.request.contextPath}/bower_components/jquery/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/plugin/echarts/echarts.min.js"></script>
<script src="${pageContext.request.contextPath}/plugin/utils.js"></script>


<body>
<div id="wrap">
  <div id="header">
    <div class="topbox">
      <div class="logo"><img src="${pageContext.request.contextPath}/images/logo.png"><p class="logo_tit">长沙海关湘府办公室</p><img src="${pageContext.request.contextPath}/images/logo_text.png" class="logo_text"/></div>
      <%-- <div class="tbtn"><a href="#" class="exit">退出</a></div>
      <div class="twel"><a href="#"><img src="${pageContext.request.contextPath}/images/main/tx.jpg" />您好<br><span>ching126</span></a></div> --%>
      <div class="clear"></div>
    </div>
  </div>
  
  <div id="mainer">
    <div class="mainbox">
      <div class="imain1">
        <div class="ibox ibox1">
          <div class="ibox_main">
          	<p class="demo_text">曲线图</p>
          	<div id="weatherCurve"  style="height:300px;width: 100%;"></div>
          </div>
        </div>
        
        <div class="clear"></div>
        
        <div class="ibox ibox2">
          <div class="ibox_main">
            <div class="ibox_t"><img src="${pageContext.request.contextPath}/images/main/it1.png" />节能提示</div>
            <div class="itip">
              <div class="item">
                <div class="t"><img src="${pageContext.request.contextPath}/images/main/ib1.png" /></div>
                <div class="m"><p class="l">光照指数</p><p class="r">强</p></div>
                <div class="f">光照充足，请减少室内照明，尽量采取自然光源</div>
              </div>
              <div class="item">
                <div class="t"><img src="${pageContext.request.contextPath}/images/main/ib2.png" /></div>
                <div class="m"><p class="l">空调指数</p><p class="r">开</p></div>
                <div class="f">光照充足，请减少室内照明，尽量采取自然光源</div>
              </div>
              <div class="item">
                <div class="t"><img src="${pageContext.request.contextPath}/images/main/ib3.png" /></div>
                <div class="m">外出提示</div>
                <div class="f">外出工作请关闭<b>空调、办公设备、照明</b>及<b>饮水机</b>等用电设备</div>
              </div>
              <div class="line line1"></div>
              <div class="line line2"></div>
            </div>
          </div>
        </div>
      	</div>
   		<div class="clear"></div>
     
      	<div class="imain2">
      	<div id="first">
      	 <!--水耗分项  -->  
	      <div class="ibox ibox1">
	      	<div class="ibox_main">
	      		<p class="demo_text">水耗分项</p>
	      		<div id="water1"  style="height:250px; width:100%;"></div>
	      	</div>
	      </div>
	     <div class="clear"></div>
	     
	  	  <!--电耗分项  -->
      	  <div class="ibox ibox1">
	          <div class="ibox_main">
	          	<p class="demo_text">电耗分项</p>
	          	<div id="electric1"  style="height:250px;width: 100%;"></div>
	          </div>
          </div>
	   	  <div class="clear"></div>
	   	</div>
	   
	   <div id="second">
	    <!--水耗分区  --> 
        <div class="ibox ibox3">
          <div class="ibox_main">
          	<p class="demo_text">水耗分区</p>
          	<div id="water2"  style="height:250px;width: 100%;"></div>
          </div>
        </div>
        <div class="clear"></div>
        
        <!--电耗分区 -->
        <div class="ibox ibox4">
          <div class="ibox_main">
          	<p class="demo_text">电耗分区</p>
          	<div id="electric2"  style="height:250px; width: 100%;"></div>
          </div>
        </div>
        <div class="clear"></div>
      	</div>	
      
      </div>
    </div>
  </div>
  
</div>
<script type="text/javascript">
	
 	var i=1;
  	function switchView(){
	  	if(i==1){
	  		$("#first").attr("style","display:block;");
	  		$("#second").attr("style","display:none;");
	  		i=2;
	  	}else{
	  		$("#first").attr("style","display:none;");
	  		$("#second").attr("style","display:block;");
	  		i=1;
	  	}
	  	return i;
  	}
  	
  	setInterval(switchView,2000);
  	
 
  
</script>
<script type="text/javascript">
//var myChartsOfweatherCurve,myChart1,myChart2,myChart3,myChart4;
window.onload=function(){
	//天气曲线
	var weatherUrl="${pageContext.request.contextPath}/weather/getSysWeather";
	//水耗分项
	var url1="${pageContext.request.contextPath}/query/getEnergyForWaterAndElectric?type=1&energyCode=02000"; 
	//水耗分区
	var url2="${pageContext.request.contextPath}/query/getEnergyForWaterAndElectric?type=2&energyCode=02000"; 
	//电耗分项
	var url3="${pageContext.request.contextPath}/query/getEnergyForWaterAndElectric?type=1&energyCode=01000"; 
	//电耗分区
	var url4="${pageContext.request.contextPath}/query/getEnergyForWaterAndElectric?type=2&energyCode=01000"; 
	

	//异步加载天气信息
	$.ajax({
		type:"POST",
		dataType:"json",
		url:weatherUrl,
		success:function(result){
		var code, msg, data; 
			if(result!=null && result!=undefined){
			code = result.code;
			msg = result.msg;
			data = result.data;
			var flag = false;
				if (code != "1") {
					// 失败 弹窗提示
					zyAlert(msg);
					flag = true;
				}
				if (flag)
					return;
				//封装图表数据		
				var seriesWeather=[];//定义天气信息数组
				//data[0]返回为json数据
				var weatherList = data;
				//循环遍历data数据中所有的json字符串
				for(var i=0;i<weatherList.length;i++){
					//获取第i个字符串，每个字符串内容包含W_LIGHT_INDEX(光照强度),W_TEMPERATURE(气温),w_time(时间)
					var weather=weatherList[i];
					//获取每个字符串中的天气气温
					var weatherValue=weather.W_TEMPERATURE;
					//获取时间点
            		var date=weather.w_time;	
            		//创建x轴坐标值	
            		}			
			  }		
				 		 optionWeather();
			 }

	})


	//异步加载水耗分项
	$.ajax({
		type:"POST",
		dataType:"json",
		url:url3,
		success:function(result){	
		var code, msg, data; 
			if(result!=null && result!=undefined){
				code = result.code;
				msg = result.msg;
				data = result.data;
				var flag = false;
					if (code != "1") {
						// 失败 弹窗提示
						zyAlert(msg);
						flag = true;
					}
					if (flag)
						return;
					//封装图表数据		
					var legend1=[];
					var series1=[];
					//data[0]返回为json数据
					var waterList1 = data;
					//循环遍历data数据中所有的json字符串
					for(var i=0;i<waterList1.length;i++){
						//获取第i个字符串，每个字符串内容包含name,energyValue,energyDate
						var energy=waterList1[i];
						//获取每个字符串中的name
						var legendName=energy.name;
						var isYes = legend1.contains(legendName);// 判断图例中是否有这个名称
	            		if(!isYes)legend1.push(legendName);
	            		if(!isYes){
	            			//创建series对象，与option中series属性对应并且赋值
		            		var series = new Object();
		            			//设置图例的名称
		            			series.name=legendName;
		            			//设置图例的类型
		            			series.type="bar";
		            			//设置y轴的初始值
		            			series.yAxisIndex=0;
		            			//设置series属性中的data，先定义空数组
		            			series.data=[];
		            			series1.push(series);			
	            		}
	            		//获取能源值	
	            		var value=energy.energyValue;
	            		//获取能源日期
	            		var date=energy.energyDate;
	            		for(var k=0;k<series1.length;k++){
	            			var series=series1[k];
	            			if(series.name==legendName){
	            				series.data.push(value)
	            			}
	            		}		
				  }		
				  	water1(legend1,series1);
			 }		
		 }
				
	});	



	//异步加载水耗分区		
	$.ajax({
		type:"POST",
		dataType:"json",
		url:url2,
		success:function(result){	
		var code, msg, data; 
			if(result!=null && result!=undefined){
				code = result.code;
				msg = result.msg;
				data = result.data;
				var flag = false;
					if (code != "1") {
						// 失败 弹窗提示
						zyAlert(msg);
						flag = true;
					}
					if (flag)
						return;
					//封装图表数据		
					var legend2=[];
					var series2=[];
					//data[0]返回为json数据
					var waterList1 = data;
					//循环遍历data数据中所有的json字符串
					for(var i=0;i<waterList1.length;i++){
						//获取第i个字符串，每个字符串内容包含name,energyValue,energyDate
						var energy=waterList1[i];
						//获取每个字符串中的name
						var legendName=energy.name;
						var isYes = legend2.contains(legendName);// 判断图例中是否有这个名称
	            		if(!isYes)legend2.push(legendName);
	            		if(!isYes){
	            			//创建series对象，与option中series属性对应并且赋值
		            		var series = new Object();
		            			//设置图例的名称
		            			series.name=legendName;
		            			//设置图例的类型
		            			series.type="bar";
		            			//设置y轴的初始值
		            			series.yAxisIndex=0;
		            			//设置series属性中的data，先定义空数组
		            			series.data=[];
		            			series2.push(series);			
	            		}
	            		//获取能源值	
	            		var value=energy.energyValue;
	            		//获取能源日期
	            		var date=energy.energyDate;
	            		for(var k=0;k<series2.length;k++){
	            			var series=series2[k];
	            			if(series.name==legendName){
	            				series.data.push(value)
	            			}
	            		}		
				  }		
				 	 water2(legend2,series2);
			 }		
		 }
				
	});

	//异步加载电耗分项		
	$.ajax({
		type:"POST",
		dataType:"json",
		url:url3,
		success:function(result){	
		var code, msg, data; 
			if(result!=null && result!=undefined){
				code = result.code;
				msg = result.msg;
				data = result.data;
				var flag = false;
					if (code != "1") {
						// 失败 弹窗提示
						zyAlert(msg);
						flag = true;
					}
					if (flag)
						return;
					//封装图表数据		
					var legend3=[];
					var series3=[];
					//data[0]返回为json数据
					var electricList1 = data;
					//循环遍历data数据中所有的json字符串
					for(var i=0;i<electricList1.length;i++){
						//获取第i个字符串，每个字符串内容包含name,energyValue,energyDate
						var energy=electricList1[i];
						//获取每个字符串中的name
						var legendName=energy.name;
						var isYes = legend3.contains(legendName);// 判断图例中是否有这个名称
	            		if(!isYes)legend3.push(legendName);
	            		if(!isYes){
	            			//创建series对象，与option中series属性对应并且赋值
		            		var series = new Object();
		            			//设置图例的名称
		            			series.name=legendName;
		            			//设置图例的类型
		            			series.type="bar";
		            			//设置y轴的初始值
		            			series.yAxisIndex=0;
		            			//设置series属性中的data，先定义空数组
		            			series.data=[];
		            			series3.push(series);			
	            		}
	            		//获取能源值	
	            		var value=energy.energyValue;
	            		//获取能源日期
	            		var date=energy.energyDate;
	            		for(var k=0;k<series3.length;k++){
	            			var series=series3[k];
	            			if(series.name==legendName){
	            				series.data.push(value)
	            			}
	            		}		
				  }		
				  electric1(legend3,series3);
			 }		
		 }
				
	});
 
 
 	//异步加载电耗分区		
	$.ajax({
		type:"POST",
		dataType:"json",
		url:url4,
		success:function(result){	
		var code, msg, data; 
			if(result!=null && result!=undefined){
				code = result.code;
				msg = result.msg;
				data = result.data;
				var flag = false;
					if (code != "1") {
						// 失败 弹窗提示
						zyAlert(msg);
						flag = true;
					}
					if (flag)
						return;
					//封装图表数据		
					var legend4=[];
					var series4=[];
					//data[0]返回为json数据
					var electricList2 = data;
					//循环遍历data数据中所有的json字符串
					for(var i=0;i<electricList2.length;i++){
						//获取第i个字符串，每个字符串内容包含name,energyValue,energyDate
						var energy=electricList2[i];
						//获取每个字符串中的name
						var legendName=energy.name;
						var isYes = legend4.contains(legendName);// 判断图例中是否有这个名称
	            		if(!isYes)legend4.push(legendName);
	            		if(!isYes){
	            			//创建series对象，与option中series属性对应并且赋值
		            		var series = new Object();
		            			//设置图例的名称
		            			series.name=legendName;
		            			//设置图例的类型
		            			series.type="bar";
		            			//设置y轴的初始值
		            			series.yAxisIndex=0;
		            			//设置series属性中的data，先定义空数组
		            			series.data=[];
		            			series4.push(series);			
	            		}
	            		//获取能源值	
	            		var value=energy.energyValue;
	            		//获取能源日期
	            		var date=energy.energyDate;
	            		for(var k=0;k<series4.length;k++){
	            			var series=series4[k];
	            			if(series.name==legendName){
	            				series.data.push(value)
	            			}
	            		}		
				  }		
				  electric2(legend4,series4);
			 }		
		 }
				
	});
 


	//天气曲线
	function optionWeather(){
		//获取dom对象
		var weatherCurve=document.getElementById("weatherCurve")
		 //天气曲线
		myChartsOfweatherCurve = echarts.init(weatherCurve);
		//设置图形格式
		optionWeather = {
			xAxis: {
			        type: 'category',
			        data: ['07', '09', '11', '13', '15', '17', '19']
			},
		    yAxis: {
		        type: 'value'
		    },
    		series: [{
		        data: [5, 10, 15, 20, 25, 30, 35],
		        type: 'line'
		    }]
		    },
		//echarts初始化天气曲线
		myChartsOfweatherCurve.setOption(optionWeather);
	
	}
	
	
	/* 水耗分项函数 */
	function water1(legend1,series1){
		//获取dom对象
		var water1=document.getElementById("water1");
		//水耗分项
		var myChart1 = echarts.init(water1);
		//设置图形格式
		option1 = {
		tooltip: {  
                  trigger : 'axis',
				 axisPointer: {
			            type: 'cross',
			            crossStyle: {
			                color: '#999'
			            }
			        }  
              },
		title: {
	                text: '水耗分项'
	            },
	    legend:{
	        data:legend1  
	    },
	    xAxis: {
	        type: 'category',
	        data: ['一月', '二月', '三月', '四月', '五月', '六月', '七月','八月','九月','十月','十一月','十二月']
	    },
	    yAxis: {
	        type: 'value',
	        name:'立方米'
	    },
	    series: series1
		},
		//echarts初始化水耗分项
		myChart1.setOption(option1);	

	}
		
	//水耗分区
	function water2(legend2,series2){
	//获取dom对象
	var water2=document.getElementById("water2");
	//水耗分区
    var myChart2 = echarts.init(water2);
    //水耗分区
	option2 = {
		tooltip: {  
                  trigger : 'axis',
				 axisPointer: {
			            type: 'cross',
			            crossStyle: {
			                color: '#999'
			            }
			        }  
              },
		title: {
	            text: '水耗分区'
	            },
	    legend:{
	        	data:legend2
	    }
	    ,
	    xAxis: {
	        type: 'category',
	        data: ['一月', '二月', '三月', '四月', '五月', '六月', '七月','八月','九月','十月','十一月','十二月']
	    },
	    yAxis: {
	        type: 'value',
	        name:'立方米'
	    },
	    series:series2
		},
		//echarts初始化水耗分区
		myChart2.setOption(option2);
	}	
	

	
//电耗分项
	function electric1(legend3,series3){
	   //获取电耗分项dom
		var electric1=document.getElementById("electric1");
		//初始化
		var myChart3 = echarts.init(electric1);
	 	//电耗分项
		option3 = {
			tooltip: {  
                  trigger : 'axis',
				 axisPointer: {
			            type: 'cross',
			            crossStyle: {
			                color: '#999'
			            }
			        }  
              },
			title: {
		         text: '电耗分项'
		            },
		    legend:{
		        data:legend3
		    }
		    ,
		    xAxis: {
		        type: 'category',
		        data: ['一月', '二月', '三月', '四月', '五月', '六月', '七月','八月','九月','十月','十一月','十二月']
		    },
		    yAxis: {
		        type: 'value',
		        name:'千瓦时'
		    },
		    series:
		    	series3
		    
			},
			myChart3.setOption(option3);		
		}
	
		
		
//echarts初始化电耗分区
	function electric2(legend4,series4){
		//获取dom
		var electric2=document.getElementById("electric2");
		//电耗分区
		var myChart4 = echarts.init(electric2);
		//电耗分区
		option4 = {
		tooltip: {  
                  trigger : 'axis',
				 axisPointer: {
			            type: 'cross',
			            crossStyle: {
			                color: '#999'
			            }
			        }  
              },
		title: {
	                text: '电耗分区'
	            },
	    legend:{
	        data:legend4
	    }
	    ,
	    xAxis: {
	        type: 'category',
	        data: ['一月', '二月', '三月', '四月', '五月', '六月', '七月','八月','九月','十月','十一月','十二月']
	    },
	    yAxis: {
	        type: 'value',
	        name:'千瓦时'
	    },
	    series: series4
		},
		//echarts初始化电耗分区
		myChart4.setOption(option4);	
	}
}		 
</script>


</body>
</html>