<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Users</title>
    <jsp:include page="metatags.jsp"/>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-xs-7">

            <h1>Users</h1>

            <c:if test="${!empty listUsers}">
                <table class="table table-striped table-bordered table-hover">
                    <tr>
                        <th>ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Age</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    <c:forEach items="${listUsers}" var="user">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.firstName}</td>
                            <td>${user.lastName}</td>
                            <td>${user.age}</td>
                            <td><a href="<c:url value='/edit/${user.id}'/>">Edit</a></td>
                            <td><a href="<c:url value='/remove/${user.id}'/>">Delete</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </div>

        <div class="col-xs-5">
            <h1>Add User</h1>

            <c:url var="addAction" value="/index/add"/>

            <form:form action="${addAction}" commandName="user">
                <table class="table">
                    <c:if test="${!empty user.firstName}">
                        <tr>
                            <td>
                                <form:label path="id">
                                    <spring:message text="ID"/>
                                </form:label>
                            </td>
                            <td>
                                <form:input path="id" readonly="true" size="8" disabled="true"/>
                                <form:hidden path="id"/>
                            </td>
                        </tr>
                    </c:if>
                    <tr>
                        <td>
                            <form:label path="firstName">
                                <spring:message text="firstName"/>
                            </form:label>
                        </td>
                        <td>
                            <form:input path="firstName"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="lastName">
                                <spring:message text="lastName"/>
                            </form:label>
                        </td>
                        <td>
                            <form:input path="lastName"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="age">
                                <spring:message text="age"/>
                            </form:label>
                        </td>
                        <td>
                            <form:input path="age"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <c:if test="${!empty user.firstName}">
                                <input type="submit"
                                       value="<spring:message text="Edit User"/>"/>
                            </c:if>
                            <c:if test="${empty user.firstName}">
                                <input type="submit"
                                       value="<spring:message text="Add User"/>"/>
                            </c:if>
                        </td>
                    </tr>
                </table>
            </form:form>

        </div>
    </div>
</div>

<jsp:include page="scripts.jsp"/>
</body>
</html>
