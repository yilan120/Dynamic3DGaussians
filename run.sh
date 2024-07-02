#!/bin/bash
#$ -cwd
#$ -wd /data/home/acw773/Dynamic3DGaussians
#$ -j y
#$ -pe smp 8          # 8 cores per GPU
#$ -l h_rt=5:59:0    # 240 hours runtime
#$ -l gpu=1           # request 1 GPU
#$ -o logs/
#$ -m ea
#$ -l gpu_type=ampere

# cd Dynamic3DGaussians

module load anaconda3
export MYVAR=/data/home/acw773/.conda/envs/dynamic_gaussians/bin:/share/apps/centos7/anaconda3/2023.03/condabin:/share/apps/centos7/anaconda3/2023.03/condabin:/share/apps/centos7/anaconda3/2023.03/bin:/data/home/acw773/.vscode-server/bin/e2816fe719a4026ffa1ee0189dc89bdfdbafb164/bin/remote-cli:/data/ITSR-Scheduler/8.6.12b/bin/lx-amd64:/data/ITSR-Scheduler/8.6.12b/bin/lx-amd64:/usr/local/Modules/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/usr/lpp/mmfs/bin:/opt/puppetlabs/bin:/share/admin/bin:/share/admin/toolsbin:/usr/lpp/mmfs/bin:/share/admin/bin:/share/admin/toolsbin
export APPTAINERENV_APPEND_PATH='/data/home/acw773/.conda/envs/dynamic_gaussians/bin'
conda activate dynamic_gaussians


module load cuda/11.6.2
export CUDA_HOME=/share/apps/centos7/cuda/11.6.2
export TORCH_CUDA_ARCH_LIST="8.0"

# train
# apptainer exec --nv /data/home/acw773/ubuntu20_DGS.simg env CUDA_VISIBLE_DEVICES=0 python train.py
# visualize
# apptainer exec --nv /data/home/acw773/ubuntu20_DGS.simg env CUDA_VISIBLE_DEVICES=0 python visualize.py 


# train-restart-no-densify
# apptainer exec --nv /data/home/acw773/ubuntu20_DGS.simg env CUDA_VISIBLE_DEVICES=0 python train_restart.py


# train-restart-no-densify-mask-loss
# apptainer exec --nv /data/home/acw773/ubuntu20_DGS.simg env CUDA_VISIBLE_DEVICES=0 python train_restart_mkloss.py

# train-smooth-restart
apptainer exec --nv /data/home/acw773/ubuntu20_DGS.simg env CUDA_VISIBLE_DEVICES=0 python train_smooth_restart.py

# apptainer exec --nv /data/home/acw773/ubuntu20_DGS.simg env CUDA_VISIBLE_DEVICES=0 python train_restart_densify.py 


# apptainer exec --nv /data/home/acw773/ubuntu20_DGS.simg env CUDA_VISIBLE_DEVICES=0 python train_restart_clean_loss.py 


# apptainer shell /data/home/acw773/ubuntu20_DGS.simg

# apptainer exec --nv /data/home/acw773/ubuntu20_DGS.simg env CUDA_VISIBLE_DEVICES=0 python render.py -m output/ho3d/mask_ho3d_100_pose_correction_lbs_offset_split_clone_merge_prune --motion_offset_flag --motion_flag --smpl_type mano --actor_gender right --iteration 5000
# apptainer exec --nv /data/home/acw773/ubuntu20_DGS.simg env CUDA_VISIBLE_DEVICES=0 python train.py -s /data/scratch/acw773/HO3D_v2/train/ABF10 --eval --exp_name ho3d/py37_mask_ho3d_100_pose_correction_lbs_offset_split_clone_merge_prune --motion_offset_flag --motion_flag --smpl_type mano --actor_gender right --iterations 5000


# module load gcc/6.3.0
# module load gcc/12.1.0