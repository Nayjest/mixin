mixin
=====

Javascript / coffeescript mixin function

Implements multiple inheritance via prototypes

# Features
    * no merging objects on class instantiation (fast!), mixin prototype properties merged to prototype of new class only when you creating that mixed class
    * possibility to call mixin constructors before or after main class constructor
    * correct inheritanse chain preserved
    * mixin may be a class(function) with some prototype properties or just simple object for extending prototype of new class
    * creating mixed class don't affects on target class, it creates new one

# usage:

 NewClass = mixin(<class>, <mixin>, <beforeConstruct> = no)

 Where
 * {Function} *class* is constructor of main class,
 * {Function|Object} *mixin* is mixin constructor or object that will be merged to new class prototype
 * {Boolean} *beforeConstruct* set true if you need to call mixin constructor before main class constructor



