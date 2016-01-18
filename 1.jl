
function generatePrimeNumber(moreThen::Int64)
    #Liczba pierwsza musi być liczbą większa niż tajemnica,dlatego
    #zwiększam o jeden i sprawdzam czy jest pierwsza, do czasu az napotkana 
    #liczba jest liczba pierwsza
        while !isprime(moreThen)
            moreThen += 1
        end
    
    return moreThen
end

function generatePoints(needed::Int64, primeNumber::Int64,secret::Int64)
    #Generujemy współczynniki wielomianu, losujemy ich needed - 1
    #gdyż jako pierwszy współczynnik przyjmujemy tajemnice (secret)
    #współczynniki musza byc mniejsze niz wygenerowana liczba pierwsza 
    # primeNumber  - 1
    points = Int64[]
    push!(points,secret)
    
    while needed > length(points)
        x = rand(1:primeNumber -1)
         if !in(x,points)
            push!(points,x)
        end
    end
    
    return points
   
end

function generateSecretPart(number::Int64, available::Int64, needed::Int64,coef::Array,prime::Int64) 
    #Wyliczanie udziałów
    #accum jest udziałem, tak więc podstawiamy wyliczone rzeczy pod wielomian i wyliczamy udział
    #coef = tablica z współczynnikami
        x = Int64
        exp = Int64
        c = Int64
        accum = Int64
        shares = Int64[]
      
        for x=1:available
             accum = coef[1]
            for exp=2:needed
                accum = (accum  + (coef[exp] * ((x^(exp-1) ) % prime) % prime)) % prime
            end 
      
        push!(shares, accum)
        accum = 0
        end
       
    return shares
end

function makeFileWithSecretPart(results::Array)
    #Tworze pliki z udziałami do pliku secret(numerudzialu).txt
    # w pliku znajduje sie w pierwszej lini "x"
    # a w drugim sam udział
    
    for i=1:length(results)
        f = open("/home/student/secret$i.txt","w")
    
        println(f,i)
        println(f,results[i])
        close(f)
    end
end


function  makeFileForVisual(s::Int64,t::Int64,n::Int64,p::Int64,results::Array,points::Array,wTab::Array)
    #Wpisywanie do pliku potrzebnych danych wymaganych do wizualizacji
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

function sharingSecret(secret::Int64, avalible::Int64,needed::Int64)
    # Główna funkcja programu
    
    p = Int64
    point = Array
    result = Array
    
    #generowanie liczby pierwszej
    p = generatePrimeNumber(secret)
    println("PrimeNumber: ",p)
    
    #generowanie punktów do wielomianu
    point = generatePoints(needed, p,secret)
    #println("Points: ",point)
    
    #obliczanie udziałów 
    result = generateSecretPart(secret, avalible, needed, point,p)
    #println("Result: ", result)
    
    #Tworzenie plików z udziałami
    #makeFileWithSecretPart(result)
    
   wTab = Int64[]
    for i=1:avalible
        push!(wTab,i)
    end
    
    #Tworzenie pliku do wizualizacji
    makeFileForVisual(secret,avalible,needed,p,wTab,result,point)
    println("Done!")
    include("podzial.jl")
end

sharingSecret(2404123,6,3)

