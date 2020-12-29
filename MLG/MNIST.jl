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

# ╔═╡ 13575c8a-49d2-11eb-35d5-678446f5c47e
using Flux:@epochs

# ╔═╡ a8485fde-47fb-11eb-0c26-05f1e3f300e3
foo=images[800]

# ╔═╡ ee91bc14-47fc-11eb-216c-61f1357586eb
reshape(foo,:)

# ╔═╡ c4977514-47fe-11eb-21f1-6da498eb7362
float(reshape(foo,:))

# ╔═╡ a7e7e35a-47ff-11eb-18df-13c13cf2690f
X=hcat(float.(reshape.(images,:))...)

# ╔═╡ a0362f42-49d1-11eb-0b18-cb34ea364cd9
m = Chain(
  Dense(28*28,40, relu),
  Dense(40, 10),
  softmax)

# ╔═╡ ab272c08-49d1-11eb-218e-fbd72b5323fd
begin
	using Flux:crossentropy,onecold,throttle
	loss(X, y) = crossentropy(m(X), y) 
	opt = ADAM()
end

# ╔═╡ dae68f32-49d4-11eb-0f5f-b9caf19a35a2
begin	
	using Statistics:mean
	accuracy(X, y) = mean(onecold(m(X)) .== onecold(y))
	md"""
	# Training accuracy: $(accuracy(X, y))
	# Test accuracy: $(accuracy(hcat(float.(reshape.(Flux.Data.MNIST.images(:test), :))...), onehotbatch(Flux.Data.MNIST.labels(:test), 0:9)))"""
end

# ╔═╡ d288829a-49d1-11eb-330c-b3ad51d54203
progress = () -> @show(loss(X, y))

# ╔═╡ d9026228-49d1-11eb-31ed-370d7411fa45
@epochs 100 Flux.train!(loss, params(m),[(X,y)], opt, cb = throttle(progress, 10))

# ╔═╡ 86716a10-49d4-11eb-0c5f-c15aa095dd26
begin
	foobar=rand(1:10000)
	md"""
	$(Flux.Data.MNIST.images(:test)[foobar])
	# Prediction: $(onecold(m(hcat(float.(reshape.(Flux.Data.MNIST.images(:test), :))...)[:,foobar])) - 1)
	"""
end

# ╔═╡ Cell order:
# ╠═bb427b30-47ae-11eb-28e6-19ba8afc227d
# ╠═96433c12-47f1-11eb-1589-bb257b66361c
# ╠═a8485fde-47fb-11eb-0c26-05f1e3f300e3
# ╠═ee91bc14-47fc-11eb-216c-61f1357586eb
# ╠═c4977514-47fe-11eb-21f1-6da498eb7362
# ╠═a7e7e35a-47ff-11eb-18df-13c13cf2690f
# ╠═03e5e240-4800-11eb-0dac-254f8ca6e0f8
# ╠═a0362f42-49d1-11eb-0b18-cb34ea364cd9
# ╠═ab272c08-49d1-11eb-218e-fbd72b5323fd
# ╠═d288829a-49d1-11eb-330c-b3ad51d54203
# ╠═13575c8a-49d2-11eb-35d5-678446f5c47e
# ╠═d9026228-49d1-11eb-31ed-370d7411fa45
# ╠═86716a10-49d4-11eb-0c5f-c15aa095dd26
# ╠═dae68f32-49d4-11eb-0f5f-b9caf19a35a2
