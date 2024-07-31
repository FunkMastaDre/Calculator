extends Label

var display_number = text
var first_number : float
var second_number : float
var calculate_method
var calculating = false
var equals_pressed = false
var just_calculated = false
var calculate_symbol

func _process(_delta):
	display_number = text
	if text == "":
		text = "0"
	get_input()

func get_input():
	if Input.is_action_just_pressed("0"):
		_on_zero_pressed()
	if Input.is_action_just_pressed("1"):
		_on_one_pressed()
	if Input.is_action_just_pressed("2"):
		_on_two_pressed()
	if Input.is_action_just_pressed("3"):
		_on_three_pressed()
	if Input.is_action_just_pressed("4"):
		_on_four_pressed()
	if Input.is_action_just_pressed("5"):
		_on_five_pressed()
	if Input.is_action_just_pressed("6"):
		_on_six_pressed()
	if Input.is_action_just_pressed("7"):
		_on_seven_pressed()
	if Input.is_action_just_pressed("8"):
		_on_eight_pressed()
	if Input.is_action_just_pressed("9"):
		_on_nine_pressed()
	if Input.is_action_just_pressed("decimal"):
		_on_decimal_point_pressed()
	if Input.is_action_just_pressed("equals"):
		_on_equals_pressed()
	if Input.is_action_just_pressed("Plus"):
		_on_plus_pressed()
	if Input.is_action_just_pressed("Minus"):
		_on_minus_pressed()
	if Input.is_action_just_pressed("Multiply"):
		_on_multiply_pressed()
	if Input.is_action_just_pressed("Divide"):
		_on_divide_pressed()
	if Input.is_action_just_pressed("Clear"):
		on_clear_pressed()
	if Input.is_action_just_pressed("Backspace"):
		_on_backspace_pressed()
	if Input.is_action_just_pressed("Percent"):
		_on_percent_pressed()
func _ready():
	pass

func get_first_number(): #Function is called when pressing any calculating buttons (add,subtract, etc).
	first_number = float(display_number)
	calculating = true
	if just_calculated == false:
		$Readout.text = str(first_number) + str(calculate_symbol)
		print(calculate_symbol)
	just_calculated = false

func get_second_number(): #Function is called when pressing equals, or pressing any calculating buttons when first number is already obtained.
	second_number = float(display_number)
	calculate()

func calculate():
	var solution
	if calculate_method == "add":
		solution = first_number + second_number
		$Readout.text = str(first_number) + " + " + str(second_number)
	if calculate_method == "subtract":
		solution = first_number - second_number
		$Readout.text = str(first_number) + " - " + str(second_number)
	if calculate_method == "multiply":
		solution = first_number * second_number
		$Readout.text = str(first_number) + " x " + str(second_number)
	if calculate_method == "divide":
		solution = first_number / second_number
		$Readout.text = str(first_number) + " / " + str(second_number)
	if equals_pressed == true and "=" not in $Readout.text:
		$Readout.text += " ="
	if calculate_method == "square root":
		solution = sqrt(first_number)
		$Readout.text = "√" + str(first_number)
	if solution != null:
		text = str(solution)
	display_number = text
	just_calculated = true
	get_first_number()
	calculating = true

func on_clear_pressed(): #resets all values to default
	first_number = 0
	second_number = 0
	text = "0"
	$Readout.text = ""
	calculate_method = null
	calculate_symbol = null
	calculating = false
	equals_pressed = false
	just_calculated = false

func _on_clear_entry_pressed():
	text = "0"

func _on_positive_negative_pressed():
	if float(display_number) != 0 and calculating == false:
		display_number = float(display_number) * -1
		text = str(display_number)

func _on_backspace_pressed():
	if calculating == false:
		var txt = text
		if txt.length() > 0:
			text = txt.substr(0, txt.length() - 1)

#region Calculate methods (Plus,Minus,Equals,etc)
func _on_equals_pressed():
	if equals_pressed == false:
		equals_pressed = true
		get_second_number()
	else:
		calculate()

func _on_plus_pressed():
	equals_pressed = false
	if first_number != 0 and calculating == false:
		get_second_number()
	else:
		calculate_method = "add"
		calculate_symbol = " +"
		get_first_number()

func _on_minus_pressed():
	equals_pressed = false
	if first_number != 0 and calculating == false:
		get_second_number()
	else:
		calculate_method = "subtract"
		calculate_symbol = " -"
		get_first_number()


func _on_multiply_pressed():
	equals_pressed = false
	if first_number != 0 and calculating == false:
		get_second_number()
	else:
		calculate_method = "multiply"
		calculate_symbol = " x"
		get_first_number()


func _on_divide_pressed():
	equals_pressed = false
	if first_number != 0 and calculating == false:
		get_second_number()
	else:
		calculate_method = "divide"
		calculate_symbol = " /"
		get_first_number()


func _on_squared_pressed():
	equals_pressed = false
	get_first_number()
	second_number = first_number
	calculate_method = "multiply"
	calculate()

func _on_square_root_pressed():
	equals_pressed = false
	get_first_number()
	calculate_method = "square root"
	calculate()

func _on_fraction_pressed():
	var fraction
	fraction = 1 / float(display_number)
	text = str(fraction)

func _on_percent_pressed():
	if first_number != 0:
		var percent
		percent =float(display_number) / 100
		text = str(percent)
	else:
		text = "0"
#endregion

#region Number Buttons
func _on_one_pressed(): 
	if equals_pressed == true:
		on_clear_pressed()
	if text == "0" or calculating == true:
		text = "1"
		calculating = false
	else:
		text += "1"

func _on_two_pressed():
	if equals_pressed == true:
		on_clear_pressed()
	if text == "0" or calculating == true:
		text = "2"
		calculating = false
	else:
		text += "2"

func _on_three_pressed():
	if equals_pressed == true:
		on_clear_pressed()
	if text == "0" or calculating == true:
		text = "3"
		calculating = false
	else:
		text += "3"

func _on_four_pressed():
	if equals_pressed == true:
		on_clear_pressed()
	if text == "0" or calculating == true:
		text = "4"
		calculating = false
	else:
		text += "4"

func _on_five_pressed():
	if equals_pressed == true:
		on_clear_pressed()
	if text == "0" or calculating == true:
		text = "5"
		calculating = false
	else:
		text += "5"

func _on_six_pressed():
	if equals_pressed == true:
		on_clear_pressed()
	if text == "0" or calculating == true:
		text = "6"
		calculating = false
	else:
		text += "6"

func _on_seven_pressed():
	if equals_pressed == true:
		on_clear_pressed()
	if text == "0" or calculating == true:
		text = "7"
		calculating = false
	else:
		text += "7"

func _on_eight_pressed():
	if equals_pressed == true:
		on_clear_pressed()
	if text == "0" or calculating == true:
		text = "8"
		calculating = false
	else:
		text += "8"

func _on_nine_pressed():
	if equals_pressed == true:
		on_clear_pressed()
	if text == "0" or calculating == true:
		text = "9"
		calculating = false
	else:
		text += "9"

func _on_zero_pressed():
	if equals_pressed == true:
		on_clear_pressed()
	if text == "0" or calculating == true:
		text = "0"
		calculating = false
	else:
		text += "0"

func _on_decimal_point_pressed():
	if equals_pressed == true:
		on_clear_pressed()
	if text == "0" or calculating == true:
		text = "0."
		calculating = false
	elif "." not in text:
		text += "."
#endregion
