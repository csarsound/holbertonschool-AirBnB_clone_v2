class State(BaseModel, Base):
    """ State class """

    __tablename__ = "states"

    if getenv('HBNB_TYPE_STORAGE') == "db":
        name = Column(String(128), nullable=False)
        cities = relationship("City", cascade="all, delete", backref="state")

    else:
        name = ""

        @property
        def cities(self):
            """ Returns the list of City instances with
            state_id equals to the current State.id """
            cities = models.storage.all(City)
            lst = []
            for city in cities.values():
                if city.state_id == self.id:
                    lst.append(city)
            return lst
