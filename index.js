// Generated by LiveScript 1.2.0
(function(){
  var co, thunkify, request, get;
  co = require('co');
  thunkify = require('thunkify');
  request = require('request');
  get = thunkify(request.get);
  co(function*(){
    var a, b;
    a = get("http://google.com");
    b = get("http://yahoo.com");
    console.log(a.status);
    console.log(b.status);
  })();
}).call(this);