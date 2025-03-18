import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

ApplicationWindow {
    visible: true 
    id: janela
    width: 700
    height: 700
    title: "POKÉDEX" /*nome da janela*/
    font.pixelSize: 24

    Image {
        id: imagem1 
        width: 700
        height: 700
        source: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/80ff523f-ff84-457d-a547-464588d3a3d3/df1y9kh-c0955b87-3708-4ff5-8d39-9c2f6869084e.jpg/v1/fill/w_948,h_843,q_70,strp/field_background_5_by_willdinomaster55_df1y9kh-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTIwMCIsInBhdGgiOiJcL2ZcLzgwZmY1MjNmLWZmODQtNDU3ZC1hNTQ3LTQ2NDU4OGQzYTNkM1wvZGYxeTlraC1jMDk1NWI4Ny0zNzA4LTRmZjUtOGQzOS05YzJmNjg2OTA4NGUuanBnIiwid2lkdGgiOiI8PTEzNTAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.Ln4GROtYueYa1TLlbv6kfk6nic0XCPBLuaJgzAJ5LQk"

        Image {
            id: imagem2
            width: 350
            height: 150
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: imagem1.top
                topMargin: 10
            }
            source: "https://user-images.githubusercontent.com/29473781/180619084-a56960ab-7efa-4e34-9d33-4e3e581d62ff.png"
        }
        TextField {
            id: pokemon_id
            width: 200
            height: 70

            color: "#ffe031" /*cor do texto*/  

            font { 
                family: "Courier New"
                pointSize: 19 /*tamanho do texto*/
                bold: true /*texto em negrito*/
            }

            placeholderText: 'Pokémon ID!' /*nome de fundo*/
            placeholderTextColor: "#ffe031" /*cor do nome de fundo*/

            anchors {
                left: imagem1.left /*fixando na esquerda da imagem1*/
                leftMargin: 120 /*margem*/
                top: imagem2.top /*fixando no topo da imagem2*/
                topMargin: 180 /*margem*/
            }
            cursorDelegate: Rectangle { /*mudando a cor do cursor*/
                visible: pokemon_id.cursorVisible
                color: "#4052d9"
                width: pokemon_id.cursorRectangle.width
            }
            background: Rectangle { 
                color: "#40FFFFFF" /*cor transparente (o 40 representa o quanto é transparente)*/
                border.color: "#4052d9" /*cor da borda*/
                border.width: 3 /*tamanho da borda (1 é o padrão, feito manualmente para possíveis consultas)*/
                radius: 4
            }
        }
        Button {
            id: button
            width: 200
            height: 82

            Text { /*para poder mudar a cor do texto*/
                text: "Catch!"

                topPadding: 25 /*distância do texto em relação ao topo do botão*/
                leftPadding: 50 /*distância do texto em relação a esquerda do botão*/
                
                color: "#ffe031" /*cor do texto*/
                style: Text.Outline /*colocando estilo de texto que permite borda*/
                styleColor: "#4052d9" /*cor da borda do texto*/

                font { 
                    family: "Courier New"
                    pointSize: 19 /*tamanho do texto*/
                    bold: true /*texto em negrito*/
                }
            }
            anchors {
                right: imagem1.right /*fixando na direita da imagem1*/
                rightMargin: 120 /*margem*/
                top: imagem2.top /*fixando no topo da imagem2*/
                topMargin: 175 /*margem*/
            }
            background: Rectangle { 
                color: "#40FFFFFF" /*cor transparente (o 40 representa o quanto é transparente)*/
                border.color: "#4052d9" /*cor da borda*/
                border.width: 3 /*tamanho da borda (1 é o padrão, feito manualmente para possíveis consultas)*/
                radius: 4
            }
            onClicked: {
                var pokedex_return = pokedex.entrada(pokemon_id.text)
                pokemon_id.text = '' /*transforma em uma string, assim pode receber algo*/
	            imagem3.source = '' /*transforma em uma string, assim pode receber algo*/
	            label.text = pokedex_return[1]
	            imagem3.source = pokedex_return[0]
            }
        }
        Label {
            id: label
            text: "Pokémon!"
            color: "#ffe031" /*cor do texto*/

            font { 
                family: "Courier New"
                pointSize: 40 /*tamanho do texto*/
                bold: true /*texto em negrito*/
            }

            style: Text.Outline /*colocando estilo de texto que permite borda*/
            styleColor: "#4052d9" /*cor da borda*/

            anchors {
                horizontalCenter: imagem1.horizontalCenter
                top: imagem2.top
                topMargin: 280
            }
        }
        Image {
	        id: imagem3
	        width: 300
	        height: 300
	        cache: false
	        anchors {
	            horizontalCenter: imagem1.horizontalCenter
	            top: imagem2.top
	            topMargin: 330
	        }
        }
        Text {
            text: "Por: Malba Vinicius Lopes Santos"

            anchors.bottom: imagem1.bottom /*fixando no fim da imagem1*/
            leftPadding: 5 /*distância do texto em relação a esquerda da imagem1*/
            bottomPadding: 5 /*distância do texto em relação ao fim da imagem1*/
                
            color: "#ffe031" /*cor do texto*/
            style: Text.Outline /*colocando estilo de texto que permite borda*/
            styleColor: "#4052d9" /*cor da borda do texto*/

            font { 
                family: "Courier New"
                pointSize: 13 /*tamanho do texto*/
                bold: true /*texto em negrito*/
            }
        }
    }
}