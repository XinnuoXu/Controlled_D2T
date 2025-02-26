#!/bin/bash

DSRC_PATH=../data_e2e/data-alg/src.dict
DTGT_PATH=../data_e2e/data-alg/tgt.dict
REL_PATH=../data_e2e/data-alg/relations.txt

DATA_PATH=/scratch/xxu/e2e.cross/hmm_data/e2e
#MODEL_PATH=/scratch/xxu/e2e/models.local_limit/
MODEL_PATH=/scratch/xxu/e2e/models/

python train.py \
	-mode test \
	-data_path ${DATA_PATH} \
	-src_dict_path ${DSRC_PATH} \
	-tgt_dict_path ${DTGT_PATH} \
	-relation_path ${REL_PATH} \
	-test_from ${MODEL_PATH}model_step_50000.pt \
	-state_emb_size 32 \
	-dec_hidden_size 128 \
	-dec_ff_size 256 \
	-enc_hidden_size 128 \
	-enc_ff_size 256 \
	-test_batch_size 100 \
	-visible_gpus 0 \
	-max_pos 512 \
	-min_length 3 \
	-max_length 200 \
	-alpha 0.9 \
	-tp_bias 0.0 \
	-active_patt_num 2 \
	-s_beam_size 3 \
	-extreme 0 \
	-log_file ../logs/val_abs_bert_cnndm \
	-result_path ../logs/abs_bert_cnndm
	#-inference_mode nucleus \
        #-nucleus_p 0.3 \
	#-lm_cov_bias 0.98 \
