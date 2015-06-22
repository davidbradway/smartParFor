function g_local = loopContents(i_local)
% loopContents
% This is an example function that we should execute in the loop
% Refer to it by a function handle
%  handle = @loopContents;
%
% in a parfor, use this:
%  g(i)=feval(handle,i);
% in a for, use this
%  g(i)=handle(i);

    % Do something in this function snippet
    g_local = i_local*2;
end