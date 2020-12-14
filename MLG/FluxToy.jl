### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# ╔═╡ 864b72c0-3e11-11eb-2cd6-9951cdcb78c3
begin#imports
	using Flux:gradient,params
	using Flux.Optimise:Descent,train!,@epochs
	using Statistics:mean
end

# ╔═╡ 588bf94e-3e17-11eb-216c-090eb107222e
using Flux:Chain,Dense,softmax

# ╔═╡ c30bbc58-3e11-11eb-1e98-cda1cf1337e3
begin #one-variable gradient
	f(x)=x^2
	df(x)=gradient(f,x)
end

# ╔═╡ a055c570-3e12-11eb-07d2-955dda5ae765
f(3),df(3)

# ╔═╡ e3427b4e-3e12-11eb-3779-7fa565a2bc17
begin #multivariable
	g(x,y,z)=x.*42 .+ y^2 .+ sin(z)
	dg(x,y,z)=gradient(g,x,y,z)
end

# ╔═╡ f2632f96-3e13-11eb-373c-d5bc583b99e9
dg(4,0,0)

# ╔═╡ bcf3b9d8-3e14-11eb-0f98-7f9dde938646
begin
	x=rand(42,1)
	W=rand(1,42)
	U=rand(1)
	grads = gradient(()->(W*x*U)[1], params([W,U]))
end

# ╔═╡ 40d88bd4-3e15-11eb-2628-71a41b821c59
grads[W],grads[U]

# ╔═╡ 354afdd6-3e17-11eb-2b2a-8fc10a36d820
model=Chain(Dense(42,9),
	Dense(9,1))

# ╔═╡ 6932f126-3e17-11eb-3b87-e5bdbd2a3f54
model(x)

# ╔═╡ ae7c1ad2-3e17-11eb-074a-03df157b9566
params(model)

# ╔═╡ 33b26a94-3e18-11eb-1125-af41dc7537e7
begin
X,y=rand(42,1000),rand(42,1000)
loss(x, y) = mean((model(x).-y))
@epochs 5 train!(loss, params(model), [(X,y)], Descent(1e-3))
end

# ╔═╡ 47eeeb8a-3e19-11eb-2158-5bf7ceb2ed90
loss(X,y)

# ╔═╡ Cell order:
# ╠═864b72c0-3e11-11eb-2cd6-9951cdcb78c3
# ╠═c30bbc58-3e11-11eb-1e98-cda1cf1337e3
# ╠═a055c570-3e12-11eb-07d2-955dda5ae765
# ╠═e3427b4e-3e12-11eb-3779-7fa565a2bc17
# ╠═f2632f96-3e13-11eb-373c-d5bc583b99e9
# ╠═bcf3b9d8-3e14-11eb-0f98-7f9dde938646
# ╠═40d88bd4-3e15-11eb-2628-71a41b821c59
# ╠═588bf94e-3e17-11eb-216c-090eb107222e
# ╠═354afdd6-3e17-11eb-2b2a-8fc10a36d820
# ╠═6932f126-3e17-11eb-3b87-e5bdbd2a3f54
# ╠═ae7c1ad2-3e17-11eb-074a-03df157b9566
# ╠═33b26a94-3e18-11eb-1125-af41dc7537e7
# ╠═47eeeb8a-3e19-11eb-2158-5bf7ceb2ed90
