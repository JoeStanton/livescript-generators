require! <[co thunkify request]>
get = thunkify(request.get)

co(->*
  [error, my-ip] = yield get "http://wtfismyip.com/text"
  [error, second-opinion] = yield get "http://icanhazip.com"

  if my-ip == second-opinion
    console.log "Success! IP: #{my-ip}"
  else
    console.log "something went wrong"
)!
