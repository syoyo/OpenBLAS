## Please edit android sdk/ndk/cmake path
ANDROID_SDK_ROOT=$HOME/Android/Sdk/
ANDROID_NDK_ROOT=$HOME/Android/Sdk/ndk-bundle
#ANDROID_NDK_ROOT=$HOME/Android/Sdk/ndk/android-ndk-r21/
# CMake 3.10 or later required
CMAKE_BIN=$ANDROID_SDK_ROOT/cmake/3.10.2.4988404/bin/cmake
#CMAKE_BIN=cmake

# For ninja build
# -DCMAKE_MAKE_PROGRAM=$ANDROID_SDK_ROOT/cmake/3.6.4111459/bin/ninja \

# Due to the source code layout of OpenBLAS, we need to use in-source build 
# Otherwise compilation fails due to the conflict of existing `config.h` and generated `config.h`
# (Using in-source build correctly overrides `config.h`)

$CMAKE_BIN \
  -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK_ROOT/build/cmake/android.toolchain.cmake \
  -DANDROID_ARM_MODE=arm \
  -DANDROID_ARM_NEON=On \
  -DANDROID_ABI=arm64-v8a \
  -DANDROID_NATIVE_API_LEVEL=28 \
  -DCMAKE_EXE_LINKER_FLAGS="-fuse-ld=lld" \
  -DANDROID_STL=c++_shared \
  -DTARGET=CORTEXA73 \
  -DNOFORTRAN=1 \
  -DDYNAMIC_ARCH=0 \
  -DBUILD_WITHOUT_LAPACK=On \
  -DBUILD_RELAPACK=Off \
  .
