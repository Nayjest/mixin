// Generated by CoffeeScript 1.6.2
/*
mixin module

@author Vitalii [Nayjest] Stepanenko <gmail@vitaliy.in>
*/


(function() {
  define([], function() {
    var mixin, _getNewProto, _processMultiple;

    _getNewProto = function(Class, mixinProto) {
      var f, name, prop, proto;

      f = function() {};
      f.prototype = Class.prototype;
      proto = new f();
      for (name in mixinProto) {
        prop = mixinProto[name];
        if (mixinProto.hasOwnProperty(name)) {
          proto[name] = prop;
        }
      }
      return proto;
    };
    _processMultiple = function(Class, mixins, defaultBeforeConstruct) {
      var m, target, _i, _len;

      target = Class;
      for (_i = 0, _len = mixins.length; _i < _len; _i++) {
        m = mixins[_i];
        if (m instanceof Array) {
          target = mixin(target, m[0], m[1]);
        } else {
          target = mixin(target, m, defaultBeforeConstruct);
        }
      }
      return target;
    };
    return mixin = function(Class, Mixin, beforeConstruct) {
      var construct, haveConstructor, mixinProto, proto;

      if (beforeConstruct == null) {
        beforeConstruct = false;
      }
      if (Mixin instanceof Array) {
        return _processMultiple.apply(this, arguments);
      }
      haveConstructor = typeof Mixin === "function";
      mixinProto = haveConstructor ? Mixin.prototype : Mixin;
      proto = _getNewProto(Class, mixinProto);
      if (haveConstructor) {
        if (beforeConstruct) {
          construct = function() {
            Mixin.apply(this, arguments);
            Class.apply(this, arguments);
            return this;
          };
        } else {
          construct = function() {
            Class.apply(this, arguments);
            Mixin.apply(this, arguments);
            return this;
          };
        }
      } else {
        construct = function() {
          Class.apply(this, arguments);
          return this;
        };
      }
      construct.prototype = proto;
      construct.__super__ = Class.prototype;
      proto.constructor = construct;
      return construct;
    };
  });

}).call(this);
