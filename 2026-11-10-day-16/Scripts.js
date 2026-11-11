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

let x = 66
let y = 77

console.log(x<y && x==5)
console.log(x<y || x==5)
console.log(!true)
console.log(!false)















