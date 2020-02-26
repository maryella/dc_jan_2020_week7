class Person {
  constructor(name) {
    this.name = name;
    this.friends = [];
  }
  addFriend(person) {
    this.friends.push(person);
  }
  createGreeting(other) {
    return `Hi ${other.name}! It's ${this.name}`;
  }
  greet(other) {
    console.log(this.createGreeting(other));
  }
  lazygreet(other) {
    setTimeout(() => console.log(this.createGreeting(other)), 200);
  }
  createGreetingsForFriends() {
    let friend_group = this.friends;
    let greeting_list = friend_group.map(friend => {
      return this.createGreeting(friend);
    });
    return greeting_list;
  }
}

//make people to work with
const amy = new Person("Amy");
const leslie = new Person("Leslie");
const ryan = new Person("Ryan");
const sarah = new Person("Sarah");

//add friends
amy.addFriend(ryan);
amy.addFriend(sarah);
amy.addFriend(leslie);

console.log();
console.log(amy.createGreetingsForFriends());
