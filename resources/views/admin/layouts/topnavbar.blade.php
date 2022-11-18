<div class="page-header navbar navbar-fixed-top" style="background-color: #02718f;">
    <div class="page-header-inner ">
        <!-- logo start -->
        <div class="page-logo">

            <a>
                <span style="display: flex;align-items: end;"><img
                        src="{{ app_logo() ?? asset('images/email/logo.svg') }}" style="width: 26px;padding-right: 5px;"
                        alt="logo">{{ app_name() ?? 'Tagxi' }}</span>
            </a>
        </div>
        <!-- logo end -->
        <ul class="nav navbar-nav navbar-left in">
            <li><a href="#" class="menu-toggler sidebar-toggler font-size-23"><i class="fa fa-bars"></i></a>
            </li>
        </ul>
        <ul class="nav navbar-nav navbar-left in">
            <!-- start full screen button -->
            <li><a href="javascript:;" class="fullscreen-click font-size-20"><i class="fa fa-arrows-alt"></i></a></li>
            <!-- end full screen button -->
        </ul>
        <form class="search-form-opened" action="#" method="GET">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Search..." name="query">
                <span class="input-group-btn search-btn">
                    <a href="javascript:;" class="btn submit">
                        <i class="fa fa-search"></i>
                    </a>
                </span>
            </div>
        </form>
        <!-- start mobile menu -->
        <a href="javascript:;" class="menu-toggler responsive-toggler" data-bs-toggle="collapse"
            data-bs-target=".navbar-collapse">
            <span></span>
        </a>
        <!-- end mobile menu -->
        <!-- start header menu -->
        <div class="top-menu">
            <ul class="nav navbar-nav pull-right">
                <!-- start notification dropdown -->
                <li class="dropdown dropdown-extended dropdown-notification" id="header_notification_bar">
                    <a href="javascript:;" class="dropdown-toggle" data-bs-toggle="dropdown" data-hover="dropdown"
                        data-close-others="true">
                        <i class="fa fa-bell-o"></i>
                        <span class="notify"></span>
                        <span class="heartbeat"></span>
                    </a>
                    @php
                    $translations = \DB::table('ltm_translations')->groupBy('locale')->get();
                    @endphp





                    <ul class="dropdown-menu pullDown">
                        <li class="external">
                            <h3><span class="bold">Notifications</span></h3>
                            <span class="notification-label purple-bgcolor">New </span>
                        </li>
                        <li>
                            <ul class="dropdown-menu-list small-slimscroll-style" data-handle-color="#637283">

                                @foreach ($translations as $k => $translation)
                                <a class="{{ $translation->locale == session()->get('applocale') ? 'hover-blue' : '' }} dropdown-item chooseLanguage"
                                    href="#" data-value="{{ $translation->locale  }}">
                                    <li>
                                        {{ ucfirst($translation->locale ) }}
                                    </li>
                                </a>
                                @endforeach

                            </ul>
                            <div class="dropdown-menu-footer">
                                <a href="javascript:void(0)"> All notifications </a>
                            </div>
                        </li>
                    </ul>
                </li>
                <!-- end notification dropdown -->
                <!-- start manage user dropdown -->
                <li class="dropdown dropdown-user">
                    <a href="javascript:;" class="dropdown-toggle" data-bs-toggle="dropdown" data-hover="dropdown"
                        data-close-others="true">

                        <img alt="" class="img-circle "
                            src="{{ auth()->user()->profile_pic ?: asset('/assets/img/user-dummy.svg') }}" />

                    </a>
                    <ul class="dropdown-menu dropdown-menu-default animated jello">
                        <li>
                            <a href="{{ url('admins/profile', auth()->user()->id) }}">
                                <i class="fa fa-user"></i> @lang('pages_names.my_profile') </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa fa-cogs"></i> {{ auth()->user()->name }}
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa fa-envelop"></i> {{ auth()->user()->email }}
                            </a>
                        </li>
                        <li class="divider"> </li>

                        <li>
                            <a href="{{ url('api/spa/logout') }}">
                                <i class="fa fa-power-off"></i> @lang('pages_names.logout') </a>

                        </li>
                    </ul>
                </li>
                <!-- end manage user dropdown -->
                <li class="dropdown dropdown-quick-sidebar-toggler">
                    <a id="headerSettingButton" class="mdl-button mdl-js-button mdl-button--icon pull-right"
                        data-upgraded=",MaterialButton">
                        <i class="fa fa-ellipsis-v py-3"></i>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
