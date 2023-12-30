# generate quantized model
python -m dgq.entry \
    TinyLlama/TinyLlama-1.1B-intermediate-step-1431k-3T \
    wikitext2 \
    --wt_fun search \
    --act_fun static \
    --groupsize 128 \
    --wbits 8 \
    --kvquant \
    --save_safetensors model_w4w8.safetensors \
    --nsamples 32 \
    --smoothquant

#evaluate quantized model
python -m dgq.entry \
    TinyLlama/TinyLlama-1.1B-intermediate-step-1431k-3T \
    wikitext2 \
    --wt_fun search \
    --act_fun static \
    --groupsize 128 \
    --wbits 8 \
    --kvquant \
    --load model_w4w8.safetensors \
    --eval \
    # --inference_mod
