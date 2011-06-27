Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QbGYJ-0003IJ-Sp
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2011 18:28:57 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 08/10] mtd-utils: kill flash_info
Date: Mon, 27 Jun 2011 11:27:25 -0700
Message-ID: <1309199247-19248-9-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1309199247-19248-1-git-send-email-computersforpeace@gmail.com>
References: <1309199247-19248-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

According to "feature-removal-schedule," we kill flash_info in favor of
mtdinfo.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 Makefile                     |    2 +-
 feature-removal-schedule.txt |    6 ----
 flash_info.c                 |   67 ------------------------------------------
 3 files changed, 1 insertions(+), 74 deletions(-)
 delete mode 100644 flash_info.c

diff --git a/Makefile b/Makefile
index 8f871c6..afbe201 100644
--- a/Makefile
+++ b/Makefile
@@ -18,7 +18,7 @@ TESTS = tests
 
 MTD_BINS = \
 	ftl_format flash_erase nanddump doc_loadbios \
-	ftl_check mkfs.jffs2 flash_lock flash_unlock flash_info \
+	ftl_check mkfs.jffs2 flash_lock flash_unlock \
 	flash_otp_info flash_otp_dump mtd_debug flashcp nandwrite nandtest \
 	jffs2dump \
 	nftldump nftl_format docfdisk \
diff --git a/feature-removal-schedule.txt b/feature-removal-schedule.txt
index a5980f7..0920203 100644
--- a/feature-removal-schedule.txt
+++ b/feature-removal-schedule.txt
@@ -34,9 +34,3 @@ the -m option. For now, we just have a warning, but the option will be
 removed in release 1.4.6.
 
 ---------------------------
-3. flash_info utility
-
-This is duplicating behavior with the mtdinfo utility.  Now the util
-warns when people use it, but it'll be removed in release 1.4.6.
-
----------------------------
diff --git a/flash_info.c b/flash_info.c
deleted file mode 100644
index d9a4492..0000000
--- a/flash_info.c
+++ /dev/null
@@ -1,67 +0,0 @@
-/*
- * flash_info.c -- print info about a MTD device
- */
-
-#define PROGRAM_NAME "flash_info"
-
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <fcntl.h>
-#include <time.h>
-#include <sys/ioctl.h>
-#include <sys/mount.h>
-
-#include "common.h"
-#include <mtd/mtd-user.h>
-
-static void usage(int status)
-{
-	fprintf(status ? stderr : stdout,
-		"Usage: %s <device> [devices]\n",
-		PROGRAM_NAME);
-	exit(status);
-}
-
-int main(int argc, char *argv[])
-{
-	int fd, i, regcount;
-
-	warnmsg("this utility is deprecated in favor of `mtdinfo` and will be removed in mtd-utils-1.4.6");
-
-	if (argc < 2)
-		usage(1);
-	if (!strcmp(argv[1], "-h") || !strcmp(argv[1], "--help"))
-		usage(0);
-
-	for (i = 1; i < argc; ++i) {
-		const char *dev = argv[i];
-		int r;
-		region_info_t reginfo;
-
-		/* Open and size the device */
-		fd = open(dev, O_RDONLY);
-		if (fd < 0) {
-			sys_errmsg("could not open: %s", dev);
-			continue;
-		}
-
-		if (ioctl(fd, MEMGETREGIONCOUNT, &regcount))
-			continue;
-
-		printf("%s: %d erase regions\n", dev, regcount);
-		for (r = 0; r < regcount; ++r) {
-			reginfo.regionindex = r;
-			if (ioctl(fd, MEMGETREGIONINFO, &reginfo) == 0) {
-				printf("Region %d is at 0x%x with size 0x%x and "
-						"has 0x%x blocks\n", r, reginfo.offset,
-						reginfo.erasesize, reginfo.numblocks);
-			} else {
-				warnmsg("can not read region %d from a %d region device",
-					r, regcount);
-			}
-		}
-	}
-
-	return 0;
-}
-- 
1.7.0.4
