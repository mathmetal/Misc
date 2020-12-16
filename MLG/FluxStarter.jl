### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# ╔═╡ 3c1afde0-3cd3-11eb-1334-d778fc425486
using Feather;using Pandas

# ╔═╡ 70723130-3cd3-11eb-0796-8316334e96c0
readdir()

# ╔═╡ 91429d00-3cd3-11eb-085c-b5d30d88a3e6
head(read_csv("cleaned",index_col=0))

# ╔═╡ Cell order:
# ╠═3c1afde0-3cd3-11eb-1334-d778fc425486
# ╠═70723130-3cd3-11eb-0796-8316334e96c0
# ╠═91429d00-3cd3-11eb-085c-b5d30d88a3e6
