

function mainFunction(n::Int64,t::Int64,s::Int64)
    begin
        #getFile(s)
        p = generatePrimeNumber(t*t)
       
        #println(p)
        points = generatePoints(t,p)
       # println(points)
        wTab = wielomianPoints(p,n)
        r = wielomian(s,n,points,p,wTab)
       # println(r)
        makeFileWithSecretPart(r,t)
        makeFileForVisual(s,n,t,p,points,r,wTab)
        
        #losowanie punktow - done!
        #generowanie wielomianu
        #wysyłanie podzielonej tajemnicy
        #println("Ala ma ktoa")
        println("Wykonano!")
    end
end   
        

function generatePrimeNumber(moreThen::Int64)
        while !isprime(moreThen)
            moreThen += 1
           #println("inside while")
            # println(moreThen)
        end
   
    return moreThen
end



function generatePoints(n::Int64, primeNumber::Int64)
    points = Int64[]
    counter = 0
    while n > length(points)
        x = rand(1:primeNumber -1)
         if !in(x,points)
            push!(points,x)
        end
    end
    #println(points)
    #println(length(points))
    return points
   
end



function wielomianPoints(primeN::Int64, n::Int64)
      wTab = Int64[]
  
    
     while n > (length(wTab)+1)
        x = rand(1:primeN-1)
         if !in(x,wTab)
            push!(wTab,x)
        end
    end
        return wTab
    end

function wielomian(s::Int64,n::Int64, p::Array, primeN::Int64, wTab::Array)
    

 
    results = Int64[]
    
   

    for i=1:length(p)
        m = s
        y = p[i]
        for j=1:n-1
           m +=  wTab[j]^j *y
        
        end
        m =  mod(m,primeN)
    push!(results,m)
    end

   # println(results)
    return results
end




function getFile(x::Any)
  
    line::Any
    open(x, "r") do f
        for line in eachline(f)
            println(line)
        end
        # return line
    end
   
end



function  makeFileForVisual(s::Int64,t::Int64,n::Int64,p::Int64,results::Array,points::Array,wTab::Array)
   
    f = open("/home/student/dane.txt","w")
        println(f,"k=$s")
        println(f,"n=$n")
        println(f,"t=$t")
        println(f,"p=$p")
        println(f,"x=$points")
        println(f,"s=$results")
        println(f,"a=$wTab")
        close(f)
    end
    
function makeFileWithSecretPart(results::Array, t::Int64)
    
    for i=1:t
        f = open("/home/student/secret$i.txt","w")
        print(f,results[i])
        close(f)
    end
end

mainFunction(7,7,123124124)

include("podzial.jl")









