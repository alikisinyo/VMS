@extends('admin.layouts.master')

@section('main-content')
  
  <section class="section">
        <div class="section-header">
            <h1>{{ __('Administrators') }}</h1>
            {{ Breadcrumbs::render('administrators') }}
        </div>

        <div class="section-body">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        @can('adminusers_create')
                            <div class="card-header">
                                <a href="{{ route('admin.adminusers.create') }}" class="btn btn-icon icon-left btn-primary"><i class="fas fa-plus"></i> {{ __('Add Administrator') }}</a>
                            </div>
                        @endcan
                        <div class="card-body">
                            @if(session('newUser'))
                                <div class="alert alert-success">
                                    New User Created: {{ session('newUser')->first_name }} {{ session('newUser')->last_name }}
                                </div>
                            @endif
                            <div class="table-responsive">
                                <table class="table table-striped" id="maintable" data-url="{{ route('admin.adminusers.get-adminusers') }}" data-hidecolumn="{{ auth()->user()->can('adminusers_show') || auth()->user()->can('adminusers_edit') || auth()->user()->can('adminusers_delete') }}">
                                    <thead>
                                        <tr>
                                            <th>{{ __('ID') }}</th>
                                            <th>{{ __('Image') }}</th>
                                            <th>{{ __('Name') }}</th>
                                            <th>{{ __('Email') }}</th>
                                            <th>{{ __('Phone') }}</th>
                                            <th>{{ __('Actions') }}</th>
                                        </tr>
                                    </thead>
                                </table>
                            </div>

                            @if(isset($createdUsers) && count($createdUsers) > 0)
                                <div class="mt-4">
                                    <h5>Recently Created Users:</h5>
                                    <ul>
                                        @foreach($createdUsers as $user)
                                            <li>{{ $user->first_name }} {{ $user->last_name }} - {{ $user->email }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@section('css')
    <link rel="stylesheet" href="{{ asset('assets/modules/datatables.net-bs4/css/dataTables.bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/modules/datatables.net-select-bs4/css/select.bootstrap4.min.css') }}">
@endsection

@section('scripts')
    <script src="{{ asset('assets/modules/datatables/media/js/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('assets/modules/datatables.net-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('assets/modules/datatables.net-select-bs4/js/select.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('js/adminuser/index.js') }}"></script>
@endsection
