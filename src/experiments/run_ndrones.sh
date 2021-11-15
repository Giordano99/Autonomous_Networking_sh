#-----------------------------------------------------------#
#           _  _ ___  ___  ___  _  _ ___ ___                #
#          | \| |   \| _ \/ _ \| \| | __/ __|               #
#          | .` | |) |   / (_) | .` | _|\__ \               #
#          |_|\_|___/|_|_\\___/|_|\_|___|___/               #
#                                                           #
#-----------------------------------------------------------#

#test baselines
for nd in "5" "10" "15";
do
    for alg in "GEO" "AI" "RND" "CLO" "EGN" "GEOUP" "NONE" "EGSOLOID" "UCB" "AI";
    do 
        echo "run: ${alg} - ndrones ${nd} "
        python3 -m src.experiments.experiment_ndrones -nd ${nd} -i_s 1 -e_s 3 -alg ${alg} &
        #python3 -m src.experiments.experiment_ndrones -nd ${nd} -i_s 10 -e_s 20 -alg ${alg} &
        #python3 -m src.experiments.experiment_ndrones -nd ${nd} -i_s 20 -e_s 30 -alg ${alg} &
    done;
done; 
wait

python3 -m src.experiments.json_and_plot -nd 5 -nd 10 -nd 15 -i_s 1 -e_s 3 -exp_suffix GEO -exp_suffix RND -exp_suffix CLO -exp_suffix EGN -exp_suffix GEOUP -exp_suffix NONE -exp_suffix EGSOLOID -exp_suffix UCB -exp_suffix AI

#python3 -m src.experiments.json_and_plot -nd 5 -nd 10 -nd 15 -i_s 1 -e_s 3 -exp_suffix AI
