// The root URL for the RESTful services
var HOST = "localhost";
var PORT = "8808";
var rootURL = "http://" + HOST + ":" + PORT + "/api";

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

/*function findAll() {
    console.log('find all orders');
    $.ajax({
        type: 'GET',
        url: rootURL + "/orders/all",
        dataType: "json", // data type of response
        success: renderTableData,
        // error: alert("failed")
    });
}*/

function findAll() {
    console.log('find all orders');
    $('#example').DataTable({
        "ajax": {
            type: 'GET',
            url: rootURL + "/orders/all",
            // dataType: "json", // data type of response
            // success: renderTableData,
            // error: alert("failed")
        }
    });
}

/**
 * Render JSON data getting from server and render to html table
 * @param data
 */
function renderTableData(data) {
    // JAX-RS serializes an empty list as null, and a 'collection of one' as an object (not an 'array of one')
    var list = data == null ? [] : (data.orders instanceof Array ? data.orders : [data.orders]);
    var table = $('#example').DataTable();

    table.clear().draw();
    $.each(list, function (index, order) {
        table.row.add(order.id, order.date, order.cust_name, order.phone, order.address, order.recv_name, oreder.phone, order.address, order.weight, order.id).draw();
    });
}

/**
 * Render JSON data getting from server and render to html
 * @param data
 */
function renderList(data) {
    // JAX-RS serializes an empty list as null, and a 'collection of one' as an object (not an 'array of one')
    var list = data == null ? [] : (data.orders instanceof Array ? data.orders : [data.orders]);

    $('#data-primary div').remove();
    $.each(list, function (index, order) {
        var eachData = '<div class="row data-row-border" data-identity="' + order.id + '">' +
            '        <div class="col-xs-1">' +
            '        <div class="row">' +
            '        <div class="col-xs-4 nopadding">' + order.id + '</div>' +
            '        <div class="col-xs-4 nopadding">' + order.date + '</div>' +
            '        </div></div>' +
            '        <div class="col-xs-1 word-wrap">' + order.cust_name + '</div>' +
            '        <div class="col-xs-1 word-wrap">' + order.phone + '</div>' +
            '        <div class="col-xs-2 word-wrap">' + order.address + '</div>' +
            '        <div class="col-xs-1 word-wrap">' + order.recv_name + '</div>' +
            '        <div class="col-xs-1 word-wrap">' + order.phone + '</div>' +
            '        <div class="col-xs-2 word-wrap">' + order.address + '</div>' +
            '        <div class="col-xs-1">' + order.weight + '</div>' +
            '        <div class="col-xs-1">' + order.id + '</div>' +
            '        </div>';
        $('#data-primary ').append(eachData);
        // $('#data-primary ').append('<div class="row data-row-border" data-identity="' + order.id + '">');
        // $('#data-primary ').append('<div class="col-xs-1">');
        // $('#data-primary ').append('<div class="col-xs-1">'+order.id+'</div>');
        // $('#data-primary ').append('<div class="col-xs-1">'+order.date+'</div>');
        // $('#data-primary ').append('</div>');
        // $('#data-primary ').append('<div class="col-xs-1 word-wrap">'+order.cust_name+'</div>');
        // $('#data-primary ').append('<div class="col-xs-1 word-wrap">'+order.phone+'</div>');
        // $('#data-primary ').append('<div class="col-xs-2 word-wrap">'+order.address+'</div>');
        // $('#data-primary ').append('<div class="col-xs-1 word-wrap">'+order.recv_name+'</div>');
        // $('#data-primary ').append('<div class="col-xs-1 word-wrap">'+order.phone+'</div>');
        // $('#data-primary ').append('<div class="col-xs-2 word-wrap">'+order.address+'</div>');
        // $('#data-primary ').append('<div class="col-xs-1">'+order.weight+'</div>');
        // $('#data-primary ').append('<div class="col-xs-1">'+order.id+'</div>');
        // $('#data-primary ').append('</div>');
    });
}