mhacks = new Firebase('https://mhacks.firebaseio.com/')

$ ->
  cancel = ->
    $('.call-to-action').html """
      <a class='register' href='#'>Register</a>
      <span>- or -</span>
      <a class='sponsor' href='mailto:hackathon@umich.edu'>Sponsor</a>
    """

  $('.call-to-action').delegate '#register-form', 'submit', (e) ->
    e.preventDefault()

    mhacks.push(email: $('.email').val())

    $('.email').val ''
    cancel()

  $('.call-to-action').delegate '.cancel', 'click', cancel

  $('.call-to-action').delegate '.register', 'click', (e) ->
    console.log "clicked register"
    e.preventDefault()
    $('.call-to-action').html """
      <form id='register-form' method='post' action='/register'>
        <input class='email' type='email' placeholder='EMAIL' name='email' required>
        <input type='submit' value='GO'>
        <button type='button' class='cancel'>STOP</button>
      </form>
    """
