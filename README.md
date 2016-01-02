Aplikacja ma za zadanie podzielić podaną tajemnicę wśród uczestników według protokołu podziału Shamira. 

Do poprawnego działania aplikacji wymagana jest instalacja pakietu GTK. Za pomocą tego pakietu program uruchomi okno pokazujące krok po kroku działanie algorytmu podziału Shamira dla danych wejściowych programu.

Parametry wywołania tj. liczba uczestników, minimalna ilość uczestników, którzy są w stanie odczytać tajemnicę oraz treść tajemnicy podaje się przy wywołaniu głównej funkcji w pliku shamir1.jl

Aplikacja składa się z dwóch części tj. podziału i odczytu. Każda z nich wywoływana jest osobno a podczas działania programu uruchamia się również aplikacja okienkowa, która krok po kroku pokazuje co zostało wykonane.

"Animacja" korzysta z dwóch pakietów, GTK oraz Polynomials. Pierwszy pakiet umożliwia stworzenie interfejsu graficznego a drugi tworzy wielomian z podanych argumentów. 
Zostało utworzone jedno główne okno oraz 4 ramki, które zmieniają się w zależności od kroku algorytmu. Wszystkie elementy widoczne w oknie są przypisane do konkretnej ramki, która jest "rysowana" w oknie po naciśnięciu kolejnego przycisku. Działaniem przycisków jest zniszczenie aktualnej ramki i utworzenie ramki kolejnej. Przykładem jest przycisk "krok 1".
id = signal_connect(step1, "clicked") do widget
	destroy(f0)
	destroy(h0)
	push!(win,f1)
	showall(win)
end

gdzie usuwane są istniejące elementy a tworzona jest kolejna ramka.
Wszystkie zmienne są pobierane z pliku dane, które są uzupełniane poprzez główną aplikację.





















