//Variables will be used to hold order information
function declareVariables(){
	var order = new Array(); // holds names of items
	var costs = new Array(); // holds costs of items
	var calcArray = [order, costs];
	//console.log(typeof order);
	return calcArray;
};



// Get Size and cost of that size and put in arrays
function getSize(calcArray){

	// Deflate passing array
	order = calcArray[0];
	costs = calcArray[1];

	// Find which radio button was pushed
	var sizeArray = document.getElementsByName('psize');
	for(var i=0; i<sizeArray.length; i++){
		if(sizeArray[i].checked){
			var selectedSize = sizeArray[i].value;
		};
	};

	// Add order and price to variables
	if(selectedSize=='personal'){
		order.push(selectedSize);
		costs.push(6.00);
	}
	else if(selectedSize=='small'){
		order.push(selectedSize);
		costs.push(10.00);
	}
	else if(selectedSize=='medium'){
		order.push(selectedSize);
		costs.push(14.00);
	}
	else{
		order.push(selectedSize);
		costs.push(16.00);
	};

	// deflate passing array
	calcArray[0] = order;
	calcArray[1] = costs;

	return calcArray;
};



// Get meats and costs of those meats and put in arrays
function getMeat(calcArray){

	// Deflate passing array
	order = calcArray[0];
	costs = calcArray[1];

	//how many meats
	var count = 0;

	// Find which radio button was pushed
	var sizeArray = document.getElementsByName('meat');
	for(var i=0; i<sizeArray.length; i++){
		if(sizeArray[i].checked){
			order.push(sizeArray[i].value);
			if(count==0){
				costs.push(0.00);
				count++;
			}
			else{
				costs.push(1.00);
			}
		};
	};

	// deflate passing array
	calcArray[0] = order;
	calcArray[1] = costs;

	return calcArray;
};



// Get Cheese and cost of that size and put in arrays
function getCheese(calcArray){

	// Deflate passing array
	order = calcArray[0];
	costs = calcArray[1];

	// Find which radio button was pushed
	var cheeseArray = document.getElementsByName('cheese');
	for(var i=0; i<cheeseArray.length; i++){
		if(cheeseArray[i].checked){
			var selectedCheese = cheeseArray[i].value;
		};
	};

	// Add order and price to variables
	if(selectedCheese=='more'){
		order.push(selectedCheese);
		costs.push(3.00);
	}
	else{
		order.push(selectedCheese);
		costs.push(0.00);
	};

	// deflate passing array
	calcArray[0] = order;
	calcArray[1] = costs;

	return calcArray;
};


// Get Crust and cost of that size and put in arrays
function getCrust(calcArray){

	// Deflate passing array
	order = calcArray[0];
	costs = calcArray[1];

	// Find which radio button was pushed
	var crustArray = document.getElementsByName('crust');
	for(var i=0; i<crustArray.length; i++){
		if(crustArray[i].checked){
			var selectedCrust = crustArray[i].value;
		};
	};

	// Add order and price to variables
	if(selectedCrust=='stuffed'){
		order.push(selectedCrust);
		costs.push(3.00);
	}
	else{
		order.push(selectedCrust);
		costs.push(0.00);
	};

	// deflate passing array
	calcArray[0] = order;
	calcArray[1] = costs;

	return calcArray;
};


// Get sauce and cost of that size and put in arrays
function getSauce(calcArray){

	// Deflate passing array
	order = calcArray[0];
	costs = calcArray[1];

	// Find which radio button was pushed
	var crustArray = document.getElementsByName('sauce');
	for(var i=0; i<crustArray.length; i++){
		if(crustArray[i].checked){
			order.push(crustArray[i].value);
			costs.push(0.00);
		};
	};

	// deflate passing array
	calcArray[0] = order;
	calcArray[1] = costs;

	return calcArray;
};


// Get veggies and costs of those meats and put in arrays
function getVeg(calcArray){

	// Deflate passing array
	order = calcArray[0];
	costs = calcArray[1];

	//how many meats
	var count = 0;

	// Find which radio button was pushed
	var sizeArray = document.getElementsByName('veg');
	for(var i=0; i<sizeArray.length; i++){
		if(sizeArray[i].checked){
			order.push(sizeArray[i].value);
			if(count==0){
				costs.push(0.00);
				count++;
			}
			else{
				costs.push(1.00);
			}
		};
	};

	// deflate passing array
	calcArray[0] = order;
	calcArray[1] = costs;

	return calcArray;
};

function sumArr(arr){
	var sum = 0;
	for(var i=0; i<arr.length; i++){
		sum += arr[i];
	}
	return sum;
}


function buildOutputString(calcArray, totalCost){
	// Deflate passing array
	order = calcArray[0];
	costs = calcArray[1];
	var outputString = "Item&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Price<br><br>";
	for(var i=0; i<order.length; i++){
		outputString += order[i] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + costs[i] + "<br>";
	};

	outputString += "<br><br>Total: " + totalCost;

	return outputString;
};

// Run Final Calculations
function CalcPizza(){
	calcArray = declareVariables();
	calcArray = getSize(calcArray);
	calcArray = getMeat(calcArray);
	calcArray = getCheese(calcArray);
	calcArray = getCrust(calcArray);
	calcArray = getSauce(calcArray);
	calcArray = getVeg(calcArray);
	totalCost = sumArr(costs);
	outputString = buildOutputString(calcArray, totalCost);

	// display output string
	document.getElementById("FinalCost").innerHTML=outputString;
	document.getElementById("FinalCost").style.opacity=1;

	// Deflate passing array
	order = calcArray[0];
	costs = calcArray[1];
	
	// Total Cost

	for(var i=0; i<order.length; i++){
		console.log("\tOrder: "+order[i]+"\t\tCost: "+costs[i]);
	};

	console.log("\n\nTOTAL: "+totalCost);
};


















