##
# 'getSumInfWithE' is a function get sum with some precision between two latest items
# -- e -- accuracy for answer
# -- fun -- equalation fun, which summes every iteration
# Author: Pankov Vasya <pank@pank.su>
##
function sum = getSumInfWithE(e, fun, reverseEveryIteration = false)
  validateattributes(e, {"numeric"}, {"scalar"})
  if !isa(fun, 'function_handle') || (length(fun) != 1)
    error('Аргумент должен быть анонимной функцией')
  endif
  n = 1
  lastEl = fun(n)
  sum = lastEl
  do
    newEl = lastEl
    n += 1
    if (reverseEveryIteration)
      lastEl *= -fun(n)
    else
      lastEl *= fun(n)
    endif
    sum += lastEl
  until (e > abs(newEl - lastEl))  
endfunction

