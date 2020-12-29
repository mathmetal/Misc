### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 6d5ac8a4-47dc-11eb-3098-abac2e02369b
begin
using Plots
using PlutoUI
end

# ╔═╡ 7525b260-47dc-11eb-172e-a721065970f4
begin
	r= @bind range html"<input type=range min=5 max=15>"
	p= @bind power Slider(-2:5)
	
	md"""
	$(r) $(p)
	
	power= $(range)
	range= $(power)
	"""
end

# ╔═╡ 72e5bc98-47dc-11eb-1473-675b6bb0958c
begin
	f(x)=x.^power
	x=-range:range
	plot(x,f(x))
end

# ╔═╡ 13611b20-47e4-11eb-05c0-bb4c4d7be8d3
@bind dims html"""
<canvas width="200" height="200" style="position: relative"></canvas>

<script>
// 🐸 `currentScript` is the current script tag - we use it to select elements 🐸 //
const canvas = currentScript.closest('pluto-output').querySelector("canvas")
const ctx = canvas.getContext("2d")

var startX = 80
var startY = 40

function onmove(e){
	// 🐸 We send the value back to Julia 🐸 //
	canvas.value = [e.layerX - startX, e.layerY - startY]
	canvas.dispatchEvent(new CustomEvent("input"))

	ctx.fillStyle = '#ffecec'
	ctx.fillRect(0, 0, 200, 200)
	ctx.fillStyle = '#3f3d6d'
	ctx.fillRect(startX, startY, ...canvas.value)
}

canvas.onmousedown = e => {
	startX = e.layerX
	startY = e.layerY
	canvas.onmousemove = onmove
}

canvas.onmouseup = e => {
	canvas.onmousemove = null
}

// Fire a fake mousemoveevent to show something
onmove({layerX: 130, layerY: 160})

</script>
"""

# ╔═╡ Cell order:
# ╠═6d5ac8a4-47dc-11eb-3098-abac2e02369b
# ╠═72e5bc98-47dc-11eb-1473-675b6bb0958c
# ╠═7525b260-47dc-11eb-172e-a721065970f4
# ╠═13611b20-47e4-11eb-05c0-bb4c4d7be8d3
