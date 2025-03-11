############## Operations on Dual numbers ###############

## Overloading Base operations

### Addition

Base.:+(d::DNumber) = d
Base.:+(d1::DNumber{T1}, D2::DNumber{T2}) where{T1 <: Number, T2 <: Number} = DNumber(d1[1] + d2[1], d1[2] + d2[2])
Base.:+(n::Number, d::DNumber) = DNumber(n + d[1], d[2])
Base.:+(d::DNumber, n::Number) = n + d

### Substraction 

Base.:-(d::DNumber) = DNumber(-d[1], -d[2])
Base.:-(d1::DNumber, d2::DNumber) = d1 + (-d2)
Base.:-(n::Number, d::DNumber) = n + (-d)
Base.:-(d::DNumber, n::Number) = (-n) + d

### Product

Base.:*(d1::DNumber, d2::DNumber) = DNumber(d1[1]*d2[1], d1[1]*d2[2] + d1[2]*d2[1])
Base.:*(n::Number, d::DNumber) = DNumber(n * d[1],n * d[2])
Base.:*(d::DNumber, n::Number) = n * d

### Division 

Base.:/(d::DNumber,n::Number) = n == 0 ? throw(ZeroDivisionError("Trying to divide by 0")) : DNumber(d[1]\n, d[2]\n)
Base.:/(n::Number, d::DNumber) = d[1] == 0 ? throw(ZeroDivisionError("Trying to divide by 0")) : (n * conj(d))/d[1]^2
Base.:/(d1::DNumber, d2::DNumber) = d2[1] == 0 ? throw(ZeroDivisionError("Trying to divide by 0")) : (d1 * conj(d2))/(d2[1])^2

### Others

conj(d::DNumber) = DNumber(d[1], -d[2])