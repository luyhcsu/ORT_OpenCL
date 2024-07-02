// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

#pragma once

// FIXME: this kernel only copies if the width % 4 == 0, otherwise, weird thing
// might happen
// __kernel void CopyBuffer2DToImage2D(
//     __global const float4* input,
//     __write_only image2d_t output,
//     __private const int width,
//     __private const int height) {
//   int x = get_global_id(0);
//   int y = get_global_id(1);
//   if (x < width && y < height) {
//     write_imagef(output, (int2)(x, y), input[x + y * width]);
//   }
// }

__kernel void CopyBuffer2DToImage2D(
    __private const int width,
    __private const int height,
    __global const float* input,
    __private const int shape_1,
    __private const int shape_2,
    __write_only image2d_t output) {
  int x = get_global_id(0);
  int y = get_global_id(1);

  if (x < width && y < height) {

    int index = y * width + x;

    // 从 input 中读取数据
    float4 v = (float4)(input[4 * index], input[4 * index + 1], input[4 * index + 2], input[4 * index + 3]);

    write_imagef(output, (int2)(x, y), (float4)v);
  }


}

__kernel void CopyImage2DToBuffer2D(
    __private const int width,
    __private const int height,
    __read_only image2d_t input,
    __global float4* output,
    __private const int shape_1,
    __private const int shape_2) {
  int x = get_global_id(0);
  int y = get_global_id(1);
  float4 v = RI_F(input, (int2)(x, y));
  output[y*width + x] = v;

}