// The root URL for the RESTful services
var HOST = "localhost";
var PORT = "8808";
var rootURL = "http://" + HOST + ":" + PORT + "/api";

var currentOrder;

// Retrieve wine list when application starts
findAll();

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
        success: renderList,
        error: alert("failed")
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
        $('#data-primary ').append('<div class="row data-row-border" data-identity="' + order.id + '">');
        $('#data-primary ').append('<div class="col-xs-1">'+order.id+'</div>');
        $('#data-primary ').append('<div class="col-xs-1 word-wrap">'+order.date+'</div>');
        $('#data-primary ').append('<div class="col-xs-1 word-wrap">'+order.cust_name+'</div>');
        $('#data-primary ').append('<div class="col-xs-1 word-wrap">'+order.phone+'</div>');
        $('#data-primary ').append('<div class="col-xs-2 word-wrap">'+order.address+'</div>');
        $('#data-primary ').append('<div class="col-xs-1 word-wrap">'+order.recv_name+'</div>');
        $('#data-primary ').append('<div class="col-xs-1 word-wrap">'+order.phone+'</div>');
        $('#data-primary ').append('<div class="col-xs-2 word-wrap">'+order.address+'</div>');
        $('#data-primary ').append('<div class="col-xs-1">'+order.weight+'</div>');
        $('#data-primary ').append('<div class="col-xs-1">'+order.id+'</div>');
        $('#data-primary ').append('</div>');
    });
}