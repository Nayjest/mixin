define [], ()->

  _getNewProto = (Class, mixinProto)->
    f = ->
    f.prototype = Class.prototype
    proto = new f()
    for name, prop of mixinProto
      if mixinProto.hasOwnProperty name
        proto[name] = prop
    proto


  mixin = (Class, Mixin, beforeConstruct = no)->
    haveConstructor = typeof Mixin is "function"
    mixinProto =  if haveConstructor then Mixin.prototype else Mixin
    proto = _getNewProto Class, mixinProto
    if haveConstructor
      if beforeConstruct
        construct = ->
          Mixin.apply @, arguments
          Class.apply @, arguments
          @
      else
        construct = ->
          Class.apply @, arguments
          Mixin.apply @, arguments
          @
    else
      construct = ->
        Class.apply @, arguments
        @
    construct.prototype = proto
    # @todo test this
    proto.constructor = construct
    construct