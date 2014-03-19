INC=-I /home/wangs/monitoring-system/include/
LIB1=/home/wangs/monitoring-system/lib/libndpi.a -lpcap 
LIB2=-lipq
FLAGS=-g

all:pcapReader ipq statistic ./netfilter/hook.c
	make -C ./netfilter
pcapReader:pcapReader.c Makefile ./libipq.c 
	gcc $(FLAGS) $(INC) pcapReader.c -o pcapReader $(LIB1)
statistic:statistics.c 
	gcc $(FLAGS) $(INC) statistics.c -o statistics $(LIB1)
ipq:	
	gcc libipq.c -o ipq $(LIB2)
clean:
	rm ./pcapReader ./ipq ./netfilter/nf_user
