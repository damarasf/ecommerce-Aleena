@extends('frontend.layouts.master')
@section('title','Aleena Byand Store - Wishlist')
@section('main-content')
	<!-- Breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="bread-inner">
						<ul class="bread-list">
							<li><a href="{{('home')}}">Home<i class="ti-arrow-right"></i></a></li>
							<li class="active"><a href="javascript:void(0);">Wishlist</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Breadcrumbs -->

	<!-- Shopping Cart -->
	<div class="shopping-cart section">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<!-- Shopping Summery -->
					<table class="table shopping-summery">
						<thead>
							<tr class="main-hading">
								<th>PRODUCT</th>
								<th>NAME</th>
								<th class="text-center">TOTAL</th>
								<th class="text-center">ADD TO CART</th>
								<th class="text-center"><i class="ti-trash remove-icon"></i></th>
							</tr>
						</thead>
						<tbody>
							@if(Helper::getAllProductFromWishlist())
								@foreach(Helper::getAllProductFromWishlist() as $key=>$wishlist)
									<tr>
										@php
											$photo=explode(',',$wishlist->product['photo']);
										@endphp
										<td class="image" data-title="No"><img src="{{$photo[0]}}" alt="{{$photo[0]}}"></td>
										<td class="product-des" data-title="Description">
											<p class="product-name"><a href="{{route('product-detail',$wishlist->product['slug'])}}">{{$wishlist->product['title']}}</a></p>
											<p class="product-des">{!!($wishlist['summary']) !!}</p>
										</td>
										<td class="total-amount" data-title="Total"><span>Rp {{number_format($wishlist['amount'])}}</span></td>
										{{-- <td><center><a href="{{route('add-to-cart',$wishlist->product['slug'])}}" class='btn text-white'>Add To Cart</a></center></td> --}}
										<td><center><a data-toggle="modal" data-target="#{{$wishlist->product['id']}}" href="#" class="btn text-white">Add To Cart</a></center></td>
										{{-- <td><a data-toggle="modal" data-target="#exampleModal" title="Quick Shop" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a></td> --}}
										<td class="action" data-title="Remove"><a href="{{route('wishlist-delete',$wishlist->id)}}"><i class="ti-trash remove-icon"></i></a></td>
									</tr>
								@endforeach
							@else
								<tr>
									<td class="text-center">
										There are no any wishlist available. <a href="{{route('product-grids')}}" style="color:blue;">Continue shopping</a>

									</td>
								</tr>
							@endif


						</tbody>
					</table>
					<!--/ End Shopping Summery -->
				</div>
			</div>
		</div>
	</div>
	<!--/ End Shopping Cart -->

	<!-- Start Shop Services Area  -->
	<section class="shop-services section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-rocket"></i>
						<h4>Free shiping</h4>
						<p>Use Special Code</p>
					</div>
					<!-- End Single Service -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-reload"></i>
						<h4>Free Return</h4>
						<p>Within 30 days returns</p>
					</div>
					<!-- End Single Service -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-lock"></i>
						<h4>Sucure Payment</h4>
						<p>100% secure payment</p>
					</div>
					<!-- End Single Service -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-tag"></i>
						<h4>Best Peice</h4>
						<p>Guaranteed price</p>
					</div>
					<!-- End Single Service -->
				</div>
			</div>
		</div>
	</section>
	<!-- End Shop Newsletter -->

	@include('frontend.layouts.newsletter')



	<!-- Modal -->
	@if(Helper::getAllProductFromWishlist())
    @foreach(Helper::getAllProductFromWishlist() as $key=>$wishlist)
        <div class="modal fade" id="{{$wishlist->product['id']}}" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="ti-close" aria-hidden="true"></span></button>
                        </div>
                        <div class="modal-body">
                            <div class="row no-gutters">
                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                    <!-- Product Slider -->
                                        <div class="product-gallery">
                                            {{-- <div class="quickview-slider-active"> --}}
                                                @php
                                                    $photo=explode(',',$wishlist->product['photo']);
                                                                // dd($photo);
                                                @endphp
                                                <img class="default-img" src="{{$photo[0]}}" alt="{{$photo[0]}}">
												{{-- <img class="hover-img" src="{{$photo[0]}}" alt="{{$photo[0]}}"> --}}
                                            {{-- </div> --}}
                                        </div>
                                    <!-- End Product slider -->
                                </div>
                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                    <div class="quickview-content">
                                        <h2>{{$wishlist->product['title']}}</h2>
                                        <div class="quickview-ratting-review">
                                            <div class="quickview-ratting-wrap">
                                                <div class="quickview-ratting">
                                                    {{-- <i class="yellow fa fa-star"></i>
                                                    <i class="yellow fa fa-star"></i>
                                                    <i class="yellow fa fa-star"></i>
                                                    <i class="yellow fa fa-star"></i>
                                                    <i class="fa fa-star"></i> --}}
                                                    @php
                                                        $rate=DB::table('product_reviews')->where('product_id',$wishlist->product['id'])->avg('rate');
                                                        $rate_count=DB::table('product_reviews')->where('product_id',$wishlist->product['id'])->count();
                                                    @endphp
                                                    @for($i=1; $i<=5; $i++)
                                                        @if($rate>=$i)
                                                            <i class="yellow fa fa-star"></i>
                                                        @else
                                                        <i class="fa fa-star"></i>
                                                        @endif
                                                    @endfor
                                                </div>
                                                <a href="#"> ({{$rate_count}} customer review)</a>
                                            </div>
                                            <div class="quickview-stock">
                                                @if($wishlist->product['stock'] >0)
                                                <span><i class="fa fa-check-circle-o"></i> {{$wishlist->product['stock']}} in stock</span>
                                                @else
                                                <span><i class="fa fa-times-circle-o text-danger"></i> {{$wishlist->product['stock']}} out stock</span>
                                                @endif
                                            </div>
                                        </div>
                                        @php
                                            $after_discount=($wishlist->product['price']-($wishlist->product['price']*$wishlist->product['discount'])/100);
                                        @endphp
                                        <h3>Rp {{number_format($after_discount)}}&ensp;<small><del class="text-muted">Rp {{number_format($wishlist->product['price'])}}</del></small></h3>
                                        {{-- <h3><small><del class="text-muted">Rp {{number_format($wishlist->product['price'])}}</del></small>    Rp{{number_format($after_discount,2)}}  </h3> --}}
                                        <div class="quickview-peragraph">
                                            <p>{!! html_entity_decode($wishlist->product['summary']) !!}</p>
                                        </div>

                                        <form action="{{route('single-add-to-cart')}}" method="POST" onsubmit="return validasi()" class="mt-4">

                                            @csrf
                                            @if($wishlist->product['size'])
                                        <div class="form-group">
                                            <div class="size">
                                                <div class="row">
                                                    <div class="col-lg-6 col-12">
                                                        <h5 class="title">Size</h5>
                                                        <select name="size" class="form-control selectpicker" id="valsize"  multiple data-live-search="true">
                                                        {{-- <option value="" selected="selected">--Select Size--</option> --}}
                                                            @php
                                                            $sizes =explode(',',$wishlist->product['size']);
                                                            // dd($sizes ?? '');
                                                            @endphp
                                                            @foreach($sizes as $size)
                                                                <option value="{{ $size }}" selected>{{ ucwords($size) }}</option>
                                                            @endforeach

                                                        </select>
                                                    </div>
                                                    {{-- <div class="col-lg-6 col-12">
                                                        <h5 class="title">Color</h5>
                                                        <select>
                                                            <option selected="selected">orange</option>
                                                            <option>purple</option>
                                                            <option>black</option>
                                                            <option>pink</option>
                                                        </select>
                                                    </div> --}}
                                                </div>
                                            </div>
                                            </div>
                                        @endif
                                            <div class="quantity">
                                                <!-- Input Order -->
                                                <div class="input-group">
                                                    <div class="button minus">
                                                        <button type="button" class="btn btn-primary btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
                                                            <i class="ti-minus"></i>
                                                        </button>
                                                    </div>
													<input type="hidden" name="slug" value="{{$wishlist->product['slug']}}">
                                                    <input type="text" name="quant[1]" class="input-number"  data-min="1" data-max="1000" value="1">
                                                    <div class="button plus">
                                                        <button type="button" class="btn btn-primary btn-number" data-type="plus" data-field="quant[1]">
                                                            <i class="ti-plus"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                                <!--/ End Input Order -->
                                            </div>
                                            <div class="add-to-cart">
                                                <button type="submit" class="btn">Add to cart</button>
                                            </div>
                                        </form>
                                        {{-- <div class="default-social">
                                        <!-- ShareThis BEGIN --><div class="sharethis-inline-share-buttons"></div><!-- ShareThis END -->
                                        </div> --}}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>

    @endforeach
@endif
        <!-- Modal end -->

@endsection
@push('scripts')
{{-- <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script>
    function validasi () {
        submitOK = "true";
        var size = document.getElementById("valsize").value;
        if (size === "") {
            swal("Failed Add to cart", "Please Choose Size", "error")
            submitOK = "false";
        }
        else {
            submitOK = "true";
            return true;
        }

        if (submitOK == "false") {
            return false;
        }
    }
</script> --}}
@endpush
