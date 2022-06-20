*** Settings ***
Documentation   Resource geral para as APIS

Library         RequestsLibrary
Library         Collections
Library         JSONLibrary

Resource        ../Resource/API_FernandaAbreuMSantos.robot

Suite Setup    Create Session  jsonplaceholder  http://thetestingworldapi.com/api/studentsDetails



*** Test Cases ***

Desafio inicial API

  Passo 1   # metodo = Post  ==>> para criar um novo registro com as informações passadas.
  Passo 2   # metodo = get  ==>> para consultar o registro criado anteriormente.
  Passo 3   # metodo = Delete  ==>> para excluir o registro feito.
  Passo 4   # metodo = get  ==>> para consultar se o registro foi cancelado, ou seja, não existe mais.


