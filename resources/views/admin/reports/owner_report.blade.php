@extends('admin.layouts.app')

@section('title', 'Owners')

@section('content')
<!-- bootstrap datepicker -->
<link rel="stylesheet"
    href="{!! asset('assets/vendor_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css') !!}">

<style>
    .form-horizontal {
        padding: 2em;
    }
</style>

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
    <div class="row">
        <div class="col-12">
            <div class="box">

                <div class="box-header with-border">
                    <h3>{{ $page }}</h3>
                </div>

                <form method="post" class="form-horizontal" action="{{ url('reports/download') }}">
                    @csrf
                    <input type="hidden" name="model" value="Owner">

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="status">@lang('view_pages.select_status')</label>
                                <select name="status" id="status" class="form-control" required>
                                    <option value="" selected disabled>@lang('view_pages.select_status')</option>
                                    <option value="1">@lang('view_pages.active')</option>
                                    <option value="0">@lang('view_pages.inactive')</option>
                                </select>
                                <span class="text-danger">{{ $errors->first('status') }}</span>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="date_option">@lang('view_pages.date_option')</label>
                                <select name="date_option" id="date_option" class="form-control">
                                    <option value="date">@lang('view_pages.date')</option>
                                    <option value="today">@lang('view_pages.today')</option>
                                    <option value="week">@lang('view_pages.week')</option>
                                    <option value="month">@lang('view_pages.month')</option>
                                    <option value="year">@lang('view_pages.year')</option>
                                </select>
                                <span class="text-danger">{{ $errors->first('date_option') }}</span>
                            </div>
                        </div>

                        <div class="col-md-6 dateDiv">
                            <div class="form-group">
                                <label for="from">@lang('view_pages.from') <span class="text-danger">*</span></label>
                                <input class="form-control datepicker" type="text" id="from" name="from"
                                    value="{{ old('from') }}" required
                                    placeholder="{{ now()->startOfMonth()->format('Y-m-d') }}" autocomplete="off">
                                <span class="text-danger">{{ $errors->first('from') }}</span>
                            </div>
                        </div>

                        <div class="col-md-6 dateDiv">
                            <div class="form-group">
                                <label for="to">@lang('view_pages.to') <span class="text-danger">*</span></label>
                                <input class="form-control datepicker" type="text" id="to" name="to"
                                    value="{{ old('to') }}" required placeholder="{{ now()->format('Y-m-d') }}"
                                    autocomplete="off">
                                <span class="text-danger">{{ $errors->first('to') }}</span>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="format">@lang('view_pages.select_format') <span
                                        class="text-danger">*</span></label>
                                <select name="format" id="format" class="form-control" required>
                                    <option value="" selected disabled>@lang('view_pages.select_format')</option>
                                    @foreach ($formats as $format)
                                    <option value="{{ $format }}">{{ $format }}</option>
                                    @endforeach
                                </select>
                                <span class="text-danger">{{ $errors->first('format') }}</span>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-12">
                            <button class="btn btn-primary btn-sm pull-right submit" type="button">
                                @lang('view_pages.download')
                            </button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<script src="{{ asset('assets/vendor_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js') }}">
</script>

<script>
    //Date picker
        $('.datepicker').datepicker({
            autoclose: true,
            format: 'yyyy-mm-dd',
            endDate: 'today'
        });

        $(document).on('change', '#date_option', function() {
            dateOption();
        });

        $(document).on('click', '.submit', function(e) {

            var validate = validateForm();

            if (validate) {
                let filterColumn = ['status', 'date_option'];
                let query = '?';

                var from = $('#from').val();
                var to = $('#to').val();

                $.each(filterColumn, function(index, value) {
                    var val = $('#' + value).val();

                    if (value == 'date_option') {
                        if (val == 'date') {
                            val = from + '<>' + to;
                        }
                    }

                    if (val != null && val != '') {
                        query += value + '=' + val + '&';
                    }
                });

                let url = '{{ url('reports/download') }}';
                let searchUrl = url + query;

                $.ajax({
                    url: searchUrl,
                    data: $('form').serialize(),
                    method: 'post',
                    success: function(res) {
                        $('form').trigger("reset");
                        dateOption();
                        window.location = res;
                    }
                });
            }
        });

        function validateForm() {
            let validateEle = ['date_option', 'format'];
            var returnVar = true;

            $.each(validateEle, function(i, ele) {
                if (ele == 'date_option') {
                    if ($('#' + ele).val() == 'date') {
                        if ($('#from').val() == '' || $('#from').val() == null) {
                            $('#from').next().text('The Field is required');
                            $('#to').next().text('The Field is required');
                            returnVar = false;
                        } else {
                            $('#from').next().text('');
                            $('#to').next().text('');
                        }
                    } else {
                        $('#from').next().text('');
                        $('#to').next().text('');
                    }
                } else {
                    ele = $('#' + ele);

                    if (ele.val() == '' || ele.val() == null) {
                        ele.next().text('The Field is required');
                        returnVar = false;
                    } else {
                        ele.next().text('');
                    }
                }
            });

            return returnVar;
        }

        function dateOption() {
            var option = $('#date_option').val();

            if (option == 'date') {
                $('.dateDiv').show();
                $('#from').attr('required', true);
                $('#to').attr('required', true);
            } else {
                $('.dateDiv').hide();
                $('#from').attr('required', false);
                $('#to').attr('required', false);
            }
        }

</script>
@endsection
