<%--
  Created by IntelliJ IDEA.
  User: IgorL
  Date: 30.03.2024
  Time: 19:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Вход</title>
    <form action="Login" method="POST">
        Логин:<input type="text" name="login"/>
        Пароль:<input type="password" name="password"/>
        <input type="submit" value="Войти">
    </form>
</head>
<body>
<a href=<%="Register"%>> Зарегистрироваться </a>
</body>
</html>