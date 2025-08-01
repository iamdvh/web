<%@include file="/common/taglib.jsp" %>
<c:url var="buildingApi" value="/api/building"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cập nhật toà nhà</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check("breadcrumbs", "fixed");
                } catch (e) {}
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Trang chủ</a>
                </li>
                <li>
                    <a href="building-list.html">Tòa nhà</a>
                </li>
                <li class="active">Chỉnh sửa thông tin tòa nhà</li>
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

            <div>
                <form class="form-horizontal" role="form" id="formEdit">
                    <div class="row">
                        <label class="col-lg-4" for="name">Tên Tòa Nhà</label>
                        <div class="col-lg-8">
                            <input
                                    type="text"
                                    class="form-control"
                                    id="name"
                                    name="name"
                                    value=""
                            />
                        </div>
                    </div>
                    <div class="row my-3">
                        <label class="col-lg-4" for="district">Quận</label>
                        <div class="col-lg-2">
                            <select
                                    class="chosen-select form-control"
                                    id="district"
                                    name="district"
                            >
                                <option value="">Chọn Quận</option>
                                <option value="AL">Alabama</option>
                                <option value="AK">Alaska</option>
                                <option value="AZ">Arizona</option>
                            </select>
                        </div>
                    </div>

                    <div class="row my-3">
                        <label class="col-lg-4" for="ward">Phường</label>
                        <div class="col-lg-8">
                            <input
                                    type="text"
                                    class="form-control"
                                    id="ward"
                                    name="ward"
                            />
                        </div>
                    </div>

                    <div class="row my-3">
                        <label class="col-lg-4" for="street">Đường</label>
                        <div class="col-lg-8">
                            <input
                                    type="text"
                                    class="form-control"
                                    id="street"
                                    name="street"
                            />
                        </div>
                    </div>

                    <div class="row my-3">
                        <label class="col-lg-4" for="structure">Kết Cấu</label>
                        <div class="col-lg-8">
                            <input
                                    type="text"
                                    class="form-control"
                                    id="structure"
                                    name="structure"
                            />
                        </div>
                    </div>

                    <div class="row my-3">
                        <label class="col-lg-4" for="numberOfBasementFloors"
                        >Số Tầng Hầm</label
                        >
                        <div class="col-lg-8">
                            <input
                                    type="text"
                                    class="form-control"
                                    id="numberOfBasementFloors"
                                    name="numberOfBasementFloors"
                            />
                        </div>
                    </div>

                    <div class="row">
                        <label class="col-lg-4" for="orientation">Hướng</label>
                        <div class="col-lg-8">
                            <input
                                    type="text"
                                    class="form-control"
                                    id="orientation"
                                    name="orientation"
                            />
                        </div>
                    </div>

                    <div class="row my-3">
                        <label class="col-lg-4" for="grade">Hạng</label>
                        <div class="col-lg-8">
                            <input
                                    type="text"
                                    class="form-control"
                                    id="grade"
                                    name="grade"
                            />
                        </div>
                    </div>

                    <div class="row my-3">
                        <label class="col-lg-4" for="rentalArea"
                        >Diện Tích Thuê</label
                        >
                        <div class="col-lg-8">
                            <input
                                    type="text"
                                    class="form-control"
                                    id="rentalArea"
                                    name="rentalArea"
                            />
                        </div>
                    </div>

                    <div class="row">
                        <label class="col-lg-4" for="areaDescription"
                        >Mô Tả Diện Tích</label
                        >
                        <div class="col-lg-8">
                    <textarea
                            type="text"
                            rows="3"
                            class="form-control"
                            id="areaDescription"
                            name="areaDescription"
                    ></textarea>
                        </div>
                    </div>

                    <div class="row my-3">
                        <label class="col-lg-4" for="rentalPrice">Giá Thuê</label>
                        <div class="col-lg-8">
                            <input
                                    type="text"
                                    class="form-control"
                                    id="rentalPrice"
                                    name="rentalPrice"
                            />
                        </div>
                    </div>

                    <div class="row">
                        <label class="col-lg-4" for="rentalPriceDescription"
                        >Mô Tả Giá Thuê</label
                        >
                        <div class="col-lg-8">
                    <textarea
                            type="text"
                            rows="3"
                            class="form-control"
                            id="rentalPriceDescription"
                            name="rentalPriceDescription"
                    ></textarea>
                        </div>
                    </div>

                    <div class="row my-3">
                        <label class="col-lg-4" for="serviceFee">Phí Dịch Vụ</label>
                        <div class="col-lg-8">
                            <input
                                    type="text"
                                    class="form-control"
                                    id="serviceFee"
                                    name="serviceFee"
                            />
                        </div>
                    </div>

                    <div class="row">
                        <label class="col-lg-4" for="carFee">Phí Ô Tô</label>
                        <div class="col-lg-8">
                            <input
                                    type="text"
                                    class="form-control"
                                    id="carFee"
                                    name="carFee"
                            />
                        </div>
                    </div>

                    <div class="row my-3">
                        <label class="col-lg-4" for="motobikeFee">Phí Mô Tô</label>
                        <div class="col-lg-8">
                            <input
                                    type="text"
                                    class="form-control"
                                    id="motobikeFee"
                                    name="motobikeFee"
                            />
                        </div>
                    </div>

                    <div class="row my-3">
                        <label class="col-lg-4" for="overtimeFee"
                        >Phí Ngoài Giờ</label
                        >
                        <div class="col-lg-8">
                            <input
                                    type="text"
                                    class="form-control"
                                    id="overtimeFee"
                                    name="overtimeFee"
                            />
                        </div>
                    </div>

                    <div class="row">
                        <label class="col-lg-4" for="electricityFee">Tiền Điện</label>
                        <div class="col-lg-8">
                            <input
                                    type="text"
                                    class="form-control"
                                    id="electricityFee"
                                    name="electricityFee"
                            />
                        </div>
                    </div>

                    <div class="row my-3">
                        <label class="col-lg-4" for="deposit">Đặt Cọc</label>
                        <div class="col-lg-8">
                            <input
                                    type="text"
                                    class="form-control"
                                    id="deposit"
                                    name="deposit"
                            />
                        </div>
                    </div>

                    <div class="row">
                        <label class="col-lg-4" for="payment">Thanh Toán</label>
                        <div class="col-lg-8">
                            <input
                                    type="text"
                                    class="form-control"
                                    id="payment"
                                    name="payment"
                            />
                        </div>
                    </div>

                    <div class="row">
                        <label class="col-lg-4" for="leaseDuration"
                        >Thời Hạn Thuê</label
                        >
                        <div class="col-lg-8">
                            <input
                                    type="text"
                                    class="form-control"
                                    id="leaseDuration"
                                    name="leaseDuration"
                            />
                        </div>
                    </div>

                    <div class="row my-3">
                        <label class="col-lg-4" for="decorationTime"
                        >Thời Gian Trang Trí</label
                        >
                        <div class="col-lg-8">
                            <input
                                    type="text"
                                    class="form-control"
                                    id="decorationTime"
                                    name="decorationTime"
                            />
                        </div>
                    </div>

                    <div class="row my-3">
                        <label class="col-lg-4" for="managerName">Tên Quản Lý</label>
                        <div class="col-lg-8">
                            <input
                                    type="text"
                                    class="form-control"
                                    id="managerName"
                                    name="managerName"
                            />
                        </div>
                    </div>

                    <div class="row my-3">
                        <label class="col-lg-4" for="managerPhoneNumber"
                        >SDT Quản lý</label
                        >
                        <div class="col-lg-8">
                            <input
                                    type="text"
                                    class="form-control"
                                    id="managerPhoneNumber"
                                    name="managerPhoneNumber"
                            />
                        </div>
                    </div>

                    <div class="row my-3">
                        <label class="col-lg-4" for="brokerageFee"
                        >Phí Môi Giới</label
                        >
                        <div class="col-lg-8">
                            <input
                                    type="text"
                                    class="form-control"
                                    id="brokerageFee"
                                    name="brokerageFee"
                            />
                        </div>
                    </div>

                    <div class="row">
                        <label class="col-lg-4" for="notes">Ghi Chú</label>
                        <div class="col-lg-8">
                    <textarea
                            type="text"
                            rows="5"
                            class="form-control"
                            id="notes"
                            name="notes"
                    ></textarea>
                        </div>
                    </div>

                    <div class="row d-flex">
                        <label class="col-lg-4" for="type">Loại Sản phẩm</label>
                        <div class="col-lg-8">
                            <div class="checkbox">
                                <label>
                                    <input
                                            name="buildingTypes"
                                            type="checkbox"
                                            class="ace"
                                            id="buildingTypes"
                                            value="tang-tret"
                                    />
                                    <span class="lbl">Tầng Trệt</span>
                                </label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input
                                            name="buildingTypes"
                                            type="checkbox"
                                            value="nguyen-can"
                                            id="buildingTypes"
                                            class="ace"
                                    />
                                    <span class="lbl">Nguyên Căn</span>
                                </label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input
                                            name="buildingTypes"
                                            type="checkbox"
                                            value="noi-that"
                                            class="ace"
                                            id="buildingTypes"
                                    />
                                    <span class="lbl">Nội Thất</span>
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-5 d-flex justify-content-end">
                        <div class="col-md-3 col-md-9">
                            <button
                                    class="btn btn-info"
                                    id="btnAddBuilding"
                                    type="button"
                            >
                                <i class="ace-icon fa fa-check bigger-110"></i>
                                Thêm Tòa Nhà
                            </button>

                            &nbsp; &nbsp; &nbsp;
                            <button class="btn" type="reset">
                                <i class="ace-icon fa fa-undo bigger-110"></i>
                                Hủy
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    $('#btnAddBuilding').click((e) => {
        e.preventDefault();
        var data = {};
        var formData = $('#formEdit').serializeArray();
        var buildingTypes = [];
        // $.each(formData, function (index, value) {
        //     if (value.name == "buildingTypes") {
        //         buildingTypes.push(value.value);
        //     } else {
        //         data["" + value.name + ""] = value.value;
        //     }
        // });
        // data["buildingType"] = buildingTypes;
        //
        $.each(formData, (index, value) => {
            data[""+value.name+""] = value.value;
        })
        $.ajax({
            type: "POST",
            url: '${buildingApi}',
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
    });
</script>
</body>
</html>
