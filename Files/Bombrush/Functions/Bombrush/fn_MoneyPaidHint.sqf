_hinttype = _this select 0;

switch (_hinttype) do {
	case 0: {
		cutText ["Why would you pay the money when there is no bomb?","PLAIN",2];
	};
	case 1: {
		cutText ["You have paid the terrorists the ransom money.","PLAIN",2];
	};
	case 2: {
		cutText ["Not enough money to make the payment.","PLAIN",2];
	};
};
