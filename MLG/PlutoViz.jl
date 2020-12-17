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

# ╔═╡ 87118aa0-4005-11eb-074a-951a3d43a444
plot(data,y="error(ms)")

# ╔═╡ bbb04e40-4005-11eb-0a5e-af47afd2c872
plot(data,x=:Column1,y="error(ms)",Geom.line,color=[colorant"red"])

# ╔═╡ cb220b46-3ed6-11eb-0e87-6f9fb238cc8c
begin
	err=layer(data,y="error(ms)",x=:Column1,Geom.line,color=[colorant"red"])
	left=layer(data,x=:Column1,y=:Ly,color=[colorant"silver",colorant"gold"])
	right=layer(data,y=:Ry,Geom.line,color=[colorant"green",colorant"blue"])
	plot(err,left,right,Guide.title("Everything Juxtaposed"))
end

# ╔═╡ 0839f3a0-4002-11eb-2d2b-2b8611a991a2
vstack(map(plot,[err,left]))

# ╔═╡ bf46a650-4003-11eb-0499-c7e69cb45f96
hstack(map(plot,[err,left]))

# ╔═╡ d0bec360-4056-11eb-1ca6-412c59828f38
plot(data,y="error(ms)",x=:Column1,Geom.line,color=[colorant"red"],Scale.y_sqrt(minvalue=1,maxvalue=100))

# ╔═╡ Cell order:
# ╠═61fd28c2-3ed0-11eb-083a-05e43d8bae12
# ╠═95b71286-3ed0-11eb-16a1-c1f5f0281a23
# ╠═87118aa0-4005-11eb-074a-951a3d43a444
# ╠═bbb04e40-4005-11eb-0a5e-af47afd2c872
# ╠═cb220b46-3ed6-11eb-0e87-6f9fb238cc8c
# ╠═0839f3a0-4002-11eb-2d2b-2b8611a991a2
# ╠═bf46a650-4003-11eb-0499-c7e69cb45f96
# ╠═d0bec360-4056-11eb-1ca6-412c59828f38
