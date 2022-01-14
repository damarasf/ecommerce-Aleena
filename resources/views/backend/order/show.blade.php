@extends('backend.layouts.master')

@section('title','Order Detail')

@section('main-content')
<div class="card">
<h5 class="card-header">Order       <a href="{{route('order.pdf',$order->id)}}" class=" btn btn-sm btn-primary shadow-sm float-right"><i class="fas fa-download fa-sm text-white-50"></i> Generate PDF</a>
  </h5>
  <div class="card-body">
    @if($order)
    <table class="table table-striped table-hover">
      @php
          $shipping_charge=DB::table('shippings')->where('id',$order->shipping_id)->pluck('price');
      @endphp
      <thead>
        <tr>
            <th>S.N.</th>
            <th>Order No.</th>
            <th>Name</th>
            <th>Email</th>
            <th>Quantity</th>
            <th>Shipping Cost</th>
            <th>Total Amount</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <tr>
            <td>{{$order->id}}</td>
            <td>{{$order->order_number}}</td>
            <td>{{$order->first_name}} {{$order->last_name}}</td>
            <td>{{$order->email}}</td>
            <td>{{$order->quantity}}</td>
            <td>@foreach($shipping_charge as $data) Rp {{number_format($data)}} @endforeach</td>
            <td>Rp {{number_format($order->total_amount)}}</td>
            <td>
                @if($order->status=='new')
                  <span class="badge badge-primary">{{$order->status}}</span>
                @elseif($order->status=='process')
                  <span class="badge badge-warning">{{$order->status}}</span>
                @elseif($order->status=='delivered')
                  <span class="badge badge-success">{{$order->status}}</span>
                @else
                  <span class="badge badge-danger">{{$order->status}}</span>
                @endif
            </td>
            <td>
                <a href="{{route('order.edit',$order->id)}}" class="btn btn-primary btn-sm float-left mr-1" style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" title="edit" data-placement="bottom"><i class="fas fa-edit"></i></a>
                <form method="POST" action="{{route('order.destroy',[$order->id])}}">
                  @csrf
                  @method('delete')
                      <button class="btn btn-danger btn-sm dltBtn" data-id={{$order->id}} style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" data-placement="bottom" title="Delete"><i class="fas fa-trash-alt"></i></button>
                </form>
            </td>

        </tr>
      </tbody>
    </table>

    <section class="confirmation_part section_padding">
      <div class="order_boxes">
        <div class="row">
          <div class="col-lg-6 col-lx-4">
            <div class="order-info">
              <h4 class="text-center pb-4">ORDER INFORMATION</h4>
              <table class="table">
                    <tr class="">
                        <td>Order Number</td>
                        <td> : {{$order->order_number}}</td>
                    </tr>
                    <tr>
                        <td>Order Date</td>
                        <td> : {{$order->created_at->format('D d M, Y')}} at {{$order->created_at->format('H : i')}} </td>
                    </tr>
                    <tr>
                        <td>Quantity</td>
                        <td> : {{$order->quantity}}</td>
                    </tr>
                    <tr>
                        <td>Order Status</td>
                        <td> : {{$order->status}}</td>
                    </tr>
                    <tr>
                      @php
                          $shipping_charge=DB::table('shippings')->where('id',$order->shipping_id)->pluck('price');
                      @endphp
                        <td>Shipping Cost</td>
                        <td> : Rp {{number_format($shipping_charge[0])}}</td>
                    </tr>
                    <tr>
                      <td>Coupon</td>
                      <td> : Rp {{number_format($order->coupon)}}</td>
                    </tr>
                    <tr>
                        <td>Total Amount</td>
                        <td> : Rp {{number_format($order->total_amount)}}</td>
                    </tr>
                    <tr>
                        <td>Payment Method</td>
                        <td> : @if($order->payment_method=='cod') Cash on Delivery @else Transfer @endif</td>
                    </tr>
                    <tr>
                        <td>Payment Status</td>
                        <td> : {{$order->payment_status}}</td>
                    </tr>
              </table>
            </div>
          </div>



          <div class="col-lg-6 col-lx-4">
            <div class="shipping-info">
              <h4 class="text-center pb-4">SHIPPING INFORMATION</h4>
              <table class="table">
                    <tr class="">
                        <td>Full Name</td>
                        <td> : {{$order->first_name}} {{$order->last_name}}</td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td> : {{$order->email}}</td>
                    </tr>
                    <tr>
                        <td>Phone No.</td>
                        <td> : {{$order->phone}}</td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td> : {{$order->address1}}, {{$order->address2}}</td>
                    </tr>
                    <tr>
                        <td>Country</td>
                        <td> : {{$order->country}}</td>
                    </tr>
                    <tr>
                        <td>Post Code</td>
                        <td> : {{$order->post_code}}</td>
                    </tr>
                    <tr>
                        <td>Receipt Number (Resi)</td>
                        <td> : {{$order->resi}}</td>
                    </tr>
              </table>
            </div>
          </div>


          {{-- order item --}}


        <table style="margin-left: 10px; margin-right: 10px" class="table shopping-summery">
						<thead>
              <h4 class="text-center pb-4" style="margin-top: 10px;"><u>ORDER ITEM</u></h4>
							<tr style="background-color: #858796" class="main-hading">
								<th>PRODUCT</th>
								<th>NAME</th>
                <th class="text-center">SIZE</th>
								<th class="text-center">UNIT PRICE</th>
								<th class="text-center">QUANTITY</th>
								<th class="text-center">TOTAL</th>
							</tr>
						</thead>
						<tbody id="cart_item_list">
							<form action="{{route('cart.update')}}" method="POST">
								@csrf
								@if(Helper::getAllProductFromOrderItemAdmin())
									@foreach(Helper::getAllProductFromOrderItemAdmin() as $key=>$cart)
										<tr>
											@php
											$photo=explode(',',$cart->product['photo']);
											@endphp
											<td class="image text-center" data-title="No"><img src="{{$photo[0]}}" alt="{{$photo[0]}}"></td>
											<td class="product-des text-center" data-title="Description">
												<p class="product-name"><a href="{{route('product-detail',$cart->product['slug'])}}" target="_blank">{{$cart->product['title']}}</a></p>
												<p class="product-des">{!!($cart['summary']) !!}</p>
											</td>
                      <td class="size text-center" data-title="size">{{ $cart->size}}</td>
											<td class="price" data-title="Price"><span>Rp {{number_format($cart['price'])}}</span></td>
                      <td class="qty text-center" data-title="Qty">{{ $cart->quantity}}</td>

											<td class="total-amount cart_single_price" data-title="Total"><span class="money">Rp {{number_format($cart['amount'])}}</span></td>
										</tr>
									@endforeach
								@else
										<tr>
											<td class="text-center">
												There are no any carts available. <a href="{{route('product-grids')}}" style="color:blue;">Continue shopping</a>
											</td>
										</tr>
								@endif

							</form>
						</tbody>
					</table>


        </div>
      </div>
    </section>
    @endif

  </div>
</div>
@endsection

@push('styles')
<style>
    .order-info,.shipping-info,.order-item{
        background:#ECECEC;
        padding: 25px;
        margin-bottom: 20px;
    }
    .order-info h4,.shipping-info h4,.order-item h4{
        text-decoration: underline;
    }

</style>
@endpush
