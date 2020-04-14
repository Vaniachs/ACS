<%--
  Created by IntelliJ IDEA.
  User: Lesha
  Date: 03.02.2020
  Time: 18:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<fmt:setLocale value="${sessionScope.locale}" scope="session"/>
<fmt:setBundle basename="locale" var="locale"/>

<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="BUBER">
    <title>driverBuber</title>
    <link href="https://fonts.googleapis.com/css?family=PT+Sans:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu:500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/resources/js/user.js"></script>
</head>
<body>
<div class="background">

    <!-- floating menu -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <header class="header" id="header">
                    <li class="logo">
                        <a class="logo__name" href="hello?action=main">BUBER</a>
                    </li>
                </header>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-4 col-sm-4">
                <div class="wrapper">
                    <div class="menu" id="menu">
                        <a href="#" class="buttonMenu" id="buttonMenu"></a>
                        <div class="menu__list">
                            <li class="menu__item">
                                <div class="act">
                                <a href="admin?action=admin_Page">
                                    <fmt:message key="text.adminPage.main" bundle="${locale}"/>
                                </a>
                                </div>
                            </li>
                            <li class="menu__item">
                                <a href="admin?action=get_All">
                                    <fmt:message key="text.adminPage.showAll" bundle="${locale}"/>
                                </a>
                            </li>
                            <li class="menu__item">
                                <a href="admin?action=get_All_By_Name">
                                    <fmt:message key="text.adminPage.findByName" bundle="${locale}"/>
                                </a>
                            </li>
                            <li class="menu__item">
                                <a href="admin?action=participant_Id">
                                    <fmt:message key="text.adminPage.findById" bundle="${locale}"/>
                                </a>
                            </li>
                            <li class="menu__item">
                                <a href="admin?action=discount">
                                    <fmt:message key="text.adminPage.discounts" bundle="${locale}"/>
                                </a>
                            </li>
                            <%--<li class="menu__item">--%>
                                <%--<a href="app?action=change_Name">--%>
                                    <%--<fmt:message key="text.userPage.username" bundle="${locale}"/>--%>
                                <%--</a>--%>
                            <%--</li>--%>
                            <li class="menu__item">
                                <a href="app?action=change_Password">
                                    <fmt:message key="text.userPage.password" bundle="${locale}"/>
                                </a>
                            </li>
                            <li class="menu__item">
                                    <a href="admin?action=new_Driver">
                                        <fmt:message key="text.adminPage.driver" bundle="${locale}"/>
                                    </a>
                            </li>
                            <li class="menu__item">
                                <a href="hello?action=logout">
                                    <fmt:message key="text.adminPage.logout" bundle="${locale}"/>
                                </a>
                            </li>
                        </div>
                    </div>
                </div>
            </div>



        </div>
    </div>
</div>
</body>
</html>