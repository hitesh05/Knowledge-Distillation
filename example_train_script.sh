# example scripts for running various KD methods
# use cifar10, resnet110 (teacher) and resnet20 (student) as examples

# Baseline
CUDA_VISIBLE_DEVICES=0 python -u train_base.py \
                           --save_root "./results/base/" \
                           --data_name cifar10 \
                           --num_class 10 \
                           --net_name resnet20 \
                           --note base-c10-r20

# SoftTarget
CUDA_VISIBLE_DEVICES=0 python -u train_kd.py \
                           --save_root "./results/st/" \
                           --t_model "./results/base/base-c10-r20/model_best.pth.tar" \
                           --s_init "./results/base/base-c10-r20/initial_r20.pth.tar" \
                           --data_name cifar10 \
                           --num_class 10 \
                           --t_name resnet20 \
                           --s_name resnet20 \
                           --kd_mode st \
                           --lambda_kd 0.1 \
                           --T 4.0 \
                           --note st-c10-r20-r20

# Fitnet
CUDA_VISIBLE_DEVICES=0 python -u train_kd.py \
                           --save_root "./results/fitnet/" \
                           --t_model "./results/base/base-c10-r20/model_best.pth.tar" \
                           --s_init "./results/base/base-c10-r20/initial_r20.pth.tar" \
                           --data_name cifar10 \
                           --num_class 10 \
                           --t_name resnet20 \
                           --s_name resnet20 \
                           --kd_mode fitnet \
                           --lambda_kd 0.1 \
                           --note fitnet-c10-r20-r20
# RKD
CUDA_VISIBLE_DEVICES=0 python -u train_kd.py \
                           --save_root "./results/rkd/" \
                           --t_model "./results/base/base-c10-r20/model_best.pth.tar" \
                           --s_init "./results/base/base-c10-r20/initial_r20.pth.tar" \
                           --data_name cifar10 \
                           --num_class 10 \
                           --t_name resnet20 \
                           --s_name resnet20 \
                           --kd_mode rkd \
                           --lambda_kd 1.0 \
                           --w_dist 25.0 \
                           --w_angle 50.0 \
                           --note rkd-c10-r20-r20