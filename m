Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auolo-0004wM-DR
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2016 22:14:22 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 5/8] mtd-utils: Add flash speed test Utility
Date: Tue, 26 Apr 2016 00:13:26 +0200
Message-Id: <1461622409-14970-6-git-send-email-richard@nod.at>
In-Reply-To: <1461622409-14970-1-git-send-email-richard@nod.at>
References: <1461622409-14970-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>

Basically a user space port of the mtd speed test kernel module.
In addition to the block offset and count module parameters, the
utility supports a block stride and can restore the block contents
after test. Furthermore, a flag can be used to disable destructive
tests (i.e. only perform read speed tests).

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 .gitignore               |   1 +
 Makefile                 |   4 +-
 misc-utils/flash_speed.c | 463 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 467 insertions(+), 1 deletion(-)
 create mode 100644 misc-utils/flash_speed.c

diff --git a/.gitignore b/.gitignore
index 3d03708..6d98b3d 100644
--- a/.gitignore
+++ b/.gitignore
@@ -37,6 +37,7 @@
 /misc-utils/mtdpart
 /misc-utils/flash_torture
 /misc-utils/flash_stress
+/misc-utils/flash_speed
 /nand-utils/nanddump
 /nand-utils/nandtest
 /nand-utils/nandwrite
diff --git a/Makefile b/Makefile
index 1bc41e0..2a7715d 100644
--- a/Makefile
+++ b/Makefile
@@ -20,7 +20,7 @@ MISC_BINS = \
 	ftl_format doc_loadbios ftl_check mtd_debug docfdisk \
 	serve_image recv_image mtdpart flash_erase flash_lock \
 	flash_unlock flash_otp_info flash_otp_dump flash_otp_lock \
-	flash_otp_write flashcp flash_torture flash_stress
+	flash_otp_write flashcp flash_torture flash_stress flash_speed
 UBI_BINS = \
 	ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
 	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol ubiblock
@@ -97,6 +97,8 @@ LDLIBS_mkfs.jffs2  = -lz $(LZOLDLIBS)
 LDFLAGS_jffs2reader = $(ZLIBLDFLAGS) $(LZOLDFLAGS)
 LDLIBS_jffs2reader  = -lz $(LZOLDLIBS)
 
+LDLIBS_flash_speed = -lrt
+
 $(foreach v,$(MISC_BINS),$(eval $(call mkdep,misc-utils/,$(v))))
 $(foreach v,$(JFFSX_BINS),$(eval $(call mkdep,jffsX-utils/,$(v))))
 $(foreach v,$(NAND_BINS),$(eval $(call mkdep,nand-utils/,$(v))))
diff --git a/misc-utils/flash_speed.c b/misc-utils/flash_speed.c
new file mode 100644
index 0000000..9b5355b
--- /dev/null
+++ b/misc-utils/flash_speed.c
@@ -0,0 +1,463 @@
+/*
+ * Copyright (C) 2007 Nokia Corporation
+ * Copyright (C) 2015 sigma star gmbh
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; see the file COPYING. If not, write to the Free Software
+ * Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+ *
+ * Test read and write speed of a MTD device.
+ *
+ * Author: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
+ *
+ * Based on linux flash_speed.c
+ * Author: Adrian Hunter <adrian.hunter@nokia.com>
+ */
+#define DESTRUCTIVE 0x01
+
+#define PROGRAM_NAME "flash_speed"
+
+#include <mtd/mtd-user.h>
+#include <sys/ioctl.h>
+#include <unistd.h>
+#include <string.h>
+#include <stdlib.h>
+#include <libmtd.h>
+#include <stdio.h>
+#include <fcntl.h>
+#include <time.h>
+
+#include "common.h"
+
+static struct mtd_dev_info mtd;
+static unsigned char *iobuf;
+static unsigned char *bbt;
+static const char *mtddev;
+static libmtd_t mtd_desc;
+static int fd;
+
+static int peb=-1, count=-1, skip=-1, flags=0;
+static struct timespec start, finish;
+static int pgsize, pgcnt;
+static int goodebcnt;
+
+static void usage(int status)
+{
+	fputs(
+	"Usage: "PROGRAM_NAME" [OPTIONS] <device>\n\n"
+	"Common options:\n"
+	"  -h, --help          Display this help output\n"
+	"  -b, --peb <num>     Start from this physical erase block\n"
+	"  -c, --count <num>   Number of erase blocks to use (default: all)\n"
+	"  -s, --skip <num>    Number of blocks to skip\n"
+	"  -d, --destructive   Run destructive (erase and write speed) tests\n",
+	status==EXIT_SUCCESS ? stdout : stderr);
+	exit(status);
+}
+
+static long read_num(int idx, int argidx, int argc, char **argv)
+{
+	char *end;
+	long num;
+
+	if (argidx >= argc) {
+		fprintf(stderr, "%s: missing argument\n", argv[idx]);
+		exit(EXIT_FAILURE);
+	}
+
+	num = strtol(argv[argidx], &end, 0);
+
+	if (!end || *end!='\0') {
+		fprintf(stderr, "%s: expected integer argument\n", argv[idx]);
+		exit(EXIT_FAILURE);
+	}
+	return num;
+}
+
+static void process_options(int argc, char **argv)
+{
+	int i;
+
+	for (i=1; i<argc; ++i) {
+		if (!strcmp(argv[i], "--help") || !strcmp(argv[i], "-h")) {
+			usage(EXIT_SUCCESS);
+		} else if (!strcmp(argv[i], "--peb") || !strcmp(argv[i], "-b")) {
+			if (peb >= 0)
+				goto failmulti;
+			peb = read_num(i, i+1, argc, argv);
+			if (peb < 0)
+				goto failarg;
+			++i;
+		} else if (!strcmp(argv[i], "--count") || !strcmp(argv[i], "-c")) {
+			if (count > 0)
+				goto failmulti;
+			count = read_num(i, i+1, argc, argv);
+			if (count <= 0)
+				goto failarg;
+			++i;
+		} else if (!strcmp(argv[i], "--skip") || !strcmp(argv[i], "-s")) {
+			if (skip >= 0)
+				goto failmulti;
+			skip = read_num(i, i+1, argc, argv);
+			if (skip < 0)
+				goto failarg;
+			++i;
+		} else if (!strcmp(argv[i],"--destructive")||!strcmp(argv[i],"-d")) {
+			if (flags & DESTRUCTIVE)
+				goto failmulti;
+			flags |= DESTRUCTIVE;
+		} else {
+			if (mtddev)
+				usage(EXIT_FAILURE);
+			mtddev = argv[i];
+		}
+	}
+
+	if (!mtddev)
+		errmsg_die("No device specified!\n");
+
+	if (peb < 0)
+		peb = 0;
+	if (skip < 0)
+		skip = 0;
+	if (count < 0)
+		count = 1;
+	return;
+failmulti:
+	fprintf(stderr, "'%s' specified more than once!\n", argv[i]);
+	exit(EXIT_FAILURE);
+failarg:
+	fprintf(stderr, "Invalid argument for '%s'!\n", argv[i]);
+	exit(EXIT_FAILURE);
+}
+
+static int write_eraseblock(int ebnum)
+{
+	int err = mtd_write(mtd_desc, &mtd, fd, ebnum, 0,
+				iobuf, mtd.eb_size, NULL, 0, 0);
+	if (err)
+		fprintf(stderr, "Error writing block %d!\n", ebnum);
+	return err;
+}
+
+static int read_eraseblock(int ebnum)
+{
+	int err = mtd_read(&mtd, fd, ebnum, 0, iobuf, mtd.eb_size);
+	if (err)
+		fprintf(stderr, "Error writing block %d!\n", ebnum);
+	return err;
+}
+
+static int write_eraseblock_by_page(int ebnum)
+{
+	void *buf = iobuf;
+	int i, err = 0;
+
+	for (i = 0; i < pgcnt; ++i) {
+		err = mtd_write(mtd_desc, &mtd, fd, ebnum, i * pgsize,
+						buf, pgsize, NULL, 0, 0);
+		if (err) {
+			fprintf(stderr, "Error writing block %d, page %d!\n",
+					ebnum, i);
+			break;
+		}
+		buf += pgsize;
+	}
+
+	return err;
+}
+
+static int write_eraseblock_by_2pages(int ebnum)
+{
+	int i, n = pgcnt / 2, err = 0;
+	size_t sz = pgsize * 2;
+	void *buf = iobuf;
+
+	for (i = 0; i < n; ++i) {
+		err = mtd_write(mtd_desc, &mtd, fd, ebnum, i * sz,
+						buf, sz, NULL, 0, 0);
+		if (err) {
+			fprintf(stderr, "Error writing block %d, page %d + %d!\n",
+					ebnum, i*2, i*2+1);
+			return err;
+		}
+		buf += sz;
+	}
+	if (pgcnt % 2) {
+		err = mtd_write(mtd_desc, &mtd, fd, ebnum, i * sz,
+						buf, pgsize, NULL, 0, 0);
+		if (err) {
+			fprintf(stderr, "Error reading block %d, page %d!\n",
+					ebnum, i*2);
+		}
+	}
+	return err;
+}
+
+static int read_eraseblock_by_page(int ebnum)
+{
+	void *buf = iobuf;
+	int i, err = 0;
+
+	for (i = 0; i < pgcnt; ++i) {
+		err = mtd_read(&mtd, fd, ebnum, i * pgsize, iobuf, pgsize);
+		if (err) {
+			fprintf(stderr, "Error reading block %d, page %d!\n",
+					ebnum, i);
+			break;
+		}
+		buf += pgsize;
+	}
+
+	return err;
+}
+
+static int read_eraseblock_by_2pages(int ebnum)
+{
+	int i, n = pgcnt / 2, err = 0;
+	size_t sz = pgsize * 2;
+	void *buf = iobuf;
+
+	for (i = 0; i < n; ++i) {
+		err = mtd_read(&mtd, fd, ebnum, i * sz, iobuf, sz);
+		if (err) {
+			fprintf(stderr, "Error reading block %d, page %d + %d!\n",
+					ebnum, i*2, i*2+1);
+			return err;
+		}
+		buf += sz;
+	}
+	if (pgcnt % 2) {
+		err = mtd_read(&mtd, fd, ebnum, i * sz, iobuf, pgsize);
+		if (err) {
+			fprintf(stderr, "Error reading block %d, page %d!\n",
+					ebnum, i*2);
+		}
+	}
+
+	return err;
+}
+
+static void start_timing(void)
+{
+	clock_gettime(CLOCK_MONOTONIC_RAW, &start);
+}
+
+static void stop_timing(void)
+{
+	clock_gettime(CLOCK_MONOTONIC_RAW, &finish);
+}
+
+static long calc_speed(void)
+{
+	long ms;
+
+	ms = (finish.tv_sec - start.tv_sec) * 1000L;
+	ms += (finish.tv_nsec - start.tv_nsec) / 1000000L;
+
+	if (ms <= 0)
+		return 0;
+
+	return ((long)goodebcnt * (mtd.eb_size / 1024L) * 1000L) / ms;
+}
+
+static void scan_for_bad_eraseblocks(unsigned int eb, int ebcnt, int ebskip)
+{
+	int i, bad = 0;
+
+	puts("scanning for bad eraseblocks");
+
+	for (i = 0; i < ebcnt; ++i) {
+		bbt[i] = mtd_is_bad(&mtd, fd, eb + i*(ebskip+1)) ? 1 : 0;
+		if (bbt[i])
+			bad += 1;
+	}
+
+	printf("scanned %d eraseblocks, %d are bad\n", ebcnt, bad);
+}
+
+static int erase_good_eraseblocks(unsigned int eb, int ebcnt, int ebskip)
+{
+	int err = 0, block;
+	unsigned int i;
+
+	for (i = 0; i < ebcnt; ++i) {
+		if (bbt[i])
+			continue;
+		block = eb + i*(ebskip+1);
+		err = mtd_erase(mtd_desc, &mtd, fd, block);
+		if (err)
+			fprintf(stderr, "Error erasing block %d!\n", block);
+	}
+
+	return err;
+}
+
+#define TIME_OP_PER_PEB( op )\
+		start_timing();\
+		for (i = 0; i < count; ++i) {\
+			if (bbt[i])\
+				continue;\
+			err = op(peb + i*(skip+1));\
+			if (err)\
+				goto out;\
+		}\
+		stop_timing();\
+		speed = calc_speed()
+
+int main(int argc, char **argv)
+{
+	int err, i, blocks, j, k, status = EXIT_FAILURE;
+	long speed;
+
+	process_options(argc, argv);
+
+	mtd_desc = libmtd_open();
+	if (!mtd_desc)
+		return errmsg("can't initialize libmtd");
+
+	if (mtd_get_dev_info(mtd_desc, mtddev, &mtd) < 0)
+		return errmsg("mtd_get_dev_info failed");
+
+	if (mtd.subpage_size == 1) {
+		puts("not NAND flash, assume page size is 512 bytes.");
+		pgsize = 512;
+	} else {
+		pgsize = mtd.subpage_size;
+	}
+
+	pgcnt = mtd.eb_size / pgsize;
+
+	if (count < 0)
+		count = mtd.eb_size;
+
+	if (peb >= mtd.eb_cnt)
+		return errmsg("Physical erase block %d is out of range!\n", peb);
+
+	if ((peb + (count - 1)*(skip + 1)) >= mtd.eb_cnt) {
+		return errmsg("Given block range exceeds block count of %d!\n",
+					mtd.eb_cnt);
+	}
+
+	iobuf = xmalloc(mtd.eb_size);
+	bbt = xzalloc(count);
+
+	if ((fd = open(mtddev, O_RDWR)) == -1) {
+		perror(mtddev);
+		goto outfree;
+	}
+
+	for (i = 0; i < mtd.eb_size; ++i)
+		iobuf[i] = rand();
+
+	scan_for_bad_eraseblocks(peb, count, skip);
+
+	for (i = 0; i < count; ++i) {
+		if (!bbt[i])
+			goodebcnt++;
+	}
+
+	/* Write all eraseblocks, 1 eraseblock at a time */
+	if (flags & DESTRUCTIVE) {
+		err = erase_good_eraseblocks(peb, count, skip);
+		if (err)
+			goto out;
+
+		puts("testing eraseblock write speed");
+		TIME_OP_PER_PEB(write_eraseblock);
+		printf("eraseblock write speed is %ld KiB/s\n", speed);
+	}
+
+	/* Read all eraseblocks, 1 eraseblock at a time */
+	puts("testing eraseblock read speed");
+	TIME_OP_PER_PEB(read_eraseblock);
+	printf("eraseblock read speed is %ld KiB/s\n", speed);
+
+	/* Write all eraseblocks, 1 page at a time */
+	if (flags & DESTRUCTIVE) {
+		err = erase_good_eraseblocks(peb, count, skip);
+		if (err)
+			goto out;
+
+		puts("testing page write speed");
+		TIME_OP_PER_PEB(write_eraseblock_by_page);
+		printf("page write speed is %ld KiB/s\n", speed);
+	}
+
+	/* Read all eraseblocks, 1 page at a time */
+	puts("testing page read speed");
+	TIME_OP_PER_PEB(read_eraseblock_by_page);
+	printf("page read speed is %ld KiB/s\n", speed);
+
+	/* Write all eraseblocks, 2 pages at a time */
+	if (flags & DESTRUCTIVE) {
+		err = erase_good_eraseblocks(peb, count, skip);
+		if (err)
+			goto out;
+
+		puts("testing 2 page write speed");
+		TIME_OP_PER_PEB(write_eraseblock_by_2pages);
+		printf("2 page write speed is %ld KiB/s\n", speed);
+	}
+
+	/* Read all eraseblocks, 2 pages at a time */
+	puts("testing 2 page read speed");
+	TIME_OP_PER_PEB(read_eraseblock_by_2pages);
+	printf("2 page read speed is %ld KiB/s\n", speed);
+
+	/* Erase all eraseblocks */
+	if (flags & DESTRUCTIVE) {
+		puts("Testing erase speed");
+		start_timing();
+		err = erase_good_eraseblocks(peb, count, skip);
+		if (err)
+			goto out;
+		stop_timing();
+		speed = calc_speed();
+		printf("erase speed is %ld KiB/s\n", speed);
+	}
+
+	/* Multi-block erase all eraseblocks */
+	if (!skip) {
+		for (k = 1; k < 7; ++k) {
+			blocks = 1 << k;
+			printf("Testing %dx multi-block erase speed\n", blocks);
+			start_timing();
+			for (i = 0; i < count; ) {
+				for (j = 0; j < blocks && (i + j) < count; ++j)
+					if (bbt[i + j])
+						break;
+				if (j < 1) {
+					++i;
+					continue;
+				}
+				err = mtd_erase_multi(mtd_desc, &mtd, fd, i, j);
+				if (err)
+					goto out;
+				i += j;
+			}
+			stop_timing();
+			speed = calc_speed();
+			printf("%dx multi-block erase speed is %ld KiB/s\n",
+					blocks, speed);
+		}
+	}
+
+	puts("finished");
+	status = EXIT_SUCCESS;
+out:
+	close(fd);
+outfree:
+	free(iobuf);
+	free(bbt);
+	return status;
+}
-- 
2.7.3
