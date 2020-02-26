// Sean's way

class Mom {
  constructor(firstName, lastName, eyeColor, hairColor) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.eyeColor = eyeColor;
    this.hairColor = hairColor;
  }
}

class Child extends Mom {
  constructor(firstName, hairColor, age, lastName, eyeColor) {
    super(lastName, eyeColor);
    this.firstName = firstName;
    this.lastName = mom.lastName;
    this.eyeColor = mom.eyeColor;
    this.hairColor = hairColor;
    this.age = age;
  }
}

const mom = new Mom("Alice", "Wong", "brown", "black");
const daughter = new Child("Ilene", "brown", 14);

console.log("mom is: ", mom);
console.log("daughter is: ", daughter);
