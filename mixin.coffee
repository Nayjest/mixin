define [], ()->
  mixin = (Class, Mixin)->
    f = ->
    f.prototype = Class.prototype
    proto = new f()
    for name, prop of Mixin.prototype
      if Mixin.prototype.hasOwnProperty name
        proto[name] = prop

    construct = ->
      Class.apply @, arguments
      Mixin.apply @, arguments
      @
    construct.prototype = proto
    constrcut