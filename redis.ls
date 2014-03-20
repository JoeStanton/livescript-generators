require! <[co thunkify fs redis]>
db = redis.create-client!
db.on "error", -> console.error "Can't connect to redis, giving up"

db.get = thunkify db.get
db.set = thunkify db.set
db.del = thunkify db.del

co(->*
  yield db.set "feeling", "impressed"
  feeling = yield db.get "feeling"
  yield db.del "feeling"

  console.log "You are : #{feeling}"
)!
