def mayus?(palabra)
	bandera = false
	for i in 0...palabra.length
		if palabra [i] == "" || palabra[i] != palabra[i].upcase
			return bandera
		else
			bandera = true
		end
	end
	return bandera
end

# def abuela_sorda
# 	palabra = gets.chomp
# 	grito = mayus?(palabra)
# 	cuenta = 0
# 	while palabra != "Abuelita te quiero, pero tengo que irme" && cuenta != 1
# 		if palabra == ""
# 			cuenta += 1
# 		elsif grito == true
# 			puts "NO, NO DESDE 1983"
# 			cuenta = 0
# 		else
# 			puts "HUH?! NO TE ESCUCHO, HIJO!"
# 			cuenta = 0
# 		end
# 		palabra = gets.chomp
# 		grito = mayus?(palabra)
# 	end
# 	return "Ahi muere"
# end

get '/' do
	puts params
	@abuelita = params[:abuelita]
	# @abuelita = params[param]
		  
	erb :index
	# Visita app/views/index.erb
end

cuenta = 0
post '/abuelita' do
  @user_input = params[:user_input]
  argument = params[:user_input]
  grito = mayus?(argument)
  if cuenta > 1
  	redirect to("/?abuelita= llegale")
  else
 	# cuenta = 0
	# while argument != "Abuelita te quiero, pero tengo que irme" && cuenta != 1
		puts cuenta
		puts "estamos en el while"
		if argument == "Abuelita te quiero, pero tengo que irme"
			cuenta += 1
			puts cuenta
			redirect to("/?abuelita= llegale")
		elsif grito == true
			cuenta = 0
			redirect to("/?abuelita= NO, NO DESDE 1983")
		else
			cuenta = 0
			redirect to("/?abuelita= HUH?! NO TE ESCUCHO, HIJO!")
		end
		puts "la cuenta es: #{cuenta}"
	  # @abuelita = "otra vez"
		erb :index
	  # argument = params[:user_input]
	# end
	end
end

