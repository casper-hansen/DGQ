# Dual Grained Quantization: Efficient Fine-Grained Quantization for LLM [[Paper](https://arxiv.org/abs/2310.04836)]

## features and milestone:
- DGQ algorithm for A8W4 models.
- Memory-efficient Linear Layers for FakeQuant For Pytorch.
- Efficient CUTLASS kernel implementation for fast inference. 
- Edge Device Support. [We are working with it.]


## Install 

```
conda create -n dgq python=3.10 -y
conda activate dgq
pip install --upgrade pip  # enable PEP 660 support
pip install -e .
```
### Kernel install 
CUDA 12.1 need to be installed first. We recommend using the bitsandbytes script(https://raw.githubusercontent.com/TimDettmers/bitsandbytes/main/cuda_install.sh).
```
git clone --recurse-submodules https://github.com/casper-hansen/DGQ.git
apt-get update && apt-get install cmake
source environment.sh
bash build_cutlass.sh
cd dgq/kernels/
python setup.py install
```
## Usage

We provide a sample script to run DGQ('./llama7b.sh')

1. Perform DGQ quantization and save the true quant model:
```bash
	python -m dgq.entry [your-model-path] [dataset] --wt_fun search --groupsize 128 --wbits 4 --smoothquant --w4w8 --kvquant --save_safetensors [path-to-save]
```
2. Load and evaluate the real quantized model:
```bash
	python -m dgq.entry [your-model-path] [dataset] --wt_fun search --groupsize 128 --wbits 4 --smoothquant --w4w8 --kvquant --load [path-to-save] --eval
```

## Reference

If you find our work useful or relevant to your research, please kindly cite our paper:

```
@article{zhang2023dual,
  title={Dual Grained Quantization: Efficient Fine-Grained Quantization for LLM},
  author={Zhang, Luoming and Fei, Wen and Wu, Weijia and He, Yefei and Lou, Zhenyu and Zhou, Hong},
  journal={arXiv preprint arXiv:2310.04836},
  year={2023}
}
```

## Acknowledgements

Our codes refers to followed projects:
[GPTQ](https://github.com/IST-DASLab/gptq)
[GPTQ-for-LLaMA](https://github.com/qwopqwop200/GPTQ-for-LLaMa/)
[AWQ](https://github.com/mit-han-lab/llm-awq)
[SmoothQuant](https://github.com/mit-han-lab/smoothquant)
[torch-int](https://github.com/Guangxuan-Xiao/torch-int)
[fasttransformer](https://github.com/NVIDIA/FasterTransformer)
