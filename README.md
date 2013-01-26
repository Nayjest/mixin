mixin
=====

*Javascript / coffeescript mixin function*

Implements multiple inheritance via prototypes

### Features

 * no merging objects on class instantiation , mixin prototype properties are merged to prototype of new class only when you creating that mixed class
 
 * possibility to call mixin constructors before or after main class constructor
 
 * correct inheritanse chain preserved
 
 * mixin may be a class(function) with some prototype properties or just simple object for extending prototype of new class
 
 * creating mixed class don't affects on target class, it creates new one

### Usage:

 NewClass = mixin( *Class*, *Mixin*, *beforeConstruct* = false )

 Where:
 * {Function} **Class** is constructor of main class,
 * {Function|Object} **Mixin** is mixin constructor or object that will be merged to new class prototype
 * {Boolean|null} **beforeConstruct** set true if you need to call mixin constructor before main class constructor

### License

Copyright 2012 Vitalii Stepanenko

Licensed under the MIT License

