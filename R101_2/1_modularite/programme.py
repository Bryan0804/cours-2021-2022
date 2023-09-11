import cesar 

message = input("message a coder ? ")

decal = 1 
while decal<26:
	print (decal,cesar.chiffre_cesar(message, decal))
	decal += 1
