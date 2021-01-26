# SportIA
Aplicativo simples feito em Flutter para estudo de Machine learning com identificação de imagens.

![app](https://user-images.githubusercontent.com/37723303/105784226-2277c480-5f57-11eb-8cfe-3b4b0f8bf9d2.jpg)

Para realizar a criação do projeto e treinamento da IA, acesse o site https://teachablemachine.withgoogle.com/ e selecione **Image Project**.
Após clique na classe e no ícone de editção para inserir o nome desejado e em seguida clique em **Upload** para adicionar imagens. 

![ml1](https://user-images.githubusercontent.com/37723303/105783556-7d102100-5f55-11eb-9ac8-782e9afbb122.jpg)

Feito o upload das imagens em suas respectivas classes, agora é necessário treinar a IA com os parâmentro padrões ou modificados.
Após concluir o treinamento, clique em **Export Model**

![ml2](https://user-images.githubusercontent.com/37723303/105784410-826e6b00-5f57-11eb-9b59-42a7f32792e3.jpg)

Agora escolha a opção **Tensorflow Lite** com o tipo **Floating point** e clique em **Download my model** para realizar o download dos arquivos gerados.

![ml3](https://user-images.githubusercontent.com/37723303/105784564-d0836e80-5f57-11eb-8ce8-a3d6eae89ef9.jpg)

## Configurações no Flutter ##
Adicione as dependências abaixo em seu pubspec.yaml
- [x] https://pub.dev/packages/tflite **para configuração da IA.**
- [x] https://pub.dev/packages/percent_indicator **para o indicador de porcentagem.**
- [x] https://pub.dev/packages/image_picker **para adicionar imagem.**

Não esqueça de atualizar as dependências com o comando **flutter pub get** em seu terminal ou **Ctrl + S** caso esteja utilizado VSCODE.

Agora é necessário abrir o arquivo **android →app →build.gradle** e adicionar o **aaptOptions** e trocar a **versão mínima do sdk para 22**.

![config](https://user-images.githubusercontent.com/37723303/105785413-93b87700-5f59-11eb-99f3-3c1430185115.jpg)

Feito estes procedimentos agora basta criar uma pasta model para a classe **TFLiteResult** e uma pasta helpers para a classe **TFLiteHelper** que estará toda a configuração da API TensorFlow Lite para a classificação de imagens e podermos utilizar da detecção das imagens.

>#Flutter #MachineLearning
