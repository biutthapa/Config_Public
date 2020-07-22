


$(function () {
  $('[data-toggle="popover"]').popover()
})

$(".house-icon").hover(
  function() {
    $('.house-collapse').collapse('show');
    $('.apartment-collapse').collapse('hide');
    $('.office-collapse').collapse('hide');
  },

  function() {
    $('.house-collapse').collapse('hide');
  }
);

$(".apartment-icon").hover(
  function() {
    $('.apartment-collapse').collapse('show');
    $('.house-collapse').collapse('hide');
    $('.office-collapse').collapse('hide');
  },

  function() {
    $('.apartment-collapse').collapse('hide');
  }
);

$(".office-icon").hover(
  function() {
    $('.office-collapse').collapse('show');
    $('.house-collapse').collapse('hide');
    $('.apartment-collapse').collapse('hide');
  },
  function() {
    $('.office-collapse').collapse('hide');
  }
);

$(".jumbotron").hover(
  function() {
    $('.apartment-collapse').collapse('hide');
    $('.house-collapse').collapse('hide');
    $('.office-collapse').collapse('hide');
  },

  function() {
    $('.apartment-collapse').collapse('hide');
    $('.house-collapse').collapse('hide');
    $('.office-collapse').collapse('hide');
  }
);

$("body").hover(
  function() {
    $('.apartment-collapse').collapse('hide');
    $('.house-collapse').collapse('hide');
    $('.office-collapse').collapse('hide');
  },

  function() {
    $('.apartment-collapse').collapse('hide');
    $('.house-collapse').collapse('hide');
    $('.office-collapse').collapse('hide');
  }
);

function colorCheck_basic() {
  colorCheck_basic_StarterKitPlus()
  colorCheck_basic_CombiProtect()
  colorCheck_basic_StreetSiren()
  colorCheck_basic_KeyPad()
  colorCheck_basic_MotionCam()
  colorCheck_basic_IndoorSiren()
  colorCheck_basic_DoorProtect()
  colorCheck_basic_SmokeDetector()
  colorCheck_basic_LeakDetector()
  colorCheck_basic_MotionProtectCurtain()
  colorCheck_basic_InfraredMotionDetectorOutside()
}

function colorCheck_recommended() {
  colorCheck_recommended_StarterKitPlus()
  colorCheck_recommended_CombiProtect()
  colorCheck_recommended_StreetSiren()
  colorCheck_recommended_KeyPad()
  colorCheck_recommended_MotionCam()
  colorCheck_recommended_IndoorSiren()
  colorCheck_recommended_DoorProtect()
  colorCheck_recommended_SmokeDetector()
  colorCheck_recommended_LeaksProtect()
  colorCheck_recommended_MotionProtectCurtain()
  colorCheck_recommended_InfraredMotionDetectorOutside()
}

$("input[type='number']").each(function(){
  //alert("ready");

  $(this).prop('style', 'width: 2.5em')
  var htmlForPrepend = $('<button id="priceChangeBtn" type="button" class="dec button btn btn-outline-dark btn-sm">-</button>');
  var htmlForAppend = $('<button id="priceChangeBtn" type="button" class="inc button btn btn-outline-dark btn-sm">+</button>');
  $(this).parent().prepend(htmlForPrepend);
  $(this).parent().append(htmlForAppend);




});

$(".button").on("click", function() {

  var $button = $(this);
  var oldValue = $button.parent().find("input").val();


  if ($button.text() == "+") {
	  var newVal = parseFloat(oldValue) + 1;
	} else {
   // Don't allow decrementing below zero
    if (oldValue > 0) {
      var newVal = parseFloat(oldValue) - 1;
    } else {
      newVal = 0;
    }
  }

  $button.parent().find("input").val(newVal);

});

function updateTotal_basic() {
  var totalPrice = object_StarterKitPlusPriceId_basic.price + object_CombiProtectPriceId_basic.price + object_StreetSirenPriceId_basic.price + object_KeyPadPriceId_basic.price + object_MotionCamPriceId_basic.price + object_IndoorSirenPriceId_basic.price + object_DoorProtectPriceId_basic.price + object_SmokeDetectorPriceId_basic.price + object_LeakDetectorPriceId_basic.price + object_MotionProtectCurtainPriceId_basic.price + object_InfraredMotionDetectorOutsidePriceId_basic.price;
  $("#totalPrice_basic").text('Total Price: €' + totalPrice.toFixed(2));
}

function updateTotal_recommended() {
  var totalPrice = object_StarterKitPlusPriceId_recommended.price + object_CombiProtectPriceId_recommended.price + object_StreetSirenPriceId_recommended.price + object_KeyPadPriceId_recommended.price + object_MotionCamPriceId_recommended.price + object_IndoorSirenPriceId_recommended.price + object_DoorProtectPriceId_recommended.price + object_SmokeDetectorPriceId_recommended.price + object_LeaksProtectPriceId_recommended.price + object_MotionProtectCurtainPriceId_recommended.price + object_InfraredMotionDetectorOutsidePriceId_recommended.price;
  $("#totalPrice_recommended").text('Total Price: €' + totalPrice.toFixed(2));
}
