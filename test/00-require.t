#! /usr/bin/lua

require 'Test.More'

plan(8)

if not require_ok 'MessagePack' then
    BAIL_OUT "no lib"
end

local m = require 'MessagePack'
type_ok( m, 'table' )
like( m._COPYRIGHT, 'Perrad', "_COPYRIGHT" )
like( m._DESCRIPTION, 'MessagePack', "_DESCRIPTION" )
like( m._VERSION, '^%d%.%d%.%d$', "_VERSION" )

type_ok( m.packers, 'table', "table packers" )
type_ok( m.unpack_cursor, 'function', "function unpack_cursor" )
type_ok( m.build_ext, 'function', "function build_ext" )

if m.full64bits then
    diag "full 64bits with Lua 5.3"
end
