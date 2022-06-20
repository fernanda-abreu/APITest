*** Settings ***
Documentation   Resource geral para as APIS

Library         RequestsLibrary
Library         Collections
Library         JSONLibrary


*** Keywords ***

Passo 1
    ## metodo = Post  ==>> para criar um novo registro com as informações passadas.                                                                                  
    &{body}=    Create dictionary           first_name=Fernanda           
    ...                                     middle_name=Abreu
    ...                                     last_name=Santos
    ...                                     date_of_birth=17/02/1989

    ${resp}=                                POST On Session    jsonplaceholder  /Post   data=${body} 
    # Get value from json         

    log to console                          ${resp.json()}  
    
    ${id}=                                  Get Value From Json	                    ${resp.json()}	                        $.id
     ${id}=                                 Set Test Variable                       ${id}
    ${first_name}                           Get Value From Json	                    ${resp.json()}	                        $.first_name
    ${middle_name}                          Get Value From Json	                    ${resp.json()}	                        $.middle_name
    ${last_name}                            Get Value From Json	                    ${resp.json()}	                        $.last_name
    ${date_of_birth}                        Get Value From Json	                    ${resp.json()}	                        $.date_of_birth

    Should Be Equal As Strings              ${first_name[0]}                        Fernanda                                Os nomes não são iguais   
    Should Be Equal As Strings              ${middle_name[0]}                       Abreu                                   Os nomes não são iguais
    Should Be Equal As Strings              ${last_name[0]}                         Santos                                  Os nomes não são iguais
    Should Be Equal As Strings              ${date_of_birth[0]}                     17/02/1989                              Os nomes não são iguais
#==============================================================================================
Passo 2
    ## metodo = get  ==>> para consultar o registro criado anteriormente.     
    
    #&{body}=                                Create dictionary                       id_2=${id[0]}                                                                          
    ${resp}=                                Get On Session                          jsonplaceholder  /${id[0]}  
    log to console                          ${resp.json()}
    
    Should Be Equal As Strings              ${resp.status_code}                     200

 
#==============================================================================================
Passo 3
    ## metodo = Delete  ==>> para excluir o registro feito.
    
    #&{body}=                                Create dictionary                       id_2=${id[0]}                                                                          
    ${resp}=                                Delete On Session                       jsonplaceholder  /${id[0]}
    log to console                          ${resp.json()}
    
    Should Be Equal As Strings              ${resp.status_code}                     200

#==============================================================================================
Passo 4
    
    ## metodo = get  ==>> para consultar se o registro foi cancelado, ou seja, não existe mais.
    #&{body}=                                Create dictionary                       id_2=${id[0]}                                                                          
    ${resp}=                                Get On Session                          jsonplaceholder  /${id[0]} 
    log to console                          ${resp.json()}
    
    Should Be Equal As Strings              ${resp.status_code}                     200
       