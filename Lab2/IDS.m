
function elapsed_time = IDS(starting_node)
tic %start timer
goal = 123456789;
starting_node.depth = 0;
setGlobalStartStack(starting_node);

for i = 1:29% depth shouldn't go past 30 due to generation of starting states
    limit = i;
    successful = DLS(goal, limit);
    if(successful)
        clear global start_stack;
        elapsed_time = toc %display elapsed time
        return
    end
end
end

function success = DLS(goal_state, depth_limit)
stack = getGlobalStartStack;
stack_index = length(stack);
unexpanded_nodes = stack;
unexpanded_nodes_index = 1;
success = 0;

visited = [];
while stack_index > 0
    node = stack(stack_index);
    stack_index = stack_index - 1;
    
    visited(length(visited) + 1) = node.state;
    
    if(node.state == goal_state)
        reconstruct_path(node);
        success = 1;
        return
     elseif(node.depth <= depth_limit)  
        nodeMoveLeft = moveBlankLeft(node);
        if(~ismember(nodeMoveLeft.state, visited))
            nodeMoveLeft.parent = node;
            nodeMoveLeft.depth = node.depth + 1;
            stack_index = stack_index + 1;
            stack(stack_index) = nodeMoveLeft;
        end

        nodeMoveRight = moveBlankRight(node);
        if(~ismember(nodeMoveRight.state, visited))
            nodeMoveRight.parent = node;
            nodeMoveRight.depth = node.depth + 1;
            stack_index = stack_index + 1;
            stack(stack_index) = nodeMoveRight;
        end

        nodeMoveDown = moveBlankDown(node);
        if(~ismember(nodeMoveDown.state, visited))
            nodeMoveDown.parent = node;
            nodeMoveDown.depth = node.depth + 1;
            stack_index = stack_index + 1;
            stack(stack_index) = nodeMoveDown;
        end

        nodeMoveUp = moveBlankUp(node);
        if(~ismember(nodeMoveUp.state, visited))
            nodeMoveUp.parent = node;            
            nodeMoveUp.depth = node.depth + 1;
            stack_index = stack_index + 1;
            stack(stack_index) = nodeMoveUp;
        end
    else
        unexpanded_nodes(unexpanded_nodes_index) = node;
        unexpanded_nodes_index = unexpanded_nodes_index + 1;
    end
end
setGlobalStartStack(unexpanded_nodes);
end

function r  = getGlobalStartStack
global start_stack
r = start_stack;
end

function setGlobalStartStack(val)
global start_stack
start_stack = val;
end
