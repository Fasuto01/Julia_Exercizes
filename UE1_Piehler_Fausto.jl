
#=
Fuege in dieses Template deine Loesungscodes ein.
Wichtig 1: Die Datei gemaess der Namensrichtlinien benennen.
Wichtig 2: Bitte nur die Funktionen ausprogrammieren und keine Funktionsaufrufe vornehmen.
=#


### Beispiel 1:

function greatest(x::Vector{T}, k::Integer = 1) :: Vector{T} where {T <: Real}

    #Parameter k checks
    if k<1 || k>=length(x)
        throw("Error: Integer k needs to be equal or greater than 1 and smaller than length(x)");
    end

    #sort vector x in reverse order (largest number has index 1)
    sorted_x = sort(x, rev = true)

    #Index sorted elements based on provided length k
    k_largest_elements = sorted_x[1:k]

    #filter vector x based on all elements existin in k_greatest elements to keep order
    result = filter( n -> n in k_largest_elements, x)

    return(result)
end 


### Beispiel 2

function nearestindex(x::Vector{<:Real}, y::Real) :: Int
    
    #calculate difference between n and x 
    diff_x = abs.(x .- y)

    #Collect all indices which connect to differences which are equal to the minimum difference
    index_min_diff = findall(m->m==minimum(diff_x), diff_x)

    #Randomly draw one of the Indices
    random_indice = rand(index_min_diff)
    return(random_indice)
end


### Beispiel 3

function swap!(x::Vector, i::Integer, j::Integer) :: Nothing
    x_n = x[i]
    x[i] = x[j]
    x[j] = x_n
    return nothing
end

function bubblesort!(x::Vector{<:Real}; rev::Bool = false) :: Nothing
    #Initialize last index for i as length-1 since second to last element is t he last we will check in the for loop
    last_index = length(x)-1



    #Initialize while loop until list is sorted
    sorted = false
    while !sorted
        sorted = true
        
        #Iterated through the list and checks if element is larger than next element 
        for i in 1:last_index
            j = i+1
            #if element is larger than next element swap and set sorted to false 
            if x[i] > x[j]
                swap!(x, i, j)
                sorted = false
            end
        end 
        #previous last index has already been correcly sorted so in the next loop unnessecary to check
        last_index -=1
    end 

    #change order to reverse order if rev = true 
    
    if rev 
        reverse!(x)
    end
    return nothing
end 


### Beispiel 4

function canonicaltour(x::Vector{T}) :: Vector{T} where {T <: Integer}

    #check if x is a permutation 1:length(x)
    perm = collect(1:length(x))
    check = length(filter(d->d in perm, x))

    #checks if length of all numbers in the vector x that also are in permutation 1:lenght(x9 is equal to length(x))
    if length(x) != check
        throw("x must be a permutation of the numbers 1 to length(x)")
    end


    #first condition get order such that 1 is the start 
    pos_one = findall(x .==1)[1]

    #possible orders clockwise or counter clockwise from 1 
    clockwise = vcat(x[pos_one:end],x[1:pos_one-1])
    counter_clock = vcat(x[pos_one:-1:1],x[end:-1:pos_one+1])

    #select tour based on second position being lower compared to other way aroung 
    x_use = clockwise[2]<counter_clock[2] ? clockwise : counter_clock

    return(x_use) 
end 


### Beispiel 5

function distance(x::Vector{<:Real}, y::Vector{<:Real}; p::Real = 2)
    if length(x) != length(y)
        throw("x and y must be of the same length")
   end
   if p <= 0
       throw("p must be greater than zero")
   end

   #p distance Calculation split into two parts: ineer and outer part of the function
   elements = abs.(x - y).^p
   p_dist = sum(elements)^(1/p)
   return(p_dist)
end