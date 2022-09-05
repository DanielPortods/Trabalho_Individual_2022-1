# Trabalho-Individual-2022-1
Trabalho individual de GCES de 2022/1

| Matrícula | Nome |
|:-:|--|
| 18/0149687  | Daniel Porto de Souza |


O presente repositório apresenta os resultados obtidos na realização da atividade proposta no trabalho inividual da disciplina GCES de 2022.1 do curso de Engenharia de Software da Universidade de Brasília. 

**Enunciado do trabalho:** [Trabalho Individual](ACTIVITY_TEXT.md)

## Rodando a aplicação

**Requisitos:** Docker, Git

>$ git clone https://github.com/DanielPortods/Trabalho_Individual_2022-1.git

>$ cd Trabalho_Individual_2022-1

>$ cp library_back/.env-sample library_back/.env

>$ docker compose up --build

A aplicação estará diponível na porta 3000 ([http://localhost:3000](http://localhost:3000))

Para checar o server nginx: [http://localhost](http://localhost)


## Etapas de trabalho
### 1. Containerização do Banco
A containerização do banco de dados foi feita diretamente no arquivo do orquestrador, [docker-compose.yml](docker-compose.yml). Foi utilizado uma imagem do banco Postgres

### 2. Containerização da Aplicação + Banco
Para containerizar o back-end da aplicação, foi desenvolvido o [Dockerfile](library_back/Dockerfile) para especificar o build corretamente. Além disso, foi criado um script [wait](library_back/wait.sh) para sincronizar a conexão com o banco, definir um timeout e continuar com as configurações necessárias após a conexão estabelecida.

### 3. Configuração do Frontend
Semelhante ao back-end, para a containeirização e configuração do front, foi utilizado o [Dockerfile](library_front/Dockerfile), o qual foi utilizado no documento do orquestrador [docker-compose.yml](docker-compose.yml).

### 4. Servindo a aplicação com o Nginx
Na última etapa de configuração do ambiente, foi feito a configuração de um servidor Nginx em um container e adicionado, também, ao [docker-compose.yml](docker-compose.yml). Para a configuração do servidor, foi desenvolvido o arquivo [nginx.conf](nginx.conf) 

### 5. Integração Contínua (CI)
Por fim, foram elaboradas dois workflows de CI. O [CI.yml](.github/workflows/CI.yml) refere-se a checagem estática de codestyle com pycodestyle e eslint, realização de testes e build da aplicação. Essas tasks são realizada sempre que um PR é aberto ou se é dado push na branch main, e foram separadas em build, back e front.

Além disso, tem-se o [CI-dockerhub.yml](.github/workflows/CI-dockerhub.yml) o qual refere-se a atualização das imagens do back-end e do front-end disponíveis no dockerhub. Essa rotina é iniciada sempre que é dado push na branch main.

É importante ressalatar que essas estratégias de Ci forma desenvolvidas pensando no contexto em que não é permitido commitar diretamente na main.

**Tag da imagem do back-end:** `portods/library-back-end`

**Tag da imagem do front-end:** `portods/library-front-end`