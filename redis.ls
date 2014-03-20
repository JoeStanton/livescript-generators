require! <[co thunkify fs redis]>

co(->*
  db = redis.create-client!

  db.get = thunkify db.get
  db.set = thunkify db.set
  db.del = thunkify db.del

  yield db.set "feeling", "impressed"
  feeling = yield db.get "feeling"
  yield db.del "feeling"

  console.log "You are : #{feeling}"
)!
