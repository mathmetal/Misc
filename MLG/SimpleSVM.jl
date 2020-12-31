### A Pluto.jl notebook ###
# v0.12.15

using Markdown
using InteractiveUtils

# ╔═╡ 18782940-4b5a-11eb-1a4c-d5d234c2a7bd
begin
using MLJ
#import RDatasets: dataset
using Gadfly
end

# ╔═╡ 254375d0-4b5a-11eb-2717-e3ba997469a1
begin
	function init()
	X = randn(40, 2)
	y = vcat(-ones(20), ones(20))
	return X,y
	end
	X,y=init()
end

# ╔═╡ e6905d60-4b5b-11eb-1ea3-d708f75a0657
begin
ym1 = y .== -1
ym2 = .!ym1
	plot(
layer(x=X[ym1, 1], y=X[ym1, 2], ),
layer(x=X[ym2, 1], y=X[ym2, 2], Theme(default_color=colorant"red")),
 #Scale.shape_discrete(levels=["+ve","-ve"]),
 Guide.manual_color_key("", ["+ve", "-ve"], ["deepskyblue","red"]),
	point_shapes=[Shape.circle, Shape.star1])
	end

# ╔═╡ 6fec4c40-4b61-11eb-0f31-698d897b7b3c
begin
	tX = MLJ.table(X)
	ty = categorical(y);
end

# ╔═╡ a0100f10-4b61-11eb-2944-2d6da12d683a
begin
	@load SVC pkg=LIBSVM
	
	svc_mdl = SVC()
	svc = machine(svc_mdl, tX, ty)
	
	fit!(svc);
end

# ╔═╡ a77e3830-4b61-11eb-34f1-4dde97f2c85f
begin
	ypred = predict(svc, tX)
	misclassification_rate(ypred, ty)
end

# ╔═╡ Cell order:
# ╠═18782940-4b5a-11eb-1a4c-d5d234c2a7bd
# ╠═254375d0-4b5a-11eb-2717-e3ba997469a1
# ╠═e6905d60-4b5b-11eb-1ea3-d708f75a0657
# ╠═6fec4c40-4b61-11eb-0f31-698d897b7b3c
# ╠═a0100f10-4b61-11eb-2944-2d6da12d683a
# ╠═a77e3830-4b61-11eb-34f1-4dde97f2c85f
