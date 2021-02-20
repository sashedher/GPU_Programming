#ifndef _KERNELS_H_
#define _KERNELS_H_

__global__ void per_row_kernel(int m,int n,int *A,int *B,int *C);
    unsigned id;
    id=blockIdx.x*blockDim.x+threadIdx.x;
    if(id<n){
          for(unsigned j=0;j<m;j++){
            C[id*m+j]=A[id*m+j]+B[id*m+j];
        }  
    }
    
}

__global__ void per_column_kernel(int m,int n,int *A,int *B,int *C);
    unsigned id;
    id =blockDim.x*blockDim.y*blockIdx.x+ blockDim.x* threadIdx.y+threadIdx.x;
    if(id<m){
          for(unsigned j=0;j<n;j++){
            C[id*n+j]=A[id*n+j]+B[id*n+j];
        }  
    }
    
}

__global__ void per_element_kernel(int m,int n,int *A,int *B,int *C);

    unsigned i,j,id;
    i = threadIdx.x + blockDim.x * threadIdx.y;
    j = blockIdx.x + gridDim.x * blockIdx.y;
    id=j*blockDim.x*blockDim.y+i;
    if(id<(m*n))
    C[id]=A[id]+B[id];
    
}

#endif
