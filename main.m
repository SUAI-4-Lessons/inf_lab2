


xValues = -2:0.1:3
integralFun = @(x) exp((-x + 3) ^ 2)
yValues = []
integralSum = 0.0
latestIntegralValue = NaN

for x = xValues
  if (x >= 0 && x < 1)
    if (isnan(latestIntegralValue))
      latestIntegralValue = x
    endif
    integralSum += rectInt(latestIntegralValue, x, 0.0005, integralFun)
    yValues(end + 1) = integralSum
    latestIntegralValue = x
  elseif (x >= 1 && x <= 3)
    func = @(n) ((-1) ^ (n - 1) * (x - 2.0)) / n
    #yValues = [yValues, 0]

    yValues(end + 1) = -2 - getSumInfWithE(0.0001, func)
  else
    yValues(end + 1) = 0
  endif
endfor
plot(xValues, yValues)

