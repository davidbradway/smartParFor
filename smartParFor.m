function g = smartParFor(handle,varargin)
% SMARTPARFOR call a function in either a 'parfor' or 'for' loop
%   G = SMARTPARFOR(HANDLE,VECTOR) run function for each element of vector
%   G = SMARTPARFOR(HANDLE,START,STOP) run function for [start:stop]
%   G = SMARTPARFOR(HANDLE,START,STOP,STEP) run function for [start:step:stop]
%
% startIndex,stopIndex
%
% handle = @loopContents;
% startIndex = 1;
% stopIndex = 5;
% g(5)=0;
% g=smartParFor(handle,startIndex,stopIndex)
% gcp
% g2(5)=0;
% g2=smartParFor(handle,startIndex,stopIndex)
% delete(gcp('nocreate'))

switch nargin
    case 2
        vector = varargin{1};
    case 3
        vector = [varargin{1}:varargin{2}];
    case 4
        vector = [varargin{1}:varargin{3}:varargin{2}];
    otherwise
        error('Expected 2, ,3 or 4 arguments')
end

g=nan(1,length(vector));

% so we start by checking whether the pool is open. 
p = gcp('nocreate');

if isempty(p)
    % If there is no pool, run as sequential for loop
    for i=vector
        g(i)=handle(i);
    end
else
    % If there is a pool, run as a parfor loop
    parfor i=vector
        g(i)=feval(handle,i);
    end
end
