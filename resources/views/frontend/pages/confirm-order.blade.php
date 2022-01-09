@extends('frontend.layouts.master')

@section('title','Aleena Byand Store - Payment')

@section('main-content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Payment') }}</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif


                        <div class="form-group row mb-0">
                            <label class="col-md-8 col-form-label">{{ __('Silahkan Transfer Ke salah satu rekening dibawah ini') }}</label>
                            <label class="col-md-8 col-form-label">{{ __('BNI - No Rekening 112321321 Atas Nama Herdi Yusli') }}</label>
                            <label class="col-md-8 col-form-label">{{ __('BCA - No Rekening 112321321 Atas Nama Herdi Yusli') }}</label>
                            <label class="col-md-8 col-form-label">{{ __('BNI - No Rekening 112321321 Atas Nama Herdi Yusli') }}</label>

                            <div class="col-md-8">
                                <button type="submit" class="btn btn-primary" onclick="location.href='https://api.whatsapp.com/send?phone=628158887661&text=Saya%20ingin%20konfirmasi%20%20untuk%20nomer%20order%20-LIHAT%20PADA%20DASHBOARD-';">
                                    {{ __('Kirim Bukti Transfer Via WhatsApp Klik Disni') }}
                                </button>
                            </div>
                        </div>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection
