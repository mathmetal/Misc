### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# ╔═╡ c1b0a650-3c72-11eb-1fc1-113073ca4477
MLG=["Machine","Learning","Geek"]

# ╔═╡ 7df7a79e-3c73-11eb-3e1c-275b2aaf2f78
for x ∈ MLG 
	print(length(x))
end

# ╔═╡ 8b9db1e0-3c75-11eb-095d-471ff4502539
map(MLG) do x length(x) end

# ╔═╡ 4d4c8500-3c76-11eb-3a7b-d711492b441e
map(x->length(MLG[x]),eachindex(MLG))

# ╔═╡ ea18bf70-3c76-11eb-1b50-6192481023f8
[length(x) for x∈MLG]

# ╔═╡ Cell order:
# ╟─c1b0a650-3c72-11eb-1fc1-113073ca4477
# ╠═7df7a79e-3c73-11eb-3e1c-275b2aaf2f78
# ╠═8b9db1e0-3c75-11eb-095d-471ff4502539
# ╠═4d4c8500-3c76-11eb-3a7b-d711492b441e
# ╠═ea18bf70-3c76-11eb-1b50-6192481023f8
