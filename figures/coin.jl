using Distributions, Plots
pyplot()


function flip_coin(biased_coin::Bernoulli, n_flips::Int64)
    heads_probabilities = zeros(n_flips)
    flips = Array{Bool}(undef, n_flips)
    x_s = Array{Int64}(undef, n_flips)
    heads = 0
    for i = 1:n_flips
        x_s[i] = i
        flip = rand(biased_coin, 1)[1]
        flips[i] = flip
        if flip
            heads = heads + 1
        end
        heads_probabilities[i] = heads / i
    end
    x = [1:n_flips]
    return x_s, heads_probabilities, flips
end

function main()
    n_flips = 500
    biased_coin = Bernoulli(0.60)
    x, y, _ = flip_coin(biased_coin, n_flips)
    pyplot()
    plot(x, y, title = "Learning a Coin's Bias via Sampling", legend=false,
        lw = 1, color=:red,
        xlabel = "Number of coin flip samples", ylabel = "Probability of Heads")
    savefig("flip.pdf")
end

main()
