Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auolT-0004ng-0I
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2016 22:14:00 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 3/8] mtd-utils: Add flash torture test utility
Date: Tue, 26 Apr 2016 00:13:24 +0200
Message-Id: <1461622409-14970-4-git-send-email-richard@nod.at>
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

Basically a user space port of the mtd torture test kernel module. In
addition to the block offset and count module parameters, the utility
supports a block stride and can restore the block contents after test.

In contrast to the kernel module, the torture test is implemented by
the libmtd mtd_toruture function and thus doesn't allow for similarly
fine grained options on diagnostics.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 .gitignore                 |   1 +
 Makefile                   |   2 +-
 misc-utils/flash_torture.c | 240 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 242 insertions(+), 1 deletion(-)
 create mode 100644 misc-utils/flash_torture.c

diff --git a/.gitignore b/.gitignore
index 2aac52c..5b529d1 100644
--- a/.gitignore
+++ b/.gitignore
@@ -35,6 +35,7 @@
 /jffsX-utils/mkfs.jffs2
 /misc-utils/mtd_debug
 /misc-utils/mtdpart
+/misc-utils/flash_torture
 /nand-utils/nanddump
 /nand-utils/nandtest
 /nand-utils/nandwrite
diff --git a/Makefile b/Makefile
index 977c9c5..af3d1fd 100644
--- a/Makefile
+++ b/Makefile
@@ -20,7 +20,7 @@ MISC_BINS = \
 	ftl_format doc_loadbios ftl_check mtd_debug docfdisk \
 	serve_image recv_image mtdpart flash_erase flash_lock \
 	flash_unlock flash_otp_info flash_otp_dump flash_otp_lock \
-	flash_otp_write flashcp
+	flash_otp_write flashcp flash_torture
 UBI_BINS = \
 	ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
 	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol ubiblock
diff --git a/misc-utils/flash_torture.c b/misc-utils/flash_torture.c
new file mode 100644
index 0000000..b5625c8
--- /dev/null
+++ b/misc-utils/flash_torture.c
@@ -0,0 +1,240 @@
+/*
+ * Copyright (C) 2006-2008 Artem Bityutskiy
+ * Copyright (C) 2006-2008 Jarkko Lavinen
+ * Copyright (C) 2006-2008 Adrian Hunter
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
+ *
+ * WARNING: this test program may kill your flash and your device. Do not
+ * use it unless you know what you do. Authors are not responsible for any
+ * damage caused by this program.
+ *
+ * Author: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
+ *
+ * Based on linux torturetest.c
+ * Authors: Artem Bityutskiy, Jarkko Lavinen, Adria Hunter
+ */
+
+#define PROGRAM_NAME "flash_torture"
+
+#define KEEP_CONTENTS 0x01
+#define RUN_FOREVER 0x02
+
+#include <mtd/mtd-user.h>
+#include <unistd.h>
+#include <stdlib.h>
+#include <libmtd.h>
+#include <signal.h>
+#include <stdio.h>
+#include <fcntl.h>
+
+#include "common.h"
+
+static int peb=-1, blocks=-1, skip=-1;
+static struct mtd_dev_info mtd;
+static sig_atomic_t flags=0;
+static const char *mtddev;
+static libmtd_t mtd_desc;
+static int mtdfd;
+
+static void sighandler(int sig)
+{
+	if (sig == SIGINT || sig == SIGTERM || sig == SIGHUP)
+		flags &= ~RUN_FOREVER;
+}
+
+static void usage(int status)
+{
+	fputs(
+	"Usage: "PROGRAM_NAME" [OPTIONS] <device>\n\n"
+	"Options:\n"
+	"  -h, --help         Display this help output\n"
+	"  -b, --peb <num>    Start from this physical erase block\n"
+	"  -c, --blocks <num> Number of erase blocks to torture\n"
+	"  -s, --skip <num>   Number of erase blocks to skip\n"
+	"  -k, --keep         Try to restore existing contents after test\n"
+	"  -r, --repeate      Repeate the torture test indefinitely\n",
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
+		} else if (!strcmp(argv[i], "--blocks") || !strcmp(argv[i], "-c")) {
+			if (blocks > 0)
+				goto failmulti;
+			blocks = read_num(i, i+1, argc, argv);
+			if (blocks <= 0)
+				goto failarg;
+			++i;
+		} else if (!strcmp(argv[i], "--skip") || !strcmp(argv[i], "-s")) {
+			if (skip >= 0)
+				goto failmulti;
+			skip = read_num(i, i+1, argc, argv);
+			if (skip < 0)
+				goto failarg;
+			++i;
+		} else if (!strcmp(argv[i], "--keep") || !strcmp(argv[i], "-k")) {
+			if (flags & KEEP_CONTENTS)
+				goto failmulti;
+			flags |= KEEP_CONTENTS;
+		} else if (!strcmp(argv[i], "--repeate") || !strcmp(argv[i], "-r")) {
+			if (flags & RUN_FOREVER)
+				goto failmulti;
+			flags |= RUN_FOREVER;
+		} else {
+			if (mtddev)
+				usage(EXIT_FAILURE);
+			mtddev = argv[i];
+		}
+	}
+
+	if (!mtddev)
+		errmsg_die("No device specified!\n");
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
+int main(int argc, char **argv)
+{
+	int i, eb, err, count = 0;
+	char* is_bad = NULL;
+	void *old=NULL;
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
+	if (peb >= mtd.eb_cnt)
+		return errmsg("Physical erase block %d is out of range!\n", peb);
+
+	if ((peb + (blocks - 1)*(skip + 1)) >= mtd.eb_cnt) {
+		return errmsg("Given block range exceeds block count of %d!\n",
+				mtd.eb_cnt);
+	}
+
+	signal(SIGINT, sighandler);
+	signal(SIGTERM, sighandler);
+	signal(SIGHUP, sighandler);
+
+	if (flags & KEEP_CONTENTS) {
+		old = xmalloc(mtd.eb_size);
+	}
+
+	is_bad = xmalloc(blocks);
+
+	if ((mtdfd = open(mtddev, O_RDWR)) == -1) {
+		perror(mtddev);
+		free(is_bad);
+		free(old);
+		return EXIT_FAILURE;
+	}
+
+	for (i = 0; i < blocks; ++i) {
+		eb = peb + i * (skip + 1);
+		is_bad[i] = mtd_is_bad(&mtd, mtdfd, eb);
+		if (is_bad[i]) {
+			fprintf(stderr, "PEB %d marked bad, will be skipped\n", eb);
+		}
+	}
+
+	do {
+		for (i = 0; i < blocks; ++i) {
+			if (is_bad[i])
+				continue;
+
+			eb = peb + i * (skip + 1);
+
+			if (flags & KEEP_CONTENTS) {
+				err = mtd_read(&mtd, mtdfd, eb, 0, old, mtd.eb_size);
+				if (err) {
+					fprintf(stderr, "Failed to create backup copy "
+							"of PEB %d, skipping!\n", eb);
+					continue;
+				}
+			}
+
+			if (mtd_torture(mtd_desc, &mtd, mtdfd, eb))
+				fprintf(stderr, "Block %d failed torture test!\n", eb);
+
+			if (flags & KEEP_CONTENTS) {
+				err = mtd_erase(mtd_desc, &mtd, mtdfd, eb);
+				if (err) {
+					fprintf(stderr, "mtd_erase failed for block %d!\n", eb);
+					continue;
+				}
+				err = mtd_write(mtd_desc, &mtd, mtdfd, eb, 0,
+						old, mtd.eb_size, NULL, 0, 0);
+				if (err)
+					fprintf(stderr, "Failed to restore block %d!\n", eb);
+			}
+		}
+
+		printf("Torture test iterations done: %d\n", ++count);
+	} while (flags & RUN_FOREVER);
+
+	free(old);
+	free(is_bad);
+	close(mtdfd);
+	return EXIT_SUCCESS;
+}
-- 
2.7.3
