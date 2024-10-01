##
# 'rectInt' is a function get integral from function by rectangle method
# -- start -- start number
# -- finish -- last number
# -- dx -- interval
# -- fun -- anonymus function with one argument
# Author: Pankov Vasya <pank@pank.su>
##

function square = rectInt(start, finish, dx, fun)
  validateattributes(start, {"numeric"}, {"scalar"})
  validateattributes(finish, {"numeric"}, {"scalar"})
  if (start == finish)
    square = 0
    return
  endif
  validateattributes(dx, {"numeric"}, {"scalar"})

  if !isa(fun, 'function_handle') || (length(fun) != 1)
    error('Аргумент должен быть анонимной функцией')
  endif
  square = 0
  for x = start:dx:finish
    square += fun(x)
  endfor
  square *= dx
  
endfunction
