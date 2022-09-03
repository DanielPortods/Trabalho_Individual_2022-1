dbIsReady() {
python3 << END
import socket
import time
import os
port = int(os.environ["POSTGRES_PORT"])
host = os.environ["POSTGRES_HOST"]
soc = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
soc.connect((host, port))
soc.close()
END
}

pip3 install -r requirements.txt

trys=0;

until dbIsReady; do
  >&2 echo "WAITING DATABASE CONNECTION..."
  sleep 1

  trys=$((trys+1))

  if [ $trys -gt 10 ]
  then
  echo "TIME OUT!"
  exit 1
  fi
done

echo "DATABASE CONNECTION ESTABLISHED! :-)"

python3 manage.py makemigrations

python3 manage.py migrate

python3 manage.py runserver 0.0.0.0:8000