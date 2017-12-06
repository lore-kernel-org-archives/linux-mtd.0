Received: from smtp6-v.fe.bosch.de ([2a03:cc00:ff0:100::2])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMVfL-00046S-2F
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 09:06:58 +0000
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>
CC: <manfred@colorfullife.com>, <dirk.behme@de.bosch.com>
Subject: [Not-a-patch] Add flight recorder to MTDRAM
Date: Wed, 6 Dec 2017 10:06:28 +0100
Message-ID: <20171206090628.29762-1-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Manfred Spraul <manfred@colorfullife.com>

Hi,

final part:
The tool to replay flight recorder output.

--
	Manfred

xxxxxxxx
/*
 * replay.cpp
 *
 * Copyright (C) 1999, 2001, 2005, 2008, 2013, 2015, 2017 by Manfred Spraul.
 *	All rights reserved except the rights granted by the GPL.
 *
 * Redistribution of this file is permitted under the terms of the GNU 
 * General Public License (GPL) version 2 or later.
 */

#define _DEFAULT_SOURCE
#include <endian.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <getopt.h>
#include <errno.h>
#include <limits.h>
#include <sys/time.h>
#include <sys/resource.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <getopt.h>
#include <fcntl.h>

#define VERBOSE_DEBUG	3
#define VERBOSE_DETAILS	2
#define	VERBOSE_NORMAL	1
#define VERBOSE_OFF	0

///
/// \brief global setting to enable more verbose output
///
/// g_verbose is used to set the logging level.
/// - VERBOSE_OFF (0) means no logs
/// - VERBOSE_NORMAL (1) means some logs
/// - VERBOSE_DETAILS (2) means more details.
/// - VERBOSE_DEBUG (3) prints internal details, only relevant for debugging
///
int g_verbose = VERBOSE_OFF;

unsigned long g_erasesize = ULONG_MAX;
unsigned long g_writesize = ULONG_MAX;

void * map_file(const char *name, size_t *len, mode_t mode)
{
	int fd;
	struct stat s;
	void *addr;

	fd = open(name, mode);
	if (fd == -1) {
		printf("  Failed to open %s.\n", name);
		exit (2);
	}

	if (fstat(fd, &s) == -1) {
		printf("  Failed to stat %s.\n", name);
		exit (2);
	}
	*len = s.st_size;

	if (mode == O_RDONLY) {
		addr = mmap(NULL, s.st_size, PROT_READ, MAP_SHARED, fd, 0);
	} else {
		addr = mmap(NULL, s.st_size, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
	}
	if (addr == NULL) {
		printf("  Failed to mmap %s.\n", name);
		exit (2);
	}

	return addr;
}

////////////////////////////////////////
// binary interface


#define round_up(a, b)	((((a)+(b)-1)/(b))*(b))

#define MAGIC_START	0x12345678UL
#define MAGIC_END	0x87654321UL

#define FUNC_WRITE	1UL
#define FUNC_ERASE	2UL
#define FUNC_WRITE_CHK	3UL
#define FUNC_ERASE_CHK	4UL
#define CHECK_VAL1	7ULL
#define CHECK_VAL2	(2*76777ULL)
#define CHECK_VAL3	104677ULL

static u_int32_t read_u32(const void *log, size_t *pos)
{
	u_int32_t retval;
	u_int32_t *src = (u_int32_t*)(((char*)log)+*pos);

	retval = le32toh(*src);
	*pos += round_up(sizeof(u_int32_t), 8);

	if (g_verbose >= VERBOSE_DEBUG) {
		printf("read_u32: val %u, pos: %ld.\n", retval, *pos);
	}

	return retval;
}

static u_int64_t read_u64(const void *log, size_t *pos)
{
	u_int64_t retval;
	u_int64_t *src = (u_int64_t*)(((char*)log)+*pos);

	retval = le64toh(*src);
	*pos += round_up(sizeof(u_int64_t), 8);

	if (g_verbose >= VERBOSE_DEBUG) {
		printf("read_u64: val %lu, pos: %ld.\n", retval, *pos);
	}

	return retval;
}

static void read_blob(const void *log, size_t *pos, void *data, int len)
{
	void *src = (void *)(((char*)log)+*pos);

	memcpy(data, src, len);
	*pos += round_up(len, 8);

	if (g_verbose >= VERBOSE_DEBUG) {
		printf("read_blob:len %d pos: %ld.\n", len, *pos);
	}
}

static void skip_blob(const void *log, size_t *pos, void *data, int len)
{
	*pos += round_up(len, 8);

	if (g_verbose >= VERBOSE_DEBUG) {
		printf("skip_blob:len %d pos: %ld.\n", len, *pos);
	}
}

//////////////////////////////////////////////////////////////////////////////

static void show_help(void)
{
	printf("\n");
	printf(" Applies up to <replay_cnt> elements from file <log> to file <dump>.\n");
	printf(" Command line parameters:\n");
	printf(" <dump>: nand dump of initial image.\n");
	printf(" <log>: output from debugfs/mtdram.\n");
	printf(" [replaycnt]: number of entries from <log> to be applied.\n");
	printf("              If not specified, then all entries are applied.\n");
	printf("  -h: Print this help\n");
	printf("  -w x: Split writes larger than <x> into multiple operations.\n");
	printf("  -e x: Split erases larger than <x> into multiple operations.\n");
	printf("  -v: Increase verbose level. Specify multiple times to increase further.\n");
}

u_int64_t get_len(u_int64_t len, u_int64_t atomic, int maxops, int *pops)
{
	u_int64_t maxlen;
	int ops;

	ops = 0;
	maxlen = 0;
	do {
		ops++;
		maxlen += atomic;
		if (maxlen >= len) {
			maxlen = len;
			break;
		}
	} while (ops < maxops);

	if (g_verbose >= VERBOSE_DEBUG) {
		printf("getlen(len=%lxh, atomic=%lxh, maxops=%d) returns len=%lxh, ops=%d.\n",
				len, atomic, maxops, maxlen, ops);
	}

	*pops = ops;
	return maxlen;
}

//////////////////////////////////////////////////////////////////////////////

int main(int argc, char **argv)
{
	int count, errno, i;
	size_t dump_len, log_len, pos;
	char *dump, *log;
	char linebuf[4096];
	int opt;

	printf("replay [-h] [-v] [-e erasesize] [-w writesize] <dump> <log> [replay_cnt]\n");

	while ((opt = getopt(argc, argv, "vhe:w:")) != -1) {
		switch(opt) {
		case 'v':
			g_verbose++;
			break;
		case '?':
		case 'h':
			show_help();
			return 0;
		case 'e':
			g_erasesize = atoi(optarg);
			if (g_erasesize == 0) {
				printf("  Invalid erase size.\n");
				return 1;
			}
			break;
		case 'w':
			g_writesize = atoi(optarg);
			if (g_writesize == 0) {
				printf("  Invalid erase size.\n");
				return 1;
			}
			break;
		}
	}

	if (argc == optind+3) {
		count=atoi(argv[optind+2]);
		if (count <= 0) {
			printf("  Invalid replay_cnt: %s (%d).\n", argv[optind+3], count);
			return 1;
		}
	} else if (argc != optind+2) {
		printf("  Missing mandatory parameters.\n");
		show_help();
		return 1;
	} else {
		count = INT_MAX;
	}

	if (g_verbose >= VERBOSE_NORMAL) {
		printf(" atomic write size: %lx.\n", g_writesize);
		printf(" atomic erase size: %lx.\n", g_erasesize);
		printf(" max opcount: %d.\n", count);
	}

	dump = (char*)map_file(argv[optind+0], &dump_len, O_RDWR);
	log = (char*)map_file(argv[optind+1], &log_len, O_RDONLY);

	if (g_verbose >= VERBOSE_NORMAL) {
		printf("Mapped file %s (len:%ld) at %p.\n", argv[optind+0], dump_len, dump);
		printf("Mapped file %s (len:%ld) at %p.\n", argv[optind+1], log_len, log);
	}

	pos=0;
	linebuf[0]='\0';
	i = 0;
	for (;;) {
		u_int32_t val1;
		u_int64_t addr, len, chk, chk_actual;
		u_int64_t len_limited;
		const char *name;
		int maxops, ops;

		if (pos >=log_len)
			break;

		if (i >= count)
			break;

		maxops = count-i;

		if (g_verbose >= VERBOSE_DEBUG)
			printf("Entry %d, start at %lu.\n", i, pos);

		val1 = read_u32(log, &pos);
		if (val1 != MAGIC_START) {
			printf("Bad MAGIC_START: 0x%x.\n", val1);
			return 3;
		}
		val1 = read_u32(log, &pos);
		switch (val1) {
		case FUNC_ERASE:
		case FUNC_ERASE_CHK:
			addr=read_u64(log, &pos);
			len=read_u64(log, &pos);
			if (val1 == FUNC_ERASE_CHK) {
				chk=read_u64(log, &pos);
				chk_actual=CHECK_VAL1*len+CHECK_VAL2*addr;

				if (chk != chk_actual) {
					printf("Checksum error!: got 0x%lx expected 0x%lx.\n",
						chk, chk_actual);
				}
				name="FUNC_ERASE_CHK";
			} else {
				name="FUNC_ERASE";
			}
			len_limited = get_len(len, g_erasesize, maxops, &ops);
			memset(&dump[addr], 0xff, len_limited);
			if (len != len_limited) {
				sprintf(linebuf,"%d: %s(addr=0x%lx, len=0x%lx of total %lx).\n",
							i, name, addr, len_limited, len);
			} else {
				sprintf(linebuf,"%d: %s(addr=0x%lx, len=0x%lx).\n",
							i, name, addr, len_limited);
			}
			i += ops;
			break;

		case FUNC_WRITE:
		case FUNC_WRITE_CHK:
			addr=read_u64(log, &pos);
			len=read_u64(log, &pos);
			len_limited = get_len(len, g_writesize, maxops, &ops);
			if (len_limited != len) {
				read_blob(log, &pos, &dump[addr], len_limited);
				skip_blob(log, &pos, &dump[addr], len-len_limited);
			} else {
				read_blob(log, &pos, &dump[addr], len);
			}
			if (val1 == FUNC_WRITE_CHK) {
				chk=read_u64(log, &pos);
				if (len_limited == len) {
					u_int8_t *buf = (u_int8_t*) &dump[addr];
					u_int32_t j;

					chk_actual = CHECK_VAL1*addr+CHECK_VAL2*len;
					for (j=0;j<len;j++)
						chk_actual += (j+buf[j])*CHECK_VAL3;
					if (chk != chk_actual) {
						printf("Checksum error!: got 0x%lx expected 0x%lx.\n",
							chk, chk_actual);
					}
				}
				name = "FUNC_WRITE_CHK";
			} else {
				name = "FUNC_WRITE";
			}
			if (len_limited != len) {
				sprintf(linebuf,"%d: %s(addr=0x%lx, len=0x%lx of total %lx).\n",
							i, name, addr, len_limited, len);
			} else {
				sprintf(linebuf,"%d: %s(addr=0x%lx, len=0x%lx).\n",
							i, name, addr, len);
			}
			i += ops;
			break;
		default:
			printf("Unknown function: 0x%x.\n", val1);
			return 3;
		}
		val1 = read_u32(log, &pos);
		if (val1 != MAGIC_END) {
			printf("Bad MAGIC_END: 0x%x.\n", val1);
			return 3;
		}
		if (g_verbose >= VERBOSE_DETAILS)
			printf("%s", linebuf);
	}
	printf("Processed %d entries, consumed %lu bytes\n", i, pos);
	if (g_verbose >= VERBOSE_NORMAL)
		printf("Last entry was %s", linebuf);
	/* Note: The files are implicitely closed by ending the process. */
	return 0;
}
