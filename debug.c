/*
 * This file is part of the coreboot project.
 *
 * Copyright (C) 2012 The ChromiumOS Authors.  All rights reserved.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 2 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
 */

#include <inttypes.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/io.h>
#include <errno.h>

#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
#define MAP_BYTES 		(1024*1024)
#define MMIO_REGION_SZ	(4096)

typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;

/* verbose output? */
static int verbose = 1;
#define debug(x...) if(verbose) printf(x)

/* File handle used to access /dev/mem */
static int fd;

/*
 * Functions to map / unmap physical memory into virtual address space. These
 * functions always maps 1MB at a time and can only map one area at once.
 */
static void *mapped_virtual;
static void *map_memory(u64 physical)
{
	void *v;
	off_t p;
	int page = getpagesize();

	/* Mapped memory must be aligned to page size */
	p = physical & ~(page - 1);

	debug("Mapping %08x of physical memory at 0x%jx.\n", MAP_BYTES, (intmax_t)p);

	v = mmap(NULL, MAP_BYTES, PROT_READ, MAP_SHARED, fd, p);

	if (v == MAP_FAILED) {
		fprintf(stderr, "Failed to mmap /dev/mem: %s\n",
			strerror(errno));
		exit(1);
	}

	/* Remember what we actually mapped ... */
	mapped_virtual = v;

	/* ... but return address to the physical memory that was requested */
	v += physical & (page-1);

	return v;
}

static void unmap_memory(void)
{
	if (mapped_virtual == NULL) {
		fprintf(stderr, "Error unmapping memory\n");
		return;
	}
	debug("Unmapping 1MB of virtual memory at %p.\n", mapped_virtual);
	munmap(mapped_virtual, MAP_BYTES);
	mapped_virtual = NULL;
}

int main(int argc, char** argv)
{
	int i;
	uint64_t base = 0;
	unsigned char *mmio, *stash;

	if (iopl(3) < 0) {
		fprintf(stderr, "Failed to gain ioperm: %s\n",
			strerror(errno));
		exit(1);
	}

	for (i=0; i<4; i++) {
		outb(0x24 + i, 0xcd6);
		base |= (unsigned) inb(0xcd7) << (8*i);
	}

	if ((base & 0x03) != 0x01) {
		printf("ACPI MMIO disabled\n");
		exit(1);
	} else {
		base &= ~0xfff;
		printf("ACPI MMIO enabled at %08lx\n", base);
	}

	fd = open("/dev/mem", O_RDONLY, 0);
	if (fd < 0) {
		fprintf(stderr, "Failed to gain memory access: %s\n",
			strerror(errno));
		exit(1);
	}

	mmio = map_memory(base);
	stash = calloc(1, MMIO_REGION_SZ);

	if (mmio == NULL || stash == NULL)
		exit(1);

	for (i=0; i<MMIO_REGION_SZ; i++) {
		stash[i] = mmio[i];
	}
	unmap_memory();
	close(fd);

	FILE * dd = fopen("mmio_dump.dd", "w");
	fwrite(stash, MMIO_REGION_SZ, 1, dd);
	fclose(dd);

	exit(0);
}
