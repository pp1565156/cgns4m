function [out_C, ierr] = cg_zconn_get(in_fn, in_B, in_Z)
% Gateway function for C function cg_zconn_get.
%
% [C, ierr] = cg_zconn_get(fn, B, Z)
%
% Input arguments (required; type is auto-casted):
%              fn: 32-bit integer (int32), scalar
%               B: 32-bit integer (int32), scalar
%               Z: 32-bit integer (int32), scalar
%
% Output arguments (optional):
%               C: 32-bit integer (int32), scalar
%            ierr: 32-bit integer (int32), scalar
%
% The original C function is:
% int cg_zconn_get( int fn, int B, int Z, int * C);
%
% For detail, see <a href="http://www.grc.nasa.gov/WWW/cgns/CGNS_docs_current/midlevel/timedep.html">online documentation</a>.
%
if (nargin < 3); 
    error('Incorrect number of input or output arguments.');
end

% Invoke the actual MEX-function.
[out_C, ierr] =  cgnslib_mex(int32(108), in_fn, in_B, in_Z);
