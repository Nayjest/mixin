###
Class may be used as mixin or base class for classes that should support events

@author Vitalii [Nayjest] Stepanenko <gmail@vitaliy.in>
###
define ['components/jquery/jquery'], ()->
  class EventsMixin

    constructor: ()->
      @eventHandlers ?= {}

    on: (eventName, handler)->
      callbacks = @eventHandlers[eventName]
      if !callbacks
        @eventHandlers[eventName] = callbacks = $.Callbacks()
      callbacks.add handler

    fireEvent: (eventName, options)->
      callbacks = @eventHandlers[eventName]
      if $callbacks
        $callbacks.fireWith @, options