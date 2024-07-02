git submodule sync --recursive
git submodule update --init --recursive
# rm -rf ./build/Linux/debug
mkdir -p ./build/Linux/debug
# /home/kylin/anaconda3/envs/ort-opencl/bin/cmake
cmake -B ./build/Linux/debug -S ./cmake/ \
    -Donnxruntime_RUN_ONNX_TESTS=OFF \
    -Donnxruntime_BUILD_WINML_TESTS=OFF \
    -Donnxruntime_GENERATE_TEST_REPORTS=ON \
    -DPython_EXECUTABLE=/home/kylin/anaconda3/envs/llama2/bin/python3 \
    -DPYTHON_EXECUTABLE=/home/kylin/anaconda3/envs/llama2/bin/python3 \
    -Donnxruntime_ROCM_VERSION= \
    -Donnxruntime_USE_MIMALLOC=OFF \
    -Donnxruntime_ENABLE_PYTHON=OFF \
    -Donnxruntime_BUILD_CSHARP=OFF \
    -Donnxruntime_BUILD_JAVA=OFF \
    -Donnxruntime_BUILD_NODEJS=OFF \
    -Donnxruntime_BUILD_OBJC=OFF \
    -Donnxruntime_BUILD_SHARED_LIB=ON \
    -Donnxruntime_BUILD_APPLE_FRAMEWORK=OFF \
    -Donnxruntime_USE_DNNL=OFF \
    -Donnxruntime_USE_NNAPI_BUILTIN=OFF \
    -Donnxruntime_USE_RKNPU=OFF \
    -Donnxruntime_USE_OPENMP=OFF \
    -Donnxruntime_USE_NUPHAR_TVM=OFF \
    -Donnxruntime_USE_LLVM=OFF \
    -Donnxruntime_ENABLE_MICROSOFT_INTERNAL=OFF \
    -Donnxruntime_USE_VITISAI=OFF \
    -Donnxruntime_USE_NUPHAR=OFF \
    -Donnxruntime_USE_OPENCL=ON \
    -Donnxruntime_USE_TENSORRT=OFF -Donnxruntime_TENSORRT_HOME= \
    -Donnxruntime_USE_TVM=OFF -Donnxruntime_TVM_CUDA_RUNTIME=OFF \
    -Donnxruntime_USE_MIGRAPHX=OFF -Donnxruntime_MIGRAPHX_HOME= \
    -Donnxruntime_CROSS_COMPILING=OFF \
    -Donnxruntime_DISABLE_CONTRIB_OPS=OFF \
    -Donnxruntime_DISABLE_ML_OPS=OFF \
    -Donnxruntime_DISABLE_RTTI=OFF \
    -Donnxruntime_DISABLE_EXCEPTIONS=OFF \
    -Donnxruntime_MINIMAL_BUILD=OFF \
    -Donnxruntime_EXTENDED_MINIMAL_BUILD=OFF \
    -Donnxruntime_MINIMAL_BUILD_CUSTOM_OPS=OFF \
    -Donnxruntime_REDUCED_OPS_BUILD=OFF \
    -Donnxruntime_ENABLE_LANGUAGE_INTEROP_OPS=OFF \
    -Donnxruntime_USE_DML=OFF -Donnxruntime_USE_WINML=OFF \
    -Donnxruntime_BUILD_MS_EXPERIMENTAL_OPS=OFF \
    -Donnxruntime_USE_TELEMETRY=OFF \
    -Donnxruntime_ENABLE_LTO=OFF \
    -Donnxruntime_ENABLE_TRANSFORMERS_TOOL_TEST=OFF \
    -Donnxruntime_USE_ACL=OFF -Donnxruntime_USE_ACL_1902=OFF \
    -Donnxruntime_USE_ACL_1905=OFF -Donnxruntime_USE_ACL_1908=OFF \
    -Donnxruntime_USE_ACL_2002=OFF -Donnxruntime_USE_ARMNN=OFF \
    -Donnxruntime_ARMNN_RELU_USE_CPU=OFF -Donnxruntime_ARMNN_BN_USE_CPU=OFF \
    -Donnxruntime_ENABLE_NVTX_PROFILE=OFF -Donnxruntime_ENABLE_TRAINING=OFF \
    -Donnxruntime_ENABLE_TRAINING_OPS=OFF -Donnxruntime_ENABLE_TRAINING_TORCH_INTEROP=OFF \
    -Donnxruntime_ENABLE_CPU_FP16_OPS=OFF -Donnxruntime_USE_NCCL=OFF \
    -Donnxruntime_BUILD_BENCHMARKS=OFF -Donnxruntime_USE_ROCM=OFF \
    -Donnxruntime_ROCM_HOME= -DOnnxruntime_GCOV_COVERAGE=OFF -Donnxruntime_USE_MPI=OFF \
    -Donnxruntime_ENABLE_MEMORY_PROFILE=OFF -Donnxruntime_ENABLE_CUDA_LINE_NUMBER_INFO=OFF \
    -Donnxruntime_BUILD_WEBASSEMBLY=OFF -Donnxruntime_BUILD_WEBASSEMBLY_STATIC_LIB=OFF \
    -Donnxruntime_ENABLE_WEBASSEMBLY_SIMD=OFF -Donnxruntime_ENABLE_WEBASSEMBLY_EXCEPTION_CATCHING=ON \
    -Donnxruntime_ENABLE_WEBASSEMBLY_EXCEPTION_THROWING=OFF -Donnxruntime_ENABLE_WEBASSEMBLY_THREADS=OFF \
    -Donnxruntime_ENABLE_WEBASSEMBLY_DEBUG_INFO=OFF -Donnxruntime_ENABLE_WEBASSEMBLY_PROFILING=OFF \
    -Donnxruntime_WEBASSEMBLY_MALLOC=dlmalloc -Donnxruntime_ENABLE_EAGER_MODE=OFF \
    -Donnxruntime_ENABLE_EXTERNAL_CUSTOM_OP_SCHEMAS=OFF -Donnxruntime_NVCC_THREADS=0 \
    -Donnxruntime_ENABLE_CUDA_PROFILING=OFF -Donnxruntime_DEV_MODE=ON -Donnxruntime_PYBIND_EXPORT_OPSCHEMA=OFF \
    -Donnxruntime_ENABLE_MEMLEAK_CHECKER=ON -DCMAKE_BUILD_TYPE=Debug 
    # --trace-expand &> trace.log

cd ./build/Linux/debug && make -j$(nproc)