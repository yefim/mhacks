// Generated by CoffeeScript 1.6.2
(function() {
  $(function() {
    $('.call-to-action').delegate('#register-form', 'submit', function(e) {
      var $f;

      e.preventDefault();
      $f = $('#register-form');
      return $.ajax({
        type: $f.attr('method'),
        url: $f.attr('action'),
        data: $f.serialize()
      }).then(function(data) {
        return console.log(data);
      });
    });
    $('.call-to-action').delegate('.cancel', 'click', function(e) {
      e.preventDefault();
      return $('.call-to-action').html("<a class='register' href='#'>Register</a>\n<span>- or -</span>\n<a class='sponsor' href='mailto:hackathon@umich.edu'>Sponsor</a>");
    });
    return $('.call-to-action').delegate('.register', 'click', function(e) {
      e.preventDefault();
      $('.call-to-action').html("<form id='register-form' method='post' action='/register'>\n  <input class='email' type='email' placeholder='EMAIL' name='email' required>\n  <input type='submit' value='GO'>\n  <button type='button' class='cancel'>STOP</button>\n</form>");
      return $('.email').focus();
    });
  });

}).call(this);
