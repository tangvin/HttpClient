<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<html>
<head>
<meta charset="utf-8">

<title>长沙海关湘府办公室</title>
<meta name="keywords" content="关键词">
<meta name="description" content="描述">
<link rel="shortcut icon" href="favicon.ico">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/css.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugin/echarts/echarts.js"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugin/echarts/echarts.min.js"/>

<script src="${pageContext.request.contextPath}/plugin/echarts/echarts.js"></script>
<script src="${pageContext.request.contextPath}/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/bower_components/jquery/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/bower_components/jquery-ui/jquery-ui.min.js"></script>
</head>

<body>

<div id="wrap">

  <div id="header">
    <div class="topbox">
      <div class="logo"><img src="${pageContext.request.contextPath}/images/logo.png"><p class="logo_tit">长沙海关湘府办公室</p><img src="${pageContext.request.contextPath}/images/logo_text.png" class="logo_text"/></div>
      <div class="tbtn"><a href="#" class="exit">退出</a></div>
      <div class="twel"><a href="#"><img src="${pageContext.request.contextPath}/images/main/tx.jpg" />您好<br><span>ching126</span></a></div>
      <div class="clear"></div>
    </div>
  </div>
  
  <div id="mainer">
    <div class="mainbox">
    
      <div class="imain1">
        <div class="ibox ibox1">
          <div class="ibox_main"><p class="demo_text">曲线图</p></div>
        </div>
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
        <div class="clear"></div>
      
      </div>
    
      <div class="imain2">
        <div class="ibox ibox3">
          <div class="ibox_main">
          	<p class="demo_text">水耗分区</p>
          	<div id="water1" style="width:100%;  height:200px;"></div>
          </div>
        </div>
        <div class="ibox ibox4">
          <div class="ibox_main"><p class="demo_text">水耗分区</p></div>
        </div>
        <div class="clear"></div>
        <div class="ibox ibox5">
          <div class="ibox_main"><p class="demo_text">电耗分项</p></div>
        </div>
        <div class="ibox ibox6">
          <div class="ibox_main"><p class="demo_text">电耗分项</p></div>
        </div>
        <div class="clear"></div>
      </div>
      
    </div>
  </div>
  
</div>
<script type="text/javascript">
var water1=document.getElementById("water1");

myChart1 = echarts.init(water1);

 //指定图标的配置和数据
        var option = {
            title:{
                text:'ECharts 数据统计'
            },
            tooltip:{},
            legend:{
                data:['用户来源']
            },
            xAxis:{
                data:["Android","IOS","PC","Ohter"]
            },
            yAxis:{

            },
            series:[{
                name:'访问量',
                type:'bar',
                data:[500,200,360,100]
            }]
        };
       
        //使用制定的配置项和数据显示图表
        myChart1.setOption(option);
      window.onresize = function(){
		if (typeof myChart1 === 'object'){myChart1.resize();}
		if (typeof myChart2 === 'object'){myChart2.resize();}
		if (typeof myChart3 === 'object'){myChart3.resize();}
		if (typeof myChart4 === 'object'){myChart4.resize();}
		if (typeof myChart5 === 'object'){myChart5.resize();}
		if (typeof myChart6 === 'object'){myChart6.resize();}
	}
		




</script>
</body>
</html>
