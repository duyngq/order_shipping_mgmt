// The root URL for the RESTful services
// This is standard host on linux
//var HOST = "localhost";

//For wamp, there is an issue, so the host should be as:
// refer this link: https://stackoverflow.com/questions/29945153/php-slim-api-404-not-found
var HOST = "localhost/order"
var PORT = "";
// var rootURL = "http://" + HOST + ":" + PORT + "/api";
// var rootURL = "http://localhost:8808/api"
var rootURL = "http://" + HOST + "/api";
var currentOrder;
var sCustomers;
var rCustomers;

// Retrieve wine list when application starts
// findAll ();

// Start table at boot
// $(document).ready(function() {
//     $('#example').DataTable();
// } );

/**
 * Config action for button/event
 */
// Nothing to delete in initial application state
$ ('#btnDelete').hide ();


/**
 * Define action to connect/get data from server
 */
function findAll () {
    console.log ('find all orders');
    $.ajax ({
        type: 'GET',
        url: rootURL + "/orders/all",
        dataType: "json", // data type of response
        success: renderTableData,
        error: function (data) {
            console.log ("failed", data);
        }
    });
}

function addOrder() {
    console.log('Add a new order');
    if (!validation()) {
        alert ('Add order fail at validation');
        return;
    }
    $.ajax({
        type: 'POST',
        contentType: 'application/json',
        url: rootURL + "/orders/add",
        dataType: "json",
        data: formToJSON(),
        success: function(data, textStatus, jqXHR){
            alert('Order created successfully');
        },
        error: function(jqXHR, textStatus, errorThrown){
            console.log(jqXHR);
            console.log (errorThrown);
            alert('add order error: ');
        }
    });
}

/**
 * Get all sender customers
 */
function getSCustomers() {
    console.log ('Get all sender customers');
    $.ajax ({
        type: 'GET',
        url: rootURL + "/customer/senders",
        dataType: "json", // data type of response
        success: function(data) {
            sCustomers = data;
            rederDataList(sCustomers, 'sendPhoneList');
        },
        error: function (data) {
            console.log ("failed to load or render senders", data);
        }
    });
}

/**
 * Get all receiver customers
 */
function getRCustomers() {
    console.log ('Get all receiver customers');
    $.ajax ({
        type: 'GET',
        url: rootURL + "/customer/receivers",
        dataType: "json", // data type of response
        success: function(data) {
            rCustomers = data;
            rederDataList(rCustomers, 'recvPhoneList');
        },
        error: function (data) {
            console.log ("failed to load or render receivers", data);
        }
    });
}

/**
 * Render JSON data getting from server and render to html table
 * Will render for:
 * 1. ordered data
 * 2. shipping data
 * 3. delivered data
 * @param data
 */
function renderTableData (data) {
    // JAX-RS serializes an empty list as null, and a 'collection of one' as an object (not an 'array of one')
    var list = data == null ? [] : (data.orders instanceof Array ? data.orders : [data.orders]);
    var table = $ ('#example').DataTable ();
    // var shippingTable = $('#shippingTbl').DataTable();
    var deliveredTable = $ ('#deliveredTbl').DataTable ();

    table.clear ().draw ();
    deliveredTable.clear ().draw ();
    extraButton = "<span style='display:inline-flex !important;'><a href='' class='order-edit glyphicon glyphicon-pencil'></a> <a href='' class='order-delete glyphicon glyphicon-trash'></a> </span>";
    // var weight = order.weight;
    $.each (list, function (index, order) {
        var weight = order.weight;
        var amount = order.total;
        /* this will validate if value is not:
            null
            undefined
            NaN
            empty string ("")
            false
            0
        */
        if (!weight)
            weight = 0;
        if (!amount)
            amount = 0;
        // divide data to 2 parts: ordered/delivered (0/1)
        if (order.status == 0)
            table.row.add ([order.id, order.date, order.s_name, order.s_phone, order.s_address, order.r_name, order.r_phone, order.r_address, weight, amount, extraButton]).draw ();
        else if (order.status == 1)
            deliveredTable.row.add ([order.id, order.date, order.s_name, order.s_phone, order.s_address, order.r_name, order.r_phone, order.r_address, weight, amount, extraButton]).draw ();
    });
    // $("#example tfoot th#orderedWeight").html(totalWeight);
    // $("#weight").html(totalWeight); same result
    // $("#example tfoot th#orderedAmount").html(totalAmount);
}

// Helper function to serialize all the form fields into a JSON string
function formToJSON() {
    var productDetails = new Array();
    for (var i = 1; i <= 10 ; i++) {
        var productDetail = new Object();
        if (!$('#productDesc'+i).val())
            continue;
        productDetail.desc = $('#productDesc'+i).val();
        productDetail.weight = $('#weight'+i).val();
        productDetail.unit = $('#unit'+i).val();
        productDetail.price = $('#price'+i).val();
        productDetail.total = $('#total'+i).val();
        productDetails[i-1] = productDetail;
    }
    return JSON.stringify({
        "sendId": $("#sendPhoneList option[value='" + $('#sendPhone').val() + "']").attr('data-id'),
        "sendName": $('#sendName').val(),
        "sendPhone": $('#sendPhone').val(),
        "sendAddr": $('#sendAddr').val(),
        "recvId": $("#recvPhoneList option[value='" + $('#recvPhone').val() + "']").attr('data-id'),
        "recvName": $('#recvName').val(),
        "recvPhone": $('#recvPhone').val(),
        "recvAddr": $('#recvAddr').val(),
        "date": $('#year').val() + "-" + $("#month").val() + "-" + $("#day").val(),
        "productDesc": $('#productDesc').val(),
        "fileNames": $('#uploaded').val(),
        "productDetails" : productDetails
    });
}

/**
 * Render JSON data to datalist
 */
function rederDataList(data, datalist) {
    // JAX-RS serializes an empty list as null, and a 'collection of one' as an object (not an 'array of one')
    var list = data == null ? [] : (data.customers instanceof Array ? data.customers : [data.customers]);
    $.each (list, function (index, customer) {
        $('#'+datalist+'').append("<option data-id='"+customer.id+"'value='" + customer.phone + "'>"); // Not working.
    });
}

function getCustomersAsJson(data) {
    var list =  data == null ? [] : (data.customers instanceof Array ? data.customers : [data.customers]);
    var returnMap ={};
    $.each (list, function (index, customer) {
        returnMap[customer.phone] = customer;
    });
    return JSON.stringify(returnMap);
}
