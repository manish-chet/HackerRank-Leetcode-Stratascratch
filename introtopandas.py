import pandas as pd


## Create a DataFrame from List
def createDataframe(student_data: List[List[int]]) -> pd.DataFrame:
    column_names = ["student_id", "age"]
    result_dataframe = pd.DataFrame(student_data, columns=column_names)
    return result_dataframe

## Get the Size of a DataFrame
def getDataframeSize(players: pd.DataFrame) -> List[int]:
    print(players)
    return list(players.shape)

## Display the First Three Rows
def selectFirstRows(employees: pd.DataFrame) -> pd.DataFrame:
    return employees.head(3)

##  select data
def selectData(students: pd.DataFrame) -> pd.DataFrame:
    return students.loc[students["student_id"] == 101, ["name", "age"]]

## add a column
def createBonusColumn(employees: pd.DataFrame) -> pd.DataFrame:
    employees['bonus'] = 2*employees['salary']
    return employees

## drop duplicates
def dropDuplicateEmails(customers: pd.DataFrame) -> pd.DataFrame:
    return customers.drop_duplicates(subset='email',keep='first')

## drop missing data
def dropMissingData(students: pd.DataFrame) -> pd.DataFrame:
    return students.dropna(subset='name')

## Modify columns
def modifySalaryColumn(employees: pd.DataFrame) -> pd.DataFrame:
    employees['salary'] = employees['salary']*2
    return employees

## rename columns
def renameColumns(students: pd.DataFrame) -> pd.DataFrame:
    return students.rename(columns={
        "id": "student_id",
        "first": "first_name",
        "last": "last_name",
        "age": "age_in_years"
    })

## change data type
def changeDatatype(students: pd.DataFrame) -> pd.DataFrame:
    return students.astype({"grade": int})

## fill na
def fillMissingValues(products: pd.DataFrame) -> pd.DataFrame:
    products['quantity'] = products['quantity'].fillna(0)
    return products

## concatenate
def concatenateTables(df1: pd.DataFrame, df2: pd.DataFrame) -> pd.DataFrame:
    result = pd.concat([df1, df2])
    return result

## reshape data pivot
def pivotTable(weather: pd.DataFrame) -> pd.DataFrame:
    result = weather.pivot(index="month", columns="city", values="temperature")
    return result

## melt function 
def meltTable(report: pd.DataFrame) -> pd.DataFrame:
    result = report.melt(id_vars=["product"], 
                 value_vars=["quarter_1", "quarter_2", "quarter_3", "quarter_4"],
                 var_name="quarter", 
                 value_name="sales")
    return result

## method chaining
def findHeavyAnimals(animals: pd.DataFrame) -> pd.DataFrame:
    result = animals[animals["weight"] > 100].sort_values(by="weight", ascending=False)[["name"]]
    return result

## 
