### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# ╔═╡ 61fd28c2-3ed0-11eb-083a-05e43d8bae12
begin #imports
	using Gadfly
	using DataFrames:DataFrame,select,select!,Not
	using CSV:File
end

# ╔═╡ 95b71286-3ed0-11eb-16a1-c1f5f0281a23
begin #running this cell sets our data and target
data=File("FluxTrain")|>DataFrame
#select!(data,Not(:Column1))
end

# ╔═╡ cb220b46-3ed6-11eb-0e87-6f9fb238cc8c
plot(layer(data,y="error(ms)",x=:Column1,Geom.line,color=[colorant"red"]),
	 layer(data,y=:Lx,color=[colorant"red",colorant"gold"]),
	 layer(data,y=:Ly,Geom.line,color=[colorant"green",colorant"blue"],))

# ╔═╡ Cell order:
# ╠═61fd28c2-3ed0-11eb-083a-05e43d8bae12
# ╠═95b71286-3ed0-11eb-16a1-c1f5f0281a23
# ╠═cb220b46-3ed6-11eb-0e87-6f9fb238cc8c
