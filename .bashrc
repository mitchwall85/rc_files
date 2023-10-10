# .bashrc

# Modules to load by default
module load slurm/blanca

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# modules
# module load python/3.8.0

# User specific aliases and functions
export PATH="/home/miwa6095/opt/bin/:$PATH"
export PATH="/projects/miwa6095/lemans/lemans-common/tools/restart_interpolator/:$PATH"
export PATH="/projects/miwa6095/monaco/source/monaco/bin:$PATH"
export PATH="/home/miwa6095/job_monitor/lemans_mpc_curc:$PATH"
module use --append ~/opt/modules

# add ssh keys
eval "$(ssh-agent -s)" > /dev/null 2>&1 
ssh-add ~/.ssh/github

# aliasies
alias sq='squeue --user=miwa6095'
alias sqit='squeue --user=miwa6095 --iterate=1'
alias proj='cd /projects/miwa6095'
alias c='clear'
alias l='ls -lrth --color=auto'
alias scratch='cd /scratch/alpine/miwa6095'
alias home='cd /home/miwa6095'
alias bq='squeue --partition=blanca-ngpdl'
alias lb='module load slurm/blanca'
alias tf='tail -f'
alias clearLemansResults='rm *.plt *.out convergence.dat residuals.dat restart.dat tecplot_convergence.dat monitors.dat'
alias clearMonacoResults='rm graph.dat evalcell.log out.dat weight.dat MC* monaco.dat monaco.log *stats *plt link.dat'
alias clearMPCResults='rm Hsurface.dat Hrestart.dat weight_hyb.dat MPC.log grid.ngp grid.unf output.* KnGLL_Info* HZone_output*'
alias sacct='sacct --format='JobID,JobName,AllocCPUS,State,CPUTime,Reqmem,MaxRSS,Submit,End,Elapsed''
alias howfuckedisblanca="squeue --partition=blanca-ngpdl -o '''   %10i %12P %10j %10u %2D %3C %10T %10L %20N %S'''"
alias howfuckedamionalpine="squeue --partition=amilan -u miwa6095 -o '''   %10i %12P %10j %10u %2D %3C %10T %10L %20N %S'''"
alias howfuckedisalpine="squeue --partition=amilan -o '''   %10i %12P %10j %10u %2D %3C %10T %10L %20N %S'''"
# alias compileLemans="cd /projects/miwa6095/lemans/source && "
alias mpcModules="module purge; module load gcc; module load openmpi"
alias nv='nvim'
alias sintNGPDL='sinteractive --reservation=ngpdl_small'
alias tma='tmux attach-session -t '
alias tmr='tmux rename-session '
alias cpath='echo -n $(pwd) | xclip -sel clip'

# python scripts
export PATH="$PATH:/home/miwa6095/python/lemansPost/"

# color terminal
export PS1='\[\e[1;34m\]\u\[\e[0m\]@\[\e[1;32m\]\h\[\e[0m\]:\[\e[1;33m\]\w\[\e[0m\]\$ '

# functions
# compile lemans from anywhere
function compLM() {
	local workingDir=$(pwd)
 	cd /projects/miwa6095/lemans/source;
	./"$1";
	cd "$workingDir"  
}

# LS Colors
LS_COLORS="di=34"

## SU2 things (old)
# export SU2_RUN=/projects/miwa6095/su2/bin
# export SU2_HOME=/projects/miwa6095/su2/SU2
# export PATH=$PATH:$SU2_RUN
# export PYTHONPATH=$PYTHONPATH:$SU2_RUN

## Sparta things (old)
# export PATH="$PATH:/projects/miwa6095/asen6061/sparta-18Jul2022/tools/paraview/"

