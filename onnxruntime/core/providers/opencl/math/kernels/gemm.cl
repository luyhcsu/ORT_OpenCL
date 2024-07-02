/***
__kernel void sgemm (
    const bool transB,
    const bool transA,
    const  int  N,
    const  int  M,
    const  int  K,
    const  float alpha,
    __read_only image2d_t matrixA,
    const  float lda,
    __read_only image2d_t matrixB,
    const  float ldb,
    __write_only image2d_t matrixC,
    const  float ldc){

    int threadIDx = get_global_id(0);
    int threadIDy = get_global_id(1);


    }


__kernel void sgemm (
    const int transB,
    const int transA,
    const int N,
    const int M,
    const int K,
    const float alpha,
    __read_only image2d_t matrixA,
    const float lda,
    __read_only image2d_t matrixB,
    const float ldb,
    __write_only image2d_t matrixC,
    const float ldc)
{
    int threadIDx = get_global_id(0);  // Thread index along x-axis
    int threadIDy = get_global_id(1);  // Thread index along y-axis

    // Calculate the global indices for matrix C
    int globalRow = threadIDy;
    int globalCol = threadIDx;

    // Initialize the result for the current thread
    float result = 0.0f;

    // Perform matrix multiplication
    for (int k = 0; k < K; ++k) {
        // Read elements from matrix A and matrix B
        float aElement = read_imagef(matrixA, SAMPLER, (int2)(transA ? k : globalRow, transA ? globalRow : k)).x;
        float bElement = read_imagef(matrixB, SAMPLER, (int2)(transB ? globalCol : k, transB ? k : globalCol)).x;

        // Accumulate the result
        result += aElement * bElement;
    }

    // Write the result to matrix C
    int2 coord = (int2)(globalCol, globalRow);
    write_imagef(matrixC, coord, (float4)(result, 0.0f, 0.0f, 0.0f));
}
***/    

__kernel void sgemm (
    const int transB,
    const int transA,
    const int N,
    const int M,
    const int K,
    const float alpha,
    __read_only image2d_t matrixA,
    const float lda,
    __read_only image2d_t matrixB,
    const float ldb,
    __write_only image2d_t matrixC,
    const float ldc)
{
    int threadIDx = get_global_id(0);  // Thread index along x-axis
    int threadIDy = get_global_id(1);  // Thread index along y-axis

    // Calculate the global indices for matrix C
    int globalRow = threadIDy;
    int globalCol = threadIDx;

    if(threadIDx == 0 && threadIDy==0){
        float4 A1 = RI_F(matrixA, (int2)(0, 0));
        float4 A2 = RI_F(matrixA, (int2)(0,1));
        float4 A3 = RI_F(matrixA, (int2)(0,2));
        float4 A4 = RI_F(matrixA, (int2)(0,3));
        printf("A4 = {%f,%f,%f,%f}",A4.x,A4.y,A4.z,A4.w);
        float4 B1 = RI_F(matrixB, (int2)(0, 0));
        float4 B2 = RI_F(matrixB, (int2)(0,1));
        float4 B3 = RI_F(matrixB, (int2)(0,2));
        float4 B4 = RI_F(matrixB, (int2)(0,3));
        printf("B1 = {%f,%f,%f,%f}",B1.x,B1.y,B1.z,B1.w);
        // 计算 C00
        float4 C00;
        C00.x = dot(A1, (float4)(B1.x, B2.x, B3.x, B4.x));
        C00.y = dot(A1, (float4)(B1.y, B2.y, B3.y, B4.y));
        C00.z = dot(A1, (float4)(B1.z, B2.z, B3.z, B4.z));
        C00.w = dot(A1, (float4)(B1.w, B2.w, B3.w, B4.w));
        printf("C00 = {%f,%f,%f,%f}",C00.x,C00.y,C00.z,C00.w);
        write_imagef(matrixC, (int2)(0,0), C00);
        // 计算 C01
        float4 C01;
        C01.x = dot(A2, (float4)(B1.x, B2.x, B3.x, B4.x));
        C01.y = dot(A2, (float4)(B1.y, B2.y, B3.y, B4.y));
        C01.z = dot(A2, (float4)(B1.z, B2.z, B3.z, B4.z));
        C01.w = dot(A2, (float4)(B1.w, B2.w, B3.w, B4.w));
        write_imagef(matrixC, (int2)(0,1), C01);
        // 计算 C02
        float4 C02;
        C02.x = dot(A3, (float4)(B1.x, B2.x, B3.x, B4.x));
        C02.y = dot(A3, (float4)(B1.y, B2.y, B3.y, B4.y));
        C02.z = dot(A3, (float4)(B1.z, B2.z, B3.z, B4.z));
        C02.w = dot(A3, (float4)(B1.w, B2.w, B3.w, B4.w));
        write_imagef(matrixC, (int2)(0,2), C02);
        // 计算 C03
        float4 C03;
        C03.x = dot(A4, (float4)(B1.x, B2.x, B3.x, B4.x));
        C03.y = dot(A4, (float4)(B1.y, B2.y, B3.y, B4.y));
        C03.z = dot(A4, (float4)(B1.z, B2.z, B3.z, B4.z));
        C03.w = dot(A4, (float4)(B1.w, B2.w, B3.w, B4.w));
        write_imagef(matrixC, (int2)(0,3), C03);
    }

}