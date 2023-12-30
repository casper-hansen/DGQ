# generate quantized model
CUDA_VISIBLE_DEVICES=0 python -m dgq.entry TinyLlama/TinyLlama-1.1B-intermediate-step-1431k-3T wikitext2 --wt_fun search --act_fun static --groupsize 128 --wbits 8 --kvquant --save_safetensors model_w4w8.safetensors --nsamples 32 --smoothquant

#evaluate quantized model
# python -m dgq.entry /data/Llama-2-7b-hf/ wikitext2 --wt_fun search --act_fun static --groupsize 128 --wbits 4 --kvquant --load model_w4w8.safetensors --eval

#evaluate quantized model with A8W4kernel
# python -m dgq.entry /data/Llama-2-7b-hf/ wikitext2 --wt_fun search --act_fun static --groupsize 128 --wbits 4 --kvquant --load model_w4w8.safetensors --eval --inference_mod