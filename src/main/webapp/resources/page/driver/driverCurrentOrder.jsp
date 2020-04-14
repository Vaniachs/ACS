<%--
  Created by IntelliJ IDEA.
  User: Lesha
  Date: 31.01.2020
  Time: 0:31
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user_currentOrder.css">
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
                                <a href="driver?action=driver_Page">
                                    <fmt:message key="text.driverPage.main" bundle="${locale}"/>
                                </a>
                            </li>
                            <li class="menu__item">
                                <a href="driver?action=driver_Orders">
                                    <fmt:message key="text.driverPage.orders" bundle="${locale}"/>
                                </a>
                            </li>
                            <li class="menu__item">
                                <a href="driver?action=busy">
                                    <fmt:message key="text.driverPage.busy" bundle="${locale}"/>
                                </a>
                            </li>
                            <li class="menu__item">
                                <div class="act">
                                    <a href="driver?action=current_Order">
                                        <fmt:message key="text.driverPage.currentOrder" bundle="${locale}"/>
                                    </a>
                                </div>
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

            <jsp:useBean id="ordered" scope="request" type="java.lang.Boolean"/>

            <c:if test="${ordered}">
                <jsp:useBean id="currentOrder" scope="request" type="by.epam.buber.entity.Order"/>
                <div class="col-lg-5 col-sm-5 ml-left">
                    <section class="features" id="features">
                        <div class="Make an order">

                            <div class="form__name">
                                <h2><fmt:message key="text.driverCurrentOrder.head" bundle="${locale}"/></h2>
                                <hr width="95%" color="#fff" align="right" size="10">
                            </div>

                            <div class="drivers_table d-flex justify-content-center">
                                <!-- Table -->

                                    <table width="70%">
                                        <tr>
                                            <th><fmt:message key="text.driverCurrentOrder.coordinates" bundle="${locale}"/>:</th>
                                            <td class="crdinate_field"><c:out value="${currentOrder.coordinates}" /><td>
                                        </tr>
                                        <tr>
                                            <th><fmt:message key="text.driverCurrentOrder.address" bundle="${locale}"/>:</th>
                                            <td class="adr_field"><c:out value="${currentOrder.destinationPoint}" /></td>

                                        </tr>
                                        <tr>
                                            <th><fmt:message key="text.driverCurrentOrder.comment" bundle="${locale}"/>:</th>
                                            <td class="comment_field"><c:out value="${currentOrder.comment}" /></td>
                                        </tr>
                                    </table>


                                <c:if test="${!currentOrder.started}">
                                <form method="post" action="app?action=start_Trip">
                                <td><input type="submit" class="accept" name="button" value=
                                            "<fmt:message key="text.driverCurrentOrder.start" bundle="${locale}"/>"></td>
                                    <input type="hidden" value="${currentOrder.id}"  name="startedOrder"/>
                                </form>
                                </c:if>

                                <c:if test="${currentOrder.started}">
                                <form method="post" action="app?action=complete">
                                    <td><input type="submit" class="accept" name="button" value=
                                            "<fmt:message key="text.driverCurrentOrder.complete" bundle="${locale}"/>"></td>
                                    <input type="hidden" value="${currentOrder.id}"  name="startedOrder"/>
                                </form>
                                </c:if>

                            </div>
                        </div>
                    </section>
                </div>
            </c:if>
            <c:if test="${!ordered}">
                <div class="form__name">
                    <hr width="95%" color="#fff" align="right" size="10">
                    <h5><fmt:message key="text.driverCurrentOrder.noOrder" bundle="${locale}"/></h5>
                </div>
            </c:if>

        </div>
    </div>
</div>
</body>
</html>
