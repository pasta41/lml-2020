using Plots, LinearAlgebra, Random, Statistics
pyplot()

# compute gradient
function df(X::Matrix{Float64}, y::Vector{Float64}, theta::Vector{Float64})
    return X' * (X * theta - y)
end

# gradient descent
function lr_gd(X::Matrix{Float64}, y::Vector{Float64}, alpha::Float64, num_iterations::Int64)
    (num_samples, num_features) = size(X)
    theta = zeros(num_features)
    for i = 1:num_iterations
        theta += df(X, y, theta)
    end
    return theta
end

# stochastic gradient descent, batch size of 1
function lr_sgd(X::Matrix{Float64}, y::Vector{Float64}, alpha::Float64, batch_size::Int64, num_iterations::Int64)
    (num_samples, num_features) = size(X)
    theta = zeros(num_features)
    for i = 1:num_iterations
        # use num_samples minibatches of size 1 to compute gradient to update theta
        # using k:k in order to keep type as a matrix
        theta += mean(df(X[k:k,:], y[k:k], theta) for k in (rand(1:num_samples) for b = 1:batch_size));
    end
    return theta
end
function main()
    num_features = 1024;
    dataset_sizes = 2 .^ [7,8,9,10,11,12,13,14,15,16];
    num_iterations = 1024;
    alpha = 0.001;
    # we will do this for the vanilla sgd case, without varying minibatch size
    batch_size = 1;
    gd_times = Float64[];
    sgd_times = Float64[];
    for num_samples in dataset_sizes
        X = randn(num_samples, num_features);
        y = randn(num_samples);
        gd_time = (@elapsed lr_gd(X, y, alpha, num_iterations)) / num_iterations;
        sgd_time = (@elapsed lr_sgd(X, y, alpha, batch_size, num_iterations)) / num_iterations;
        push!(gd_times, gd_time);
        push!(sgd_times, sgd_time);
        println("dataset size $num_samples --- GD time = $gd_time, SGD time = $sgd_time");
    end
    plot(dataset_sizes, gd_times, label="Gradient Descent (GD)", color=:blue,
        markershape=:circle, xaxis=:log, yaxis=:log);
    plot!(dataset_sizes, sgd_times, label="Stochastic Gradient Descent (SGD, with minibatch size=$batch_size)",
        markershape=:rect, color=:orange, marker=:, xaxis=:log, yaxis=:log,
        xticks = 10 .^ [2, 3, 4, 5, 6],
        xlabel="Number of data points", ylabel="Time per iteration (seconds)",
        title="Comparing Runtime per Iteration for GD and SGD");
    savefig("timesgd.pdf")
end
main()
