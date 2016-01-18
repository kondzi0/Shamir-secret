Aplikacja ma za zadanie podzielić podaną tajemnicę wśród uczestników według protokołu podziału Shamira. 
Aplikacja składa się z dwóch części tj. podziału i odczytu. Każda z nich wywoływana jest osobno a podczas działania programu uruchamia się również wizualizacja okienkowa, która krok po kroku pokazuje co zostało wykonane.
Do poprawnego działania aplikacji wymagana jest instalacja pakietu GTK. Za pomocą tego pakietu program uruchomi okno pokazujące krok po kroku działanie algorytmu podziału oraz odczytu Shamira dla danych wejściowych programu.
Parametry wywołania podziału tj. liczba uczestników, minimalna ilość uczestników, którzy są w stanie odczytać tajemnicę oraz treść tajemnicy podaje się przy wywołaniu głównej funkcji w pliku shamir1.jl
Parametry wywołania odczytu to udziały uczestników chcących odczytać tajemnicę, numery uczestników oraz liczba pierwsza
Wizualizacja korzysta z dwóch pakietów, GTK oraz Polynomials. Pierwszy pakiet umożliwia stworzenie interfejsu graficznego a drugi tworzy wielomian z podanych argumentów. 
Zostało utworzone jedno główne okno oraz 4 ramki, które zmieniają się w zależności od kroku algorytmu. Wszystkie elementy widoczne w oknie są przypisane do konkretnej ramki, która jest "rysowana" w oknie po naciśnięciu kolejnego przycisku. Działaniem przycisków jest zniszczenie aktualnej ramki i utworzenie ramki kolejnej. Przykładem jest przycisk "krok 1" dla podziału.
id = signal_connect(step1, "clicked") do widget
	destroy(f0)
	destroy(h0)
	push!(win,f1)
	showall(win)
end
gdzie usuwane są elementu a tworzona jest kolejna ramka.
polecenie @Window  tworzy okno, @Frame -  Ramkę  a @Button - przyciski.  Wszystkie elementy takie jak wyświetlane teksty czy argumenty z pliku, są zapisane w kolekcji @Box, która później jest wyświetlona w konkretnej ramce. Jakiekolwiek wyświetlenie elementu na ekranie, czy to jest ramka, przycisk, kolekcja czy elementy kolekcji, polega na wykorzystaniu polecenia push!(a,b), gdzie "a" to jest element nadrzędny a "b" to element wyświetlany w elemencie nadrzędnym.
Po podaniu argumentów wielomianu do Funkcji Poly z biblioteki Polynomials, program tworzy dla nich postać wielomianową. 
Wszystkie zmienne są pobierane z pliku dane, które są uzupełniane poprzez główną aplikację.





















Schemat działania programu

1.	Podział 

sharingSecret(secret::Int64, avalible::Int64,needed::Int64)
Do poprawnego działania protokołu podziału potrzebne są trzy argumenty:
•	Tajemnice
•	Liczba wszystkich uczestników którzy biorą udział w podziale
•	Liczba uczestników potrzebnych do odczytania tajemnicy

generatePrimeNumber(secret::Int64)
Pierwszym krokiem jest wygenerowanie dostatecznie dużej liczby pierwszej p,  gdyż               wszystkie obliczenia będą wykonywane w ciele Zp.
 
generatePoints(needed::Int64,secret::Int64,primeNumber::Int64)
Następnie generowane są współczynniki wielomianu dla którego będziemy wyliczać udział dla każdego z uczestników protokołu

generateSecretPart(number::Int64, available::Int64, needed::Int64,coef::Array,prime::Int64)
Po wykonaniu tej czynności dla każdego z uczestników zostaje wygenerowany jest udział.

makeFileWithSecretPart(results::Array)
Na zakończenie sa generowane pliki z udziałami dla każdego z uczestników



2.	Odczyt
joinSecretPart(shares::Array, points::Array, primeNumber::Int64)
Tak samo jak przy podziale potrzebne są trzy argumenty:
•	Tablica z udziałami uczestników 
•	Tablica z punktami 
•	Liczbę pierwsza 
Wszystkie podane argumenty są potrzebne do obliczenia wielomianu interpolacyjnego Lagrange`a. Po wyliczeniu wielomianu jako wynik dostajemy tajemnice która chcieliśmy uzyskać 




