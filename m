Received: from smtp.gentoo.org ([140.211.166.183])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTR7s-0002yH-GE
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 04:09:18 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 722BD1B4008
	for <linux-mtd@lists.infradead.org>;
	Mon,  6 Jun 2011 04:09:13 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/5] flash_{lock,unlock}: merge functionality
Date: Mon,  6 Jun 2011 00:09:11 -0400
Message-Id: <1307333354-26583-2-git-send-email-vapier@gentoo.org>
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

The flash_lock util has a bit of extra argument checking, and it supports
a magic value of "-1" to mean "all blocks".

The flash_unlock util supports automatic 2nd/3rd arguments to unlock the
whole flash.  It also supports multiple bases (not just hex) for selecting
the range of the device to unlock.

So tweak both utilities so that they have equivalent functionality again
by adding the missing features to each.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 flash_lock.c   |   41 +++++++++++++++++++++++------------------
 flash_unlock.c |   17 +++++++++++++++--
 2 files changed, 38 insertions(+), 20 deletions(-)

diff --git a/flash_lock.c b/flash_lock.c
index 8cd1b82..164eaa4 100644
--- a/flash_lock.c
+++ b/flash_lock.c
@@ -23,14 +23,13 @@ int main(int argc, char *argv[])
 	int fd;
 	struct mtd_info_user mtdInfo;
 	struct erase_info_user mtdLockInfo;
-	int num_sectors;
-	int ofs;
+	int count;
 
 	/*
 	 * Parse command line options
 	 */
-	if (argc != 4) {
-		fprintf(stderr, "USAGE: %s <mtd device> <ofs in hex> <num of sectors in decimal or -1 for all sectors>\n", PROGRAM_NAME);
+	if (argc < 2) {
+		fprintf(stderr, "USAGE: %s <mtd device> <offset> <block count>\n", PROGRAM_NAME);
 		exit(1);
 	} else if (strncmp(argv[1], "/dev/mtd", 8) != 0) {
 		fprintf(stderr, "'%s' is not a MTD device.  Must specify mtd device: /dev/mtd?\n", argv[1]);
@@ -48,26 +47,32 @@ int main(int argc, char *argv[])
 		close(fd);
 		exit(1);
 	}
-	sscanf(argv[2], "%x", &ofs);
-	sscanf(argv[3], "%d", &num_sectors);
-	if (ofs > mtdInfo.size - mtdInfo.erasesize) {
-		fprintf(stderr, "%x is beyond device size %x\n", ofs,
-			(unsigned int)(mtdInfo.size - mtdInfo.erasesize));
+
+	if (argc > 2)
+		mtdLockInfo.start = strtol(argv[2], NULL, 0);
+	else
+		mtdLockInfo.start = 0;
+	if (mtdLockInfo.start > mtdInfo.size) {
+		fprintf(stderr, "%#x is beyond device size %#x\n",
+			mtdLockInfo.start, mtdInfo.size);
+		close(fd);
 		exit(1);
 	}
 
-	if (num_sectors == -1) {
-		num_sectors = mtdInfo.size / mtdInfo.erasesize;
+	if (argc > 3) {
+		count = strtol(argv[3], NULL, 0);
+		if (count == -1)
+			mtdLockInfo.length = mtdInfo.size - mtdInfo.erasesize;
+		else
+			mtdLockInfo.length = mtdInfo.erasesize * count;
 	} else {
-		if (num_sectors > mtdInfo.size / mtdInfo.erasesize) {
-			fprintf(stderr, "%d are too many sectors, device only has %d\n",
-				num_sectors, (int)(mtdInfo.size / mtdInfo.erasesize));
-			exit(1);
-		}
+		mtdLockInfo.length = mtdInfo.size - mtdInfo.erasesize;
+	}
+	if (mtdLockInfo.start + mtdLockInfo.length > mtdInfo.size) {
+		fprintf(stderr, "lock range is more than device supports\n");
+		exit(1);
 	}
 
-	mtdLockInfo.start = ofs;
-	mtdLockInfo.length = (num_sectors - 1) * mtdInfo.erasesize;
 	if (ioctl(fd, MEMLOCK, &mtdLockInfo)) {
 		fprintf(stderr, "Could not lock MTD device: %s\n", argv[1]);
 		close(fd);
diff --git a/flash_unlock.c b/flash_unlock.c
index 26721a5..690825d 100644
--- a/flash_unlock.c
+++ b/flash_unlock.c
@@ -29,7 +29,7 @@ int main(int argc, char *argv[])
 	 * Parse command line options
 	 */
 	if (argc < 2) {
-		fprintf(stderr, "USAGE: %s <mtd device> <offset in hex> <block count in decimal number>\n", PROGRAM_NAME);
+		fprintf(stderr, "USAGE: %s <mtd device> <offset> <block count>\n", PROGRAM_NAME);
 		exit(1);
 	} else if (strncmp(argv[1], "/dev/mtd", 8) != 0) {
 		fprintf(stderr, "'%s' is not a MTD device.  Must specify mtd device: /dev/mtd?\n", argv[1]);
@@ -52,13 +52,26 @@ int main(int argc, char *argv[])
 		mtdLockInfo.start = strtol(argv[2], NULL, 0);
 	else
 		mtdLockInfo.start = 0;
+	if (mtdLockInfo.start > mtdInfo.size) {
+		fprintf(stderr, "%#x is beyond device size %#x\n",
+			mtdLockInfo.start, mtdInfo.size);
+		close(fd);
+		exit(1);
+	}
 
 	if (argc > 3) {
 		count = strtol(argv[3], NULL, 0);
-		mtdLockInfo.length = mtdInfo.erasesize * count;
+		if (count == -1)
+			mtdLockInfo.length = mtdInfo.size - mtdInfo.erasesize;
+		else
+			mtdLockInfo.length = mtdInfo.erasesize * count;
 	} else {
 		mtdLockInfo.length = mtdInfo.size - mtdInfo.erasesize;
 	}
+	if (mtdLockInfo.start + mtdLockInfo.length > mtdInfo.size) {
+		fprintf(stderr, "unlock range is more than device supports\n");
+		exit(1);
+	}
 
 	if (ioctl(fd, MEMUNLOCK, &mtdLockInfo)) {
 		fprintf(stderr, "Could not unlock MTD device: %s\n", argv[1]);
-- 
1.7.5.3
