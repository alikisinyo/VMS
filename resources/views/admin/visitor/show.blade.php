@extends('admin.layouts.master')

@section('css')
    <link rel="stylesheet" href="{{ asset('css/id-card-print.css') }}">
    <link rel="stylesheet" href="https://cdn.rawgit.com/davidshimjs/qrcodejs/gh-pages/qrcode.min.css">

    <style>
    @media print {
        body * {
            visibility: hidden;
        }

        #printidcard, #printidcard * {
            visibility: visible;
        }

        #printidcard {
            position: absolute;
            left: 0;
            top: 0;
        }

        #printidcard .id-card {
            height: 3.375in; /* 3.375 inches is the width of a standard credit card */
            width: 2.125in; /* 2.125 inches is the height of a standard credit card */
            border: 1px solid #000;
            border-radius: 10px;
            padding: 20px;
            background: #fff;
            margin: 0 auto;
        }

        @page {
            size: auto;
            margin: 0;
        }
    }
</style>

@endsection

@section('main-content')
    <section class="section">
        <div class="section-header">
            <h1>{{ __('Visitors') }}</h1>
            {{ Breadcrumbs::render('visitors/show') }}
        </div>

        <div class="section-body">
            <div class="row">
                <div class="col-4 col-md-4 col-lg-4">
                    <div class="card">
                        <div class="card-header">
                            <a href="#" id="print" class="btn btn-icon icon-left btn-primary"><i
                                    class="fas fa-print"></i> {{ __('Print ID card') }}</a>
                        </div>
                        <div class="card-body">
                                <div class="img-cards" id="printidcard">
                                    <div class="id-card-holder">
                                        <div class="id-card">

                                        <!-- default user image -->
                                            <!-- <div class="id-card-photo">
                                                <canvas id="canvas2" width="80" height="70" style="border:5px solid #d3d3d3;"></canvas>
                                                <img src="{{ asset('assets/img/default/user.png') }}" alt="Default Image">
                                            </div> -->

                                        <!-- uploaded user image -->

                                        <div class="id-card-photo">
                                            @if($visitingDetails->getFirstMediaUrl('visitor'))
                                                <img src="{{ asset($visitingDetails->getFirstMediaUrl('visitor')) }}" alt="Visitor Image">
                                            @else(session('imageUrl'))
                                                <div class="id-card-photo">
                                                <img src="{{ asset('assets/img/default/user.png') }}" alt="Default Image">
                                                </div>
                                            @endif
                                        </div>


                                            <h2>{{$visitingDetails->visitor->name}}</h2> 
                                            <h2>{{$visitingDetails->visitor->company_name}}</h2>
                                            <h3>{{__('Host:')}} {{$visitingDetails->employee->name}}</h3>
                                            <h3>{{__('Host Mobile:')}} {{$visitingDetails->employee->phone}}</h3>

                                            <hr>
                                            <div id="qrcode"></div>
                                        </div>
                                    </div>
                                </div>
                        </div>
                    </div>
                </div>
                <div class="col-8 col-md-8 col-lg-8">
                <div class="card">
			    		<div class="card-body">
			    			<div class="profile-desc">
			    				<div class="single-profile">
			    					<p><b>{{ __('First Name') }}: </b> {{ $visitingDetails->visitor->first_name}}</p>
			    				</div>
			    				<div class="single-profile">
			    					<p><b>{{ __('Last Name') }}: </b> {{ $visitingDetails->visitor->last_name}}</p>
			    				</div>
			    				<div class="single-profile">
			    					<p><b>{{ __('Email') }}: </b> {{ $visitingDetails->visitor->email}}</p>
			    				</div>
			    				<div class="single-profile">
			    					<p><b>{{ __('Phone') }}: </b> {{ $visitingDetails->visitor->phone}}</p>
			    				</div>
                                <div class="single-profile">
			    					<p><b>{{ __('Employee') }}: </b> {{ $visitingDetails->employee->user->name}}</p>
			    				</div>
                                <div class="single-profile">
                                    <p><b>{{ __('Purpose') }}: </b> {{ $visitingDetails->purpose}}</p>
                                </div>
                                <div class="single-profile">
                                    <p><b>{{ __('Company') }}: </b> {{ $visitingDetails->company_name}}</p>
                                </div>
                                <div class="single-profile">
                                    <p><b>{{ __('National Identification') }}: </b> {{ $visitingDetails->visitor->national_identification_no}}</p>
                                </div>
			    				<div class="single-profile">
			    					<p><b>{{ __('Date') }}: </b> {{date('d-m-Y', strtotime($visitingDetails->created_at))}}</p>
			    				</div>
                                <div class="single-profile">
			    					<p><b>{{ __('Checkin') }}: </b> {{date('d-m-Y h:i A', strtotime($visitingDetails->checkin_at))}}</p>
			    				</div>
                                @if($visitingDetails->checkout_at)
                                <div class="single-profile">
			    					<p><b>{{ __('Checkout') }}: </b> {{date('d-m-Y h:i A', strtotime($visitingDetails->checkout_at))}}</p>
			    				</div>
                                @endif
                                <div class="single-profile">
                                    <p><b>{{ __('Address') }}: </b> {{ $visitingDetails->visitor->address}}</p>
                                </div>
                                <div class="single-profile">
                                    <p><b>{{ __('Status') }}: </b> {{ $visitingDetails->my_status}}</p>
                                </div>
			    			</div>
			    		</div>
			    	</div>
				</div>
                </div>
            </div>
        </div>
    </section>
@endsection

@section('scripts')
    <script src="{{ asset('assets/modules/datatables/media/js/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('assets/modules/datatables.net-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('assets/modules/datatables.net-select-bs4/js/select.bootstrap4.min.js') }}"></script>
    <script src="https://cdn.rawgit.com/davidshimjs/qrcodejs/gh-pages/qrcode.min.js"></script>

    <script>
    $(document).ready(function () {
        // Concatenate information for the main QR code
        var mainQrText = 'Name: {{$visitingDetails->visitor->name}}\n' +
                        'ID: {{$visitingDetails->visitor->national_identification_no}}\n' +
                         'Visitors Mobile: {{$visitingDetails->visitor->phone}}\n' +
                         'Company: {{$visitingDetails->company_name}}\n' +
                         'Host: {{$visitingDetails->employee->name}}\n' +

                         '{{ setting('site_name') }}\n'+
                         '{{ setting('site_address') }}\n';


        // Generate main QR code
        var mainQrCode = new QRCode(document.getElementById('qrcode'), {
            text: mainQrText,
            width: 92,
            height: 92,
        });

        $('#maintable').DataTable({
            "columns": [
                {
                    "data": "visitor_id",
                    "render": function (data, type, row) {
                        // Concatenate information for each row's QR code
                        var rowQrText = 'Visitor ID: ' + data;

                        // Generate QR Code for each row
                        new QRCode(document.getElementById('qrcode-' + row.id), {
                            text: rowQrText,
                            width: 92,
                            height: 92,
                        });

                        // Return an empty string (the actual QR Code is rendered in the specified div)
                        return '';
                    }
                },
                // ... other columns ...
            ],
        });

            // Print button click event
            $('#print').on('click', function () {
                // Call the window.print() function
                window.print();
            });
    });
</script>

@endsection
