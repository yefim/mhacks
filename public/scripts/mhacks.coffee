$ ->
  $('.call-to-action').delegate '#register-form', 'submit', (e) ->
    e.preventDefault()
    $f = $('#register-form')
    $.ajax(
      type: $f.attr 'method'
      url: $f.attr 'action'
      data: $f.serialize()
    ).then (data) ->
      console.log data

  $('.call-to-action').delegate '.cancel', 'click', (e) ->
    e.preventDefault()
    $('.call-to-action').html """
      <a class='register' href='#'>Register</a>
      <span>- or -</span>
      <a class='sponsor' href='mailto:hackathon@umich.edu'>Sponsor</a>
    """

  $('.call-to-action').delegate '.register', 'click', (e) ->
    e.preventDefault()
    $('.call-to-action').html """
      <form id='register-form' method='post' action='/register'>
        <input type='email' placeholder='EMAIL' name='email' required>
        <input type='submit' value='GO'>
        <button type='button' class='cancel'>STOP</button>
      </form>
    """
  #$('.call-to-action').html """
    #<form id='register-form' method='post' action='/register'>
      #<input type='email' placeholder='EMAIL' name='email' required>
      #<input type='submit' value='GO'>
    #</form>
  #"""
