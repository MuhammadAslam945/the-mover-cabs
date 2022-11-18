@extends('admin.layouts.app')

@section('title', 'Fleet Document')

@section('content')

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
    <div class="row">
        <div class="col-12">
            <div class="box">
                <div class="box-header with-border">
                    <div class="row text-right">
                        {{-- <div class="col-2">
                            <div class="form-group">
                                <input type="text" id="search_keyword" name="search" class="form-control"
                                    placeholder="Enter keyword">
                            </div>
                        </div>

                        <div class="col-1">
                            <button class="btn btn-success btn-outline btn-sm mt-5" type="submit">
                                @lang('view_pages.search')
                            </button>
                        </div> --}}

                        <div class="col-12 text-right">
                            <a href="{{url('fleet_needed_doc/create')}}" class="btn btn-primary btn-sm">
                                <i class="mdi mdi-plus-circle mr-2"></i>@lang('view_pages.add_fleet_needed_doc')</a>
                        </div>
                    </div>
                </div>

                <div id="js-needed_doc-partial-target">
                    <include-fragment src="fleet_needed_doc/fetch">
                        <span style="text-align: center;font-weight: bold;">@lang('view_pages.loading')</span>
                    </include-fragment>
                </div>

            </div>
        </div>
    </div>
    </div>
</div>
    <script src="{{asset('assets/js/fetchdata.min.js')}}"></script>
    <script>
        $(function() {
    $('body').on('click', '.pagination a', function(e) {
        e.preventDefault();
        var url = $(this).attr('href');
        $.get(url, $('#search').serialize(), function(data){
            $('#js-fleet-needed_doc-partial-target').html(data);
        });
    });

    $('#search').on('click', function(e){
        e.preventDefault();
            var search_keyword = $('#search_keyword').val();
            console.log(search_keyword);
            fetch('fleet_needed_doc/fetch?search='+search_keyword)
            .then(response => response.text())
            .then(html=>{
                document.querySelector('#js-fleet-needed_doc-partial-target').innerHTML = html
            });
    });

});
    </script>
    @endsection
