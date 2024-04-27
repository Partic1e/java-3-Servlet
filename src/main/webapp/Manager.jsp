<%--
  Created by IntelliJ IDEA.
  User: IgorL
  Date: 10.03.2024
  Time: 13:45
  To change this template use File | Settings | File Templates.
--%>
<<%@ page import="java.io.File" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String directory = request.getParameter("path");
    File file = new File(directory);
    String parentDirectoryPath = "C:/";



    parentDirectoryPath = file.getParent();

    if (parentDirectoryPath == null) {
        parentDirectoryPath = "C:/";
    }


%>
<html>
<head>
    <title>Менеджер файлов</title>
</head>
<body>
<h1>Текущая директория: "<%=directory%> "</h1>
<p><a href=<%="?path="+parentDirectoryPath.replace("\\","/").replace(" ","%20")%>/>Назад</p>
<table>
    <tr>
        <th>Папка</th>
        <th>Перейти</th>
        <th>Размер(байты)</th>
        <th>Последнее изменение</th>
    </tr>
    <%
        File[] itemList = (File[]) request.getAttribute("folders");
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
        File[] list = (File[]) request.getAttribute("files");
        for (File item : list) {
    %>
    <tr>
        <th><%= item.getName()%></th>

        <th><a href=<%="http://localhost:8080/lab-3-Servlet_war_exploded/Download?path="+ item.getAbsolutePath().replace("\\", "/").replace(" ","%20")%>> Скачать </a> </th>
        <th><%= item.length()%></th>
        <th><%= new Date(item.lastModified())%></th>
    </tr>
    <% } %>
</table>
<p></p>
</body>
</html>
