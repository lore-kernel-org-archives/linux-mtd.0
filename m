Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auolT-0004nw-0L
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2016 22:14:00 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 4/8] mtd-utils: Add flash stress test Utility
Date: Tue, 26 Apr 2016 00:13:25 +0200
Message-Id: <1461622409-14970-5-git-send-email-richard@nod.at>
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

Basically a user space port of the mtd stress test kernel module.
In addition to the block offset and count module parameters, the
utility supports a block stride and can restore the block contents
after test.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 .gitignore                |   1 +
 Makefile                  |   2 +-
 misc-utils/flash_stress.c | 276 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 278 insertions(+), 1 deletion(-)
 create mode 100644 misc-utils/flash_stress.c

diff --git a/.gitignore b/.gitignore
index 5b529d1..3d03708 100644
--- a/.gitignore
+++ b/.gitignore
@@ -36,6 +36,7 @@
 /misc-utils/mtd_debug
 /misc-utils/mtdpart
 /misc-utils/flash_torture
+/misc-utils/flash_stress
 /nand-utils/nanddump
 /nand-utils/nandtest
 /nand-utils/nandwrite
diff --git a/Makefile b/Makefile
index af3d1fd..1bc41e0 100644
--- a/Makefile
+++ b/Makefile
@@ -20,7 +20,7 @@ MISC_BINS = \
 	ftl_format doc_loadbios ftl_check mtd_debug docfdisk \
 	serve_image recv_image mtdpart flash_erase flash_lock \
 	flash_unlock flash_otp_info flash_otp_dump flash_otp_lock \
-	flash_otp_write flashcp flash_torture
+	flash_otp_write flashcp flash_torture flash_stress
 UBI_BINS = \
 	ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
 	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol ubiblock
diff --git a/misc-utils/flash_stress.c b/misc-utils/flash_stress.c
new file mode 100644
index 0000000..2dd2da1
--- /dev/null
+++ b/misc-utils/flash_stress.c
@@ -0,0 +1,276 @@
+/*
+ * Copyright (C) 2006-2008 Nokia Corporation
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
+ * Test random reads, writes and erases on MTD device.
+ *
+ * Author: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
+ *
+ * Based on linux stresstest.c
+ * Author: Adrian Hunter <ext-adrian.hunter@nokia.com>
+ */
+#define PROGRAM_NAME "flash_stress"
+
+#define KEEP_CONTENTS 0x01
+#define COUNT_CHANGED 0x02
+#define SEED_SET 0x04
+
+#include <mtd/mtd-user.h>
+#include <unistd.h>
+#include <stdlib.h>
+#include <libmtd.h>
+#include <stdio.h>
+#include <fcntl.h>
+#include <time.h>
+
+#include "common.h"
+
+static struct mtd_dev_info mtd;
+static const char *mtddev;
+static libmtd_t mtd_desc;
+static int fd;
+
+static unsigned char *writebuf;
+static unsigned char *readbuf;
+static unsigned char *old;
+static unsigned char *bbt;
+
+static int pgsize;
+static int pgcnt;
+
+static int count = 10000;
+static int flags = 0;
+
+static void usage(int status)
+{
+	fputs(
+	"Usage: "PROGRAM_NAME" [OPTIONS] <device>\n\n"
+	"Options:\n"
+	"  -h, --help         Display this help output\n"
+	"  -c, --count <num>  Number of operations to do (default is 10000)\n"
+	"  -s, --seed <num>   Seed for pseudor random number generator\n"
+	"  -k, --keep         Restore existing contents after test\n",
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
+		} else if (!strcmp(argv[i], "--keep") || !strcmp(argv[i], "-k")) {
+			if (flags & KEEP_CONTENTS)
+				goto failmulti;
+			flags |= KEEP_CONTENTS;
+		} else if (!strcmp(argv[i], "--seed") || !strcmp(argv[i], "-s")) {
+			if (flags & SEED_SET)
+				goto failmulti;
+			srand(read_num(i, i+1, argc, argv));
+			flags |= SEED_SET;
+		} else if (!strcmp(argv[i], "--count") || !strcmp(argv[i], "-c")) {
+			if (flags & COUNT_CHANGED)
+				goto failmulti;
+			count = read_num(i, i+1, argc, argv);
+			if (count <= 0)
+				goto failarg;
+			++i;
+			flags |= COUNT_CHANGED;
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
+	if (!(flags & SEED_SET))
+		srand(time(NULL));
+	return;
+failmulti:
+	fprintf(stderr, "'%s' specified more than once!\n", argv[i]);
+	exit(EXIT_FAILURE);
+failarg:
+	fprintf(stderr, "Invalid argument for '%s'!\n", argv[i]);
+	exit(EXIT_FAILURE);
+}
+
+static int rand_eb(void)
+{
+	unsigned int eb;
+
+	/* Read or write up 2 eraseblocks at a time - hence 'mtd.eb_cnt - 1' */
+	do {
+		eb = rand() % (mtd.eb_cnt - 1);
+	} while (bbt[eb]);
+
+	return eb;
+}
+
+static int do_read(void)
+{
+	int eb = rand_eb();
+	int offs = rand() % pgcnt;
+	int len = rand() % (pgcnt - offs);
+
+	offs *= pgsize;
+	len *= pgsize;
+	return mtd_read(&mtd, fd, eb, offs, readbuf, len);
+}
+
+static int do_write(void)
+{
+	int eb = rand_eb(), err, err1;
+	int offs = rand() % pgcnt;
+	int len = rand() % (pgcnt - offs);
+
+	offs *= pgsize;
+	len *= pgsize;
+
+	if (flags & KEEP_CONTENTS) {
+		err = mtd_read(&mtd, fd, eb, 0, old, mtd.eb_size);
+		if (err) {
+			fputs("Error backing up old erase block contents\n", stderr);
+			return -1;
+		}
+	}
+
+	err = mtd_erase(mtd_desc, &mtd, fd, eb);
+	if (err)
+		goto out;
+
+	err = mtd_write(mtd_desc, &mtd, fd, eb, offs,
+			writebuf, len, NULL, 0, 0);
+	if (err)
+		goto out;
+
+	err = 0;
+out:
+	if (flags & KEEP_CONTENTS) {
+		if (mtd_erase(mtd_desc, &mtd, fd, eb)) {
+			fprintf(stderr, "mtd_erase: PEB %d", eb);
+			return -1;
+		}
+
+		err1 = mtd_write(mtd_desc, &mtd, fd, eb, 0,
+					old, mtd.eb_size, NULL, 0, 0);
+
+		if (err1) {
+			fprintf(stderr, "Failed to restore old contents\n");
+			return -1;
+		}
+	}
+	return err;
+}
+
+static void scan_for_bad_eraseblocks(unsigned int eb, int ebcnt)
+{
+	int i, bad = 0;
+
+	puts("scanning for bad eraseblocks");
+
+	for (i = 0; i < ebcnt; ++i) {
+		bbt[i] = mtd_is_bad(&mtd, fd, eb + i) ? 1 : 0;
+		if (bbt[i])
+			bad += 1;
+	}
+
+	printf("scanned %d eraseblocks, %d are bad\n", ebcnt, bad);
+}
+
+int main(int argc, char **argv)
+{
+	int status = EXIT_FAILURE, i, op, err;
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
+	readbuf = xmalloc(mtd.eb_size);
+	writebuf = xmalloc(mtd.eb_size);
+	bbt = xzalloc(mtd.eb_cnt);
+
+	if (flags & KEEP_CONTENTS)
+		old = xmalloc(mtd.eb_size);
+
+	for (i = 0; i < mtd.eb_size; ++i)
+		writebuf[i] = rand();
+
+	/* Open device file */
+	if ((fd = open(mtddev, O_RDWR)) == -1) {
+		perror(mtddev);
+		goto out;
+	}
+
+	/* Do operations */
+	scan_for_bad_eraseblocks(0, mtd.eb_cnt);
+
+	puts("doing operations");
+	for (op = 0; op < count; op++) {
+		if ((op & 1023) == 0)
+			printf("%d operations done\n", op);
+		err = (rand() & 1) ? do_read() : do_write();
+		if (err)
+			goto out;
+	}
+	printf("finished, %d operations done\n", op);
+
+	status = EXIT_SUCCESS;
+out:
+	close(fd);
+	free(bbt);
+	free(writebuf);
+	free(readbuf);
+	free(old);
+	return status;
+}
-- 
2.7.3
