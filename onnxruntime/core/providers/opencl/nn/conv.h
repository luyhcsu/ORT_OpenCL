// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

#pragma once

#include "core/providers/opencl/opencl_utils.h"

namespace onnxruntime {
namespace opencl {

class ONNX_OPERATOR_VERSIONED_KERNEL_CLASS_NAME(kOpenCLExecutionProvider, kOnnxDomain, 1, 10, Conv);
class ONNX_OPERATOR_KERNEL_CLASS_NAME(kOpenCLExecutionProvider, kOnnxDomain, 11, Conv);
class ONNX_OPERATOR_KERNEL_CLASS_NAME(kOpenCLExecutionProvider, kOnnxDomain, 1, Conv);
class ONNX_OPERATOR_KERNEL_CLASS_NAME(kOpenCLExecutionProvider, kMSDomain, 1, FusedConv);

}  // namespace opencl
}  // namespace onnxruntime
