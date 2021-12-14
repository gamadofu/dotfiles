if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi
# added by Anaconda3 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/yajima/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/yajima/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/yajima/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/yajima/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yajima/google-cloud-sdk/path.bash.inc' ]; then . '/Users/yajima/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yajima/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/yajima/google-cloud-sdk/completion.bash.inc'; fi

# android
export ANDROID_SDK=/Users/yajima/Library/Android/sdk
export PATH=/Users/yajima/Library/Android/sdk/platform-tools:$PATH

export PATH=$PATH:/Applications/"Android Studio.app"/Contents/jre/Contents/Home/bin
export JAVA_HOME=/Applications/"Android Studio.app"/Contents/jre/Contents/Home
