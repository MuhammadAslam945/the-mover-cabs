<!DOCTYPE html>
<html lang="en">
<!-- BEGIN HEAD -->

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta name="description" content="Responsive Admin Template" />
    <meta name="author" content="SmartUniversity" />
    <title>{{ app_name() ?? 'Tagxi' }} - Admin App</title>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <!-- google font -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet" type="text/css" />
    <!-- icons -->
    <link href="{{ asset('assets/admin/css/bootstrap.min.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('assets/admin/css/summernote.css') }}" rel="stylesheet">
    <!-- morris chart -->
    <link href="{{ asset('assets/admin/css/morris.css') }}" rel="stylesheet" type="text/css" />
    <!-- Material Design Lite CSS -->

    <link href="{{ asset('assets/admin/css/animate_page.css') }}" rel="stylesheet">
    <!-- Theme Styles -->
    <link href="{{ asset('assets/admin/css/plugins.min.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('assets/admin/css/style.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('assets/admin/css/responsive.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('assets/admin/css/theme-color.css') }}" rel="stylesheet" type="text/css" />
    <link href="https://api.mapbox.com/mapbox-gl-js/v2.3.1/mapbox-gl.css" rel="stylesheet">
    <!--bootstrap -->
    <link rel="shortcut icon" href="images/favicon.ico" />
    <link rel="stylesheet" href="{{ mix('css/app.css') }}">
    @include('admin.layouts.common_styles')

</head>
<!-- END HEAD -->

<body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white white-sidebar-color logo-white">

    <div class="page-wrapper">
        <!-- start header -->
        @include('admin.layouts.topnavbar')
        <!-- end header -->
        <!-- start page container -->
        <div class="page-container">
            <!-- start sidebar menu -->
            @include('admin.layouts.navigation')
            <!-- end sidebar menu -->
            @include('admin.layouts.common_scripts')
            <!-- start page content -->
            @yield('content')
            <!-- end chat sidebar -->
        </div>
        <!-- end page container -->
        <!-- start footer -->
        @include('admin.layouts.footer')
        <!-- end footer -->
    </div>

    <!-- start js include path -->

    @yield('extra-js')

    <script src="{{ asset('assets/admin/js/jquery.blockui.min.js') }}"></script>
    <script src="{{ asset('assets/admin/js/jquery.slimscroll.min.js') }}"></script>
    <!-- bootstrap -->
    <script src="{{ asset('assets/admin/js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('assets/admin/js/bootstrap.min.js.map') }}"></script>
    <script src="{{ asset('assets/admin/js/jquery.sparkline.min.js') }}"></script>
    <script src="{{ asset('assets/admin/js/sparkline-data.js') }}"></script>
    <!-- Common js-->
    <script src="{{ asset('assets/admin/js/app.js') }}"></script>
    <script src="{{ asset('assets/admin/js/layout.js') }}"></script>
    <script src="{{ asset('assets/admin/js/theme-color.js') }}"></script>
    <!-- material -->
    <script src="{{ asset('assets/admin/js/material.min.js') }}"></script>
    <!-- animation -->
    <script src="{{ asset('assets/admin/js/animations.js') }}"></script>
    <!-- morris chart -->
    <script src="{{ asset('assets/admin/js/morris.min.js') }}"></script>
    <script src="{{ asset('assets/admin/js/raphael-min.js') }}"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <!-- google map -->
    <script src="{{ asset('assets/admin/js/modernizr.min.js') }}"></script>
    <script src="https://use.fontawesome.com/0b84b2eea5.js"></script>



</body>

</html>
