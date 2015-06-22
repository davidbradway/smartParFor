function g = smartParFor(parallel,handle,startIndex,stopIndex)
% This is a wrapper function that allows us to call a function
% snippet in either a 'parfor' or 'for' loop structure.
% This keeps us from having to repeat ourselves.
% Use a function handle before this function call:
%
% g(5)=0;
% parallel=0;
% handle = @loopContents;
% startIndex = 1;
% stopIndex = 5;
% g=smartParFor(parallel,handle,startIndex,stopIndex)

g=nan(1,length(startIndex:stopIndex));
if parallel
    parfor i=startIndex:stopIndex
        g(i)=feval(handle,i);
    end
else
    for i=startIndex:stopIndex
        g(i)=handle(i);
    end
end
