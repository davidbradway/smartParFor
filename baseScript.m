%baseScript.m

%% Demonstrate Parallel mode
poolobj = parpool;
g(5)=0;
%parallel=1;
%handle = @loopContents;
%startIndex = 1;
%stopIndex = 5;
%g = smartParFor(parallel,handle,startIndex,stopIndex);
g = smartParFor(1,@loopContents,1,5);
disp(g)

delete(poolobj)

%% Demonstrate normal mode
g(5)=0;
parallel=0;
handle = @loopContents;
startIndex = 1;
stopIndex = 5;
g = smartParFor(parallel,handle,startIndex,stopIndex);
disp(g)