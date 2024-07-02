

// TODO: 

__kernel void MatMul (const int x,
    const int y,
    const int z,
    __read_only image2d_t matrixA,
    __read_only image2d_t matrixB,
    __write_only image2d_t matrixC) {
  int px = get_global_id(0);
  int py = get_global_id(1);


  if(px == 0 ){
    for (int i = 0; i < x /*A.Rows()*/; ++i) {
        for (int j = 0; j < z /*B.Cols()*/; ++j) {
            float4 A = RI_F(matrixA, (int2)(i, j));
            float4 B = RI_F(matrixB, (int2)(i, j));
            printf("{%d,%d} : %f %f",i,j,A.x,B.x);
        }
    }
    for(int i = 0;i < 4;i++){
        float4 c = {0.5,0,0,0};
        WI_F(matrixC , (int2)(0, i), c);
        
      }
    
  }
  

}
