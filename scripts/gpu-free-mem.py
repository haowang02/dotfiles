#!/usr/bin/python3

from nvitop import Device

def get_free_gpu_memory():
    """
    Returns the free GPU memory in human-readable format.
    """
    devices = Device.all()
    if not devices:
        return "No GPU devices found."
    free_memory = []
    for device in devices:
        free_memory_bytes = device.memory_free()
        free_memory.append(f'{free_memory_bytes / (1024 ** 3):.0f}GB')

    return ' '.join(free_memory)

if __name__ == "__main__":
    print(get_free_gpu_memory(), end='')
