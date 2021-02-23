__global__ void per_row_kernel(int m,int n,int *A,int *B,int *C){
    int idr;
    idr=blockIdx.x*blockDim.x+threadIdx.x;
    if(idr<m){
          for(int j=0;j<n;j++){
            C[idr*n+j]=A[idr*n+j]+B[idr*n+j];
        }  
    }
    
}


__global__ void per_column_kernel(int m,int n,int *A,int *B,int *C){
    int idc;
    idc =blockDim.x*blockDim.y*blockIdx.x+ blockDim.x* threadIdx.y+threadIdx.x;
    if(idc<n){
          for(int j=0;j<m;j++){
            C[idc*m+j]=A[idc*m+j]+B[idc*m+j];
        }  
    }
    
}


__global__ void per_element_kernel(int m,int n,int *A,int *B,int *C){
    int i,j,ide;
    i = threadIdx.x + blockDim.x * threadIdx.y;
    j = blockIdx.x + gridDim.x * blockIdx.y;
    ide=j*blockDim.x*blockDim.y+i;
    if(ide<(m*n))
    C[ide]=A[ide]+B[ide];
    
}