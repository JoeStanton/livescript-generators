require! <[co thunkify request]>
get = thunkify(request.get)

co(->*
  # Skip the first param, it's the response, body is next
  [_, my-ip] = yield get "http://wtfismyip.com/text"
  [_, second-opinion] = yield get "http://icanhazip.com"

  if my-ip == second-opinion
    console.log "Success! IP: #{my-ip}"
  else
    console.log "something went wrong"
)!
