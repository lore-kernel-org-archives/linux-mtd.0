Received: from smtp.gentoo.org ([140.211.166.183])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTR7s-0002yI-DC
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 04:09:18 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 065DF1B400B
	for <linux-mtd@lists.infradead.org>;
	Mon,  6 Jun 2011 04:09:13 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/5] flash_{lock,unlock}: merge into one util
Date: Mon,  6 Jun 2011 00:09:12 -0400
Message-Id: <1307333354-26583-3-git-send-email-vapier@gentoo.org>
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

Now that the utils have equivalent functionality, merge the two source
code bases so they can't diverge in the future.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 flash_lock.c   |   81 ++-----------------------------------------------------
 flash_unlock.c |   22 ++++++++++-----
 2 files changed, 18 insertions(+), 85 deletions(-)

diff --git a/flash_lock.c b/flash_lock.c
index 164eaa4..33f76c7 100644
--- a/flash_lock.c
+++ b/flash_lock.c
@@ -1,83 +1,8 @@
 /*
- * FILE flash_lock.c
- *
- * This utility locks one or more sectors of flash device.
+ * flash_{lock,unlock}
  *
+ * utilities for locking/unlocking sectors of flash devices
  */
 
 #define PROGRAM_NAME "flash_lock"
-
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <fcntl.h>
-#include <time.h>
-#include <sys/ioctl.h>
-#include <sys/mount.h>
-#include <string.h>
-
-#include <mtd/mtd-user.h>
-
-int main(int argc, char *argv[])
-{
-	int fd;
-	struct mtd_info_user mtdInfo;
-	struct erase_info_user mtdLockInfo;
-	int count;
-
-	/*
-	 * Parse command line options
-	 */
-	if (argc < 2) {
-		fprintf(stderr, "USAGE: %s <mtd device> <offset> <block count>\n", PROGRAM_NAME);
-		exit(1);
-	} else if (strncmp(argv[1], "/dev/mtd", 8) != 0) {
-		fprintf(stderr, "'%s' is not a MTD device.  Must specify mtd device: /dev/mtd?\n", argv[1]);
-		exit(1);
-	}
-
-	fd = open(argv[1], O_RDWR);
-	if (fd < 0) {
-		fprintf(stderr, "Could not open mtd device: %s\n", argv[1]);
-		exit(1);
-	}
-
-	if (ioctl(fd, MEMGETINFO, &mtdInfo)) {
-		fprintf(stderr, "Could not get MTD device info from %s\n", argv[1]);
-		close(fd);
-		exit(1);
-	}
-
-	if (argc > 2)
-		mtdLockInfo.start = strtol(argv[2], NULL, 0);
-	else
-		mtdLockInfo.start = 0;
-	if (mtdLockInfo.start > mtdInfo.size) {
-		fprintf(stderr, "%#x is beyond device size %#x\n",
-			mtdLockInfo.start, mtdInfo.size);
-		close(fd);
-		exit(1);
-	}
-
-	if (argc > 3) {
-		count = strtol(argv[3], NULL, 0);
-		if (count == -1)
-			mtdLockInfo.length = mtdInfo.size - mtdInfo.erasesize;
-		else
-			mtdLockInfo.length = mtdInfo.erasesize * count;
-	} else {
-		mtdLockInfo.length = mtdInfo.size - mtdInfo.erasesize;
-	}
-	if (mtdLockInfo.start + mtdLockInfo.length > mtdInfo.size) {
-		fprintf(stderr, "lock range is more than device supports\n");
-		exit(1);
-	}
-
-	if (ioctl(fd, MEMLOCK, &mtdLockInfo)) {
-		fprintf(stderr, "Could not lock MTD device: %s\n", argv[1]);
-		close(fd);
-		exit(1);
-	}
-
-	return 0;
-}
+#include "flash_unlock.c"
diff --git a/flash_unlock.c b/flash_unlock.c
index 690825d..759a5bc 100644
--- a/flash_unlock.c
+++ b/flash_unlock.c
@@ -1,11 +1,17 @@
 /*
- * FILE flash_unlock.c
- *
- * This utility unlock all sectors of flash device.
+ * flash_{lock,unlock}
  *
+ * utilities for locking/unlocking sectors of flash devices
  */
 
+#ifndef PROGRAM_NAME
 #define PROGRAM_NAME "flash_unlock"
+#define FLASH_MSG    "unlock"
+#define FLASH_UNLOCK 1
+#else
+#define FLASH_MSG    "lock"
+#define FLASH_UNLOCK 0
+#endif
 
 #include <unistd.h>
 #include <stdlib.h>
@@ -20,7 +26,7 @@
 
 int main(int argc, char *argv[])
 {
-	int fd;
+	int fd, request;
 	struct mtd_info_user mtdInfo;
 	struct erase_info_user mtdLockInfo;
 	int count;
@@ -69,12 +75,14 @@ int main(int argc, char *argv[])
 		mtdLockInfo.length = mtdInfo.size - mtdInfo.erasesize;
 	}
 	if (mtdLockInfo.start + mtdLockInfo.length > mtdInfo.size) {
-		fprintf(stderr, "unlock range is more than device supports\n");
+		fprintf(stderr, "%s range is more than device supports\n", FLASH_MSG);
 		exit(1);
 	}
 
-	if (ioctl(fd, MEMUNLOCK, &mtdLockInfo)) {
-		fprintf(stderr, "Could not unlock MTD device: %s\n", argv[1]);
+	request = FLASH_UNLOCK ? MEMUNLOCK : MEMLOCK;
+	if (ioctl(fd, request, &mtdLockInfo)) {
+		fprintf(stderr, "Could not %s MTD device: %s\n",
+			FLASH_MSG, argv[1]);
 		close(fd);
 		exit(1);
 	}
-- 
1.7.5.3
