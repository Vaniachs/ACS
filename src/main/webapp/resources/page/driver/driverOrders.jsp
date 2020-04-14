<%--
  Created by IntelliJ IDEA.
  User: Lesha
  Date: 27.01.2020
  Time: 18:22
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
    <title>userBuber</title>
    <link href="https://fonts.googleapis.com/css?family=PT+Sans:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu:500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/driver.css">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user_showDrivers.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/resources/js/status.js"></script>
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
                                    <a href="driver?action=driver_Page">
                                        <fmt:message key="text.driverPage.main" bundle="${locale}"/>
                                    </a>
                                </li>
                            <li class="menu__item">
                                <div class="act">
                                <a href="driver?action=driver_Orders">
                                    <fmt:message key="text.driverPage.orders" bundle="${locale}"/>
                                </a>
                                </div>
                            </li>
                            <li class="menu__item">
                                <a href="driver?action=busy">
                                    <fmt:message key="text.driverPage.busy" bundle="${locale}"/>
                                </a>
                            </li>
                            <li class="menu__item">
                                <a href="driver?action=current_Order">
                                    <fmt:message key="text.driverPage.currentOrder" bundle="${locale}"/>
                                </a>
                            </li>
                            <li class="menu__item">
                                <a href="app?action=change_Name">
                                    <fmt:message key="text.userPage.username" bundle="${locale}"/>
                                </a>
                            </li>
                            <li class="menu__item">
                                <a href="app?action=change_Password">
                                    <fmt:message key="text.userPage.password" bundle="${locale}"/>
                                </a>
                            </li>
                            <li class="menu__item">
                                <a href="hello?action=logout">
                                    <fmt:message key="text.userPage.logout" bundle="${locale}"/>
                                </a>
                            </li>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-5 col-sm-5 ml-left">
                <jsp:useBean id="noOrders" scope="request" type="java.lang.Boolean"/>
                <jsp:useBean id="orderAccepted" scope="request" type="java.lang.Boolean"/>

                <c:if test="${!noOrders}">
                <c:if test="${!orderAccepted}">

                <jsp:useBean id="orders" scope="request" type="java.util.List"/>

                    <c:forEach items="${orders}" var="currentOrder" varStatus="status">
                        <form method="post" action="driver?action=accept_Order">
                            <section class="features" id="features">
                                <div class="Make an order">

                                    <div class="form__name">
                                        <h2><fmt:message key="text.ableDrivers.head" bundle="${locale}"/></h2>
                                        <hr width="100%" color="#fff" align="right" size="10">
                                    </div>

                                    <div class="drivers_table d-flex justify-content-center">
                                        <!-- Table -->
                                        <table width="70%">
                                            <tr>
                                                <th><fmt:message key="text.driverOrders.coordinates" bundle="${locale}"/></th>
                                                <th><fmt:message key="text.driverOrders.address" bundle="${locale}"/></th>
                                                <th><fmt:message key="text.driverOrders.comment" bundle="${locale}"/></th>
                                                    <%--<th id="btn"> </th>--%>
                                            </tr>

                                            <tr>
                                                <td><c:out value="${currentOrder.coordinates}" /></td>
                                                <td><c:out value="${currentOrder.destinationPoint}" /></td>
                                                <td><c:out value="${currentOrder.comment}"/></td>
                                                <td id="btn"> <input type="submit" class="submit" name="button" id="ss" value=
                                                        "<fmt:message key="text.driverOrders.accept.button" bundle="${locale}"/>"></td>
                                            </tr>
                                            <input type="hidden" value="${currentOrder.id}"  name="acceptedOrder"/>
                                        </table>
                                    </div>
                                </div>
                            </section>
                        </form>
                    </c:forEach>
                </c:if>
                </c:if>
            </div>

        </div>
    </div>

</div>
</body>
</html>