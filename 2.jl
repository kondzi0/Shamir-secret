
function joinSecretPart(shares::Array, points::Array, primeNumber::Int64) 
    #Funkcja do odczytu tajemnicy 
    #Nic tylko podstawianie danych do wielomianu intetrpolacyjnego lagrange
    
  
    accum = 0
    for formula=1:length(shares)

        numerator = 1
	denominator = 1
	
        for count=1:length(shares)
        
           if formula == count 
              continue 
            end
            
            startposition = shares[formula]
            nextposition = shares[count]
            numerator = (numerator * (-nextposition)) % primeNumber
            denominator = (denominator * (startposition - nextposition)) % primeNumber
     
          end
        
        value = points[formula]  
        accum = (primeNumber + accum + (value * numerator *invmod(denominator,primeNumber))) % primeNumber
		
       end
   
    return accum
 end

 
function  makeFileForVisual(points::Array,shares::Array,primeNumber::Int64)
  
    f = open("/home/student/dane2.txt","w")
    println(f,"x=$points")
    println(f,"s=$shares")
    println(f,"p=$primeNumber")
       
    close(f)
end


function mainFunctionForJoinSecret(shares::Array, points::Array, primeNumber::Int64)
    #Funkcja do łączenia udziałów i odczytu tajemnicy
    joinSecretPart(points,shares,primeNumber)
    
    #Tworzenie pliku z danymi do wizualizacji
   makeFileForVisual(points,shares,primeNumber)
   include("odczyt.jl")
end

#Przykład wywołania funkcji
shares = [22852903,12383261,16673571]
points = [1,2,3]
primeNumber = 24041263

mainFunctionForJoinSecret(shares,points,primeNumber)
