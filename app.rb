require 'sinatra'
# require 'sendgrid-ruby'
# include SendGrid


$userRequests = [];

get "/" do
	erb :home	
end

post "/email" do

	redirect "/thanks"
end

get "/thanks" do

	erb :thanks
end

get "/contact" do

	erb :contact
end

get "/makeCake" do
	class Cake
		attr_reader :type, :price
		attr_accessor :quantity
		def initialize(type, quantity)
			@price = getPrice(type)
			@type = type
			@quantity = quantity
		end
	end
	def getPrice(type)

		if(type == "One Layer")
			return 10
		elsif (type == "Two Layer")
			return 25
		elsif (type == "Full Sheet")
			return 40
		end	
	end

	def makeCake(type, amount)
		array = []
		if $userRequests.length == 0

		else
			array = $userRequests.select { |e| e.class.to_s == "Cake"}
			array = array.select { |e| e.type == type  }
		end

		if(array.length==0)

			cake = Cake.new(type, amount);
			$userRequests << cake

		else
			$userRequests.map { |e| 
				if e.class.to_s == "Cake" && e.type ==type
					e.quantity = amount
				end }
			# $userRequests << cookie;
		end
		p array
		array = []
	end
	type = params[:type]
	numberToMake = params[:quantity].to_i

	makeCake(type,numberToMake)
	p $userRequests
	redirect "/cake"
end

get "/cake" do

	erb :cake
end
get "/makecookies" do
	class Cookie
		attr_reader :type, :price
		attr_accessor :quantity
		def initialize(type, quantity)
			@price = getPrice(type)
			@quantity = quantity
			@type = type
		end
	end
	def getPrice(type)
		if type == "Peanut Butter Sandwich"
			return 2.0
		else
			return 1.5
		end	
	end

	def makeCookies(type, amount)
		array = []
		if $userRequests.length == 0

		else
			array = $userRequests.select { |e| e.class.to_s == "Cookie"}
			array = array.select { |e| e.type == type  }
		end

		if(array.length==0)

			cookie = Cookie.new(type, amount);
			$userRequests << cookie

		else
			$userRequests.map { |e| 
				if e.class.to_s == "Cookie" && e.type ==type
					e.quantity = amount
				end }
			# $userRequests << cookie;
		end
		p array
		array = []
	end

	type = params[:type]
	numberToMake = params[:quantity].to_i

	makeCookies(type,numberToMake)
	p $userRequests
	redirect "/cookie"
end

get "/cookie" do

	erb :cookie
end

get "/makeMuffin" do

	class Muffin
		attr_reader :type, :price
		attr_accessor :quantity
		def initialize(type, quantity)
			@price = 1.50
			@type = type
			@quantity = quantity
		end
	end


	def makeMuffin(type, amount)
		array = []
		if $userRequests.length == 0

		else
			array = $userRequests.select { |e| e.class.to_s == "Muffin"}
			array = array.select { |e| e.type == type  }
		end

		if(array.length==0)

			muffin = Muffin.new(type, amount)
			$userRequests << muffin

		else
			$userRequests.map { |e| 
				if e.class.to_s == "Muffin" && e.type == type
					e.quantity = amount
				end }
			# $userRequests << cookie;
		end
		p array
		array = []
	end


	type = params[:type]
	numberToMake = params[:quantity].to_i

	makeMuffin(type,numberToMake)
	p $userRequests
	redirect "/muffin"
end

get "/muffin" do

	erb :muffin
end