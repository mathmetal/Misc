### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# ╔═╡ bb427b30-47ae-11eb-28e6-19ba8afc227d
begin
using Flux
images = Flux.Data.MNIST.images();
labels = Flux.Data.MNIST.labels();
end

# ╔═╡ 96433c12-47f1-11eb-1589-bb257b66361c
begin
	using Random
	x=rand(1:60000)
	md"""
	$(images[x])
	# $(labels[x])"""
end

# ╔═╡ 03e5e240-4800-11eb-0dac-254f8ca6e0f8
begin
	using Flux: onehotbatch
	y=onehotbatch(labels, 0:9)
end

# ╔═╡ a8485fde-47fb-11eb-0c26-05f1e3f300e3
foo=images[800]

# ╔═╡ ee91bc14-47fc-11eb-216c-61f1357586eb
reshape(foo,:)

# ╔═╡ c4977514-47fe-11eb-21f1-6da498eb7362
float(reshape(foo,:))

# ╔═╡ a7e7e35a-47ff-11eb-18df-13c13cf2690f
hcat(float.(reshape.(images,:))...)

# ╔═╡ Cell order:
# ╠═bb427b30-47ae-11eb-28e6-19ba8afc227d
# ╟─96433c12-47f1-11eb-1589-bb257b66361c
# ╠═a8485fde-47fb-11eb-0c26-05f1e3f300e3
# ╠═ee91bc14-47fc-11eb-216c-61f1357586eb
# ╠═c4977514-47fe-11eb-21f1-6da498eb7362
# ╠═a7e7e35a-47ff-11eb-18df-13c13cf2690f
# ╠═03e5e240-4800-11eb-0dac-254f8ca6e0f8
