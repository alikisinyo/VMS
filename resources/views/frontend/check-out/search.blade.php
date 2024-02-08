@extends('frontend.layouts.frontend')

@section('content')
    <section id="pm-banner-1" class="custom-css-step">
        <div class="container">
            <div class="card" style="margin-top: 40px;">
                <div class="card-header" id="Details" align="center">
                    <h4 style="color: #111570; font-weight: bold">{{ __('Check Out Visitor') }}</h4>
                </div>
                <div class="card-body">
                    <div style="margin: 10px;">
                        {!! Form::open(['route' => 'fetchSearchResults', 'class' => 'form-horizontal', 'files' => true, 'id' => 'search-form']) !!}
                            <div class="save">
                                <div class="visitor" id="visitor">
                                    <div class="form-group {{ $errors->has('search') ? 'has-error' : ''}}">
                                        {!! Html::decode(Form::label('search', "Search by Email / Name", ['class' => 'control-label'])) !!}
                                        {!! Form::text('search', null, ['class' => 'form-control input', 'placeholder' => "Enter email or name to search...", 'id' => 'search']) !!}
                                        {!! $errors->first('search', '<p class="text-danger">:message</p>') !!}
                                    </div>
                                </div>

                                <div id="search-results">
                                    <!-- Results will be displayed here -->
                                    @if ($results->count() > 0)
                                        <div class="col-12 col-md-8 col-lg-12">
                                            <h2> Visitor Details</h2>
                                            <div class="card">
                                                                                        <div class="card-body">
                                                <div class="profile-desc">
                                                    @foreach($results as $result)
                                                    <div class="single-profile">
                                                        <p><b>{{ __('Name') }}: </b> {{ $result->first_name }} {{ $result->last_name }}</p>
                                                        <p><b>{{ __('Company') }}: </b> {{ $result->company_name }}</p>
                                                        <p><b>{{ __('Purpose') }}: </b> {{ $result->purpose }}</p>
                                                        <p><b>{{ __('Time_in') }}: </b> {{ $result->time_in }}</p>
                                                        <p><b>{{ __('Date') }}: </b> {{ date('d-m-Y', strtotime($result->created_at)) }}</p>
                                                        <p><b>{{ __('Checkin') }}: </b> {{ date('d-m-Y h:i A', strtotime($result->checkin_at)) }}</p>
                                                        <!-- Add other details here -->
                                                    </div>
                                                    @endforeach
                                                </div>
                                            </div>

                                            </div>
                                        </div>
                                    @else
                                        <p>No visitor found with the given search term.</p>
                                    @endif
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-6">
                                        <a href="{{ route('check-in') }}" class="btn btn-danger float-left text-white">
                                            <i class="fa fa-arrow-left" aria-hidden="true"></i> {{__('Cancel')}}
                                        </a>
                                    </div>
                                    <div class="col-md-6">
                                        <button type="button" class="btn btn-success float-right" id="continue">
                                            <i class="fa fa-arrow-right" aria-hidden="true"></i> {{__('Continue')}}
                                        </button>
                                    </div>
                                </div>
                            </div>
                        {!! Form::close() !!}
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
    $(document).ready(function () {
        $('#continue').click(function () {
            // Perform AJAX request
            $.ajax({
                url: "{{ route('fetchSearchResults') }}", // Update this line
                method: "POST",
                data: $('#search-form').serialize(),
                dataType: "html",
                success: function (data) {
                    $('#search-results').html(data);
                },
                error: function (xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });
        });
    });
</script>
@endsection









