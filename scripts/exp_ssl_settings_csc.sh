#!/bin/bash

FOLD=$1
BATCH_SIZE=$2
JOB_ID=$3
COMMENT=$4
MODEL_NAME=$5
METHOD_NAME=$6
DATA_DIR=$7
REMOVED_LOSSES=$8 # for Semixup only. Value: 1, 2, or 3. String not including them 3 means to use all regularizers.
SEED=$9


N_DATA_LIST=(3000 3000 2000 2000 2000 1000 1000 1000 1000 1000 1000 500 500 500 500 500 500 100 100 100 100 100 100 50 50 50 50 50 50)
N_UDATA_LIST=(3000 6000 2000 4000 6000 1000 2000 3000 4000 5000 6000 500 1000 1500 2000 2500 3000 100 200 300 400 500 600 50 100 150 200 250 300)

N_DATA=${N_DATA_LIST[JOB_ID-1]}
N_UDATA=${N_UDATA_LIST[JOB_ID-1]}

SKIP=1

let BS=${BATCH_SIZE}
let a=\(5*${N_DATA}+${BS}-1\)
let b=$a/${BS}
let N_BATCHES=${SKIP}*$b
echo "Num of batches is ${N_BATCHES} ${METHOD_NAME} ${COMMENT} ${DATA_DIR}"
echo "-------------- $b ---------- "


echo "Run ./scripts/train_ssl.sh ${FOLD} ${BATCH_SIZE} ${N_DATA} ${N_UDATA} ${MODEL_NAME} 32 ${N_BATCHES} ${METHOD_NAME} ${COMMENT} ${DATA_DIR} ${REMOVED_LOSSES} ${SEED}"
./scripts/train_ssl.sh ${FOLD} ${BATCH_SIZE} ${N_DATA} ${N_UDATA} ${MODEL_NAME} 32 ${N_BATCHES} ${METHOD_NAME} ${COMMENT} ${DATA_DIR} ${REMOVED_LOSSES} ${SEED}