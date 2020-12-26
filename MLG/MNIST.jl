### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# ╔═╡ 8253be60-47ae-11eb-21dc-592280e51f2e
begin
using Statistics
using Flux: onehotbatch, onecold, crossentropy, throttle
using Base.Iterators: repeated
using CuArrays #you want to use GPU
end

# ╔═╡ bb427b30-47ae-11eb-28e6-19ba8afc227d
begin
imgs = Flux.Data.MNIST.images()
labels = Flux.Data.MNIST.labels();
end

# ╔═╡ ce3bd2f0-47b2-11eb-1bac-19865f8e6aea


# ╔═╡ Cell order:
# ╠═8253be60-47ae-11eb-21dc-592280e51f2e
# ╠═bb427b30-47ae-11eb-28e6-19ba8afc227d
# ╠═ce3bd2f0-47b2-11eb-1bac-19865f8e6aea
