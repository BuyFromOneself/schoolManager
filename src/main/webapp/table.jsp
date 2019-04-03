<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href='/'/>
<title>Insert title here</title>
<script type="text/javascript" src="/js/jquery-3.3.1.min.js" ></script>
		<link rel="stylesheet" href="/lib/layui/css/layui.css" />
</head>
<body>
 
 <div id="dataStr"></div>
	<script type="text/javascript" src="lib/layui/layui.all.js"></script>
	  
   <div align="center" style="width:1500px;height: 400px;margin-left: auto;margin-right: auto;">
	    <div>
			<h2>学生管理</h2>
		</div>
	   <div class="layui-input-inline">
	        <table id="user" lay-filter="test"></table>
	   </div>             
	               
	</div>
    <script type="text/javascript">
	    var popForm;
		layui.use(["form","table"], function() {
            var table = layui.table;
            popForm=layui.form;
            //第一个实例
            table.render({
                   elem: '#user',
                   loading:true,
                    skin: 'line', //行边框风格                     
                    even : true,//开启隔行背景
                    size : 'lg',//小尺寸的表格
                    url : '${pageContext.request.contextPath }/student/find',
                page : { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                    layout : [  'prev', 'page', 'next', 'skip','limit' ],  //自定义分页布局
                    groups : 5,//只显示 1 个连续页码
                    limit : 5,//	
                    limits : [ 4, 8, 16 ]
                     
                },
                cols : [ [ //表头
                {
                    field : 'sId',
                    title : 'ID',
                    width : 50,
                    sort : true,
                    //fixed : 'left'
                }, {
                    field : 'sName',
                    title : '名字',
                    width : 200,
                    
                }, {
                    field : 'sSex',
                    title : '性别',
                    width : 150, 
                },   {
                    field : 'sBirth',
                    title : '生日',
                    width : 200, 

                },     {
                    fixed : 'right',
                    title : '操作',
                    width : 150,
                    align : 'center',
                    toolbar : '#barDemo'
                } ] ]
            });
         //监听工具条
        table.on('tool(test)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
          var data = obj.data; //获得当前行数据
          var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
          var tr = obj.tr; //获得当前行 tr 的DOM对象
          
          
          if(layEvent === 'detail'){ //查看
           // layer.msg('ID：'+ JSON.stringify(data) + ' 的查看操作');
        	  location.href="${pageContext.request.contextPath }/reply/queryTopic/"+data.id+".do";
          } else if(layEvent === 'del'){ //删除
            layer.confirm('真的删除行么', function(index){
              obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
              $.get('<c:url value="/book/del/'+data.id+'.do"/>',"",function(){});
              layer.close(index);
              //向服务端发送删除指令
            });
          } else if(layEvent === 'edit'){ //编辑
            //do something
          /*   layer.alert('编辑行：<br>'+ JSON.stringify(data)+data.name); */
           
          
            
            layer.open({
            	//layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                type:1,
                title:"修改用户",
                btn:'关闭',
                area: ['25%','50%'],
                content:$("#userID").html()
            });
            
            setFormValue(data);//动态向表单赋值 
   

           /*  //同步更新缓存对应的值
            obj.update({
            	name: data.name
              ,title: 'xx'
            }); */
          }
        }); 
        function setFormValue(data){
        	//给表单赋值
            popForm.val("formTestFilter2121", {
            "userId":data.userId
  			  ,"name":data.name 
  			 ,"content":data.content
  			 ,"id":data.id
  			,"createTime":data.createTime
  			 
  			});
    		popForm.render(null,'formTestFilter2121');
	 
	 
	  		}
        });

    </script>
    <script type="text/html" id="usernameTpl">
  <a href="/?table-demo-id={{d.id}}" class="layui-table-link" target="_blank">{{ d.name }}</a>
</script>
<script type="text/html" id="barDemo">
  <a class="layui-btn  layui-btn-xs" lay-event="detail">查看</a>
  <a class="layui-btn  layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger  layui-btn-xs" lay-event="del">删除</a>

  <!-- 这里同样支持 laytpl 语法，如： -->
  {{#  if(d.auth > 2){ }}
    <a class="layui-btn layui-btn-mini" lay-event="check">审核</a>
  {{#  } }}
</script>

	<div id="userID" style="display: none;">
	<div class="layui-col-md11" >
	        <form class="layui-form" method="post" action='<c:url value="/book/update.do"/>' lay-filter="formTestFilter2121" >
	        	<input type="hidden" name="id">
	        	 
	            <div class="layui-form-item">
	                <label class="layui-form-label">标题：</label>
	                <div class="layui-input-inline">
	                    <input type="text" name="name"    class="layui-input">
	                </div>
	               
	            </div>
	            <div class="layui-form-item">
	                <label class="layui-form-label">内容：</label>
	                <div class="layui-input-inline">
	                    <input type="text" name="content"   class="layui-input">
	                </div> 
	            </div>
	            <input type="hidden" name="createTime">
	            <input type="hidden" name="userId">
	     
	  
	             
	            <div class="layui-form-item">
	                <div class="layui-input-block">
	                	<input type="submit" class="layui-btn layui-btn-normal" />
	                   <!-- <button type="button" class="layui-btn layui-btn-normal">提交</button>
-->	                </div>
	            </div>
	        </form>
	    </div>
</div>	
<!--时间格式化-->
    <script src="js/date-format.js" type="text/javascript" charset="utf-8"></script>
    <script id="createTime" type="text/html">
		function createTime(v){
		var date = new Date(v);
		var y = date.getFullYear();
		var m = date.getMonth()+1;
		m = m<10?'0'+m:m;
		var d = date.getDate();
		d = d<10?("0"+d):d;
		var h = date.getHours();
		h = h<10?("0"+h):h;
		var M = date.getMinutes();
		M = M<10?("0"+M):M;
		var str = y+"-"+m+"-"+d+" "+h+":"+M;
		return str;
		}
    </script>
 
 
</body>
</html>