$("#btnLogin").click(function () {
    //$("#login_err").css('display', 'none', 'important');
    username = $("#inputUsername").val();
    password = $("#inputPassword").val();
    $.ajax({
        type: "POST",
        url: "login.php",
        data: "name=" + username + "&pwd=" + password,
        success: function (result) {
            if (result == 'true') {
                //$("#add_err").result("right username or password");
                window.location = "index.html";
            } else {
                $("#login_err").css('display', 'inline', 'important');
                $("#login_err").html("<img src='images/alert.png' />Wrong username or password");
            }
        },
        beforeSend: function () {
            $("#login_err").css('display', 'inline', 'important');
            $("#login_err").html("<img src='images/ajax-loader.gif' /> Loading...")
        },
        error: function () {
            $("#login_err").css('display', 'inline', 'important');
            $("#login_err").html("<img src='images/alert.png' />Wrong username or password");
        }
    });
    return false;
});