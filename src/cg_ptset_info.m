function [out_ptset_type, out_npnts, ierr] = cg_ptset_info()
% Gateway function for C function cg_ptset_info.
%
% [ptset_type, npnts, ierr] = cg_ptset_info()
%
% Input argument (required; type is auto-casted): 
%
% Output arguments (optional):
%      ptset_type: 32-bit integer (int32), scalar
%           npnts: 64-bit or 32-bit integer (platform dependent), scalar
%            ierr: 32-bit integer (int32), scalar
%
% The original C function is:
% int cg_ptset_info( CG_PointSetType_t * ptset_type, ptrdiff_t * npnts);
%
% For detail, see <a href="http://www.grc.nasa.gov/WWW/cgns/CGNS_docs_current/midlevel/location.html">online documentation</a>.
%

% Invoke the actual MEX-function.
[out_ptset_type, out_npnts, ierr] =  cgnslib_mex(int32(234));
