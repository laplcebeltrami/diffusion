## Diffusion Smoothing
© 2017 Moo K. Chung
University of Wisconsin-Madison

Diffusion smoothing based on the finite element method (FEM) is introduced in [Chung (2001)](https://www.stat.wisc.edu/~mchung/papers/thesis.pdf). Run MATLAB live script SCRIPT-diffusion.mlx. The core function diffusion_smooth.m requires FEM.m that computes A and C matrices associated with the FEM of the given surface mesh [Chung & Taylor, 2004](https://pages.stat.wisc.edu/~mchung/papers/BMI2004/diffusion_biomed04.pdf). Instead of solving heat diffusion using FEM, it is possible to solve it as a spectral expansion of the Laplace-Beltrami operator [Seo et al. 2010](https://pages.stat.wisc.edu/~mchung/papers/miccai.2010.seo.pdf). Heat kernel smoothing approach is more stable and robust. The code for heat kernel smoothing is given in here. It is also possible to spectral expand heat kernel through the fast polynomial approximation [Huang et al. 2019](https://pages.stat.wisc.edu/~mchung/papers/huang.2019.MICCAI.pdf) in performing heat kernel convolution. The code for polynomial approximation is given here. The fast polynomial approximation is the fastest possible diffusion solver on manifolds.


Reference

[1] Chung, M.K. 2001. Statistical Morphometry in Neuroanatomy, PhD Thesis, McGill University.

[2] Chung, M.K., Taylor, J. 2004. Diffusion Smoothing on Brain Surface via Finite Element Method,  IEEE International Symposium on Biomedical Imaging (ISBI). 562.

[3] Seo, S., Chung, M.K., Vorperian, H. K. 2010. Heat kernel smoothing using Laplace-Beltrami eigenfunctions. 13th International Conference on Medical Image Computing and Computer Assisted Intervention (MICCAI). Lecture Notes in Computer Science (LNCS). 6363:505-512.

[4] Seo, S., Chung, M.K. 2011. Laplace-Beltrami eigenfunction expansion of cortical manifolds. IEEE International Symposium on Biomedical Imaging (ISBI).

[5] Huang, S.-G., Lyu, I., Qiu, A., Chung, M.K. 2019. Fast polynomial approximation to heat diffusion in manifolds, Medical Image Computing and Computer Assisted Intervention (MICCAI) 11767:48-56. MATLAB

[6]  Huang, S.-G., Lyu, I., Qiu, A., Chung, M.K. 2020. Fast polynomial approximation of heat kernel convolution on manifolds and its application to brain sulcal and gyral graph pattern analysis, IEEE Transactions on Medical Imaging 39:2201-2212 MATLAB

Update histrory: 2017 Page created in http://brainimaging.waisman.wisc.edu/~chung/diffusion. 2026 Sept 6: Package moved to gitHub
