<%-- 
    Document   : AccountManagermet
    Created on : Jun 6, 2024, 3:27:31 PM
    Author     : ADMIN
--%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Free Bootstrap Admin Template : Binary Admin</title>
        <!-- BOOTSTRAP STYLES-->
        <link href="assets/css/bootstrap.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLES-->
        <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
        <link href="assets/css/custom.css" rel="stylesheet" />
        <!-- GOOGLE FONTS-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
        <!-- TABLE STYLES-->
        <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
        <style>
            .delete-link {
                color: white;
            }
        </style>
    </head>
    <body>
        <script type="text/javascript">
            function confirmStaff(userId) {
                if (confirm("Bạn có chắc chắn muốn đổi chức vụ tài khoản này?")) {
                    document.getElementById("changeStaff_" + userId).submit();
                }
            }

            function confirmAdmin(userId) {
                if (confirm("Bạn có chắc chắn muốn đổi chức vụ tài khoản này?")) {
                    document.getElementById("changeAdmin_" + userId).submit();
                }
            }
        </script>
        <div id="wrapper">
            <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="homeadmin.jsp"></a> 
                </div>
                <div style="color: white;
                     padding: 15px 50px 5px 50px;
                     float: right;
                     font-size: 16px;"> Last access : 30 May 2014 &nbsp; <a href="logout" class="btn btn-danger square-btn-adjust">Logout</a> </div>
            </nav>   
            <!-- /. NAV TOP  -->
            <nav class="navbar-default navbar-side" role="navigation">
                <div class="sidebar-collapse">
                    <ul class="nav" id="main-menu">
                        <li class="text-center">
                            <img src="img/logo1.png" class="user-image img-responsive" />
                        </li>
                        <li>
                            <a href="homeAdmin1.jsp">
                                <img src="img/home.png" alt="Home" style="width: 35px; height: 35px; margin-left:5px;margin-right:10px;">
                                    Trang chủ
                            </a>
                        </li>
                        <li>
                            <a href="manageproduct">
                                <img src="img/iconpm.png" alt="Home" style="width: 38px; height: 38px; margin-left:5px;margin-right:7px;">
                                    Quản Lý Sản Phẩm
                            </a>
                        </li>
                        <li>
                            <a href="brandmanagerment">
                                <img src="img/iconbrand.png" alt="Home" style="width: 40px; height: 40px; margin-left:5px;margin-right:5px;">
                                    Quản Lý Nhãn Hàng
                            </a>
                        </li>
                        <li>
                            <a href="categorymanagerment">
                                <img src="img/iconcategory.png" alt="Home" style="width: 40px; height: 40px; margin-left:5px;margin-right:5px;">
                                    Quản Lý Loại Sản Phẩm
                            </a>
                        </li>
                        <li>
                            <a href="accountmanagerment">
                                <img src="img/iconuser.png" alt="Home" style="width: 35px; height: 35px; margin-left:5px;margin-right:10px;">
                                    Quản Lý Tài Khoản
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="img/iconorder.png" alt="Home" style="width: 35px; height: 35px; margin-left:5px;margin-right:10px;">
                                    Quản Lý Đơn Hàng
                            </a>
                        </li>
                        <li>
                            <a href="statistic">
                                <img src="img/statistic.png" alt="Home" style="width: 35px; height: 35px; margin-left:5px;margin-right:10px;">
                                    Thống Kê
                            </a>
                        </li>
                        <li>
                            <a href="roleManagerment.jsp">
                                <img src="img/role.png" alt="Home" style="width: 30px; height: 30px; margin-left:5px;margin-right:15px;">
                                    Phân Quyền
                            </a>
                        </li>                
                    </ul>
                </div>
            </nav>  
            <!-- /. NAV SIDE  -->
            <div id="page-wrapper">
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-9">
                            <h2>Phân Quyền</h2>
                            <h5>Welcome ${sessionScope.acc.fullName}, Love to see you back.</h5>

                            <a href="banuser"><button class="btn btn-danger ">Cấm Tài Khoản Người Dùng</button></a>
                            <a href="updaterole"><button class="btn btn-primary">Phân Quyền Nhân Viên</button></a>
                        </div>
                    </div>

                    <!-- /. ROW  -->
                    <hr />
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Advanced Tables
                                </div>
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Họ và Tên</th>
                                                    <th>Email</th>
                                                    <th>Chức vụ</th>
                                                    <th>Chức Năng</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.listUser}" var="lu">
                                                    <c:choose>
                                                        <c:when test="${lu.roleId == 1}">
                                                            <tr>
                                                                <td>${lu.id}</td>
                                                                <td>${lu.fullName}</td>
                                                                <td>${lu.email}</td>
                                                                <td>Quản trị viên</td>
                                                                <td>
                                                                    <form id="changeStaff_${lu.id}" action="updaterole" method="post">
                                                                        <input type="hidden" name="changeRoleStaff" value="${lu.id}">
                                                                            <button type="button" class="btn btn-primary btn-xs" onclick="confirmStaff('${lu.id}')">Chuyển qua nhân viên</button>
                                                                    </form>
                                                                </td>
                                                            </tr>
                                                        </c:when>
                                                        <c:when test="${lu.roleId == 3}">
                                                            <tr>
                                                                <td>${lu.id}</td>
                                                                <td>${lu.fullName}</td>
                                                                <td>${lu.email}</td>
                                                                <td>Nhân viên</td>
                                                                <td>
                                                                    <form id="changeAdmin_${lu.id}" action="updaterole" method="post">
                                                                        <input type="hidden" name="changeRoleAdmin" value="${lu.id}">
                                                                            <button type="button" class="btn btn-success btn-xs" onclick="confirmAdmin('${lu.id}')">Chuyển qua quản trị viên</button>
                                                                    </form>
                                                                </td>
                                                            </tr>
                                                        </c:when>
                                                    </c:choose>
                                                </c:forEach>


                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!-- End Advanced Tables -->
                        </div>
                    </div>
                </div>
                <!-- /. PAGE INNER  -->
            </div>
            <!-- /. PAGE WRAPPER  -->
        </div>
        <!-- /. WRAPPER  -->
        <!-- SCRIPTS AT THE BOTTOM TO REDUCE THE LOAD TIME -->
        <!-- JQUERY SCRIPTS -->
        <script src="assets/js/jquery-1.10.2.js"></script>
        <!-- BOOTSTRAP SCRIPTS -->
        <script src="assets/js/bootstrap.min.js"></script>
        <!-- METISMENU SCRIPTS -->
        <script src="assets/js/jquery.metisMenu.js"></script>
        <!-- DATA TABLE SCRIPTS -->
        <script src="assets/js/dataTables/jquery.dataTables.js"></script>
        <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
        <script>
                                                                                $(document).ready(function () {
                                                                                    $('#dataTables-example').dataTable();
                                                                                });
        </script>
        <!-- CUSTOM SCRIPTS -->
        <script src="assets/js/custom.js"></script>
    </body>
</html>
