### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# ╔═╡ a10105d6-4ae0-11eb-0192-2f51f6c7cf2b
begin
	using Flux
	using Gadfly
end

# ╔═╡ fb607214-4ae0-11eb-1642-277331455b29
begin #household functions and variables
	model(X) = W*X .+ b
	loss(W,b,X,y) = sum(((W.-X).^2).+((b.-y).^2))#sum((model(x) .- y).^2)

	function init(n::Int)
	W = rand(n)
	b = zeros(n)
	X, y = rand(n), rand(n)
		return W,b,X,y
	end
	W,b,X,y=init(100)
end

# ╔═╡ b17b71c6-4ae0-11eb-2693-7dc486447d0e
begin
	d = gradient(() -> loss(W,b,X,y), params(W, b))
	dW,db = d[W],d[b]
	
	W .-= 0.01 * dW
	b .-= 0.01 * db
	
	l=loss(W,b,X,y)
	
	plot(layer(x=X,y=y),layer(x=W,y=b,Geom.line))
end

# ╔═╡ 237e0690-4ae5-11eb-3c50-c1be36fa96ef
l

# ╔═╡ Cell order:
# ╠═a10105d6-4ae0-11eb-0192-2f51f6c7cf2b
# ╠═fb607214-4ae0-11eb-1642-277331455b29
# ╠═237e0690-4ae5-11eb-3c50-c1be36fa96ef
# ╠═b17b71c6-4ae0-11eb-2693-7dc486447d0e
