Received: from smtp.gentoo.org ([140.211.166.183])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTR7s-0002yJ-AH
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 04:09:17 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 91E781B400F
	for <linux-mtd@lists.infradead.org>;
	Mon,  6 Jun 2011 04:09:14 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/5] flash_{lock,unlock}: convert to common code
Date: Mon,  6 Jun 2011 00:09:13 -0400
Message-Id: <1307333354-26583-4-git-send-email-vapier@gentoo.org>
In-Reply-To: <1307333354-26583-1-git-send-email-vapier@gentoo.org>
References: <1307333354-26583-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 flash_unlock.c |   75 ++++++++++++++++++++++++++++++-------------------------
 1 files changed, 41 insertions(+), 34 deletions(-)

diff --git a/flash_unlock.c b/flash_unlock.c
index 759a5bc..3d7dd53 100644
--- a/flash_unlock.c
+++ b/flash_unlock.c
@@ -22,48 +22,57 @@
 #include <sys/mount.h>
 #include <string.h>
 
+#include "common.h"
 #include <mtd/mtd-user.h>
 
+static void usage(int status)
+{
+	fprintf(status ? stderr : stdout,
+		"Usage: %s <mtd device> [offset] [block count]\n\n"
+		"If offset is not specified, it defaults to 0.\n"
+		"If block count is not specified, it defaults to all blocks.\n",
+		PROGRAM_NAME);
+	exit(status);
+}
+
 int main(int argc, char *argv[])
 {
 	int fd, request;
 	struct mtd_info_user mtdInfo;
 	struct erase_info_user mtdLockInfo;
 	int count;
+	const char *dev;
 
 	/*
 	 * Parse command line options
 	 */
-	if (argc < 2) {
-		fprintf(stderr, "USAGE: %s <mtd device> <offset> <block count>\n", PROGRAM_NAME);
-		exit(1);
-	} else if (strncmp(argv[1], "/dev/mtd", 8) != 0) {
-		fprintf(stderr, "'%s' is not a MTD device.  Must specify mtd device: /dev/mtd?\n", argv[1]);
-		exit(1);
-	}
+	if (argc < 2 || argc > 4)
+		usage(1);
+	if (!strcmp(argv[1], "-h") || !strcmp(argv[1], "--help"))
+		usage(0);
 
-	fd = open(argv[1], O_RDWR);
-	if (fd < 0) {
-		fprintf(stderr, "Could not open mtd device: %s\n", argv[1]);
-		exit(1);
-	}
+	dev = argv[1];
+
+	/*
+	 * Get the device info to compare to command line sizes
+	 */
+	fd = open(dev, O_RDWR);
+	if (fd < 0)
+		sys_errmsg_die("could not open: %s", dev);
 
-	if (ioctl(fd, MEMGETINFO, &mtdInfo)) {
-		fprintf(stderr, "Could not get MTD device info from %s\n", argv[1]);
-		close(fd);
-		exit(1);
-	}
+	if (ioctl(fd, MEMGETINFO, &mtdInfo))
+		sys_errmsg_die("could not get mtd info: %s", dev);
 
+	/*
+	 * Make sure user options are valid
+	 */
 	if (argc > 2)
 		mtdLockInfo.start = strtol(argv[2], NULL, 0);
 	else
 		mtdLockInfo.start = 0;
-	if (mtdLockInfo.start > mtdInfo.size) {
-		fprintf(stderr, "%#x is beyond device size %#x\n",
+	if (mtdLockInfo.start > mtdInfo.size)
+		errmsg_die("%#x is beyond device size %#x",
 			mtdLockInfo.start, mtdInfo.size);
-		close(fd);
-		exit(1);
-	}
 
 	if (argc > 3) {
 		count = strtol(argv[3], NULL, 0);
@@ -71,21 +80,19 @@ int main(int argc, char *argv[])
 			mtdLockInfo.length = mtdInfo.size - mtdInfo.erasesize;
 		else
 			mtdLockInfo.length = mtdInfo.erasesize * count;
-	} else {
+	} else
 		mtdLockInfo.length = mtdInfo.size - mtdInfo.erasesize;
-	}
-	if (mtdLockInfo.start + mtdLockInfo.length > mtdInfo.size) {
-		fprintf(stderr, "%s range is more than device supports\n", FLASH_MSG);
-		exit(1);
-	}
+	if (mtdLockInfo.start + mtdLockInfo.length > mtdInfo.size)
+		errmsg_die("range is more than device supports: %#x + %#x > %#x",
+			mtdLockInfo.start, mtdLockInfo.length, mtdInfo.size);
 
+	/*
+	 * Finally do the operation
+	 */
 	request = FLASH_UNLOCK ? MEMUNLOCK : MEMLOCK;
-	if (ioctl(fd, request, &mtdLockInfo)) {
-		fprintf(stderr, "Could not %s MTD device: %s\n",
-			FLASH_MSG, argv[1]);
-		close(fd);
-		exit(1);
-	}
+	if (ioctl(fd, request, &mtdLockInfo))
+		sys_errmsg_die("could not %s device: %s\n",
+			FLASH_MSG, dev);
 
 	return 0;
 }
-- 
1.7.5.3
