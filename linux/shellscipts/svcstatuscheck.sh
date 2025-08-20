#!/bin/bash

SERVICE="nginx"   

if systemctl is-active --quiet $SERVICE; then   
    echo "$(date): $SERVICE is running."        
else
    echo "$(date): $SERVICE is down, restarting..."
    systemctl start $SERVICE                    
    if [ $? -eq 0 ]; then                       
        echo "$(date): Successfully restarted $SERVICE."
    else
        echo "$(date): Failed to restart $SERVICE!"
    fi
fi

