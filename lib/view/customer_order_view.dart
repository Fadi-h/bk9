import 'package:bk9/const/app-style.dart';
import 'package:bk9/controller/customer_order_controller.dart';
import 'package:bk9/model/customer_order.dart';
import 'package:bk9/widgets/background_image.dart';
import 'package:bk9/widgets/container_with_image.dart';
import 'package:bk9/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomerOrderView extends StatelessWidget {

  CustomerOrderView(List<CustomerOrder> orders) {
    customerOrderController.orders = orders;
  }

  CustomerOrderController customerOrderController = Get.put(CustomerOrderController());


  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              BackgroundImage(),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _header(context),
                    SizedBox(height: 30),
                    Container(
                        child: ListView.builder(
                            itemCount: customerOrderController.orders.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return items(context, customerOrderController.orders[index]);
                            })),
                    SizedBox(height: 20,)
                  ],
                ),
              ),
              customerOrderController.loading.value ?
              Positioned(child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.white.withOpacity(0.5),
                child: Center(
                  child: CircularProgressIndicator(color: AppStyle.primary,),
                ),
              )) : Center()
            ],
          ),
        )
    ));
  }
  _header(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      width: AppStyle.getDeviceWidthPercent(100, context),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 20,
            spreadRadius: 1,
            offset: Offset(5.0, 5.0,),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back,size: 23,)
              ),
              SizedBox(width: 25),
              Container(
                width: AppStyle.getDeviceWidthPercent(45, context),
                child: Text("Order History",
                    style: TextStyle(
                      fontSize: CommonTextStyle.mediumTextStyle,
                      color: AppStyle.darkGrey,
                      fontWeight: FontWeight.bold,
                    )
                ),
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(top: 3),
              child: ContainerWithImage(
                  width: 40,
                  height: 70,
                  image: "assets/icons/wishlist.svg",
                  color: Colors.transparent,
                  option: 0)
          )
        ],
      ),
    );
  }
  items(BuildContext context, CustomerOrder orderItem) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: AppStyle.getDeviceWidthPercent(90, context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 4,
                  offset: Offset(0, 4), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text("Order ID" + ": ",
                            style: CommonTextStyle.textStyleForDarkGreyMediumButton,
                          ),
                          Text(orderItem.orderNumber,
                            style: CommonTextStyle.textStyleForWhiteSmallButtonNormal
                          )
                        ],
                      ),
                      Text(
                        _date_covert(orderItem.createdAt),
                        style: CommonTextStyle.textStyleForGreyTinyButton
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "phone" + ": ",
                        style: CommonTextStyle.textStyleForDarkGreySmallButtonBold
                      ),
                      Text(
                        orderItem.phone,
                        style:  CommonTextStyle.textStyleForGreySmallButton,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "total" + ": ",
                              style: CommonTextStyle.textStyleForDarkGreySmallButtonBold
                          ),
                          Text(
                            orderItem.total.toStringAsFixed(2),
                            style: CommonTextStyle.textStyleForGreySmallButton,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "subTotal" + ": ",
                              style: CommonTextStyle.textStyleForDarkGreySmallButtonBold
                          ),
                          Text(
                            orderItem.subTotal.toStringAsFixed(2),
                            style: CommonTextStyle.textStyleForGreySmallButton,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "discount" + ": ",
                              style: CommonTextStyle.textStyleForDarkGreySmallButtonBold
                          ),
                          Text(
                            orderItem.discount.toStringAsFixed(2),
                            style: CommonTextStyle.textStyleForGreySmallButton,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "shipping" + ": ",
                              style: CommonTextStyle.textStyleForDarkGreySmallButtonBold
                          ),
                          Text(
                            orderItem.shipping.toStringAsFixed(2),
                            style: CommonTextStyle.textStyleForGreySmallButton,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  state(orderItem.orderState, context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                          text: "view order",
                          onPressed: () {
                            customerOrderController.viewOrder(orderItem.id, context);
                          },
                          color: AppStyle.primary,
                          borderRadius: 20,
                          border: AppStyle.primary,
                          width: 100,
                          height: 30,
                          textStyle: CommonTextStyle.textStyleForOrangeMediumButton
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _date_covert(DateTime dateTime) {
    final format = DateFormat('MMM-dd-yyyy');
    final clockString = format.format(dateTime);
    return clockString.replaceAll(" ", ",");
  }
  state(int state, BuildContext context) {
    if (state == -1) {
      return Row(
        children: const [
          Text("canceled",
            style: TextStyle(
              color: Colors.red,
              fontSize: CommonTextStyle.tinyTextStyle
            )
          ),
          SizedBox(
            width: 3,
          ),
          Icon(
            Icons.close,
            color: AppStyle.grey,
            size: CommonTextStyle.tinyTextStyle,
          ),
        ],
      );
    } else if (state == 0) {
      return Row(
        children: const [
          Text("pending",
              style: TextStyle(
                  color: AppStyle.primary,
                  fontSize: CommonTextStyle.tinyTextStyle
              )
          ),
          SizedBox(
            width: 3,
          ),
          Icon(
            Icons.history,
            color: AppStyle.grey,
            size: CommonTextStyle.tinyTextStyle,
          ),
        ],
      );
    } else {
      return Row(
        children: const [
          Text("delivered",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: CommonTextStyle.tinyTextStyle
              )
          ),
          SizedBox(
            width: 3,
          ),
          Icon(
            Icons.check_circle,
            color: AppStyle.grey,
            size: CommonTextStyle.tinyTextStyle,
          ),
        ],
      );
    }
  }

}