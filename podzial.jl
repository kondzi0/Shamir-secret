include("dane.txt")

#wymagane biblioteki
using Polynomials
using Gtk.ShortNames

#utworzenie obiektów
    win = @Window("Shamir",200,200) #okno
    f0 = @Frame("Podział")
    f1 = @Frame("krok 1")
    f2 = @Frame("krok 2")
    f3 = @Frame("krok 3")
    
    step1 = @Button("krok 1")
    step2 = @Button("krok 2")
    step3 = @Button("krok 3")
    exit = @Button("Zakończ")
    
    d = Int64[]
    
#########krok 0
    h0 = @Box(:v) 
    setproperty!(h0,:spacing,10)
    push!(h0,"")
    push!(h0,"Wymagane paramentry,")
    push!(h0,"które zostały wprowadzone to:")
    push!(h0,"")
    push!(h0,"Tajemnica k = $k")
    push!(h0,"t = $t")
    push!(h0,"ilość uczesntników n = $n")
    push!(h0,"Ciało Zp = $p")

    for i in 1:length(x)
    push!(h0,"x$i dla uczestnika $i = $(x[i])")
    end

    push!(h0, step1)
    push!(f0,h0)

########## krok 1
    h1 = @Box(:v) 
    setproperty!(h1,:spacing,10)
    push!(h1,"")
    push!(h1," wylosowane współczynniki, to:")
    push!(h1,"")
    for i in 1:length(a)
    push!(h1,"a$i = $(a[i])")
    end
  
    push!(h1, step2)
    push!(f1, h1)

############ krok 2
    fx = "f(x)= $k"
    h2 = @Box(:v) 
    setproperty!(h2,:spacing,10)
    push!(h2,"")
    push!(h2,"Wielomian ma postać:")
    push!(h2,"")
    
    #wypisanie wielomianu
    push!(d, k)
    ab = [d;a]
    f = Poly([ab])
    push!(h2, "f(x) = $f")
    
    push!(h2,"")
    push!(h2,"Wielomian dla konkretnego uczestnika ma postać: ")
    push!(h2,"")
   
   fxj =""
   for  j in 1:length(x)
    fxj = "U$j : f($(x[j]))= $k "
    for i in 1:length(a)
    fxj = string(fxj," + $(a[i]) * $(x[j])^$i")
    
     
    end
    push!(h2, fxj)
    end
   

    push!(h2, step3)
    push!(f2, h2)


 ############ krok 3
    h3 = @Box(:v) 
    setproperty!(h3,:spacing,10)
    push!(h3,"")
    push!(h3,"Wyliczne Udziały dla Uczestników to:")
    push!(h3,"")
    
    for i in 1:length(s)
    push!(h3, "Udział s$i = $(s[i])")
    end
    
    push!(h3, exit)
    push!(f3, h3)

    
    
######## Button 1
id = signal_connect(step1, "clicked") do widget
    destroy(f0)
    destroy(h0)
    
    push!(win, f1)
    showall(win)
end
   

   
######## Button 2
id2 = signal_connect(step2, "clicked") do widget
    destroy(f1)
    destroy(h1)
    
    push!(win, f2)
    showall(win)
end
    
    
######## Button 3
id3 = signal_connect(step3, "clicked") do widget
    destroy(f2)
    destroy(h2)
    
    push!(win, f3)
    showall(win)

end
    
    
######## Button 4
id4 = signal_connect(exit, "clicked") do widget
       destroy(win)
       
end
     
     
         
  push!(win, f0)
  showall(win)
