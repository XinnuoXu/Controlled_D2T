#!/bin/bash

DSRC_PATH=../data_e2e.clean/data-alg/src.dict
DTGT_PATH=../data_e2e.clean/data-alg/tgt.dict
REL_PATH=../data_e2e.clean/data-alg/relations.txt
JSON_PATH=/scratch/xxu/e2e.clean/pretrain_jsons/
DATA_PATH=/scratch/xxu/e2e.clean/pretrain_data/

python preprocess.py \
	-mode pretrain_to_data \
	-raw_path ${JSON_PATH} \
	-save_path ${DATA_PATH} \
	-relation_path ${REL_PATH} \
	-src_dict_path ${DSRC_PATH} \
	-tgt_dict_path ${DTGT_PATH} \
	-tokenizer word \
      	-lower \
	-n_cpus 30 \
	-min_src_nsents 0 \
	-max_src_nsents 7 \
	-min_src_ntokens_per_sent 2 \
	-log_file ../logs/preprocess.log
