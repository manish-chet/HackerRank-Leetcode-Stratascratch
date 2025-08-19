import pandas as pd

def getDataframeSize(players: pd.DataFrame) -> List[int]:
    print(players)
    return list(players.shape)
