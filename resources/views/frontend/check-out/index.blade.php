@extends('frontend.layouts.frontend')

@section('content')
    <section id="pm-banner-1" class="custom-css-step">
        <div class="container">
            <div class="card" style="margin-top:40px;">
                <div class="card-header" id="Details" align="center">
                    <h4 style="color: #111570;font-weight: bold">{{__('Check Out Visitor')}}</h4>
                </div>
                <div class="card-body">
                    <div style="margin: 10px;">
                        {!! Form::open(['route' => 'search', 'class' => 'form-horizontal', 'files' => true]) !!}
                        <div class="save">
                            <div class="visitor" id="visitor">
                            <div class="form-group {{ $errors->has('search') ? 'has-error' : ''}}">
                                {!! Html::decode(Form::label('search', "Search by Email / Name", ['class' => 'control-label'])) !!}
                                {!! Form::text('search', null, ['class' => 'form-control input', 'placeholder' => "Enter email or name to search..."]) !!}
                                {!! $errors->first('search', '<p class="text-danger">:message</p>') !!}
                            </div>
                            <div id="search-results"></div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <a href="{{ route('check-in') }}"
                                           class="btn btn-danger float-left text-white">
                                            <i class="fa fa-arrow-left" aria-hidden="true"></i> {{__('Cancel')}}
                                        </a>
                                    </div>
                                    <div class="col-md-6">
                                        <button type="submit" class="btn btn-success float-right" id="continue">
                                            <i class="fa fa-arrow-right" aria-hidden="true"></i> {{__('Continue')}}
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {!! Form::close() !!}
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
@section('scripts')
<script>
        $(document).ready(function () {
            $('.select2').select2();

            // Listen for changes in the search input
            $('#searchInput').on('input', function () {
                // Fetch data based on the search term
                fetchSearchResults($(this).val());
            });

            // Function to fetch search results via AJAX
            function fetchSearchResults(searchTerm) {
                $.ajax({
                    url: "{{ route('search') }}", // Replace with your actual route
                    method: 'POST', // Adjust the HTTP method if needed
                    data: {
                        search: searchTerm
                    },
                    success: function (data) {
                        // Display the fetched data in the #search-results div
                        $('#search-results').html(data);
                    },
                    error: function (error) {
                        console.error('Error fetching search results:', error);
                    }
                });
            }
        });
    </script>
@endsection
