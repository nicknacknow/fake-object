# fake-object

This module can be required in your Lua code.
It uses the newproxy function which is only available in earlier versions of Lua (I believe).
Personally, I use Lua 5.1.4 however 5.1.5 supports this aswell.

By requiring it, you call the new() function, which can take a string as an argument for the name of this object.
The fake object is returned from the function for you to use in your code.
When trying to output/print the object, it'll just output the name given in the function.
If you don't give a name, it'll automatically assume 'object' as its name.

Example:

local object = require("fake-object"):new("object-name")

object.name = "hello!"

print(object.name) >> "hello!"

print(object) >> "object-name"
