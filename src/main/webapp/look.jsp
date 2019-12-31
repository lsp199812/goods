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
	<form>
		商品名称：<input name="name"><br>
		商品名称：<input name="name"><br>
		英文名称：<input name="sname"><br>
		商品品牌：<input name="bname"><br>
		商品种类：<input name="type"><br>
		商品尺寸：<input name="size"><br>
		商品单价：<input name="price"><br>
		商品数量：<input name="num"><br>
		<input type="button" value="返回" onclick="fh()">
	</form>
	
</body>
<script type="text/javascript">
	var id = '${param.id}'
	$.post(
		"getGoods.do",
		{"id":id},
		function(res){
			$("[name=name]").val(res.name)
			$("[name=sname]").val(res.sname)
			$("[name=bname]").val(res.bname)
			$("[name=type]").val(res.type)
			$("[name=size]").val(res.size)
			$("[name=price]").val(res.price)
			$("[name=num]").val(res.num)
		},
		"json"
	)
	
	function fh(){
		location="getList.do"
	}
</script>
</html>