// variables
// (Var, let, const,)  Ex-1

let a = 3 
var b = "Ali"
const c = true

console.log(a,b,c);

// datatypes    
// NN SS BB U          Ex-2

let d = 5
let e =  null
let f = 'Sami'
const g = Symbol("id")
let h = true // can be false also 
let i = BigInt("123")+ BigInt("127")
let j = undefined

console.log(d,e,f,g,h,i,j);

//typeof              Ex-3

console.log(typeof d,e,f,g,h,i,j)


//Objects
// key&value          Ex-4

const boys = {
 
   "Ali" : true,
   "Hassan" : false,
   "Asad"  : 89,
   "Rahim" : undefined

};
 console.log(boys["Hassan"])

 //Objects
// key&value dictionary Word/Meaning          Ex-5

 const dictionary = {
  Serendipity : "The occurrence of events by chance in a happy or beneficial way; finding valuable or agreeable things down a path not specifically looked for.",
  Ephemeral : "Lasting for a very short time; transient or fleeting.",
  Resilience : "The capacity to recover quickly from difficulties, toughness, or the ability of a substance to spring back into shape.",
 }
console.log(dictionary.Ephemeral)  // dictionary.Ephemeral & dictionary["Ephemeral"])


// Arithmetic Operators 
// + - / * %  ++ -- **    Ex-6

let a1 = 25
let b1 = 77

console.log("a1 + b1 =", a1+b1)
console.log("a1 - b1 =", a1-b1)
console.log("a1 / b1 =", a1/b1)
console.log("a1 * b1 =", a1*b1)
console.log("a1 % b1 =", a1%b1)
console.log("a1  =", ++a1)
console.log("a1  =", --a1)
console.log("a1  =", a1++)
console.log("a1  =", a1--)
console.log("a1  =", a1)

// Assigment Operators   5x-7
// =+ -= *= /= %= **=
let assigment = 1

assigment +=5
console.log("Now a is",assigment)

assigment -=5
console.log("Now a is",assigment)

assigment *=5
console.log("Now a is",assigment)

assigment /=5
console.log("Now a is",assigment)

assigment %=5
console.log("Now a is",assigment)

assigment **=5
console.log("Now a is",assigment)


// Comparision Operators   Ex-8
let com1 = 55
let com2 = 45

console.log("com1==com2 is",com1==com2)
console.log("com1!=com2 is",com1!=com2)
console.log("com1===com2 is",com1===com2)
console.log("com1!==com2 is",com1!==com2)
console.log("com1>com2 is",com1>com2)


// logical Operators Ex-9 

let x = true
let y = false 

console.log(x==y) 




// Datatype

// Array

// list

// Int

// String

// double



// singed vs unsigned





// loops (0->n , n<-0) (Pattern creation)

// conditional statements (if/else, switch statements)
 


// -------------------------------------------------------------------------------------------------------

//Primative Datatypes 
// Number boolean string symbol BigInt null undefined 

let number = 12
let bigNumber = BigInt("264144893493")
let name = 'ali'
let Boolean = true
let id = null
let user = undefined
let symbol = Symbol("T")


//Non-Primitive
//Array Object Function

// Array Ex-1 Print

const favoriteColors = ["yellow","white","black"];

console.log(favoriteColors[1]);


// Array Ex-2 Change values 


const numbers = [10, 20, 30, 40]

numbers[2]=99;

console.log(numbers[2]);

// Object Ex-1 

const car ={
   
    name: "Toyota",
    model:"corolla",
    year: "2023"


};
    console.log(car.model);

   // Object Ex-2 update

    car["year"]="2024";

    console.log(car.year);


   // Object Ex-3 Add



    car["isElectric"] = false; 
 

    console.log(car);


   // Conditional statements if/eles Ex-1 

   let age = 16
   if(age >=18 )
      {console.log("You can vote!");
    }
    else {
      console.log("You are too young to vote.")
    }
       
   // Conditional statements Switch/case/break Ex-2
   
   let lightColor = "red";

   switch (lightColor) {
    case "red":
        console.log("Stop!");
        break;
    case "yellow":
        console.log("Get ready! ");
        break;
    case "green":
        console.log("Go!");
        break;
    default:
        console.log("Invalid light color!");
}
 



//    // For Loop (Adding loop)

//      let n = 5; 
//      for (let i = 0; i <= n; i++) {
//      console.log(i); 
// }

//    //Reverse Loop (let n = 5;
 
//     let n = 5;

// for (let i = n; i >= 0; i--) {
//     console.log(i);
// }


// Function Ex-1

function sayHello() {
    console.log("Hello, Aun! Welcome to JavaScript.");
}


sayHello();

// Function Ex-2

function greetUser(name) {
    console.log("Hello, " + name + "!");
}

greetUser("Ali");   


// Function Ex-3

function multiplyNumbers(num1, num2) {
    console.log(num1 * num2);
}

multiplyNumbers(5, 7); 


// Function Ex-4

let n = 5; 

for (let i = 1; i <= n; i++) {
    let row = ""; 
    
    for (let j = 1; j <= i; j++) {
        row += "*"; 
    }
    
    console.log(row);
}

   

      

 






