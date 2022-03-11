cd ~/projects/
new_folder_name=$1

if [ -d $new_folder_name ]
then
	echo "Уже существует папка с названием $1"
	exit 1
fi

mkdir $new_folder_name
cd $new_folder_name
git init
touch README.md
nano README.md
git add README.md
git commit -a -m "первый коммит"

ssh-keygen -t ed25519 -f "/home/volera/.ssh/$1" -N "" -q
cat ~/.ssh/$1.pub
cd ~/.ssh/
text=$(cat <<EOF
Host github.com
    IdentityFile=~/.ssh/$1
EOF
)
echo "$text" >> "config"


echo "Создание прошло успешно"
