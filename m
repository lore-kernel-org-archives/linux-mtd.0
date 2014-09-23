Received: from mail-wg0-x22c.google.com ([2a00:1450:400c:c00::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWQ0G-0006kh-3y
 for linux-mtd@lists.infradead.org; Tue, 23 Sep 2014 13:19:38 +0000
Received: by mail-wg0-f44.google.com with SMTP id z12so572486wgg.3
 for <linux-mtd@lists.infradead.org>; Tue, 23 Sep 2014 06:19:14 -0700 (PDT)
Message-ID: <1411478352.2030.11.camel@lp-lvrv.comap.cz>
Subject: [RFC] nondestructive nandtest
From: Rostislav Lisovy <lisovy@gmail.com>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Date: Tue, 23 Sep 2014 15:19:12 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Michal Vokac <michal.vokac@comap.cz>, Rostislav Lisovy <lisovy@merica.cz>,
 Michal Sojka <sojkam1@fel.cvut.cz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a simple nondestructive nandtest utility. The testing logic is
similar to the original nandtest however the OOB data is properly
restored and the erased pages are kept as erased (for more detailed
information see the source file header).
The test tries to be nondestructive as much as possible however if it
will be interrupted (by the user or power loss) during testing, it is
very likely that the data on the NAND flash will be corrupted (this is
not a bug but a feature of the r/w testing).

To use it just run the program and use the full MTD device path as its
only parameter (i.e. nandtest /dev/mtd7). It can test only the whole mtd
device for now, it still lacks all the "offset/length" parameters that
the original nandtest has (and printing information about the operation
performed). Libmtd is needed to compile.

Very simple benchmark ("real runtime" measured by "time" command):
                    | original nandtest | new nandtest |
/-------------------+-------------------+--------------|
|   8MiB mtd device |         0m  6.00s |     0m 9.29s |
| 256MiB mtd device |         3m 18.88s |     5m 9.82s |

Your feedback is highly appreciated.

Best regards;
Rostislav
--

/*
 * Nondestructive NAND flash testing utility for Linux MTD subsystem
 *
 * Copyright (c) ComAp a.s. 2014, http://www.comap.cz/
 * Author: Rostislav Lisovy <lisovy@merica.cz>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
 * the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 *
 *
 * The test consists of the following phases (performed on each EB):
 *  * Store the original content of the EB (including OOB)
 *  * Multiple times (defined in PER_EB_RUNS)
 *    - Generate random test_pattern (of size eb_size)
 *    - Erase EB
 *    - Write test_pattern
 *    - Read content of the EB
 *    - Compare read data with the test_pattern
 *  * Restore the previously stored data
 *
 * Reasons for the test to fail:
 *  * New bad block was discovered
 *  * Single non-correctable bit-flip occurred
 *  * More than 'CORRECTABLE_BIT_FLIPS_THRESHOLD' correctable
 *    bit-flips occurred
 *  * Any of the syscalls (ioctl/open/...) failed
 *
 * Side note:
 *   When storing EB, all the data can be read at once
 *   (copied into the buffer of the size eb_size), however
 *   when reading OOB, we have to read it for each page in
 *   the EB separately (copying to the buffer of size
 *   pages_cnt * oob_size).
 *
 *   When restoring data (writing from buffers back to flash),
 *   we have to check carefully for each page if it was originally
 *   erased or not. The check is simply performed by matching the
 *   data stored in buffers (data + oob) with the 0xffffffff pattern.
 *   (One may thing that 0xff data may be valid "stored value", that's
 *   true, however 0xff data do not have 0xff ECC in OOB).
 *   If the page was not empty (erased), write the data, otherwise
 *   do not touch the page, skip it and continue with the next one.
 *   This is done due to the NAND flash HW limitation of single
 *   write operation allowed per page (or sub-page) after the erase
 *   command (i.e. even storing of the 0xffffffff pattern is legal
 *   write operation which depletes this "single write" requirement).
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>
#include <sys/ioctl.h>
#include <assert.h>
#include <inttypes.h>
#include <stdbool.h>
#include <time.h>

#include <mtd/mtd-user.h>
#include "libmtd.h"

libmtd_t mtd_desc;
struct mtd_dev_info meminfo;
int fd;

void *eb;		/* Store EB content */
void *oob;		/* Store OOB of each page */
void *test_pattern;	/* Randomly generated pattern to write to en EB */
void *tmp_buff;

/*
 * How many correctable bit-flips may occur
 * until the test will fail
 */
#define CORRECTABLE_BIT_FLIPS_THRESHOLD		100

/*
 * Pattern that matches if the page is erased
 * (page + OOB should match at the same time)
 */
#define NAND_FLASH_ERASED_U32			0xffffffff

/*
 * Number of pages in an EB
 * FIXME is this fragile or will it always work?
 */
#define PAGE_CNT				(meminfo.eb_size / meminfo.min_io_size)

/*
 * How many times should be a single EB tested
 * with a r/w access
 */
#define PER_EB_RUNS				1

static int store_eb_content(int eb_nr)
{
	int ret;
	int page_nr;

	ret = mtd_read(&meminfo, fd, eb_nr, 0, eb, meminfo.eb_size);
	if (ret == -1)
		return ret;

	/* For each page */
	for (page_nr = 0; page_nr < PAGE_CNT; page_nr++) {
		ret = mtd_read_oob(mtd_desc, &meminfo, fd,
				   (eb_nr * meminfo.eb_size) +
					(page_nr * meminfo.min_io_size),
				   meminfo.oob_size,
				   oob + (page_nr * meminfo.oob_size));
		if (ret == -1)
			return ret;
	}

	return 0;
}

static int restore_eb_content(int eb_nr)
{
	int ret;
	int i;
	bool page_is_erased;
	int page_nr;

	/* FIXME Assume that data length is 4B (32-bit) multiple */
	assert(!(meminfo.eb_size & 0x2));

	ret = mtd_erase(mtd_desc, &meminfo, fd, eb_nr);
	if (ret == -1)
		return ret;

	/* For each page in the EB */
	for (page_nr = 0; page_nr < PAGE_CNT; page_nr++) {
		/* Make the life easier with the pointers to the exact page */
		void *pg_data = eb + (page_nr * meminfo.min_io_size);
		void *pg_oob = oob + (page_nr * meminfo.oob_size);

		page_is_erased = true;

		/* For each 4B in OOB */
		for (i = 0; i < meminfo.oob_size; i += sizeof(uint32_t)) {
			if (*((uint32_t *)(pg_oob + i)) != NAND_FLASH_ERASED_U32) {
				page_is_erased = false;
				break;
			}
		}

		/* For each 4B in page */
		for (i = 0; i < meminfo.min_io_size; i += sizeof(uint32_t)) {
			if (*((uint32_t *)(pg_data + i)) != NAND_FLASH_ERASED_U32) {
				page_is_erased = false;
				break;
			}
		}

		/*
		 * If the page does contain some data (!page_is_erased)
		 * do write them, otherwise do not touch it)
		 */
		if (!page_is_erased) {
			/*
			 * Can only write to a single page at a time
			 * if writing to OOB.
			 */
			ret = mtd_write(mtd_desc, &meminfo, fd, eb_nr,
					page_nr * meminfo.min_io_size,
					pg_data, meminfo.min_io_size,
					pg_oob, meminfo.oob_size, MTD_OPS_RAW);
			if (ret == -1)
				return ret;
		}
	}

	return 0;
}

static int eb_rw_testing(int eb_nr)
{
	int ret;
	int i;

	ret = mtd_erase(mtd_desc, &meminfo, fd, eb_nr);
	if (ret == -1)
		return ret;

	ret = mtd_write(mtd_desc, &meminfo, fd, eb_nr, 0,
			test_pattern, meminfo.eb_size,
			NULL, 0, MTD_OPS_AUTO_OOB);
	if (ret == -1)
		return ret;

	ret = mtd_read(&meminfo, fd, eb_nr, 0, tmp_buff, meminfo.eb_size);
	if (ret == -1)
		return ret;

	/* Compare the test_pattern with the data read from the EB */
	for (i = 0; i < meminfo.eb_size; i += sizeof(uint32_t))
	{
		if (*((uint32_t*)(tmp_buff + i)) != *((uint32_t*)(test_pattern + i))) {
			/*
			 * FIXME what should be done if we newly discover a bad block?
			 * Should we run mtd_torture? Or mark this EB as bad?
			 * In such case a flashed FS will not be usable anymore
			 */
			fprintf(stderr, "New badblock discovered. This is bad. "
					"Stopping the test.\n");
			return -1;
		}
	}

	return 0;
}

static int run_test(void)
{
	int ret = -1;
	int eb_nr;
	int i, j;

	eb = malloc(meminfo.eb_size);
	if (!eb)
		return -1;

	oob = malloc(meminfo.oob_size * PAGE_CNT);
	if (!oob)
		goto leave_free_eb;

	/* Prepare test pattern */
	srand(time(NULL));
	test_pattern = malloc(meminfo.eb_size);
	if (!test_pattern)
		goto leave_free_oob;

	tmp_buff = malloc(meminfo.eb_size);
	if (!tmp_buff)
		goto leave_free_test_pattern;

	/* For each eraseblock */
	for (eb_nr = 0; eb_nr < meminfo.eb_cnt; eb_nr++) {
		/* Skip bad blocks */
		ret = mtd_is_bad(&meminfo, fd, eb_nr);
		if (ret == 1)
			continue;
		if (ret == -1)
			goto leave_free_all;

		/* Store the EBs data before testing (including OOB) */
		ret = store_eb_content(eb_nr);
		if (ret)
			goto leave_free_all;

		/* Run RW tests */
		for (i = 0; i < PER_EB_RUNS; i++) {
			/* Generate test pattern */
			for (j = 0; j < meminfo.eb_size; j++)
				*((char *)(test_pattern + j)) = (char)rand();

			ret = eb_rw_testing(eb_nr);
			if (ret)
				goto leave_free_all;
		}

		/* Restore the original data */
		ret = restore_eb_content(eb_nr);
		if (ret)
			goto leave_free_all;
	}

	printf("Test finished. Everything OK.\n");
	ret = EXIT_SUCCESS;

leave_free_all:
	free(tmp_buff);
leave_free_test_pattern:
	free(test_pattern);
leave_free_oob:
	free(oob);
leave_free_eb:
	free(eb);

	return ret;
}

int main(int argc, char* argv[])
{
	struct mtd_ecc_stats eccstats_orig;
	struct mtd_ecc_stats eccstats_new;
	int ret = EXIT_FAILURE;
	char *dev;

	if (argc < 2) {
		fprintf(stderr, "Usage: %s MTD_DEVICE\n", argv[0]);
		exit(EXIT_FAILURE);
	}

	/* Initialize libmtd */
	mtd_desc = libmtd_open();
	if (!mtd_desc) {
		fprintf(stderr, "can't initialize libmtd");
		exit(EXIT_FAILURE);
	}

	dev = argv[1];

	/* Open MTD device */
	fd = open(dev, O_RDWR);
	if (fd < 0) {
		perror("open");
		exit(EXIT_FAILURE);
	}

	/* Fill in MTD device capability structure */
	if (mtd_get_dev_info(mtd_desc, dev, &meminfo) < 0) {
		fprintf(stderr, "mtd_get_dev_info failed");
		goto close_fd;
	}

	if (ioctl(fd, ECCGETSTATS, &eccstats_orig)) {
		perror("ECCGETSTATS");
		goto close_fd;
	}

	ret = run_test();

	if (ioctl(fd, ECCGETSTATS, &eccstats_new)) {
		perror("ECCGETSTATS");
		goto close_fd;
	}

	/* Fail the test even if there was a single uncorrectable 'bit-flip' */
	if (eccstats_new.failed > eccstats_orig.failed) {
		ret = EXIT_FAILURE;
		goto close_fd;
	}
	/* If there is more correctable bitflips than the threshold, fail the test */
	if ((eccstats_new.corrected - eccstats_orig.corrected) >
	    CORRECTABLE_BIT_FLIPS_THRESHOLD) {
		ret = EXIT_FAILURE;
		goto close_fd;
	}

close_fd:
	close(fd);
	exit(ret);
}
