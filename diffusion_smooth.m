function output = diffusion_smooth(input, surf, sigma, n, A,C)
%
% output= diffusion_smooth(input, surf, sigma)
%
% input         : signal to smooth.
% surf          : structured array consisting of surface.vertices and surface.faces.
%                 We are using the default MATLAB data strcture obtained 
%                 from the isosurface algorithm
% sigma         : bandwidth of heat kernel [3].  
%                 The bandwidth given in old publications [1] [2] are given
% n             : number of iterations. This has to be alot to even
%                 gurantee convergence.
%                 in terms of diffusion time (t): sigma = t^2/2.
% A,C           : A and C matrices are computed from FEM.m. The detail is
%                 given in [1][2]. 
%
%
% (C) 2001- Moo K. Chung
%     Department of Biostatistics and Medical Informatics
%     Waisman Laboratory for Brain Imaging
%     University of Wisconsin-Maison
%  
% email://mkchung@wisc.edu
%
% The code has been downloadd from
% http://www.stat.wisc.edu/~mchung/softwares/diffusion/diffusion.html
%
%
% If you use this code, please reference [1],[2] or [3]. The details on
% the mathematical basis of of the algorithm can be found in the following papers.
%
% [1] Chung, M.K. 2001. Statistical Morphometry in Neuroanatomy, 
%     PhD Thesis, McGill University.
%     http://www.stat.wisc.edu/~mchung/papers/thesis.pdf
%
% [2] Chung, M.K., Taylor, J. 2004. Diffusion Smoothing on Brain Surface via Finite 
%     Element Method,  IEEE International Symposium on Biomedical Imaging (ISBI). 562.
%     http://www.stat.wisc.edu/~mchung/papers/BMI2004/diffusion_biomed04.pdf
%
% [3] Chung, M.K., Qiu, A., Seo S., Vorperian, H.K. 2015. Unified heat kernel 
%     regression for diffusion, kernel smoothing and wavelets on manifolds 
%     and its application to mandible growth modeling in CT images, Medical 
%     Image Analysis. 22:63-76
%     http://www.stat.wisc.edu/~mchung/papers/chung.2015.MIA.pdf
%
%
% Update histotry: 2001 created
%                  2014 rwritten to input A,C
%                  2017 updated documentation
%

coord=surf.vertices;
tri=surf.faces;

[nbr, deg] = FINDnbr(tri);

%DISCRETE LAPLACE-BELTRAMI OPERATOR ESTIMATION

laplace= -inv(A)*C;

% n_time: number of iterations (this has to be very large to gurantee the
% convergence). Here we are simply usng 1000 iterations for illustration
% purpose. 
n_time=n;

delta=sigma/n_time;

% delta: step size (has to be very small). [1] [2] provides specific conditions for
% convergence, which are not implemented. A more modern approach based on
% heat kernel expansion [3] simply make this technique obselete. 




%figure_trimesh(surf,input)

curr_signal=input;


for i_time=1:n_time
    maxcurr=max(curr_signal);
    mincurr=min(curr_signal);

    curr_signal= curr_signal + delta*laplace*curr_signal;
    
    ind= find(curr_signal>=maxcurr);
    curr_signal(ind)= maxcurr;  % smoothed signal cannot possibly be bigger than maximum of signal.  
    
    ind= find(curr_signal<=mincurr);
    curr_signal(ind)= mincurr;  % smoothed signal cannot possibly be smaller than minimum of signal.  
    
    %figure; figure_surf(surf, curr_signal); colorbar
end;

output=curr_signal;

%figure_trimesh(surf,curr_signal)
