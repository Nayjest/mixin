###
mixin module

@author Vitalii [Nayjest] Stepanenko <gmail@vitaliy.in>
###
define [], ()->

  _getNewProto = (Class, mixinProto)->
    f = ->
    f.prototype = Class.prototype
    proto = new f()
    for name, prop of mixinProto
      if mixinProto.hasOwnProperty name
        proto[name] = prop
    proto


  _processMultiple = (Class, mixins, defaultBeforeConstruct)->
    target = Class
    for m in mixins
      if m instanceof Array
        target = mixin target, m[0], m[1]
      else
        target = mixin target, m, defaultBeforeConstruct
    return target

  mixin = (Class, Mixin, beforeConstruct = no)->
    if Mixin instanceof Array
      return _processMultiple.apply @, arguments
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