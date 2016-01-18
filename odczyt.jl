include("dane2.txt")

#wymagana biblioteka
using Gtk.ShortNames

    win1 = @Window("Shamir",200,200) #okno
    fr0 = @Frame("Odczyt")
    fr1 = @Frame("krok 1")
    fr2 = @Frame("krok 2")
    fr3 = @Frame("krok 3")
    
    stepp1 = @Button("krok 1")
    stepp2 = @Button("krok 2")
    stepp3 = @Button("krok 3")
    exitt = @Button("Zakończ")
    
    
#########krok 0
    hr0 = @Box(:v) 
    setproperty!(hr0,:spacing,10)
     
  
   push!(hr0,"Użytkownicy z udziałami o podanych numerach chcą odczytać tajemnicę.")
    
  for i in 1:length(points)
  
    push!(hr0,"x[$(points[i])] = $(s[i]) ")
    end
    
        push!(hr0, stepp1)
    push!(fr0,hr0)

    
########## krok 1
    hr1 = @Box(:v) 
    setproperty!(hr1,:spacing,2)
    
    push!(hr1,"")
    push!(hr1,"Tworzenie węzłów wielomianu Lagrange'a:")
    
    push!(hr1, "Ogólny wzór dla węzła wielomianu ma postać: ")
    push!(hr1, "")
    push!(hr1, "               y_i(x-x1)(x - x2)....(x - x_n)")
    push!(hr1, "a_i(x) = -----------------------------")
    push!(hr1, "                    (x_i - x1)(x_i - x2)....(x_i - x_n)")

    push!(hr1, stepp2)
    push!(fr1,hr1)


  ############ krok 
    hr2 = @Box(:v) 
    setproperty!(hr2,:spacing,10)
    
    push!(hr2,"")
    push!(hr2,"Wielomian f(x) jest to suma węzłów")
    push!(hr2,"")
   
    
    push!(hr2, "f(x) = sum(a[])")
 
    push!(hr2, stepp3)
    push!(fr2, hr2)
   
   
    ############ krok 4
    hr3 = @Box(:v) 
    setproperty!(hr3,:spacing,10)
    
    push!(hr3,"")
    push!(hr3,"tajemnica to rozwiązanie wielomianu f(x) dla x = 0")
    push!(hr3,"")
    push!(hr3,"Tajemnica k = $k")

    push!(hr3, exitt)
    push!(fr3, hr3)
   
    
    
######## Button 1
idd = signal_connect(stepp1, "clicked") do widget
    destroy(fr0)
    destroy(hr0)
    
    push!(win1, fr1)
    showall(win1)
end
   

   
######## Button 2
idd2 = signal_connect(stepp2, "clicked") do widget
    destroy(fr1)
    destroy(hr1)
    
    push!(win1, fr2)
    showall(win1)
end
    
    
######## Button 3
idd3 = signal_connect(stepp3, "clicked") do widget
    destroy(fr2)
    destroy(hr2)
    
    push!(win1, fr3)
    showall(win1)

end
    
    
    
######## Button 4
idd4 = signal_connect(exitt, "clicked") do widget
       destroy(win1)
       
end
     
     
         
  push!(win1, fr0)
  showall(win1)
