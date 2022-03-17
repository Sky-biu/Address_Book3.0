<%--
  Created by IntelliJ IDEA.
  User: wxw10
  Date: 2022/3/15
  Time: 18:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>通讯录第三版</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="webjars/jquery/3.4.1/jquery.min.js"></script>
    <script src="webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="webjars/bootstrap/3.3.5/css/bootstrap.min.css" />

    <style type="text/css">
        h1 {
            text-align: center;
        }

        body {
            background-color: antiquewhite;
        }

        th, td {
            width: 70px;
            height: 35px;
            text-align: center;
        }

        #before {
            text-align: center;
        }
    </style>
    
    <script type="text/javascript">
        function isPhone(phone) {
            var pattern = /^((13[0-9])|(14(0|[5-7]|9))|(15([0-3]|[5-9]))|(16(2|[5-7]))|(17[0-8])|(18[0-9])|(19([0-3]|[5-9])))\d{8}$/;
            return pattern.test(phone);
        }
    </script>

    <script type="text/javascript">
        function addPerson(){
            var xmlHttp;
            if(window.ActiveXObject){
                xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
            }else if(window.XMLHttpRequest){
                xmlHttp=new XMLHttpRequest();
            }
            var Name = document.getElementById("Name");
            var Phone_number = document.getElementById("Phone_number");
            if (isPhone(Phone_number.value)===false){
                alert("操作出错，电话号码非中国大陆运营商号段，请重试！")
            }
            else if(isPhone(Phone_number.value)===true){
                var queryString="addtest?Name="+Name.value+"&Phone_number="+Phone_number.value;
                xmlHttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        alert("数据已提交");
                        $('#myModal').modal('hide')
                        searchPerson("");
                    }
                };
                xmlHttp.open("GET",queryString,true);
                xmlHttp.send(null);
            }
        }
    </script>

    <script type="text/javascript">
        function searchPerson(Name){
            var xmlHttp1;
            if(window.ActiveXObject){
                xmlHttp1=new ActiveXObject("Microsoft.XMLHTTP");
            }else if(window.XMLHttpRequest){
                xmlHttp1=new XMLHttpRequest();
            }
            var queryString1="ajaxtest?Name="+Name;
            xmlHttp1.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    myFunction(this);
                }
            };
            xmlHttp1.open("GET",queryString1,true);
            xmlHttp1.send(null);
        }

        function myFunction(xml) {
            var i;
            var xmlDoc = xml.responseXML;
            var x = xmlDoc.getElementsByTagName("person");
            if(x.length == 0){
                var table = "<div style=\"text-align:center\">没有查询到任何数据</div>";
            }
            else{
                var table="<thead><tr bgcolor=\"#5f9ea0\"><th>姓名</th><th>电话</th><th>选项</th></tr></thead>";
                for (i = 0; i <x.length; i++) {
                    var a = x[i].getElementsByTagName("pid")[0].childNodes[0].nodeValue;
                    var b = x[i].getElementsByTagName("pname")[0].childNodes[0].nodeValue;
                    var c = x[i].getElementsByTagName("phone")[0].childNodes[0].nodeValue;
                    table += "<tbody><tr><td>" +
                        b +
                        "</td><td>" +
                        c +
                        "</td><td><div class=\"btn-group\">"+
                        "<button type=\"button\" class=\"btn btn-info btn-sm\" onclick=editPerson('"+
                        a + "','" + b + "','" + c+
                        "')>编辑</button>"+
                        "<button type=\"button\" class=\"btn btn-danger btn-sm\" onclick=\"delPerson("+
                        a +
                        ")\">删除</button>"+
                        "</div></td></tr></tbody>";
                }
            }
            document.getElementById("mytable1").innerHTML = table;
        }
    </script>

    <script type="text/javascript">
        function editPerson(ID,Name,Phone_number) {
            $("#editModal").modal('show');
            $("#editName").val(Name);
            $("#editPhone_number").val(Phone_number);
            $("#editbutton").attr("value",ID);
        }
    </script>

    <script type="text/javascript">
        function update(ID) {
            var xmlHttp3;
            if(window.ActiveXObject){
                xmlHttp3=new ActiveXObject("Microsoft.XMLHTTP");
            }else if(window.XMLHttpRequest){
                xmlHttp3=new XMLHttpRequest();
            }
            var Name = document.getElementById("editName");
            var Phone_number = document.getElementById("editPhone_number");
            if (isPhone(Phone_number.value)===false){
                alert("操作出错，电话号码非中国大陆运营商号段，请重试！")
            }
            else if(isPhone(Phone_number.value)===true){
                var queryString="updatetest?ID="+ID+"&Name="+Name.value+"&Phone_number="+Phone_number.value;
                xmlHttp3.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        alert("数据已修改");
                        $('#editModal').modal('hide')
                        searchPerson("");
                    }
                };
                xmlHttp3.open("GET",queryString,true);
                xmlHttp3.send(null);
            }
        }
    </script>

    <script type="text/javascript">
        function delPerson(ID) {
            var xmlHttp2;
            if(window.ActiveXObject){
                xmlHttp2=new ActiveXObject("Microsoft.XMLHTTP");
            }else if(window.XMLHttpRequest){
                xmlHttp2=new XMLHttpRequest();
            }
            var queryString2="deltest?ID="+ID;
            xmlHttp2.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    alert("数据已删除");
                    searchPerson("");
                }
            };
            xmlHttp2.open("GET",queryString2,true);
            xmlHttp2.send(null);
        }
    </script>

</head>
<body>
<h1><b>通讯录</b></h1>
<hr/>
<div id="before">
    <p><input type="text" id="txt1" placeholder="输入姓名进行查找" onkeyup="searchPerson(this.value)"></p>
</div>

<table class="table" align="center" id="mytable1" cellspacing="5">
    <script type="text/javascript">
        searchPerson("");
    </script>
</table>

<div style="text-align:center">
<button class="btn btn-default" data-toggle="modal" data-target="#myModal">添加数据</button>
</div>
<!-- 模态框（myModal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    添加新的数据至通讯录
                </h4>
            </div>
            <div class="modal-body">
                <div>
                    <tr>
                        <label>姓名：</label></td>
                        <input type="text" name="Name" id="Name" placeholder="姓名">
                    </tr>
                </div>
                <div>
                    <tr>
                        <label>电话：</label>
                        <input type="text" name="Phone_number" id="Phone_number" placeholder="电话">
                    </tr>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="addPerson()">添加</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!-- 模态框（editModal） -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="editModalLabel">
                    更新通讯录
                </h4>
            </div>
            <div class="modal-body">
                <div>
                    <tr>
                        <label>姓名：</label></td>
                        <input type="text" name="Name" id="editName" placeholder="姓名">
                    </tr>
                </div>
                <div>
                    <tr>
                        <label>电话：</label>
                        <input type="text" name="Phone_number" id="editPhone_number" placeholder="电话">
                    </tr>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="editbutton" onclick="update(value)">修改</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</body>
</html>
