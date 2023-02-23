function dijkstra!(G,idStart)
    InitializeSingleSource!(G,idStart)
    Q=Int[]
    for i in 1:length(G.V)
        push!(Q,i)
    end
    S=[]
    while ~isempty(Q)
        u=ExtractMin!(Q)
        if u == 0
            break
        else
        for v in findall(G.AdjMatrix[u,:].>0)
                Relax!(G,u,v)
        end
        G.V[u].color='B'
        end
    end
    for i in 1:length(G.V)
        if G.V[i].d == typemax(Int)
            push!(S,-1)
        else
            push!(S,G.V[i].d)
        end
    end
    return S
end
function InitializeSingleSource!(G,s)
    v=1:size(G.AdjMatrix,1)
    for u in v
        G.V[u].color='W'
        G.V[u].d=typemax(Int)
        G.V[u].pred=-1
    end
    G.V[s].d=0
    G.V[s].color='G'
end
function ExtractMin!(Q)
    min=typemax(Int)
    minInd=0
    cvorInd=0
    for i in 1:length(Q)
        p=Q[i]
        if min>G.V[p].d
            min=G.V[p].d
            minInd=i
            cvorInd=p
        end
    end
    if minInd==0
        return cvorInd
    else
        deleteat!(Q,minInd)
    end
    return cvorInd
end
function Relax!(G,u,v)
    if G.V[v].d>G.V[u].d+G.AdjMatrix[u,v] && G.V[v].color != 'B'
        G.V[v].d=G.V[u].d+G.AdjMatrix[u,v]
        G.V[v].pred=u
        G.V[v].color='G'
    end
end
