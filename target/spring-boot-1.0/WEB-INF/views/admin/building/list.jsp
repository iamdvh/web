<%@include file="/common/taglib.jsp" %>
<c:url var="buildingListUrl" value="/admin/building-list"/>
<c:url var="buildingControllerOfAdmin" value="/api/building"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách toà nhà</title>
</head>
<body>

<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check("breadcrumbs", "fixed");
                } catch (e) {
                }
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">Danh sách tòa nhà</li>
            </ul>
            <!-- /.breadcrumb -->
            <div class="nav-search" id="nav-search">
                <form class="form-search">
                <span class="input-icon">
                  <input
                          type="text"
                          placeholder="Search ..."
                          class="nav-search-input"
                          id="nav-search-input"
                          autocomplete="off"
                  />
                  <i class="ace-icon fa fa-search nav-search-icon"></i>
                </span>
                </form>
            </div>
            <!-- /.nav-search -->
        </div>

        <div class="page-content">
            <div class="ace-settings-container" id="ace-settings-container">
                <div
                        class="btn btn-app btn-xs btn-warning ace-settings-btn"
                        id="ace-settings-btn"
                >
                    <i class="ace-icon fa fa-cog bigger-130"></i>
                </div>

                <div class="ace-settings-box clearfix" id="ace-settings-box">
                    <div class="pull-left width-50">
                        <div class="ace-settings-item">
                            <div class="pull-left">
                                <select id="skin-colorpicker" class="hide">
                                    <option data-skin="no-skin" value="#438EB9">
                                        #438EB9
                                    </option>
                                    <option data-skin="skin-1" value="#222A2D">
                                        #222A2D
                                    </option>
                                    <option data-skin="skin-2" value="#C6487E">
                                        #C6487E
                                    </option>
                                    <option data-skin="skin-3" value="#D0D0D0">
                                        #D0D0D0
                                    </option>
                                </select>
                            </div>
                            <span>&nbsp; Choose Skin</span>
                        </div>

                        <div class="ace-settings-item">
                            <input
                                    type="checkbox"
                                    class="ace ace-checkbox-2"
                                    id="ace-settings-navbar"
                            />
                            <label class="lbl" for="ace-settings-navbar">
                                Fixed Navbar</label
                            >
                        </div>

                        <div class="ace-settings-item">
                            <input
                                    type="checkbox"
                                    class="ace ace-checkbox-2"
                                    id="ace-settings-sidebar"
                            />
                            <label class="lbl" for="ace-settings-sidebar">
                                Fixed Sidebar</label
                            >
                        </div>

                        <div class="ace-settings-item">
                            <input
                                    type="checkbox"
                                    class="ace ace-checkbox-2"
                                    id="ace-settings-breadcrumbs"
                            />
                            <label class="lbl" for="ace-settings-breadcrumbs">
                                Fixed Breadcrumbs</label
                            >
                        </div>

                        <div class="ace-settings-item">
                            <input
                                    type="checkbox"
                                    class="ace ace-checkbox-2"
                                    id="ace-settings-rtl"
                            />
                            <label class="lbl" for="ace-settings-rtl">
                                Right To Left (rtl)</label
                            >
                        </div>

                        <div class="ace-settings-item">
                            <input
                                    type="checkbox"
                                    class="ace ace-checkbox-2"
                                    id="ace-settings-add-container"
                            />
                            <label class="lbl" for="ace-settings-add-container">
                                Inside
                                <b>.container</b>
                            </label>
                        </div>
                    </div>
                    <!-- /.pull-left -->

                    <div class="pull-left width-50">
                        <div class="ace-settings-item">
                            <input
                                    type="checkbox"
                                    class="ace ace-checkbox-2"
                                    id="ace-settings-hover"
                            />
                            <label class="lbl" for="ace-settings-hover">
                                Submenu on Hover</label
                            >
                        </div>

                        <div class="ace-settings-item">
                            <input
                                    type="checkbox"
                                    class="ace ace-checkbox-2"
                                    id="ace-settings-compact"
                            />
                            <label class="lbl" for="ace-settings-compact">
                                Compact Sidebar</label
                            >
                        </div>

                        <div class="ace-settings-item">
                            <input
                                    type="checkbox"
                                    class="ace ace-checkbox-2"
                                    id="ace-settings-highlight"
                            />
                            <label class="lbl" for="ace-settings-highlight">
                                Alt. Active Item</label
                            >
                        </div>
                    </div>
                    <!-- /.pull-left -->
                </div>
                <!-- /.ace-settings-box -->
            </div>
            <!-- /.ace-settings-container -->

            <div class="row">
                <div class="col-xs-12 col-sm-12">
                    <div class="widget-box">
                        <div class="widget-header">
                            <h4 class="widget-title">Tìm Kiếm</h4>

                            <div class="widget-toolbar">
                                <a href="#" data-action="collapse">
                                    <i class="ace-icon fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="widget-body">
                            <div class="widget-main">
                                <form:form modelAttribute="modalSearch" action="${buildingListUrl}" id="listForm"
                                           method="GET">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                            <div>
                                                <label for="name">Tên Tòa Nhà</label>
                                                    <%--                                                <input type="text" class="form-control" id="name" name="name" value="${modalSearch.name}"/>--%>
                                                <form:input path="name" cssClass="form-control"/>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                            <div>
                                                <label for="yardArea">Diện Tích Sàn</label>
                                                <input
                                                        type="text"
                                                        class="form-control"
                                                        id="yardArea"
                                                        name="floorArea"
                                                        value="${modalSearch.floorArea}"
                                                />
                                                    <%--                                                <form:input path="floorArea" cssClass="form-control" t/>--%>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row my-3">
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <div>
                                                <label for="districtId">Quận Hiện Có</label>
                                                <select
                                                        class="chosen-select form-control"
                                                        id="form-field-select-3"
                                                        data-placeholder="Chọn Quận"
                                                >
                                                    <option value="" class>Chọn Quận</option>
                                                    <option value="Q1">Quận 1</option>
                                                    <option value="Q2">Quận 2</option>
                                                    <option value="Q4">Quận 4</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <div>
                                                <label for="ward">Phường </label>
                                                <form:input path="ward" cssClass="form-control"/>

                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <div>
                                                <label for="Streat">Đường</label>
                                                <form:input path="street" cssClass="form-control"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <div>
                                                <label for="form-field-8">Số Tầng Hầm</label>
                                                <input type="text" class="form-control" id="area"/>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <div>
                                                <label for="form-field-8">Hướng </label>
                                                <input type="text" class="form-control" id="area"/>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <div>
                                                <label for="form-field-8">Hạng</label>
                                                <input type="text" class="form-control" id="area"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row my-3">
                                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                            <div>
                                                <label for="areaFrom">Diện Tích Từ</label>
                                                <input
                                                        type="number"
                                                        class="form-control"
                                                        id="areaFrom"
                                                />
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                            <div>
                                                <label for="areaTo">Diện Tích Đến</label>
                                                <input
                                                        type="number"
                                                        class="form-control"
                                                        id="area"
                                                />
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                            <div>
                                                <label for="rentalPriceFrom">Giá Thuê Từ</label>
                                                <input
                                                        type="number"
                                                        class="form-control"
                                                        id="rentalPriceFrom"
                                                />
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                            <div>
                                                <label for="rentalPriceTo">Giá Thuê Đến</label>
                                                <input
                                                        type="number"
                                                        class="form-control"
                                                        id="rentalPriceTo"
                                                />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row my-3">
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <div>
                                                <label for="managerName">Tên Quản Lý</label>
                                                <input
                                                        type="text"
                                                        class="form-control"
                                                        id="managerName"
                                                />
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <div>
                                                <label for="managerPhoneNumber">SDT Quản lý</label>
                                                <input
                                                        type="number"
                                                        class="form-control"
                                                        id="managerPhoneNumber"
                                                />
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <label class="d-block" for="staff">Nhân Viên Phụ Trách</label>
                                                <%--                                                <select--%>
                                                <%--                                                        class="chosen-select form-control"--%>
                                                <%--                                                        id="form-field-select-3"--%>
                                                <%--                                                        data-placeholder="Chọn Quận"--%>
                                                <%--                                                >--%>
                                                <%--                                                    <option value="" class>--%>
                                                <%--                                                        Chọn Nhân Viên Phụ Trách--%>
                                                <%--                                                    </option>--%>
                                                <%--                                                    <option value="AL">Alabama</option>--%>
                                                <%--                                                    <option value="AK">Alaska</option>--%>
                                                <%--                                                    <option value="AZ">Arizona</option>--%>
                                                <%--                                                </select>--%>
                                            <form:select path="staffId" cssClass="form-control">
                                                <form:option value="-1" label="Chọn nhân viên"/>
                                                <form:options items="${staffMap}"/>
                                            </form:select>
                                        </div>
                                    </div>

                                    <div class="row d-flex">
                                        <div class="checkbox">
                                            <label>
                                                <input
                                                        name="form-field-checkbox"
                                                        type="checkbox"
                                                        class="ace"
                                                />
                                                <span class="lbl">Tầng Trệt</span>
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input
                                                        name="form-field-checkbox"
                                                        type="checkbox"
                                                        class="ace"
                                                />
                                                <span class="lbl">Nguyên Căn</span>
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input
                                                        name="form-field-checkbox"
                                                        type="checkbox"
                                                        class="ace"
                                                />
                                                <span class="lbl">Nội Thất</span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <button type="button" class="btn btn-primary" id="btn-search">Tìm kiếm
                                            </button>
                                        </div>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 d-flex justify-content-end gap-2">
                    <button
                            class="btn btn-white btn-info btn-bold"
                            data-toggle="tooltip"
                            title="Thêm Tòa Nhà"
                    >
                        <i class="fa fa-plus-circle purple" aria-hidden="true"></i>
                    </button>
                    <button
                            class="btn btn-white btn-warning btn-bold"
                            data-toggle="tooltip"
                            title="Xóa Tòa Nhà"
                    >
                        <i
                                class="ace-icon fa fa-trash-o bigger-120 orange"
                                aria-hidden="true"
                        ></i>
                    </button>
                </div>
            </div>
            <br/>
            <div class="row">
                <div class="col-xs-12">
                    <table
                            id="simple-table"
                            class="table table-striped table-bordered table-hover"
                    >
                        <thead>
                        <tr>
                            <th class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace"/>
                                    <span class="lbl"></span>
                                </label>
                            </th>
                            <th>Ngày</th>
                            <th>Tên Sản Phẩm</th>
                            <th>Địa Chỉ</th>
                            <th>Tên Quản Lý</th>
                            <th>Số Điện Thoại</th>
                            <th>D.T Sàn</th>
                            <th>D.T Trống</th>
                            <th>Giá Thuê</th>
                            <th>Phí Dịch Vụ</th>
                            <th>Phí MG</th>
                            <th>Thao Tác</th>
                        </tr>
                        </thead>

                        <tbody id="buildinglist">
                        <c:forEach var="building" items="${buildings}">
                            <tr>
                                <td class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace"/>
                                        <span class="lbl"></span>
                                    </label>
                                </td>

                                <td>25/12/2019</td>
                                <td class="fw-bold">${building.name}</td>
                                <td>170 Bùi Thị Xuân, Phường Phạm Ngũ Lão, Quận 1</td>
                                <td>A Khánh, Chú Long</td>

                                <td>090290090 - 086915348 - 086915348</td>
                                <td>430</td>
                                <td>
                                    290m2 (lầu lửng), 110m2 (lầu 4), 420m2 (lầu 2), 80m2
                                    (lầu 5) giá 23$ allin, 310m2 (lầu 11) giá 21$ all in
                                </td>

                                <td>17$</td>
                                <td>4$</td>
                                <td>0.7T</td>
                                <td>
                                    <div class="hidden-sm hidden-xs btn-group d-flex gap-2">
                                        <button
                                                class="btn btn-xs btn-info"
                                                data-toggle="tooltip"
                                                title="Giao Tòa Nhà"
                                                onclick="asignmentBuilding(1)"
                                        >
                                            <i class="fa fa-bars fs-5" aria-hidden="true"></i>
                                        </button>
                                        <button
                                                class="btn btn-xs btn-info"
                                                data-toggle="tooltip"
                                                title="Edit Tòa Nhà"
                                        >
                                            <i
                                                    class="ace-icon fa fa-pencil-square-o fs-5"
                                                    aria-hidden="true"
                                                    onclick="navigateToEdit()"
                                            ></i>
                                        </button>
                                    </div>

                                    <div class="hidden-md hidden-lg">
                                        <div class="inline pos-rel">
                                            <button
                                                    class="btn btn-minier btn-primary dropdown-toggle"
                                                    data-toggle="dropdown"
                                                    data-position="auto"
                                            >
                                                <i
                                                        class="ace-icon fa fa-cog icon-only bigger-110"
                                                ></i>
                                            </button>

                                            <ul
                                                    class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close"
                                            >
                                                <li>
                                                    <a
                                                            href="#"
                                                            class="tooltip-info"
                                                            data-rel="tooltip"
                                                            title="View"
                                                    >
                                  <span class="blue">
                                    <i
                                            class="ace-icon fa fa-search-plus bigger-120"
                                    ></i>
                                  </span>
                                                    </a>
                                                </li>

                                                <li>
                                                    <a
                                                            href="#"
                                                            class="tooltip-success"
                                                            data-rel="tooltip"
                                                            title="Edit"
                                                    >
                                  <span class="green">
                                    <i
                                            class="ace-icon fa fa-pencil-square-o bigger-120"
                                    ></i>
                                  </span>
                                                    </a>
                                                </li>

                                                <li>
                                                    <a
                                                            href="#"
                                                            class="tooltip-error"
                                                            data-rel="tooltip"
                                                            title="Delete"
                                                    >
                                  <span class="red">
                                    <i
                                            class="ace-icon fa fa-trash-o bigger-120"
                                    ></i>
                                  </span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- /.row -->
    </div>
</div>
<div class="modal fade" id="assignmentBuildingModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button
                        type="button"
                        class="close"
                        data-dismiss="modal"
                        aria-label="Close"
                >
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    Danh Sách Nhân Viên
                </h4>
            </div>

            <div class="modal-body">
                <div class="row">
                    <div class="col-xs-12">
                        <table
                                id="stafflist"
                                class="table table-striped table-bordered table-hover"
                        >
                            <thead>
                            <tr>
                                <th class="center">Chọn Nhân Viên</th>
                                <th>Tên Nhân Viên</th>
                            </tr>
                            </thead>

                            <tbody>
<%--                            <tr>--%>
<%--                                <td class="center">--%>
<%--                                    <label class="pos-rel">--%>
<%--                                        <input--%>
<%--                                                type="checkbox"--%>
<%--                                                class="ace"--%>
<%--                                                id="checkbox_1"--%>
<%--                                                value="1"--%>
<%--                                        />--%>
<%--                                        <span class="lbl"></span>--%>
<%--                                    </label>--%>
<%--                                </td>--%>
<%--                                <td>Nguyen Van A</td>--%>
<%--                            </tr>--%>
<%--                            <tr>--%>
<%--                                <td class="center">--%>
<%--                                    <label class="pos-rel">--%>
<%--                                        <input--%>
<%--                                                type="checkbox"--%>
<%--                                                class="ace"--%>
<%--                                                id="checkbox_2"--%>
<%--                                                value="2"--%>
<%--                                                checked--%>
<%--                                        />--%>
<%--                                        <span class="lbl"></span>--%>
<%--                                    </label>--%>
<%--                                </td>--%>
<%--                                <td>Nguyen Van B</td>--%>
<%--                            </tr>--%>
<%--                            <tr>--%>
<%--                                <td class="center">--%>
<%--                                    <label class="pos-rel">--%>
<%--                                        <input--%>
<%--                                                type="checkbox"--%>
<%--                                                class="ace"--%>
<%--                                                id="checkbox_3"--%>
<%--                                                value="3"--%>
<%--                                        />--%>
<%--                                        <span class="lbl"></span>--%>
<%--                                    </label>--%>
<%--                                </td>--%>
<%--                                <td>Nguyen Van C</td>--%>
<%--                            </tr>--%>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.span -->
                </div>
                <!-- /.row -->
            </div>

            <div class="modal-footer">
                <button
                        type="button"
                        class="btn btn-default"
                        data-dismiss="modal"
                >
                    Đóng
                </button>
                <button
                        type="button"
                        class="btn btn-primary"
                        id="btnAssignBuilding"
                >
                    Giao Tòa Nhà
                </button>
            </div>
        </div>
    </div>
</div>
<script>
    let crrBuildingId = null;
    const asignmentBuilding = (buildingid) => {
        crrBuildingId = buildingid;
        loadStaff();
        openModalAssignmentBuilding();
    };

    const loadStaff = () => {
        $.ajax({
            type: "GET",
            url: "${buildingControllerOfAdmin}/1/staff",
            // data: JSON.stringify(data),
            // dataType: "json",
            contentType: "application/json",
            success: (response) => {
                console.log(response);
                var row = '';
                $.each(response, (index, user) => {
                    row += '<tr>'
                    row += ' <td className="center"> <label className="pos-rel"> <input type="checkbox" className="ace" id="checkbox_"'+user.id+' value='+user.id+' '+user.checked+'  />  <span className="lbl"></span>  </label>  </td>'
                    row += '           <td>'+user.fullName+'</td>'
                    row += '</tr>'
                });

                $(`#stafflist tbody`).html(row);
            },

            error: (error) => {
                console.log(error);
            },
        });
    }

    const openModalAssignmentBuilding = () => {
        $(`#assignmentBuildingModal`).modal();
    };

    const navigateToEdit = () => {
        window.location.href = "building-edit";
    };

    $(`#btnAssignBuilding`).click(function (e) {
        e.preventDefault();
        var data = {};
        var buildingid = crrBuildingId;
        // staffid
        var staffid = $(`#stafflist`)
            .find(`tbody input[type=checkbox]`)
            .map(function () {
                return $(this).val();
            })
            .get();
        data = {
            buildingid: buildingid,
            staffid: staffid,
        };
        assignStaff(data);
    });

    const assignStaff = (data) => {
        $.ajax({
            type: "POST",
            url: "/building/add",
            data: JSON.stringify(data),
            dataType: "json",
            contentType: "application/json",
            success: (response) => {
                console.log(response);
            },
            error: (error) => {
                console.log(error);
            },
        });
    };

    const deleteBuilding = (buildingids) => {
        $.ajax({
            type: "DELETE",
            url: "http://localhost:8081/api-building",
            data: JSON.stringify(buildingids),
            dataType: "json",
            contentType: "application/json",
            success: (response) => {
                console.log(response);
            },
            error: (error) => {
                console.log(error);
            },
        });
    }

    $(`#btn-search`).click((e) => {
        e.preventDefault();
        $("#listForm").submit();
    })
</script>
</body>
</html>
