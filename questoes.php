<?php
    session_start();
    include_once "conexao.php";
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Quiz</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <style>
        #fundo{
            background-image: url("fundo.jpg");
            width: 100%;
		    height: 90vh;
            display: flex; 
            align-items: center; 
        }

        input[type=checkbox], input[type=radio]{
            width:25px;
            height:25px;
        }

        .alternativa{
            margin-left:2px;
            margin-right:2px;
        }

        .alternativa p{
            font-size:18px;
            margin-left:4px;
        }
    </style>
</head>
<body id="fundo">
    <div class="container align-center">
        <div class="row justify-content-center">
            <div class="col-sm-8">
                <div class="card">
                    <div class="card-body ">

                        <?php
                            //Pesquisar primeira pergunta
                            $sql_pergunta = "SELECT * FROM `perguntas` WHERE id = 1";
                            $pergunta = mysqli_query($conexao, $sql_pergunta);
                            $imprimir_pergunta = mysqli_fetch_array($pergunta);
                        ?>
                      
                        <form method="post" action="">
                            <?php
                                //Receber os dados
                                $dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
                                //var_dump($dados);

                                if(isset($_POST['btn-resposta'])){
                                    if(!empty($dados['id_resposta'])){
                                        //Resposta da pergunta
                                        $id_resposta = $dados['id_resposta'];
                                        $id_pergunta = $dados['id_pergunta'];

                                        $sql_resposta = "SELECT * FROM `alternativas` WHERE id = $id_resposta LIMIT 1";

                                        $resposta_pergunta = mysqli_query($conexao, $sql_resposta);
                                        $imprimir_resposta = mysqli_fetch_array($resposta_pergunta);

                                        if($imprimir_resposta['val_resposta']==1){
                                            $novo_id = $id_pergunta + 1;
                                            $sql_pergunta = "SELECT * FROM `perguntas` WHERE id = $novo_id";
                                            $pergunta = mysqli_query($conexao, $sql_pergunta);
                                            $imprimir_pergunta = mysqli_fetch_array($pergunta);
                                            
                                            $_SESSION['pg'] = "<p style='color:#666;font-size: 18px; margin-bottom:0;'>Pergunta ".$novo_id." de 10</p>";

                                            if($novo_id == 11){
                                                header("Location: final.php");
                                            }

                                        }else{
                                            
                                            $sql_pergunta = "SELECT * FROM `perguntas` WHERE id = $id_pergunta";
                                            $pergunta = mysqli_query($conexao, $sql_pergunta);
                                            $imprimir_pergunta = mysqli_fetch_array($pergunta);
                                            $_SESSION['msg'] = "<p style='color:#ff0000;font-size: 18px; text-align:center;'>Resposta incorreta, tente novamente</p>";

                                        }

                                    }else{
                                        $id_pergunta = $dados['id_pergunta'];
                                        $sql_pergunta = "SELECT * FROM `perguntas` WHERE id = $id_pergunta";
                                        $pergunta = mysqli_query($conexao, $sql_pergunta);
                                        $imprimir_pergunta = mysqli_fetch_array($pergunta);

                                        $_SESSION['msg'] = "<p style='color:#ff0000;font-size: 18px; text-align:center;'>Você deve escolher uma das alternativas</p>";
                                    }
                                }

                                if($imprimir_pergunta['pergunta'] != 0){
                                    if(isset($_SESSION['pg'])){
                                        echo $_SESSION['pg'];
                                        unset($_SESSION['pg']);
                                    } else{
                                        echo "<p style='color:#666;font-size: 18px; margin-bottom:0;'>Pergunta 1 de 10</p>";
                                    }

                                    echo "<h2 class='card-title text-center'>".$imprimir_pergunta['pergunta']."</h2>";
                                    echo "<hr style='background-color: #007bff;'>";

                                    if(isset($_SESSION['msg'])){
                                        echo $_SESSION['msg'];
                                        unset($_SESSION['msg']);
                                    }

                                    //Pesquisar alternativas
                                    $id_pergunta = $imprimir_pergunta['id'];
                                    $sql_alternativa = "SELECT * FROM `alternativas` WHERE pergunta_id = $id_pergunta";

                                    $alternativa = mysqli_query($conexao, $sql_alternativa);

                                    echo "<input type='hidden' value='$id_pergunta' name='id_pergunta'>";

                                    while($imprimir_alternativa = mysqli_fetch_array($alternativa)){
                                        $id_resposta = $imprimir_alternativa['id'];
                                        $resposta = $imprimir_alternativa['resposta'];

                                        if(isset($dados['id_resposta']) AND (!empty($dados['id_resposta'])) AND $id_resposta == $dados['id_resposta']){
                                            $selecionado = "checked";
                                        }else{
                                            $selecionado = "";
                                        }

                                        echo "<div class='row alternativa'><input type='radio' name='id_resposta' value='$id_resposta' $selecionado><p>$resposta</p></div>";
                                        
                                    }
                                }else {
                                    echo "Pergunta não encontrada";
                                }
                            ?>
                            <input type="submit" name="btn-resposta" class="btn btn-primary mt-3" value="Verificar resultado">

                            <a href="index.php" class="btn btn-primary mt-3 mr">Sair</a>
                        </form>             
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>