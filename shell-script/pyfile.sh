#! /bin/bash
friends=(Kyle Marc Jem "Brian Holt" Sarah)
friends+=("Agung Prasetyo Nugroho") # add new element

# Mengakses elemen array
echo "My second friend is ${friends[1]}"

# Mengakses semua elemen array
echo "My friends are ${friends[@]}"

# Looping melalui array
for friend in "${friends[@]}"
do
    echo "Friend: $friend"
done

# Menghitung jumlah elemen dalam array
echo "I have ${#friends[@]} friends"cho "hello world"

touch $1_{1..10}.txt
