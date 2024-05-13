<%--
  Created by IntelliJ IDEA.
  User: IgorL
  Date: 17.03.2024
  Time: 23:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String directory = request.getParameter("path").replace("\\","/");
    File file = new File(directory);
    String parentDirectoryPath = "/";


    parentDirectoryPath = file.getParent();
    String login =(String) request.getAttribute("login");
    if (parentDirectoryPath == null || parentDirectoryPath.length() < ("C:/Users/IgorL/java/".length() + login.length())) {
        parentDirectoryPath = "C:/Users/IgorL/java/"+request.getAttribute("login");
    }


%>
<html>
<head>
    <title>Менеджер файлов</title>
</head>
<body>
<h1>Текущая директория: "<%=(String) request.getAttribute("currentPath")%> "</h1>
<a href=<%="?path="+parentDirectoryPath.replace("\\","/")%>>Назад</a>
<table>
    <tr>
        <th>Папка</th>
        <th>Перейти</th>
        <th>Размер(байты)</th>
        <th>Последнее изменение</th>
    </tr>
    <%
        File[] itemList = (File[]) request.getAttribute("folders"); // Получаем список из объекта запроса
        for (File item : itemList) {
    %>
    <tr>
        <th><%= item.getName()%></th>
        <th><a href=<%="?path="+item.getAbsolutePath().replace("\\", "/").replace(" ","%20")%>/>Перейти</th>


        <th><%= item.length()%></th>
        <th><%= new Date(item.lastModified())%></th>
    </tr>
    <% } %>
    <tr>
        <th>Файл</th>
        <th>Ссылка на скачивание</th>
        <th>Размер(байты)</th>
        <th>Последнее изменение</th>
    </tr>
    <%
        File[] list = (File[]) request.getAttribute("files"); // Получаем список из объекта запроса
        for (File item : list) {
    %>
    <tr>
        <th><%= item.getName()%></th>

        <th><a href=<%="http://localhost:8080/lab_5_authorization_war_exploded/Download?path="+ item.getAbsolutePath().replace("\\","/").replace(" ","%20")%>> Скачать </a> </th>
        <th><%= item.length()%></th>
        <th><%= new Date(item.lastModified())%></th>
    </tr>
    <% } %>
</table>
<p>
<form action="Manager" method="POST">
    <input type="submit" value="Выйти">
</form>
</p>
</body>
</html>