@extends('admin.layouts.app')

@section('title', 'Owners')

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

                            <div>
                                <strong class="text-danger" style="font-size: 18px;">Note: We are currently working on
                                    this
                                    update, you may get this update soon</strong>
                            </div><br>
                            <div class="row text-right">


                                <div class="col-2">
                                    <div class="form-group">
                                        <input type="text" id="search_keyword" name="search" class="form-control"
                                            placeholder="@lang('view_pages.enter_keyword')">
                                    </div>
                                </div>

                                <div class="col-1">
                                    <button class="btn btn-success btn-outline btn-sm mt-5" type="submit">
                                        @lang('view_pages.search')
                                    </button>
                                </div>

                                <div class="col-9 text-right">
                                    <a href="{{ url('owners/create',$area->id)}}" class="btn btn-primary btn-sm">
                                        <i class="mdi mdi-plus-circle mr-2"></i>@lang('view_pages.add')</a>
                                    <!--  <a class="btn btn-danger">
                                    Export</a> -->
                                </div>
                                <!-- <div class="box-controls pull-right">
                <div class="lookup lookup-circle lookup-right">
                  <input type="text" name="s">
                </div>
              </div> -->
                            </div>



                        </div>

                        <div id="js-project-partial-target">
                            <include-fragment src="fetch/{{$area->id}}">
                                <span style="text-align: center;font-weight: bold;"> @lang('view_pages.loading')</span>
                            </include-fragment>
                        </div>



                    </div>
                </div>
            </div>
        </div>
    </div>
    {{--
</div>--}}
<!-- container -->


<script src="{{asset('assets/vendor_components/jquery/dist/jquery.js')}}"></script>

<script src="{{asset('assets/js/fetchdata.min.js')}}"></script>
<script>
    $(function() {
    $('body').on('click', '.pagination a', function(e) {
    e.preventDefault();
    var url = $(this).attr('href');
    $.get(url, $('#search').serialize(), function(data){
        $('#js-project-partial-target').html(data);
    });
});

$('#search').on('click', function(e){
    e.preventDefault();
        var search_keyword = $('#search_keyword').val();
        console.log(search_keyword);
        fetch('project/fetch?search='+search_keyword)
        .then(response => response.text())
        .then(html=>{
            document.querySelector('#js-project-partial-target').innerHTML = html
        });
});

});
</script>

@endsection
