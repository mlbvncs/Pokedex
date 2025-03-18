from PySide6.QtCore import QObject, Slot
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtGui import QGuiApplication
from httpx import get

class Pokedex(QObject):
    @Slot(str, result=list)
    def entrada(self, pokemon_id):  
        response = get(
                f'https://pokeapi.co/api/v2/pokemon/{pokemon_id}'
            ).json() #pega o link e transforma em um json (o response adquire todas as informações do json da pokeapi)

        imagem_url = response["sprites"]["other"]["home"]["front_default"] #puxa o url da imagem do pokemon através do response
        
        return imagem_url, response["name"].capitalize() + '!' #retorna a imagem e o nome do pokémon (capitalize deixa a primeira letra maiúscula)

app = QGuiApplication()

engine = QQmlApplicationEngine()
engine.load("pokédex.qml")

pokedex = Pokedex()
context = engine.rootContext()
context.setContextProperty("pokedex", pokedex)

app.exec() 