@extends('frontend.layouts.frontend')
@section('style')
    <style>
        #myOnlineCamera video{width:320px;height:240px;margin:15px;float:left;}
        #myOnlineCamera canvas{width:320px;height:240px;margin:15px;float:left;}
        #myOnlineCamera button{clear:both;margin:30px;}
    </style>

@section('css')
    <link rel="stylesheet" href="{{ asset('css/id-card-print.css') }}">
    <link rel="stylesheet" href="https://cdn.rawgit.com/davidshimjs/qrcodejs/gh-pages/qrcode.min.css">


@endsection
@section('content')
    <!-- Default Page -->
    <section id="pm-banner-1" class="custom-css-step">
        <div class="container">
            <div class="card"  style="margin-top:40px;">
                <div class="card-header" id="Details" align="center">
                    <h4 style="color: #111570;font-weight: bold">{{__('Take Visitor Photo')}}</h4>
                </div>
                {!! Form::open(['route' => 'check-in.step-two.next', 'class' => 'form-horizontal', 'files' => true]) !!}
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div style="margin: auto" align="center">
                                            <video width="180" height="140" id="videos" style="border:5px solid #d3d3d3;" autoplay></video>
                                            <canvas id="canvas" width="160" height="130" style="border:5px solid #d3d3d3;"></canvas>
                                            <input type="hidden" id="image" name="photo" value="">
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <div class="col-md-12">
                                        <button type="button" id="playvideo" class='retakephoto btn btn-md btn-dark float-left'>
                                            <img src="{{ asset('website/img/retake.png')}}" style="height: 60px">
                                        </button>
                                        <button type="button" id="snap" class='retakephoto btn btn-md btn-danger float-right'>
                                            <img class="img" src="{{ asset('website/img/cemara1.png')}}" style="height: 60px">
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <span class="text-center">{!! $errors->first('photo', '<p class="text-danger">:message</p>') !!}</span>
                            @if(setting('visitor_agreement'))
                                <div class="form-group mt-5">
                                    <div class="form-check">
                                        <input class="form-check-input" name="agreement" type="checkbox" id="gridCheck">
                                        <label class="form-check-label" for="gridCheck">
                                            <span class="text-black-50">{{__('I Agree to the')}} </span><a href="#" data-toggle="modal" data-target="#exampleModalLong"> {{__('Terms & condition')}}</a>
                                        </label>
                                    </div>
                                    @if ($errors->has('agreement'))
                                     <span class="text-danger">
                                        {{ $errors->first('agreement') }}
                                    </span>
                                    @endif
                                </div>
                            @endif
                        </div>









                        <div class="col-md-4">
                            <div class="img-cards" id="printidcard">
                                <div class="id-card-holder">
                                    <div class="id-card">
                                            <div class="id-card-photo">
                                                <img src="{{ asset('assets/img/default/user.png') }}" alt="Default Image">
                                            </div>
                                        <h2>{{$visitingDetails['first_name']}} {{$visitingDetails['last_name']}}</h2>
                                        <h2>{{$visitingDetails['company_name']}}</h2>
                                        <h3>{{__('Host:')}} {{$employee->name}}</h3>
                                        <h3>{{__('Host Mobile:')}} {{$employee->phone}}</h3>
                                        <hr>
                                        <div id="qrcode"></div>
                                </div>
                            </div>
                        </div>


                        
                    </div>
                </div>
                <div class="card-footer">
                    <div class="row">
                        <div class="col-md-6">
                            <a href="{{ route('check-in.step-one') }}" class="btn btn-primary float-left text-white">
                                <i class="fa fa-arrow-left" aria-hidden="true"></i> back
                            </a>
                        </div>
                        <div class="col-md-6">
                            <button type="submit" class="btn btn-success float-right" id="hide">
                                Continue <i class="fa fa-arrow-right" aria-hidden="true"></i>
                            </button>
                        </div>
                    </div>
                </div>
                {!! Form::close() !!}
            </div>
            <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">{{__('Terms & condition')}}</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            {{strip_tags(setting('terms_condition'))}}
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
@section('scripts')
    <script src="{{ asset('js/photo.js') }}"></script>
    <script src="{{ asset('assets/modules/datatables/media/js/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('assets/modules/datatables.net-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('assets/modules/datatables.net-select-bs4/js/select.bootstrap4.min.js') }}"></script>
    <script src="https://cdn.rawgit.com/davidshimjs/qrcodejs/gh-pages/qrcode.min.js"></script>

    <script>
    $(document).ready(function () {
        // Concatenate information for the main QR code
        var mainQrText = 'Name: {{$visitingDetails['first_name']}} {{$visitingDetails['last_name']}}\n' +
                         'ID: {{$visitingDetails['national_identification_no']}}\n' +
                         'Visitors Mobile: {{$visitingDetails['phone']}}\n' +
                         'Company: {{$visitingDetails ['company_name']}}\n' +
                         'Host: {{$employee->name}}\n' +

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
