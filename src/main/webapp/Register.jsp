<%--
  Created by IntelliJ IDEA.
  User: IgorL
  Date: 30.03.2024
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Регистрация</title>
</head>
<body>
<form action="Register" method="POST">
    Логин: <input type="text" name="login"/>
    Пароль: <input type="password" name="password"/>
    Почта: <input type="text" name="email"/>
    <input type="submit" value="Зарегистрироваться">
</form>
</body>
</html>