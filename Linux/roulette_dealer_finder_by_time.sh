cat $1_Dealer_schedule | awk '{print $1, $2, $5, $6}' | grep "$2"
