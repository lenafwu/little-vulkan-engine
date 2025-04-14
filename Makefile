CXX = g++
CXXFLAGS = -std=c++17 -g -D_DEBUG -O2
VULKAN_SDK = /Users/helenwu/VulkanSDK/1.4.309.0/macOS

INCLUDES = -I/opt/homebrew/include \
           -I$(VULKAN_SDK)/include \
           -I/opt/homebrew/opt/glfw/include

LDFLAGS = -L/opt/homebrew/lib \
          -L$(VULKAN_SDK)/lib


# Update rpath format for macOS
RPATH = -Wl,-rpath,@executable_path/../lib \
        -Wl,-rpath,/opt/homebrew/lib \
        -Wl,-rpath,$(VULKAN_SDK)/lib

LIBS = -lglfw -lvulkan

# Add environment variables for validation layers
ENV_VARS = VULKAN_SDK=$(VULKAN_SDK) \
           VK_LAYER_PATH=$(VULKAN_SDK)/share/vulkan/explicit_layer.d \
           VK_ICD_FILENAMES=$(VULKAN_SDK)/share/vulkan/icd.d/MoltenVK_icd.json \
           DYLD_LIBRARY_PATH=$(VULKAN_SDK)/lib:$$DYLD_LIBRARY_PATH

SRC = *.cpp
TARGET = vulkanapp

$(TARGET): $(SRC)
	$(CXX) $(CXXFLAGS) $(INCLUDES) $(SRC) -o $(TARGET) $(LDFLAGS) $(LIBS) $(RPATH)

.PHONY: clean run

run: $(TARGET)
	$(ENV_VARS) ./$(TARGET)

clean:
	rm -f $(TARGET)