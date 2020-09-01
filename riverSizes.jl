M = [[0, 0, 1, 1, 1, 1, 0, 0, 1],
     [1, 0, 1, 0, 0, 1, 0, 1, 1],
     [0, 0, 0, 0, 0, 1, 0, 0, 1],
     [1, 1, 1, 0, 0, 1, 1, 0, 0],
     [1, 0, 1, 1, 0, 0, 1, 0, 0],
     [0, 0, 0, 1, 0, 0, 1, 0, 1],
     [0, 1, 0, 1, 0, 0, 1, 1, 1]]

# ====================================================================

function riverSizes(map)
    
    sizes = []
    visited = [[false for x in row] for row in map]
        
    for i in 1:length(map), j in 1:length(map[i])
        
        exploreNode!(i, j, map, visited, sizes)
            
    end
    
    return sizes
    
end


function exploreNode!(i, j, map, visited, sizes)

    currentRiverSize = 0
    nodesToExplore = [[i, j]]

    while (length(nodesToExplore) != 0)

        i, j = pop!(nodesToExplore)

        if visited[i][j] == true

            continue

        end

        visited[i][j] = true

        if map[i][j] == 0

            continue

        end

        currentRiverSize += 1

        unvisited_Neighbors = getUnvisitedNeighbors(i, j, map, visited)

        for neighbor in unvisited_Neighbors

            append!(nodesToExplore, [neighbor])

        end
        
    end

    if currentRiverSize > 0

        append!(sizes, currentRiverSize)

    end
        
end


function getUnvisitedNeighbors(i, j, map, visited)
    
    unvisitedNeighbors = []

    if i > 1 && !(visited[i - 1][j])

        append!(unvisitedNeighbors, [[i - 1, j]])

    end

    if i < length(map) && !(visited[i + 1][j])

        append!(unvisitedNeighbors, [[i + 1, j]])

    end

    if j > 1 && !(visited[i][j - 1])

        append!(unvisitedNeighbors, [[i, j - 1]])

    end

    if j < length(map[i]) && !(visited[i][j + 1])

        append!(unvisitedNeighbors, [[i, j + 1]])

    end
                
    return unvisitedNeighbors
        
end


# ====================================================================

river_sizes = riverSizes(M);
println(sort(river_sizes))






