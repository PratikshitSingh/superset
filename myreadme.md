## Print where conditions
print(str(where_clause[0].compile(compile_kwargs={"literal_binds": True})))

## Print sql query from sqlalchemy object
print(sqlalchemy_object)