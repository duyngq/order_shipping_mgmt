// The root URL for the RESTful services
// This is standard host on linux
//var HOST = "localhost";

//For wamp, there is an issue, so the host should be as:
// refer this link: https://stackoverflow.com/questions/29945153/php-slim-api-404-not-found
var HOST="localhost/order"
var PORT = "";
// var rootURL = "http://" + HOST + ":" + PORT + "/api";
var rootURL = "http://localhost/order/api"
var currentOrder;

// Retrieve wine list when application starts
findAll();

// Start table at boot
// $(document).ready(function() {
//     $('#example').DataTable();
// } );

/**
 * Config action for button/event
 */
// Nothing to delete in initial application state
$('#btnDelete').hide();


/**
 * Define action to connect/get data from server
 */
function findAll() {
    console.log('find all orders');
    $.ajax({
        type: 'GET',
        url: rootURL + "/orders/all",
        dataType: "json", // data type of response
        success: renderTableData,
        error: function(data) {
            console.log("failed", data);
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
function renderTableData(data) {
    // JAX-RS serializes an empty list as null, and a 'collection of one' as an object (not an 'array of one')
    var list = data == null ? [] : (data.orders instanceof Array ? data.orders : [data.orders]);
    var table = $('#example').DataTable();
    // var shippingTable = $('#shippingTbl').DataTable();
    var deliveredTable = $('#deliveredTbl').DataTable();

    table.clear().draw();
    deliveredTable.clear().draw();
    // var totalWeight = 0, totalAmount = 0;
    // 1. ordered data
    $.each(list, function (index, order) {
        // var weight = order.weight;
        // var total = order.total;
        /* this will validate if value is not:
            null
            undefined
            NaN
            empty string ("")
            false
            0
        */
        // if (weight)
        //     totalWeight += parseFloat(weight);
        // if (total)
        //     totalAmount += parseFloat(total);
        if (order.status == 1)
            table.row.add([order.id, order.date, order.s_name, order.s_phone, order.s_address, order.r_name, order.r_phone, order.r_address, order.weight, order.total]).draw();
        else if (order.status == 0)
            deliveredTable.row.add([order.id, order.date, order.s_name, order.s_phone, order.s_address, order.r_name, order.r_phone, order.r_address, order.weight, order.total]).draw();
    });
    // $("#example tfoot th#orderedWeight").html(totalWeight);
    // $("#weight").html(totalWeight); same result
    // $("#example tfoot th#orderedAmount").html(totalAmount);
}