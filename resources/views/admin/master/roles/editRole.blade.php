@extends('admin.layouts.app')

@section('title', 'Main page')

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
<!-- Start Page content -->
<div class="content">
    <div class="container-fluid">

        <div class="row">
            <div class="col-sm-12">
                <div class="box">
                    <div class="box-header with-border">

                        <a href="{{ url('roles') }}">
                            <button class="btn btn-danger btn-sm pull-right" type="submit">
                                <i class="mdi mdi-keyboard-backspace mr-2"></i>
                                @lang('view_pages.back')
                            </button>
                        </a>
                    </div>
                    <div class="mb-3">
                        <form method="post" class="form-horizontal" action="{{url('roles/update',$role->id)}}">
                            {{csrf_field()}}
                            <div class="form-group m-b-25">
                                <div class="col-12">
                                    <label for="name">@lang('view_pages.name')</label>
                                    <input class="form-control" type="text" id="name" name="name"
                                        value="{{old('name',$role->name)}}" required=""
                                        placeholder="@lang('view_pages.enter_role')">
                                    <span class="text-danger">{{ $errors->first('name') }}</span>

                                </div>
                            </div>

                            <div class="form-group m-b-25">
                                <div class="col-12">
                                    <label for="name">@lang('view_pages.slug')</label>
                                    <input class="form-control" type="text" id="slug" name="slug"
                                        value="{{old('slug',$role->slug)}}" required=""
                                        placeholder="@lang('view_pages.enter_role_slug')">
                                    <span class="text-danger">{{ $errors->first('slug') }}</span>

                                </div>
                            </div>

                            <div class="form-group m-b-25">
                                <div class="col-12">
                                    <label for="name">@lang('view_pages.description')</label>
                                    <input class="form-control" type="text" id="description" name="description"
                                        value="{{old('description',$role->description)}}" required=""
                                        placeholder="@lang('view_pages.enter_description')">
                                    <span class="text-danger">{{ $errors->first('description') }}</span>

                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-12">
                                    <button class="btn btn-primary pull-right mb-2" type="submit">
                                        @lang('view_pages.update')
                                    </button>
                                </div>
                            </div>

                        </form>

                    </div>
                </div>


            </div>
        </div>
    </div>

</div>
<!-- container -->
</div>
</div>
<!-- content -->

@endsection
