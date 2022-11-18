@extends('admin.layouts.app')

@section('title', 'Users')

@section('content')


<!-- Start Page content -->
<div class="page-content-wrapper">
    <div class="page-content">
        <div class="page-bar">
            <div class="page-title-breadcrumb">
                <div class=" pull-left">
                    <div class="page-title">Dashboard</div>
                </div>
                <ol class="breadcrumb page-breadcrumb pull-right">
                    <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="index.html">Home</a>&nbsp;<i
                            class="fa fa-angle-right"></i>
                    </li>
                    <li class="active">Dashboard</li>
                </ol>
            </div>
        </div>
    {{-- <div class="container-fluid"> --}}

        <div class="row">
            <div class="col-12">
                <div class="box">

                    <div class="box-header with-border">
                        <div class="row text-right">

                            <div class="col-8 col-md-3">
                                <div class="form-group">
                                    <input type="text" name="search" id="search_keyword" class="form-control"
                                        placeholder="@lang('view_pages.enter_keyword')">
                                </div>
                            </div>

                            <div class="col-4 col-md-2 text-left">
                                <button id="search" class="btn btn-success btn-outline btn-sm py-2" type="submit">
                                    @lang('view_pages.search')
                                </button>
                            </div>


                            <div class="col-md-7 text-center text-md-right">
                                <a href="{{ url('users/create') }}" class="btn btn-primary btn-sm">
                                    <i class="mdi mdi-plus-circle mr-2"></i>@lang('view_pages.add_user')</a>
                                <!--  <a class="btn btn-danger">
                                                Export</a> -->
                            </div>
                        </div>
                        <!-- <div class="box-controls pull-right">
                        <div class="lookup lookup-circle lookup-right">
                          <input type="text" name="s">
                        </div>
                      </div> -->

                    </div>

                    <div id="js-user-partial-target">
                        <include-fragment src="users/fetch">
                            <span style="text-align: center;font-weight: bold;"> @lang('view_pages.loading')</span>
                        </include-fragment>
                    </div>


                </div>
            </div>

        </div>
        <!-- container -->
    </div>
</div>
        {{--
    </div> --}}
    <!-- content -->

    <script src="{{ asset('assets/js/fetchdata.min.js') }}"></script>
    <script>
        var search_keyword = '';
            $(function() {
                $('body').on('click', '.pagination a', function(e) {
                    e.preventDefault();
                    var url = $(this).attr('href');
                    $.get(url, $('#search').serialize(), function(data) {
                        $('#js-user-partial-target').html(data);
                    });
                });

                $('#search').on('click', function(e) {
                    e.preventDefault();
                    search_keyword = $('#search_keyword').val();

                    fetch('users/fetch?search=' + search_keyword)
                        .then(response => response.text())
                        .then(html => {
                            document.querySelector('#js-user-partial-target').innerHTML = html
                        });
                });

            });

            $(document).on('click', '.sweet-delete', function(e) {
                e.preventDefault();

                let url = $(this).attr('data-url');


                swal({
                    title: "Are you sure to delete ?",
                    type: "error",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "Delete",
                    cancelButtonText: "No! Keep it",
                    closeOnConfirm: false,
                    closeOnCancel: true
                }, function(isConfirm) {
                    if (isConfirm) {
                        swal.close();

                        $.ajax({
                            url: url,
                            cache: false,
                            success: function(res) {

                                fetch('users/fetch?search=' + search_keyword)
                                    .then(response => response.text())
                                    .then(html => {
                                        document.querySelector('#js-user-partial-target')
                                            .innerHTML = html
                                    });

                                $.toast({
                                    heading: '',
                                    text: res,
                                    position: 'top-right',
                                    loaderBg: '#ff6849',
                                    icon: 'success',
                                    hideAfter: 5000,
                                    stack: 1
                                });
                            }
                        });
                    }
                });
            });

    </script>
    @endsection
