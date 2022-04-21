DATA=$1
HEIGHT=$2

# create camera intrinsics/extrinsic format for NSFF, same as original NeRF where it uses imgs2poses.py script from the LLFF code: https://github.com/Fyusion/LLFF/blob/master/imgs2poses.py
python save_poses_nerf.py --data_path $DATA
# Resize input images and run single view model, 
# argument resize_height: resized image height for model training, width will be resized based on original aspect ratio
python run_midas.py --data_path $DATA --resize_height $HEIGHT
# Run optical flow model
python run_flows_video.py --model models/raft-things.pth --data_path $DATA