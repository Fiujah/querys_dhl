SELECT 
  A.col_1 AS KEY,
  A.col_2 AS CHAVE_NFE,
  A.col_3 AS CODIGO_AGENDAMENTO,
  A.col_4 AS "NOTA FISCAL",
  A.col_5 AS "SERIE NF",
  A.col_2 AS CHAVENFE,
  A.col_6 AS VOLUMES,
  ROUND(A.col_7, 4) AS "PESO CUBADO",
  A.col_8 AS VALOR_NF,
  TRUNC(A.col_9) AS DATAEMISSAONF,
  A.col_10 AS NUMEROPEDIDOK,
  A.col_11 AS CHAVE_CLIENTE,
  A.col_12 AS PESO_TOTAL,
  A.col_13 AS PESO_CONSIDERADO,
  A.col_14 AS CARRIER_CODE,
  A.col_15 AS TIPOITEM,
  (CASE WHEN A.col_16 IS NULL THEN B.col_1 ELSE E.col_1 END) AS FILIAL_ATUAL,
  D.col_2 AS DATA_PREVISAO,
  (CASE
     WHEN TRUNC(D.col_2) >= TRUNC(SYSDATE) THEN 'No Prazo'
     WHEN TRUNC(D.col_2) BETWEEN TRUNC(SYSDATE -5) AND TRUNC(SYSDATE) THEN 'No Prazo'
     WHEN TRUNC(D.col_2) BETWEEN TRUNC(SYSDATE-15) AND TRUNC(SYSDATE -5) THEN 'Entre 6 e 15'
     WHEN TRUNC(D.col_2) BETWEEN TRUNC(SYSDATE-30) AND TRUNC(SYSDATE -15) THEN 'Entre 16 e 30'
     WHEN TRUNC(D.col_2) < TRUNC(SYSDATE -30) THEN 'Maior que 30'
     ELSE 'SEM CTE'
   END) AS STATUSPRAZO,
  D.col_3 AS CTE_RPS,
  D.col_4 AS CHAVE_CTE,
  AJ.col_1 AS FILIAL_ENTREGA,
  TRUNC(D.col_5) AS DATA_CTE,
  D.col_6 AS DATA_ENTREGA,
  G.col_2 AS CNPJ_REMETENTE,
  G.col_1 AS REMETENTEORIGEM,
  G.col_3 AS REMETENTE,
  (CASE A.col_17
     WHEN <ID_1> THEN '<CLIENT_NAME>'
     WHEN <ID_2> THEN '<CLIENT_NAME>'
     WHEN <ID_3> THEN '<CLIENT_NAME>'
     WHEN <ID_4> THEN '<CLIENT_NAME>'
     WHEN <ID_5> THEN '<CLIENT_NAME>'
     WHEN <ID_6> THEN '<CLIENT_NAME>'
     WHEN <ID_7> THEN '<CLIENT_NAME>'
     WHEN <ID_8> THEN '<CLIENT_NAME>'
     WHEN <ID_9> THEN '<CLIENT_NAME>'
     WHEN <ID_10> THEN '<CLIENT_NAME>'
     WHEN <ID_11> THEN '<CLIENT_NAME>'
     WHEN <ID_12> THEN '<CLIENT_NAME>'
     WHEN <ID_13> THEN '<CLIENT_NAME>'
     WHEN <ID_14> THEN '<CLIENT_NAME>'
     WHEN <ID_15> THEN '<CLIENT_NAME>'
     WHEN <ID_16> THEN '<CLIENT_NAME>'
     WHEN <ID_17> THEN '<CLIENT_NAME>'
     WHEN <ID_18> THEN '<CLIENT_NAME>'
     WHEN <ID_19> THEN '<CLIENT_NAME>'
     WHEN <ID_20> THEN '<CLIENT_NAME>'
     WHEN <ID_21> THEN '<CLIENT_NAME>'
     WHEN <ID_22> THEN '<CLIENT_NAME>'
     WHEN <ID_23> THEN '<CLIENT_NAME>'
     ELSE I.col_4
   END) AS APELIDO_TOMADOR,
  I.col_1 AS NOME_TOMADOR,
  (CASE WHEN H.col_5 = 'S' THEN 'Sim' ELSE 'Não' END) AS "EXIGE_AGENDAMENTO?",
  D.col_2 AS "DATA AGENDAMENTO",
  (CASE WHEN A.col_3 IS NULL THEN 'N' ELSE 'S' END) AS "EXISTE_AGENDAMENTO?",
  H.col_4 AS DESTINATARIO,
  H.col_2 AS CNPJDESTINATARIO,
  I.col_2 AS CNPJ_TOMADOR,
  I.col_5 AS LOGRADOURO_TOMADOR,
  I.col_6 AS BAIRRO_TOMADOR,
  I.col_7 AS CEP_TOMADOR,
  (J.col_1 ||','||J.col_2) AS ENDERECOENTREGA,
  J.col_7 AS CEPENTREGA,
  SUBSTR(J.col_7, 0,3) AS REGIAOCEPENTREGA,
  J.col_7 AS CEP_ENTREGA,
  B.col_1 AS FILIAL_ORIGEM,
  (CASE WHEN M.col_3 = 'S' THEN 'Sim' ELSE 'Não' END) AS EXIGEAGENDAMENTO_CONTRATO,
  N.col_1 AS OPERACAO,
  O.col_1 AS STATUS_POR_NOTA,
  Q.col_1 AS SETOR,
  R.col_1 AS MUNICIPIO_ENTREGA,
  T.col_1 AS BAIRRO,
  S.col_1 AS UF_ENTREGA,
  (CASE WHEN A.col_18 IS NOT NULL THEN 'Sim' ELSE 'Não' END) AS DEVOLUCAO,
  F.col_2 AS TIPO_SERVICO,
  U.col_1 AS UF_TOMADOR,
  V.col_1 AS MUNICIPIO_TOMADOR,
  W.col_3 AS NUMERO_AGENDAMENTO,
  (X.col_4 ||'-'||A.col_4||'-'||A.col_5) AS KEY_NOTA,
  Y.col_1 AS STATUS_CTE,
  TRUNC(X.col_6) AS DATA_CHEGADA_FILIAL_DESTINO,
  X.col_4 AS ULTIMAVIAGEM,
  X.col_7 AS INICIO_VIAGEM,
  Z.col_1 AS TIPO_VIAGEM,
  AA.col_1 AS STATUS_VIAGEM,
  AC.col_1 AS REDESPACHANTE,
  AD.col_1 AS DATAPODIMAGEM,
  AG.col_2 AS "ULTIMA OCORRENCIA",
  FN_REMOVE_QUEBRA(TRIM((CASE WHEN AG.col_1 IN (00,301) THEN SUBSTR(AG.col_2,0,60) ELSE TO_CHAR(SUBSTR(AF.col_3, 1,60)) END))) AS "OBSERVACAO OCORRENCIA",
  AF.col_4 AS "DATA OCORRENCIA",
  AG.col_1 AS COD_OCORRENCIA,
  CASE
    WHEN A.col_15 IS NULL THEN (
      CASE
        WHEN AH.col_5 = 13 THEN 'Medicamento'
        WHEN AH.col_5 IS NOT NULL THEN 'Seco'
      END
    ) ELSE A.col_15
  END AS TIPO_PRODUTO,
  (
    SELECT FI.col_1
    FROM VIAGEMPARADAS PARADA
    INNER JOIN FILIAIS FI ON FI.col_1 = PARADA.col_2
    WHERE PARADA.col_1 IN (
      SELECT MAX(VT.col_3) FROM VIAGEMDOCUMENTOS VT WHERE VT.col_4 = D.col_7 AND VT.col_5 = 198
    )
  ) AS FILIAL_DESTINO,
  (
    SELECT col_8 FROM VIAGENS WHERE col_1 IN (
      SELECT MAX(VT.col_1) FROM VIAGEMDOCUMENTOS VT WHERE D.col_7 = VT.col_4 AND VT.col_5 = 198
    )
  ) AS CHEGADAEFETIVAULTTRANSFERENCIA,
  A.col_19 AS VENCIMENTO_PERECIVEL,
  AI.col_2 AS ROTA_VIAGEM

FROM schema_1.table_1 A
INNER JOIN schema_2.table_2 B ON A.col_20 = B.col_1
INNER JOIN (
  SELECT MIN(col_21) AS PRIMEIRO_CTE, col_22 AS NOTAFISCAL
  FROM schema_3.table_3
  GROUP BY col_22
) C ON C.NOTAFISCAL = A.col_1
INNER JOIN schema_4.table_4 D ON C.PRIMEIRO_CTE = D.col_1
LEFT JOIN schema_5.table_5 E ON D.col_9 = E.col_1
INNER JOIN schema_6.table_6 F ON A.col_23 = F.col_1
LEFT JOIN schema_7.table_7 G ON A.col_24 = G.col_1
LEFT JOIN schema_7.table_7 H ON A.col_25 = H.col_1
LEFT JOIN schema_7.table_7 I ON A.col_26 = I.col_1
LEFT JOIN schema_8.table_8 J ON A.col_27 = J.col_1
LEFT JOIN schema_6.table_6 L ON A.col_23 = L.col_1
LEFT JOIN schema_9.table_9 M ON M.col_2 = L.col_1
LEFT JOIN schema_10.table_10 N ON A.col_28 = N.col_1
LEFT JOIN schema_11.table_11 O ON A.col_29 = O.col_1
LEFT JOIN schema_12.table_12 P ON A.col_30 = P.col_1
LEFT JOIN schema_13.table_13 Q ON P.col_4 = Q.col_1
LEFT JOIN schema_14.table_14 R ON J.col_3 = R.col_1
LEFT JOIN schema_15.table_15 S ON J.col_4 = S.col_1
LEFT JOIN schema_16.table_16 T ON J.col_5 = T.col_1
LEFT JOIN schema_15.table_15 U ON I.col_6 = U.col_1
LEFT JOIN schema_14.table_14 V ON I.col_7 = V.col_1
LEFT JOIN schema_17.table_17 W ON D.col_10 = W.col_1
LEFT JOIN (
  SELECT MAX(col_1) AS ULTVG, col_2 AS DOCLOG
  FROM schema_18.table_18
  GROUP BY col_2
) X1 ON X1.DOCLOG = D.col_1
LEFT JOIN schema_19.table_19 X ON X1.ULTVG = X.col_1
LEFT JOIN schema_11.table_11 Y ON D.col_11 = Y.col_1
LEFT JOIN schema_11.table_11 Z ON X.col_9 = Z.col_1
LEFT JOIN schema_11.table_11 AA ON X.col_10 = AA.col_1
LEFT JOIN schema_20.table_20 AB ON X.col_11 = AB.col_1
LEFT JOIN schema_7.table_7 AC ON AB.col_2 = AC.col_1
LEFT JOIN (
  SELECT MIN(col_1) POD, col_2 AS NOTAFISCAL
  FROM schema_21.table_21
  GROUP BY col_2
) AD ON AD.NOTAFISCAL = A.col_1
LEFT JOIN (
  SELECT MAX(AE1.col_1) AS HDOC, AE1.col_2 AS HDDC
  FROM schema_22.table_22 AE1
  WHERE AE1.col_3 IN ('N')
  GROUP BY AE1.col_2
) AE ON AE.HDDC = A.col_1
LEFT JOIN schema_23.table_23 AF ON AE.HDOC = AF.col_1
LEFT JOIN schema_24.table_24 AG ON AF.col_2 = AG.col_1
LEFT JOIN schema_25.table_25 AH ON AH.col_2 = A.col_1
LEFT JOIN schema_26.table_26 AI ON AI.col_3 = X.col_1
LEFT JOIN schema_2.table_2 AJ ON D.col_12 = AJ.col_1

WHERE 1=1
  AND A.col_9 >= TRUNC(ADD_MONTHS(SYSDATE, -1), 'MONTH')
  AND D.col_6 IS NULL
  AND ((coalesce({CTE_RPS}, null) is null) OR (D.col_3 IN ({CTE_RPS})))
  AND ((coalesce({NUMERO_NF}, null) is null) OR (A.col_4 IN ({NUMERO_NF})))
  AND ((coalesce({ApelidoTomador}, null) is null) OR (I.col_1 IN ({ApelidoTomador})))
  AND ((coalesce({UltimaViagem}, null) is null) OR (X.col_4 IN ({UltimaViagem})))
  AND ((coalesce({Filial Atual}, null) is null) OR ((CASE WHEN A.col_16 IS NULL THEN B.col_1 ELSE E.col_1 END) IN ({Filial Atual})))
  AND ((coalesce({Filial Destino}, null) is null) OR D.col_13 IN ({Filial Destino}))
  AND P.col_5 IN ('<CLIENT_A>', '<CLIENT_B>', '<CLIENT_C>')
  AND A.col_29 NOT IN (220, 743, 236, 399, 234, 235, 417)
  AND (D.col_14 IS NULL OR D.col_14 NOT IN (8, 14))
  AND D.col_11 NOT IN (236,237,417, 419,421)
;
