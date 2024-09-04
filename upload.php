<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obter a imagem base64 do corpo da requisição
    $image = $_POST['image'];

    // Obter configurações da API a partir das variáveis de ambiente
    $apiUrl = getenv('API_URL');
    $apiKey = getenv('API_KEY');

    // Configurar a requisição para a API
    $data = json_encode(['image' => $image]);
    $options = [
        'http' => [
            'header'  => "Content-type: application/json\r\n",
            'method'  => 'POST',
            'content' => $data,
        ],
    ];
    $context  = stream_context_create($options);
    $response = file_get_contents($apiUrl, false, $context);

    // Retornar a resposta da API
    if ($response === FALSE) {
        die('Erro ao comunicar com a API.');
    }

    echo $response;
}
?>
