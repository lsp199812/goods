<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.2.min.js"></script>
</head>
<body>
	<form action="getList.do" method="post">
		<input name="pageNum" value="1">
		<input name="key" value="${m.key }">
		<input type="submit" value="查询">
		<input type="button" value="批量删除" onclick="plsc()">
		<input type="button" value="添加" onclick="add()">
	</form>
	<table border="1px">
		<tr>
			<td>选择</td>
			<td>商品名称</td>
			<td>英文名称</td>
			<td>尺寸</td>
			<td>单价</td>		
			<td>商品品牌</td>	
			<td>商品种类</td>
			<td>操作</td>	
		</tr>
		<c:forEach items="${pi.list }" var="s">
			<tr>
				<td><input type="checkbox" class="c" value="${s.id }"></td>
				<td>${s.name }</td>
				<td>${s.sname }</td>
				<td>${s.size }</td>
				<td>${s.price }</td>		
				<td>${s.bname }</td>
				<td>${s.type }</td>
				<td>
					<input type="button" value="删除" onclick="ds(${s.id})">
					<input type="button" value="详情" onclick="look(${s.id})">
					<input type="button" value="编辑" onclick="update(${s.id})">
				</td>
			</tr>
		</c:forEach>
	</table>
	<a href="#" onclick="getPage(1)">首页</a>
	<a href="#" onclick="getPage(${pi.pageNum-1})">上一页</a>
	当前${pi.pageNum}页/共${pi.pages}页
	<a href="#" onclick="getPage(${pi.pageNum+1})">下一页</a>
	<a href="#" onclick="getPage(${pi.pages})">尾页</a>
</body>
<script type="text/javascript">
	function getPage(s){
		$("[name=pageNum]").val(s);
		$("form").submit();
	}
	
	var id='${param.id}'
	function ds(id){
		$.post(
			"del.do",
			{id:id},
			function(res){
				if(res>0){
					alert("删除成功")
					location="getList.do"
				}else{
					alert("删除失败")
				}
			},
			"json"
		)
	}
	
	function plsc(){
		var id="";
		 $(".c:checked").each( 
			function(){
				
				id+=","+$(this).val()
			}
		 )
		 id=id.substring(1)
		
		 $.post(
			"del.do",
			{id:id},
			function(res){
				if(res>0){
					alert("删除成功")
					location="getList.do"
				}else{
					alert("删除失败")
				}
			},
			"json"
		 )
	}
	
	var id='${param.id}'
	function look(id){
		location="look.jsp?id="+id;
	}
	
	function add(){
		location="add.jsp"
	}
</script>
</html>