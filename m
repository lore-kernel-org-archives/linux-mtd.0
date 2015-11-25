Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1ZOp-0005ue-0o
 for linux-mtd@lists.infradead.org; Wed, 25 Nov 2015 12:42:17 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.sigma-star.at (Postfix) with ESMTP id 936BF16B4D07
 for <linux-mtd@lists.infradead.org>; Wed, 25 Nov 2015 13:41:50 +0100 (CET)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [RFC][PATCH] mtd-utils: Add read disturb test utility
Date: Wed, 25 Nov 2015 13:41:19 +0100
Message-Id: <1448455279-9663-1-git-send-email-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 - Read disturb test mode repeatedly reads range of blocks
   and counts bit flips. The page with the highest number is
   reported for each block.
 - Implements functionallity of proposed in-kernel read
   disturb test.
 - MLC test mode counts and compares bit flips before and after
   writing to a paired page.
 - Still looking for a better name for the utility.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 .gitignore                   |   1 +
 Makefile                     |   2 +-
 nand-utils/readdisturbtest.c | 397 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 399 insertions(+), 1 deletion(-)
 create mode 100644 nand-utils/readdisturbtest.c

diff --git a/.gitignore b/.gitignore
index 2aac52c..7fa8468 100644
--- a/.gitignore
+++ b/.gitignore
@@ -35,6 +35,7 @@
 /jffsX-utils/mkfs.jffs2
 /misc-utils/mtd_debug
 /misc-utils/mtdpart
+/nand-utils/readdisturbtest
 /nand-utils/nanddump
 /nand-utils/nandtest
 /nand-utils/nandwrite
diff --git a/Makefile b/Makefile
index bd9504a..1bcc0af 100644
--- a/Makefile
+++ b/Makefile
@@ -29,7 +29,7 @@ UBIFS_BINS = \
 JFFSX_BINS = \
 	mkfs.jffs2 sumtool jffs2reader jffs2dump
 NAND_BINS = \
-	nanddump nandwrite nandtest nftldump nftl_format
+	nanddump nandwrite nandtest nftldump nftl_format readdisturbtest
 NOR_BINS = \
 	rfddump rfdformat
 
diff --git a/nand-utils/readdisturbtest.c b/nand-utils/readdisturbtest.c
new file mode 100644
index 0000000..86ea1c4
--- /dev/null
+++ b/nand-utils/readdisturbtest.c
@@ -0,0 +1,397 @@
+#define PROGRAM_NAME "readdisturbtest"
+
+#include <mtd/mtd-user.h>
+#include <sys/ioctl.h>
+#include <unistd.h>
+#include <string.h>
+#include <stdlib.h>
+#include <libmtd.h>
+#include <stdio.h>
+#include <fcntl.h>
+
+#include "common.h"
+
+#define KEEP_CONTENTS 0x01
+#define RUN_READTEST 0x02
+#define RUN_MLCTEST 0x04
+#define READ_MULTI 0x08
+
+static int peb=-1, pair1=-1, pair2=-1, reads=-1, blocks=-1, skip=-1, log=-1;
+static struct mtd_dev_info mtd;
+static const char *mtddev;
+static libmtd_t mtd_desc;
+static int mtdfd, flags;
+
+static void usage(int status)
+{
+	fputs(
+	"Usage: "PROGRAM_NAME" [OPTIONS] <device>\n\n"
+	"Common options:\n"
+	"  -h, --help                   Display this help output\n"
+	"  -b, --peb <num>              Start from this physical erase block\n"
+	"  -c, --blocks <num>           Number of erase blocks to read\n"
+	"  -s, --skip <num>             Number of erase blocks to skip\n"
+	"  -k, --keep                   Restore existing contents after test\n\n"
+	"Options for MLC test:\n"
+	"  -p, --pair <first> <second>  Assume the given pages are paired\n\n"
+	"Options for read disturb test:\n"
+	"  -r, --reads <num>            Number of iterations\n"
+	"  -l, --log <num>              If set, only log statistics after\n"
+	"                               the Nth iteration.\n",
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
+		} else if (!strcmp(argv[i], "--peb") || !strcmp(argv[i], "-b")) {
+			if (peb >= 0)
+				goto failmulti;
+			peb = read_num(i, i+1, argc, argv);
+			if (peb < 0)
+				goto failarg;
+			++i;
+		} else if (!strcmp(argv[i], "--pair") || !strcmp(argv[i], "-p")) {
+			if (flags & RUN_MLCTEST)
+				goto failmulti;
+			pair1 = read_num(i, i+1, argc, argv);
+			pair2 = read_num(i, i+2, argc, argv);
+			if (pair1<0 || pair2<0 || pair1==pair2)
+				goto failarg;
+			i += 2;
+			flags |= RUN_MLCTEST;
+		} else if (!strcmp(argv[i], "--reads") || !strcmp(argv[i], "-r")) {
+			if (flags & RUN_READTEST)
+				goto failmulti;
+			reads = read_num(i, i+1, argc, argv);
+			if (reads <= 0)
+				goto failarg;
+			++i;
+			flags |= RUN_READTEST;
+		} else if (!strcmp(argv[i], "--blocks") || !strcmp(argv[i], "-c")) {
+			if (blocks > 0)
+				goto failmulti;
+			blocks = read_num(i, i+1, argc, argv);
+			if (blocks <= 0)
+				goto failarg;
+			++i;
+			flags |= READ_MULTI;
+		} else if (!strcmp(argv[i], "--skip") || !strcmp(argv[i], "-s")) {
+			if (skip >= 0)
+				goto failmulti;
+			skip = read_num(i, i+1, argc, argv);
+			if (skip < 0)
+				goto failarg;
+			++i;
+			flags |= READ_MULTI;
+		} else if (!strcmp(argv[i], "--log") || !strcmp(argv[i], "-l")) {
+			if (log>0)
+				goto failmulti;
+			log = read_num(i, i+1, argc, argv);
+			if (log <= 0)
+				goto failarg;
+			++i;
+		} else {
+			if (mtddev)
+				usage(EXIT_FAILURE);
+			mtddev = argv[i];
+		}
+	}
+
+	if ((flags & READ_MULTI) && blocks <= 0)
+		errmsg_die("Block skip specified, but no block count!\n");
+
+	if (!(flags & (RUN_READTEST|RUN_MLCTEST)))
+		errmsg_die("Neither page pair nor read test iterations specified!\n");
+
+	if (!mtddev)
+		errmsg_die("No device specified!\n");
+
+	if (log < 0)
+		log = 1;
+	if (peb < 0)
+		peb = 0;
+	if (skip < 0)
+		skip = 0;
+	if (blocks < 0)
+		blocks = 1;
+	return;
+failmulti:
+	fprintf(stderr, "'%s' specified more than once!\n", argv[i]);
+	exit(EXIT_FAILURE);
+failarg:
+	fprintf(stderr, "Invalid argument for '%s'!\n", argv[i]);
+	exit(EXIT_FAILURE);
+}
+
+static size_t count_bitflips(unsigned char* a, unsigned char* b, size_t size)
+{
+	size_t i, count=0;
+	unsigned char x;
+
+	for (i=0; i < size; ++i) {
+		x = *(a++) ^ *(b++);
+		count += __builtin_popcount(x);
+	}
+
+	return count;
+}
+
+static int mlc_test(void)
+{
+	void *page1=NULL, *page2=NULL, *scratch=NULL;
+	int err = -1, i, block;
+	size_t count1, count2;
+
+	puts("================= MLC test ================");
+
+	page1 = malloc(mtd.subpage_size);
+	if (!page1)
+		goto failalloc;
+	page2 = malloc(mtd.subpage_size);
+	if (!page2)
+		goto failalloc;
+	scratch = malloc(mtd.subpage_size);
+	if (!scratch)
+		goto failalloc;
+
+	memset(page1, 0xAA, mtd.subpage_size);
+	memset(page2, 0x55, mtd.subpage_size);
+
+	for (i=0; i < blocks; ++i) {
+		block = peb + i*(skip+1);
+
+		if (mtd_erase(mtd_desc, &mtd, mtdfd, block)) {
+			perror("mtd_erase");
+			goto out;
+		}
+
+		mtd_write(mtd_desc, &mtd, mtdfd, block, mtd.subpage_size*pair1,
+				page1, mtd.subpage_size, NULL, 0, 0);
+		mtd_read(&mtd, mtdfd, block, mtd.subpage_size*pair1,
+				scratch, mtd.subpage_size);
+
+		count1 = count_bitflips(page1, scratch, mtd.subpage_size);
+		printf("Detected %zu bit flips in block %d, page %zu\n",
+				count1,block,pair1);
+
+		mtd_write(mtd_desc, &mtd, mtdfd, block, mtd.subpage_size*pair2,
+				page2, mtd.subpage_size, NULL, 0, 0);
+		mtd_read(&mtd, mtdfd, block, mtd.subpage_size*pair1,
+				scratch, mtd.subpage_size);
+
+		count2 = count_bitflips(page1, scratch, mtd.subpage_size);
+		printf("Detected %zu bit flips in block %d, page %zu\n",
+				count2,block,pair1);
+
+		if (count2 > count1)
+			printf("Number of bitflips increased by %zu\n", count2-count1);
+		else if(count2 < count1)
+			printf("At least %zu previously flipped bits flipped back\n",
+					count1-count2);
+	}
+	err = 0;
+out:
+	free(page1);
+	free(page2);
+	free(scratch);
+	return err;
+failalloc:
+	fputs("Out of memory", stderr);
+	goto out;
+}
+
+static int read_test(void)
+{
+	size_t i, count, worst, worstpage;
+	void *pattern=NULL, *scratch=NULL;
+	int j, k, err=-1;
+
+	puts("============ read disturb test ============");
+
+	pattern = malloc(mtd.eb_size);
+	if (!pattern)
+		goto failalloc;
+
+	scratch = malloc(mtd.eb_size);
+	if (!scratch)
+		goto failalloc;
+
+	for (i=0; i < mtd.eb_size; i += mtd.subpage_size)
+		memset(pattern + i, i & 0x01 ? 0xAA : 0x55, mtd.subpage_size);
+
+	for (i=0; i < blocks; ++i) {
+		if (mtd_erase(mtd_desc, &mtd, mtdfd, peb+i*(skip+1))) {
+			perror("mtd_erase");
+			goto out;
+		}
+
+		mtd_write(mtd_desc, &mtd, mtdfd, peb+i*(skip+1), 0,
+			pattern, mtd.eb_size, NULL, 0, 0);
+	}
+
+	for (j=0; j < reads; ++j) {
+		for (k=0; k < blocks; ++k) {
+			mtd_read(&mtd, mtdfd, peb+k*(skip+1), 0, scratch, mtd.eb_size);
+			worstpage = 0;
+			worst = 0;
+
+			for (i=0; i < mtd.eb_size; i += mtd.subpage_size) {
+				count = count_bitflips(pattern + i, scratch + i,
+							mtd.subpage_size);
+
+				if (count > worst) {
+					worst = count;
+					worstpage = i / mtd.subpage_size;
+				}
+			}
+
+			if (((j+1) % log)==0) {
+				printf("Detected %zu bitflips in block %d, page %zu "
+					"after %d reads\n", worst, peb+k*(skip+1),
+					worstpage, j+1);
+			}
+		}
+	}
+
+	err = 0;
+out:
+	free(pattern);
+	free(scratch);
+	return err;
+failalloc:
+	fputs("Out of memory", stderr);
+	goto out;
+}
+
+int main(int argc, char **argv)
+{
+	int pagecount, err, status=EXIT_FAILURE, i;
+	void *old = NULL;
+
+	process_options(argc, argv);
+
+	mtd_desc = libmtd_open();
+	if (!mtd_desc)
+		return errmsg("can't initialize libmtd");
+
+	/* sanity check */
+	if (mtd_get_dev_info(mtd_desc, mtddev, &mtd) < 0)
+		return errmsg("mtd_get_dev_info failed");
+
+	if (mtd.type!=MTD_MLCNANDFLASH && mtd.type!=MTD_NANDFLASH)
+		return errmsg("%s is not a NAND flash!\n", mtddev);
+
+	pagecount = mtd.eb_size / mtd.subpage_size;
+
+	if (peb >= mtd.eb_cnt)
+		return errmsg("Physical erase block %d is out of range!\n", peb);
+	if (pair1 >= pagecount)
+		return errmsg("Page number %d is out of range!\n", pair1);
+	if (pair2 >= pagecount)
+		return errmsg("Page number %d is out of range!\n", pair2);
+
+	if ((peb + (blocks - 1)*(skip + 1)) >= mtd.eb_cnt) {
+		return errmsg("Given block range exceeds block count of %d!\n",
+					mtd.eb_cnt);
+	}
+
+	/* open device and set raw mode (no ECC) */
+	if ((mtdfd = open(mtddev, O_RDWR)) == -1) {
+		perror(mtddev);
+		return EXIT_FAILURE;
+	}
+
+	if (flags & KEEP_CONTENTS) {
+		old = malloc(mtd.eb_size * blocks);
+		if (!old) {
+			fputs("Not enough memory to backup old data!\n", stderr);
+			return EXIT_FAILURE;
+		}
+
+		for (i=0; i < blocks; ++i) {
+			err = mtd_read(&mtd, mtdfd, peb+i*(skip+1), 0,
+					old+i*mtd.eb_size, mtd.eb_size);
+
+			if (err) {
+				perror("mtd_read");
+				return EXIT_FAILURE;
+			}
+		}
+	}
+
+	if (ioctl(mtdfd, MTDFILEMODE, MTD_FILE_MODE_RAW)!=0) {
+		perror("MTDFILEMODE");
+		return EXIT_FAILURE;
+	}
+
+	/* run test */
+	if (flags & RUN_MLCTEST) {
+		if (mlc_test( ))
+			goto out;
+	}
+	if (flags & RUN_READTEST) {
+		if (read_test( ))
+			goto out;
+	}
+
+	status = EXIT_SUCCESS;
+
+	/* restore */
+out:
+	if (flags & KEEP_CONTENTS) {
+		if (ioctl(mtdfd, MTDFILEMODE, MTD_FILE_MODE_NORMAL)!=0) {
+			perror("MTDFILEMODE");
+			return EXIT_FAILURE;
+		}
+
+		for (i=0; i < blocks; ++i) {
+			if (mtd_erase(mtd_desc, &mtd, mtdfd, peb+i*(skip+1))) {
+				perror("mtd_erase");
+				status = EXIT_FAILURE;
+			}
+
+			err = mtd_write(mtd_desc, &mtd, mtdfd, peb+i*(skip+1), 0,
+					old+i*mtd.eb_size, mtd.eb_size,
+					NULL, 0, 0);
+
+			if (err) {
+				perror("mtd_write");
+				status = EXIT_FAILURE;
+			}
+		}
+	}
+
+	/* cleanup */
+	close(mtdfd);
+	free(old);
+	return status;
+}
-- 
2.6.2
