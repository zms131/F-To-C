.data
fahrenheit_temp: .word 68      # Example Fahrenheit temperature
celsius_temp:    .space 4     # Space for storing Celsius temperature

.text
.globl main

main:
    # Load Fahrenheit temperature
    lw $t0, fahrenheit_temp

    # Convert Fahrenheit to Celsius
    li $t1, 32        # Load constant 32 (for subtraction)
    sub $t0, $t0, $t1 # Subtract 32 from Fahrenheit value
    li $t1, 5         # Load constant 5 (for division)
    mul $t0, $t0, $t1 # Multiply by 5
    li $t1, 9         # Load constant 9 (for division)
    div $t0, $t1      # Divide by 9

    # Store result in celsius_temp
    mflo $t0          # Move quotient to $t0 (Celsius value)
    sw $t0, celsius_temp

    # Exit program
    li $v0, 10
    syscall
