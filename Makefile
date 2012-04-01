all:
	 gcc -DHAVE_CONFIG_H      -g3 -O2 -MT nv_map.o -MD -MP -c -o nv_map.o nv_map.c
	 gcc  -DHAVE_CONFIG_H     -g3 -O2 -MT oswego_malloc.o -MD -MP -c -o oswego_malloc.o oswego_malloc.c
	 gcc  -DHAVE_CONFIG_H     -g3 -O2 -MT nvmalloc_wrap.o -MD -MP -c -o nvmalloc_wrap.o nvmalloc_wrap.c
	 gcc  -g3 -O2 nvmalloc_bench.c -o nvmalloc_bench nv_map.o oswego_malloc.o nvmalloc_wrap.o -lm -lpthread
	 gcc  -g3 -O2 nvcommit_bench.c -o nvcommit_bench nv_map.o oswego_malloc.o nvmalloc_wrap.o -lm -lpthread

clean:
	rm -f *.o
	rm -f *.d 
	rm -f nvmalloc_bench
	rm -f nvcommit_bench
