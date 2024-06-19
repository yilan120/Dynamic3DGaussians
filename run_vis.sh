

# module load anaconda3
# export MYVAR=/data/home/acw773/.conda/envs/dynamic_gaussians/bin:/share/apps/centos7/anaconda3/2023.03/condabin:/share/apps/centos7/anaconda3/2023.03/condabin:/share/apps/centos7/anaconda3/2023.03/bin:/data/home/acw773/.vscode-server/bin/e2816fe719a4026ffa1ee0189dc89bdfdbafb164/bin/remote-cli:/data/ITSR-Scheduler/8.6.12b/bin/lx-amd64:/data/ITSR-Scheduler/8.6.12b/bin/lx-amd64:/usr/local/Modules/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/usr/lpp/mmfs/bin:/opt/puppetlabs/bin:/share/admin/bin:/share/admin/toolsbin:/usr/lpp/mmfs/bin:/share/admin/bin:/share/admin/toolsbin
# export APPTAINERENV_APPEND_PATH='/data/home/acw773/.conda/envs/dynamic_gaussians/bin'
# conda activate dynamic_gaussians


# module load cuda/11.6.2
# export CUDA_HOME=/share/apps/centos7/cuda/11.6.2
# export TORCH_CUDA_ARCH_LIST="8.0"

# apptainer exec --nv /data/home/acw773/ubuntu20_DGS.simg env CUDA_VISIBLE_DEVICES=0 python train.py


apptainer exec --nv /data/home/acw773/ubuntu20_DGS.simg env CUDA_VISIBLE_DEVICES=0 python visualize.py 
