Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dn14x-0003PL-K1
 for linux-mtd@lists.infradead.org; Wed, 30 Aug 2017 11:22:43 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: Richard Weinberger <richard@nod.at>, kernel@pengutronix.de,
 linux-mtd@lists.infradead.org
Subject: [PATCH mtd-utils v2] nandmarkbad: new util to mark blocks as bad
Date: Wed, 30 Aug 2017 13:21:45 +0200
Message-Id: <20170830112145.26586-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20170824152227.30394-1-ukleinek@debian.org>
References: <20170824152227.30394-1-ukleinek@debian.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

---
changes since (implicit) v1 sent with Message-Id: 20170824152227.30394-1-ukleinek@debian.org:

 - fix printf format resulting in crash
   (suggested by gcc and David Oberhollenzer)
 - add options --help, --version, -V (suggested by David Oberhollenzer)
 - add options --i-know-what-i-do, -y (suggested by Richard Weinberger)
 - add an error message if no device was given
 - make usage static
 - use right author email address

 .gitignore               |  1 +
 nand-utils/Makemodule.am |  5 ++-
 nand-utils/nandmarkbad.c | 95 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 100 insertions(+), 1 deletion(-)
 create mode 100644 nand-utils/nandmarkbad.c

diff --git a/.gitignore b/.gitignore
index 38bd04deb34e..754da97b43bf 100644
--- a/.gitignore
+++ b/.gitignore
@@ -36,6 +36,7 @@ mkfs.jffs2
 mtd_debug
 mtdpart
 nanddump
+nandmarkbad
 nandtest
 nandwrite
 nftl_format
diff --git a/nand-utils/Makemodule.am b/nand-utils/Makemodule.am
index d75b0cb3e36c..c31dcb01f06e 100644
--- a/nand-utils/Makemodule.am
+++ b/nand-utils/Makemodule.am
@@ -7,6 +7,9 @@ nandwrite_LDADD = libmtd.a
 nandtest_SOURCES = nand-utils/nandtest.c
 nandtest_LDADD = libmtd.a
 
+nandmarkbad_SOURCES = nand-utils/nandmarkbad.c
+nandmarkbad_LDADD = libmtd.a
+
 nftldump_SOURCES = nand-utils/nftldump.c
 nftldump_LDADD = libmtd.a
 
@@ -14,7 +17,7 @@ nftl_format_SOURCES = nand-utils/nftl_format.c
 nftl_format_LDADD = libmtd.a
 
 NAND_BINS = \
-	nanddump nandwrite nandtest nftldump nftl_format
+	nanddump nandwrite nandtest nandmarkbad nftldump nftl_format
 
 NAND_SH = \
 	nand-utils/load_nandsim.sh
diff --git a/nand-utils/nandmarkbad.c b/nand-utils/nandmarkbad.c
new file mode 100644
index 000000000000..023bdbe50c4d
--- /dev/null
+++ b/nand-utils/nandmarkbad.c
@@ -0,0 +1,95 @@
+#define PROGRAM_NAME "nandmarkbad"
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <getopt.h>
+
+#include "common.h"
+#include <libmtd.h>
+
+void usage(int status)
+{
+	fprintf(status ? stderr : stdout,
+		"usage: %s [OPTIONS] <device>\n\n"
+		"  -b, --markbad=blockno        Mark block bad\n"
+		PROGRAM_NAME);
+	exit(status);
+}
+
+/*
+ * Main program
+ */
+int main(int argc, char **argv)
+{
+	loff_t mark_bad[32];
+	unsigned cnt_bad = 0;
+	struct mtd_dev_info mtd;
+	libmtd_t mtd_desc;
+	int fd;
+	int error = 0;
+	int ret;
+	unsigned int i;
+
+	for (;;) {
+		static const char short_options[] = "b:h";
+		static const struct option long_options[] = {
+			{ "markbad", required_argument, 0, 'b' },
+			{0, 0, 0, 0},
+		};
+		int option_index = 0;
+		int c = getopt_long(argc, argv, short_options, long_options,
+				    &option_index);
+		if (c == EOF)
+			break;
+
+		switch (c) {
+		case 'h':
+			usage(EXIT_SUCCESS);
+			break;
+		case '?':
+			usage(EXIT_FAILURE);
+			break;
+
+		case 'b':
+			if (cnt_bad < ARRAY_SIZE(mark_bad)) {
+				mark_bad[cnt_bad] =
+					simple_strtoll(optarg, &error);
+				++cnt_bad;
+			} else {
+				errmsg_die("Can't handle so many bad blocks\n");
+			}
+
+			break;
+		}
+	}
+
+	argc -= optind;
+	argv += optind;
+
+	if (argc != 1 || error)
+		usage(EXIT_FAILURE);
+
+	if (!cnt_bad)
+		errmsg_die("You must specify at least one block to mark bad\n");
+
+	fd = open(argv[0], O_RDWR);
+	if (fd < 0)
+		sys_errmsg_die("Failed to open mtd device\n");
+
+	mtd_desc = libmtd_open();
+	if (!mtd_desc)
+		errmsg_die("Can't initialize libmtd");
+
+	if (mtd_get_dev_info(mtd_desc, argv[0], &mtd) < 0)
+		errmsg_die("mtd_get_dev_info failed");
+
+	for (i = 0; i < cnt_bad; ++i) {
+		ret = mtd_mark_bad(&mtd, fd, mark_bad[i]);
+		if (ret)
+			sys_errmsg_die("%s: MTD Mark bad block failure",
+				       argv[0]);
+	}
+
+	return EXIT_SUCCESS;
+}
-- 
2.14.1
