@php


if(str_contains((string)request()->path(),'translations')){
$main_menu = 'settings';
$sub_menu = 'translations';
}
@endphp


<div class="sidebar-container" style="background-color: #02718f;">
    <div class="sidemenu-container navbar-collapse collapse fixed-menu" style="background-color: #02718f;">
        <div id="remove-scroll">
            <ul class="sidemenu page-header-fixed p-t-20" data-keep-expanded="false" data-auto-scroll="true"
                data-slide-speed="200">
                <li class="sidebar-toggler-wrapper hide">
                    <div class="sidebar-toggler">
                        <span></span>
                    </div>
                </li>
                @if(auth()->user()->can('access-dashboard'))
                <li class="nav-item ">
                    <a href="{{url('/dashboard')}}" class="nav-link">
                        <i class="fa fa-tachometer"></i>
                        <span class="title">@lang('pages_names.dashboard')</span>
                    </a>
                </li>
                @endif
                @if(auth()->user()->can('access-dashboard') && env('APP_FOR')=='demo1')
                <li class="nav-item  {{'admin_dashboard' == $main_menu ? 'active' : '' }}">
                    <a href="{{url('/admin_dashboard')}}">
                        <i class="fa fa-tachometer"></i> <span>@lang('pages_names.admin-dashboard')</span>
                    </a>
                </li>
                <li class=" nav-item {{'driver_profile_dashboard' == $main_menu ? 'active' : '' }}">
                    <a href="{{url('/driver_profile_dashboard')}}">
                        <i class="fa fa-tachometer"></i> <span>Driver profile Dashboard</span>
                    </a>
                </li>
                @endif

                @if(auth()->user()->can('view-settings'))
                <li class="nav-item">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="fa fa-cog"></i>
                        <span class="title">@lang('pages_names.settings')</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        @if(auth()->user()->can('get-all-roles'))
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/roles')}}">
                                <span class="title">@lang('pages_names.roles')</span>
                            </a>
                        </li>
                        @endif
                        @if(auth()->user()->can('view-system-settings'))
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/system/settings')}}">
                                <span class="title">@lang('pages_names.system_settings')</span>
                            </a>
                        </li>
                        @endif
                        <!-- @if(auth()->user()->can('view-system-settings'))
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/translations')}}">
                                <span class="title">@lang('pages_names.translations')</span>
                            </a>
                        </li>
                        @endif -->
                    </ul>
                </li>
                @endif
                @if(auth()->user()->can('master-data'))
                <li class="nav-item">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="fa fa-code-fork"></i>
                        <span class="title">@lang('pages_names.master')</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        @if(auth()->user()->can('manage-carmake'))
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/carmake')}}">
                                <span class="title">@lang('pages_names.carmake')</span>
                            </a>
                        </li>
                        @endif
                        @if(auth()->user()->can('manage-carmodel'))
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/carmodel')}}">
                                <span class="title">@lang('pages_names.carmodel')</span>
                            </a>
                        </li>
                        @endif
                        @if(auth()->user()->can('manage-needed-document'))
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/needed_doc')}}">
                                <span class="title">@lang('pages_names.needed_doc')</span>
                            </a>
                        </li>
                        @endif
                        @if(auth()->user()->can('manage-owner-needed-document'))
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/owner_needed_doc')}}">
                                <span class="title">@lang('pages_names.owner_needed_doc')</span>
                            </a>
                        </li>
                        @endif
                        @if(auth()->user()->can('manage-fleet-needed-document'))
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/fleet_needed_doc')}}">
                                <span class="title">@lang('pages_names.fleet_needed_doc')</span>
                            </a>
                        </li>
                        @endif
                        @if(auth()->user()->can('package-type'))
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/package_type')}}">
                                <span class="title">@lang('pages_names.package_type')</span>
                            </a>
                        </li>
                        @endif
                    </ul>
                </li>
                @endif
                @if(auth()->user()->can('service_location'))
                <li class="nav-item">
                    <a class="nav-link" href="{{url('/service_location')}}">
                        <i class="fa fa-map-marker"></i> <span>@lang('pages_names.service_location')</span>
                    </a>
                </li>
                @endif
                @if(auth()->user()->can('manage-fleet'))
                <li class="nav-item">
                    <a  class="nav-link" href="{{ route('viewFleet') }}">
                        <i class="fa fa-bus"></i> <span>{{ trans('pages_names.manage_fleet') }}</span>
                    </a>
                </li>
                @endif

                @if(auth()->user()->can('admin'))
                <li class="nav-item">
                    <a  class="nav-link" href="{{url('/admins')}}">
                        <i class="fa fa-user-circle-o"></i> <span>@lang('pages_names.admins')</span>
                    </a>
                </li>
                @endif

                @php
                $areas = App\Models\Admin\ServiceLocation::companyKey()->active(true)->get();
                @endphp

                @if(auth()->user()->can('manage-owner'))
                <li class="nav-item">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="fa fa-code-fork"></i>
                        <span class="title">@lang('pages_names.owners')</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        @foreach ($areas as $item)
                        <li class="nav-item" data-id="{{ $item->id }}">
                            <a href="{{url('/owners/by_area',$item->id)}}">
                             <span class="title">{{ucfirst($item->name) }}</span>
                            </a>
                        </li>
                        @endforeach
                    </ul>
                </li>
                @endif
                @if(auth()->user()->can('view-requests'))
                <li class="nav-item">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="fa fa-map"></i>
                        <span class="title">@lang('pages_names.request')</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/requests')}}">
                                <span class="title">@lang('pages_names.rides')</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/scheduled-rides')}}">
                                <span class="title">@lang('pages_names.scheduled_rides')</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/cancellation-rides')}}">
                                <span class="title">@lang('pages_names.cancellation_rides')</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link ">
                                <span class="title">Route Map</span>
                            </a>
                        </li>
                    </ul>
                </li>
                @endif
                @if(auth()->user()->can('view-types'))
                <li class="nav-item">
                    <a href="{{url('/types')}}" class="nav-link">
                        <i class="fa fa-taxi "></i>
                    <span class="title">@lang('pages_names.types')</span>
                    </a>
                </li>
                @endif
                @if(auth()->user()->can('map-menu'))
                <li class="nav-item">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="fa fa-map"></i>
                        <span class="title">@lang('pages_names.map')</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        @if(auth()->user()->can('view-zone'))
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/zone')}}">
                                <span class="title">@lang('pages_names.zone')</span>
                            </a>
                        </li>
                        @endif
                        @if(auth()->user()->can('list-airports'))
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/airport')}}">
                                <span class="title">@lang('pages_names.airport')</span>
                            </a>
                        </li>
                        @endif
                    </ul>
                </li>
                @endif
                @if(auth()->user()->can('drivers-menu'))
                @if (auth()->user()->hasRole('owner'))
                @php
                $route = 'company/drivers';
                @endphp
                @else
                @php
                $route = 'drivers';
                @endphp
                @endif
                <li class="nav-item">
                    <a class="nav-link nav-toggle">
                        <i class="fa fa-users"></i>
                        <span class="title">@lang('pages_names.drivers') </span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        @if(auth()->user()->can('view-drivers'))
                        <li class="nav-item">
                            <a class="nav-link " href="{{url($route)}}">
                                <span class="title">@lang('pages_names.approved_drivers')</span>
                            </a>
                        </li>
                        @endif
                        @if(auth()->user()->can('view-drivers'))
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/drivers/waiting-for-approval')}}">
                                <span class="title">@lang('pages_names.pending_approvals')</span>
                            </a>
                        </li>
                        @endif
                        @if(auth()->user()->can('view-drivers'))
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/driver-ratings')}}">
                                <span class="title">@lang('pages_names.driver_ratings')</span>
                            </a>
                        </li>
                        @endif
                        @if(auth()->user()->can('view-drivers'))
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/withdrawal-requests-lists')}}">
                                <span class="title">@lang('pages_names.withdrawal_requests')</span>
                            </a>
                        </li>
                        @endif
                        @if(auth()->user()->can('view-drivers'))
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('withdrawal-requests-lists/negative_balance_drivers')}}">
                                <span class="title">@lang('pages_names.negative_balance_drivers')</span>
                            </a>
                        </li>
                        @endif
                    </ul>
                </li>
                @endif
                @if(auth()->user()->can('fleet-drivers-menu'))
                @if (auth()->user()->hasRole('owner'))
                @php
                $route = 'company/drivers';
                @endphp
                @else
                @php
                $route = 'fleet-drivers';
                @endphp
                @endif
                <li class="nav-item">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="fa fa-users"></i>
                        <span class="title"> @lang('pages_names.fleet_drivers') </span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        @if(auth()->user()->can('view-fleet-drivers'))
                        <li class="nav-item">
                            <a class="nav-link " href="{{url($route)}}">
                                <span class="title">@lang('pages_names.approved_fleet_drivers')</span>
                            </a>
                        </li>
                        @endif
                        @if(auth()->user()->can('view-fleet-drivers'))
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/fleet-drivers/waiting-for-approval')}}">
                                <span class="title">@lang('pages_names.pending_approvals')</span>
                            </a>
                        </li>
                        @endif
                    </ul>
                </li>
                @endif
                @if(auth()->user()->can('user-menu'))
                <li class="nav-item">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="fa fa-user"></i>
                        <span class="title">@lang('pages_names.users') </span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        @if(auth()->user()->can('view-users'))
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/users')}}">
                                <span class="title">@lang('pages_names.user_details')</span>
                            </a>
                        </li>
                        @endif
                    </ul>
                </li>
                @endif
                @if(auth()->user()->can('view-sos'))
                <li class="nav-item">
                    <a href="{{url('/sos')}}" class="nav-link">
                        <i class="fa fa-heartbeat"></i> <span>@lang('pages_names.emergency_number')</span>
                    </a>
                </li>
                @endif
                @if(auth()->user()->can('manage-promo'))
                <li class="nav-item">
                    <a href="{{url('/promo')}}" class="nav-link">
                        <i class="fa fa-gift"></i> <span>@lang('pages_names.promo_codes')</span>
                    </a>
                </li>
                @endif
                @if(auth()->user()->can('complaint-title'))
                <li class="nav-item">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="fa fa-paper-plane"></i>
                        <span class="title">@lang('pages_names.notifications')</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        @if(auth()->user()->can('complaint-title'))
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/notifications/push')}}">
                                <span class="title">@lang('pages_names.push_notification')</span>
                            </a>
                        </li>
                        @endif
                    </ul>
                </li>
                @endif
                @if(auth()->user()->can('cancellation-title'))
                <li class="nav-item">
                    <a href="{{url('/cancellation')}}" class="nav-link">
                        <i class="fa fa-ban"></i> <span>@lang('pages_names.cancellation')</span>
                    </a>
                </li>
                @endif
                @if(auth()->user()->can('complaint-title'))
                <li class="nav-item">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="fa fa-list-alt"></i>
                        <span class="title">@lang('pages_names.complaints')</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        @if(auth()->user()->can('complaint-title'))
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/complaint/title')}}">
                                <span class="title">@lang('pages_names.complaint_title')</span>
                            </a>
                        </li>
                        @endif
                        @if(auth()->user()->can('user-complaint'))
                        <li class="nav-item">
                            <a class="nav-link nav-toggle">
                                <i class="fa fa-circle-thin"></i>
                                <span> @lang('pages_names.user_complaints') </span>
                                <span class="arrow"></span>
                            </a>
                            <ul class="sub-menu">
                               <li class="nav-item">
                                <a href="{{url('/complaint/users/general')}}" class="nav-link">
                                 <span>@lang('pages_names.general_complaints')</span>
                                </a>
                               </li>
                               <li class="nav-item">
                                <a href="{{url('/complaint/users/request')}}" class="nav-link">
                                 <span>@lang('pages_names.request_complaints')</span>
                                </a>
                               </li>
                            </ul>
                        </li>
                        @endif
                        @if(auth()->user()->can('driver-complaint'))
                        <li class="nav-item">
                            <a class="nav-link nav-toggle">
                                <i class="fa fa-circle-thin"></i>
                                <span> @lang('pages_names.driver_complaints') </span>
                                <span class="arrow"></span>
                            </a>
                            <ul class="sub-menu">
                               <li class="nav-item">
                                <a  href="{{url('/complaint/drivers/general')}}" class="nav-link">
                                 <span>@lang('pages_names.general_complaints')</span>
                                </a>
                               </li>
                               <li class="nav-item">
                                <a href="{{url('/complaint/drivers/request')}}" class="nav-link">
                                 <span>@lang('pages_names.request_complaints')</span>
                                </a>
                               </li>
                            </ul>
                        </li>
                        @endif
                        @if(auth()->user()->can('owner-complaint'))
                        <li class="nav-item">
                            <a class="nav-link nav-toggle">
                                <i class="fa fa-circle-thin"></i>
                                <span> @lang('pages_names.owner_complaints')</span>
                                <span class="arrow"></span>
                            </a>
                            <ul class="sub-menu">
                               <li class="nav-item">
                                <a  href="{{url('/complaint/owner/general')}}" class="nav-link">
                                 <span>@lang('pages_names.general_complaints')</span>
                                </a>
                               </li>
                               <li class="nav-item">
                                <a href="{{url('/complaint/owner/request')}}" class="nav-link">
                                 <span>@lang('pages_names.request_complaints')</span>
                                </a>
                               </li>
                            </ul>
                        </li>
                        @endif
                    </ul>
                </li>
                @endif
                @if(auth()->user()->can('reports'))
                <li class="nav-item">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="fa fa-file-pdf-o"></i>
                        <span class="title">@lang('pages_names.reports') </span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        @if(auth()->user()->can('user-report'))
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/reports/user')}}">
                                <span class="title">@lang('pages_names.user_report')</span>
                            </a>
                        </li>
                        @endif
                        @if(auth()->user()->can('driver-report'))
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/reports/driver')}}">
                                <span class="title">@lang('pages_names.driver_report')</span>
                            </a>
                        </li>
                        @endif
                        @if(auth()->user()->can('driver-report'))
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/reports/driver-duties')}}">
                                <span class="title">@lang('pages_names.driver_duties_report')</span>
                            </a>
                        </li>
                        @endif
                        @if(auth()->user()->can('owner-report'))
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/reports/owner')}}">
                                <span class="title">@lang('pages_names.owner_report')</span>
                            </a>
                        </li>
                        @endif
                        @if(auth()->user()->can('finance-report'))
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/reports/travel')}}">
                                <span class="title">@lang('pages_names.finance_report')</span>
                            </a>
                        </li>
                        @endif
                    </ul>
                </li>
                @endif
                @if(auth()->user()->can('manage-map'))
                <li class="nav-item">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="fa fa-globe"></i>
                        <span class="title">@lang('pages_names.manage-map')</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        @if(auth()->user()->can('heat-map'))
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('map/heatmap')}}">
                                <span class="title">@lang('pages_names.heat_map')</span>
                            </a>
                        </li>
                        @endif
                        @if(auth()->user()->can('heat-map'))
                        <li class="nav-item">
                            <a class="nav-link " href="{{route('mapView')}}">
                                <span class="title">@lang('pages_names.map_view')</span>
                            </a>
                        </li>
                        @endif
                    </ul>
                </li>
                @endif
                @if(auth()->user()->can('manage-faq'))
                <li class="nav-item">
                    <a href="{{url('/faq')}}" class="nav-link">
                        <i class="fa fa-question-circle"></i> <span>@lang('pages_names.faq')</span>
                    </a>
                </li>
                @endif
                @if(auth()->user())
                <li class="nav-item">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="fa fa-file-pdf-o"></i>
                        <span class="title">CMS</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/cms/frontpagecms')}}">
                                <span class="title">Home Page CMS</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/cms/safetypagecms')}}">
                                <span class="title">Safety Page CMS</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/cms/servicepage')}}">
                                <span class="title">Serviceas Page CMS</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/cms/privacypagecms')}}">
                                <span class="title">Privacy Page CMS</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/cms/dmvpagecms')}}">
                                <span class="title">DMV Page CMS</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/cms/complaincepagecms')}}">
                                <span class="title">Complaince Page CMS</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/cms/termspagecms')}}">
                                <span class="title">Terms Page CMS</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/cms/drreqpagecms')}}">
                                <span class="title">Driver Req Page CMS</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/cms/applydriverpagecms')}}">
                                <span class="title">Apply Drive</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/cms/howdriverpagecms')}}">
                                <span class="title">How Its Work Page CMS</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/cms/contactpagecms')}}">
                                <span class="title">Contact Us CMS</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/cms/playstorepagecms')}}">
                                <span class="title">Play Store Link Page CMS</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/cms/footerpagecms')}}">
                                <span class="title">Footer Page CMS</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/cms/colorthemepagecms')}}">
                                <span class="title">Color Theme Page CMS</span>
                            </a>
                        </li>
                    </ul>
                </li>
                @endif
               @if(auth()->user()->can('view-companies'))
                <li class="nav-item">
                    <a href="{{url('/company')}}" class="nav-link">
                        <i class="fa fa-building"></i> <span>@lang('pages_names.company')</span>
                    </a>
                </li>
                @endif
                @if(access()->hasRole('super-admin'))
                <li class="nav-item">
                    <a href="{{url('/project')}}" class="nav-link">
                        <i class="fa fa-file"></i> <span>@lang('pages_names.project')</span>
                    </a>
                </li>
                @endif
                @if(access()->hasRole('super-admin'))
                 <li class="nav-item">
                    <a href="{{url('/developer')}}" class="nav-link">
                        <i class="fa fa-users"></i> <span>@lang('pages_names.developers')</span>
                    </a>
                 </li>
                 @endif
                 @if(auth()->user()->can('view-builds'))
                <li class="nav-item">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="fa fa-share"></i>
                        <span class="title">Builds</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        @if(auth()->user()->can('view-builds'))
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('builds/projects')}}">
                                <span class="title">Build Lists</span>
                            </a>
                        </li>
                        @endif
                        @if(auth()->user()->can('upload-builds'))
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('/builds/create')}}">
                                <span class="title">Upload Builds</span>
                            </a>
                        </li>
                        @endif
                    </ul>
                </li>
                @endif

            </ul>
        </div>
    </div>
</div>
