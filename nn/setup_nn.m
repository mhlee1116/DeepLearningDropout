function net = setup_nn(net, x , y)
	numNodePrev = size(x,1);
    net.nodeRanges = zeros(length(net.layers), 2);
    net.nodeRanges(1,:) = [1, numNodePrev];
	for l = 2:length(net.layers)-1
		net.layers{l}.w = rand(net.layers{l}.n, numNodePrev) * 2 - 1; % Initialize weight matrix - value between -1 and 1
		net.layers{l}.b = zeros(net.layers{l}.n,1); % Initialize bias - need to experiment with different methods
		numNodePrev = net.layers{l}.n;
        net.nodeRanges(l,:) = [net.nodeRanges(l-1,2)+1, net.nodeRanges(l-1,2)+numNodePrev];
	end
	l = length(net.layers);
	net.layers{l}.w = rand(size(y,1),numNodePrev) * 2 - 1; % Initialize weight matrix - need to experiment with different methods
	net.layers{l}.b = zeros(size(y,1),1);
	net.layers{1}.do = ones(1) * -1;
    net.nodeRanges(l,:) = [net.nodeRanges(l-1,2)+1, net.nodeRanges(l-1,2)+size(y,1)];
end