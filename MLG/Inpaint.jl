### A Pluto.jl notebook ###
# v0.12.15

using Markdown
using InteractiveUtils

# ╔═╡ 40d8ceb2-4b66-11eb-19b7-b52e55c7659b
begin
	using ImageInpainting,FileIO,Images,ImageDraw,Plots
	using TestImages
end

# ╔═╡ bd22a0d0-4b67-11eb-0e58-974d11ff83d0
image=load("C:\\Tempy\\2077.jpg")

# ╔═╡ c7c76710-4b6b-11eb-3c08-a124a24b84aa
split=channelview(image);

# ╔═╡ 7bfb4cb0-4b6c-11eb-0c4a-cdfbd7020989
R=colorview(RGB,StackedView(split[1,:,:], zeroarray, zeroarray))

# ╔═╡ b97c14c0-4b6c-11eb-1fb8-015c71819eec
G=colorview(RGB,StackedView(zeroarray,split[2,:,:], zeroarray))

# ╔═╡ ba26fac0-4b6c-11eb-33f9-254abd8cedf7
B=colorview(RGB,StackedView(zeroarray, zeroarray,split[3,:,:] ))

# ╔═╡ 3954f680-4b6d-11eb-3878-ad32170054eb
masking=draw(image,Ellipse(CirclePointRadius(140,666,90)))

# ╔═╡ ba6df960-4b6d-11eb-2a58-41e7a9fd7140
mask= masking.!=image

# ╔═╡ f2727d40-4b6d-11eb-2c0d-f7711c97884c
begin
	function doIt(image)
	split=channelview(image);
	r=inpaint(convert(Array{Float64},(Gray.(split[1,:,:]))),mask,Criminisi(150,130))
	g=inpaint(convert(Array{Float64},(Gray.(split[2,:,:]))),mask,Criminisi(150,110))
	b=inpaint(convert(Array{Float64},(Gray.(split[3,:,:]))),mask,Criminisi(150,130))
	return colorview(RGB,StackedView(r,g,b))
	end
end

# ╔═╡ 22e3d8f0-4b70-11eb-018f-37c28b93a851
doIt(image)

# ╔═╡ Cell order:
# ╠═40d8ceb2-4b66-11eb-19b7-b52e55c7659b
# ╠═bd22a0d0-4b67-11eb-0e58-974d11ff83d0
# ╠═c7c76710-4b6b-11eb-3c08-a124a24b84aa
# ╠═7bfb4cb0-4b6c-11eb-0c4a-cdfbd7020989
# ╠═b97c14c0-4b6c-11eb-1fb8-015c71819eec
# ╟─ba26fac0-4b6c-11eb-33f9-254abd8cedf7
# ╟─3954f680-4b6d-11eb-3878-ad32170054eb
# ╠═ba6df960-4b6d-11eb-2a58-41e7a9fd7140
# ╠═f2727d40-4b6d-11eb-2c0d-f7711c97884c
# ╠═22e3d8f0-4b70-11eb-018f-37c28b93a851
