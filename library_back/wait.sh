dbIsReady() {
python3 << END
import socket
import time
import os
port = int(os.environ["POSTGRES_PORT"])
soc = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
soc.connect(('library_db', port))
soc.close()
END
}

pip3 install -r requirements.txt

until dbIsReady; do
  >&2 echo "WAITING DATABASE CONNECTION..."
  sleep 1
done
echo "DATABASE CONNECTION ESTABLISHED! :-)"

python3 manage.py makemigrations

python3 manage.py migrate

python3 manage.py runserver 0.0.0.0:8000