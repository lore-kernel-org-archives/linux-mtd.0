Received: from smtp.gentoo.org ([140.211.166.183])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTR2O-0003eX-OG
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 04:03:38 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id D6F441B4002
	for <linux-mtd@lists.infradead.org>;
	Mon,  6 Jun 2011 04:09:12 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/5] flash_lock/flash_unlock/flash_info: clean up style
Date: Mon,  6 Jun 2011 00:09:10 -0400
Message-Id: <1307333354-26583-1-git-send-email-vapier@gentoo.org>
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
 flash_info.c   |   31 +++++++++++++------------------
 flash_lock.c   |   37 +++++++++++++++----------------------
 flash_unlock.c |   16 +++++-----------
 3 files changed, 33 insertions(+), 51 deletions(-)

diff --git a/flash_info.c b/flash_info.c
index ad7b30a..f8b7efa 100644
--- a/flash_info.c
+++ b/flash_info.c
@@ -14,44 +14,39 @@
 
 #include <mtd/mtd-user.h>
 
-int main(int argc,char *argv[])
+int main(int argc, char *argv[])
 {
 	int regcount;
-	int Fd;
+	int fd;
 
-	if (1 >= argc)
-	{
-		fprintf(stderr,"Usage: %s device\n", PROGRAM_NAME);
+	if (1 >= argc) {
+		fprintf(stderr, "Usage: %s device\n", PROGRAM_NAME);
 		return 16;
 	}
 
-	// Open and size the device
-	if ((Fd = open(argv[1],O_RDONLY)) < 0)
-	{
-		fprintf(stderr,"File open error\n");
+	/* Open and size the device */
+	fd = open(argv[1], O_RDONLY);
+	if (fd < 0) {
+		fprintf(stderr, "File open error\n");
 		return 8;
 	}
 
-	if (ioctl(Fd,MEMGETREGIONCOUNT,&regcount) == 0)
-	{
+	if (ioctl(fd, MEMGETREGIONCOUNT, &regcount) == 0) {
 		int i;
 		region_info_t reginfo;
 		printf("Device %s has %d erase regions\n", argv[1], regcount);
-		for (i = 0; i < regcount; i++)
-		{
+		for (i = 0; i < regcount; i++) {
 			reginfo.regionindex = i;
-			if(ioctl(Fd, MEMGETREGIONINFO, &reginfo) == 0)
-			{
+			if (ioctl(fd, MEMGETREGIONINFO, &reginfo) == 0) {
 				printf("Region %d is at 0x%x with size 0x%x and "
 						"has 0x%x blocks\n", i, reginfo.offset,
 						reginfo.erasesize, reginfo.numblocks);
-			}
-			else
-			{
+			} else {
 				printf("Strange can not read region %d from a %d region device\n",
 						i, regcount);
 			}
 		}
 	}
+
 	return 0;
 }
diff --git a/flash_lock.c b/flash_lock.c
index ef75234..8cd1b82 100644
--- a/flash_lock.c
+++ b/flash_lock.c
@@ -29,53 +29,46 @@ int main(int argc, char *argv[])
 	/*
 	 * Parse command line options
 	 */
-	if(argc != 4)
-	{
+	if (argc != 4) {
 		fprintf(stderr, "USAGE: %s <mtd device> <ofs in hex> <num of sectors in decimal or -1 for all sectors>\n", PROGRAM_NAME);
 		exit(1);
-	}
-	else if(strncmp(argv[1], "/dev/mtd", 8) != 0)
-	{
+	} else if (strncmp(argv[1], "/dev/mtd", 8) != 0) {
 		fprintf(stderr, "'%s' is not a MTD device.  Must specify mtd device: /dev/mtd?\n", argv[1]);
 		exit(1);
 	}
 
 	fd = open(argv[1], O_RDWR);
-	if(fd < 0)
-	{
+	if (fd < 0) {
 		fprintf(stderr, "Could not open mtd device: %s\n", argv[1]);
 		exit(1);
 	}
 
-	if(ioctl(fd, MEMGETINFO, &mtdInfo))
-	{
+	if (ioctl(fd, MEMGETINFO, &mtdInfo)) {
 		fprintf(stderr, "Could not get MTD device info from %s\n", argv[1]);
 		close(fd);
 		exit(1);
 	}
-	sscanf(argv[2], "%x",&ofs);
-	sscanf(argv[3], "%d",&num_sectors);
-	if(ofs > mtdInfo.size - mtdInfo.erasesize)
-	{
-		fprintf(stderr, "%x is beyond device size %x\n",ofs,(unsigned int)(mtdInfo.size - mtdInfo.erasesize));
+	sscanf(argv[2], "%x", &ofs);
+	sscanf(argv[3], "%d", &num_sectors);
+	if (ofs > mtdInfo.size - mtdInfo.erasesize) {
+		fprintf(stderr, "%x is beyond device size %x\n", ofs,
+			(unsigned int)(mtdInfo.size - mtdInfo.erasesize));
 		exit(1);
 	}
 
 	if (num_sectors == -1) {
-		num_sectors = mtdInfo.size/mtdInfo.erasesize;
-	}
-	else {
-		if(num_sectors > mtdInfo.size/mtdInfo.erasesize)
-		{
-			fprintf(stderr, "%d are too many sectors, device only has %d\n",num_sectors,(int)(mtdInfo.size/mtdInfo.erasesize));
+		num_sectors = mtdInfo.size / mtdInfo.erasesize;
+	} else {
+		if (num_sectors > mtdInfo.size / mtdInfo.erasesize) {
+			fprintf(stderr, "%d are too many sectors, device only has %d\n",
+				num_sectors, (int)(mtdInfo.size / mtdInfo.erasesize));
 			exit(1);
 		}
 	}
 
 	mtdLockInfo.start = ofs;
 	mtdLockInfo.length = (num_sectors - 1) * mtdInfo.erasesize;
-	if(ioctl(fd, MEMLOCK, &mtdLockInfo))
-	{
+	if (ioctl(fd, MEMLOCK, &mtdLockInfo)) {
 		fprintf(stderr, "Could not lock MTD device: %s\n", argv[1]);
 		close(fd);
 		exit(1);
diff --git a/flash_unlock.c b/flash_unlock.c
index 3d29a92..26721a5 100644
--- a/flash_unlock.c
+++ b/flash_unlock.c
@@ -28,26 +28,21 @@ int main(int argc, char *argv[])
 	/*
 	 * Parse command line options
 	 */
-	if(argc < 2)
-	{
+	if (argc < 2) {
 		fprintf(stderr, "USAGE: %s <mtd device> <offset in hex> <block count in decimal number>\n", PROGRAM_NAME);
 		exit(1);
-	}
-	else if(strncmp(argv[1], "/dev/mtd", 8) != 0)
-	{
+	} else if (strncmp(argv[1], "/dev/mtd", 8) != 0) {
 		fprintf(stderr, "'%s' is not a MTD device.  Must specify mtd device: /dev/mtd?\n", argv[1]);
 		exit(1);
 	}
 
 	fd = open(argv[1], O_RDWR);
-	if(fd < 0)
-	{
+	if (fd < 0) {
 		fprintf(stderr, "Could not open mtd device: %s\n", argv[1]);
 		exit(1);
 	}
 
-	if(ioctl(fd, MEMGETINFO, &mtdInfo))
-	{
+	if (ioctl(fd, MEMGETINFO, &mtdInfo)) {
 		fprintf(stderr, "Could not get MTD device info from %s\n", argv[1]);
 		close(fd);
 		exit(1);
@@ -65,8 +60,7 @@ int main(int argc, char *argv[])
 		mtdLockInfo.length = mtdInfo.size - mtdInfo.erasesize;
 	}
 
-	if(ioctl(fd, MEMUNLOCK, &mtdLockInfo))
-	{
+	if (ioctl(fd, MEMUNLOCK, &mtdLockInfo)) {
 		fprintf(stderr, "Could not unlock MTD device: %s\n", argv[1]);
 		close(fd);
 		exit(1);
-- 
1.7.5.3
