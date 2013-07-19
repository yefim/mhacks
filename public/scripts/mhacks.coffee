$ ->
  $('body').delegate '#register-form', 'submit', (e) ->
    e.preventDefault()
    $f = $('#register-form')
    $.ajax(
      type: $f.attr 'method'
      url: $f.attr 'action'
      data: $f.serialize()
    ).then (data) ->
      console.log data

  $('.register').on 'click', (e) ->
    e.preventDefault()
    $(e.target).replaceWith """
      <form id='register-form' method='post' action='/register'>
        <input type='email' placeholder='EMAIL' name='email'>
        <input type='submit' value='GO'>
      </form>
    """
