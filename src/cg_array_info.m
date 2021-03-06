function [io_ArrayName, io_DimensionVector, out_DataType, out_DataDimension, ierr] = cg_array_info(in_A, io_ArrayName, io_DimensionVector)
% Gateway function for C function cg_array_info.
%
% [ArrayName, DimensionVector, DataType, DataDimension, ierr] = cg_array_info(A, ArrayName, DimensionVector)
%
% Input argument (required; type is auto-casted): 
%               A: 32-bit integer (int32), scalar
%
% In&Out arguments (required as output; also required as input if specified; type is auto-casted):
%       ArrayName: character string with default length 32 
%    DimensionVector: 64-bit or 32-bit integer (platform dependent), len=3 
%
% Output arguments (optional):
%        DataType: 32-bit integer (int32), scalar
%    DataDimension: 32-bit integer (int32), scalar
%            ierr: 32-bit integer (int32), scalar
%
% The original C function is:
% int cg_array_info( int A, char * ArrayName, CG_DataType_t * DataType, int * DataDimension, ptrdiff_t * DimensionVector);
%
% For detail, see <a href="http://www.grc.nasa.gov/WWW/cgns/CGNS_docs_current/midlevel/physical.html">online documentation</a>.
%
if ( nargout < 2 || nargin < 1); 
    error('Incorrect number of input or output arguments.');
end
if nargin<2
    io_ArrayName=char(zeros(1,32));
elseif length(io_ArrayName)<32
    %% Enlarge the array if necessary;
    io_ArrayName=char([io_ArrayName zeros(1,32-length(io_ArrayName))]);
elseif ~isa(io_ArrayName,'char');
    io_ArrayName=char(io_ArrayName);
else
    % Write to it to avoid sharing memory with other variables
    t=io_ArrayName(1); io_ArrayName(1)=t;
end

if strfind(computer,'64');
    basetype='int64'; ptrdiff_t=@int64;
else
    basetype='int32'; ptrdiff_t=@int32;
end
if nargin<3
    io_DimensionVector=zeros(1,3,basetype);
elseif length(io_DimensionVector)<3
    % Enlarge the array if necessary;
    if size(io_DimensionVector,2)==1;
        io_DimensionVector=[io_DimensionVector; zeros(3-length(io_DimensionVector),1,basetype)];
    else
        io_DimensionVector=[io_DimensionVector, zeros(1,3-length(io_DimensionVector),basetype)];
    end
elseif ~isa(io_DimensionVector,basetype);
    io_DimensionVector=ptrdiff_t(io_DimensionVector);
elseif ~isempty(io_DimensionVector);
    % Write to it to avoid sharing memory with other variables
    t=io_DimensionVector(1); io_DimensionVector(1)=t;
end


% Invoke the actual MEX-function.
[out_DataType, out_DataDimension, ierr] =  cgnslib_mex(int32(199), in_A, io_ArrayName, io_DimensionVector);
