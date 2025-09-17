package com.example.webimc;

public class IMC {
    public static String getCondicaoFisica(double imc){
        String condicao = "";
        if(imc < 18.5)
            condicao = "Abaixo do Peso";
        else if(imc <= 24.9)
            condicao = "Peso ideal";
        else if (imc <= 29.9)
            condicao = "Sobrepeso";
        else
            condicao = "Obesidade";
        return condicao;
    }
}
