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
  newEl = fun(n)
  sum = newEl
  do
    lastEl = newEl
    n += 1
    if (reverseEveryIteration) 
      newEl *= -fun(n)
    else
      newEl *= fun(n)
    endif
    sum += newEl
  until (e > abs(newEl - lastEl))  
endfunction

