Received: from smtp.gentoo.org ([140.211.166.183])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTeRW-0003zi-Ih
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 18:22:27 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id A71FA1B4013
	for <linux-mtd@lists.infradead.org>;
	Mon,  6 Jun 2011 18:22:15 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/4] flash_info: allow people to get info on multiple devices
Date: Mon,  6 Jun 2011 14:22:15 -0400
Message-Id: <1307384537-9607-2-git-send-email-vapier@gentoo.org>
In-Reply-To: <1307384537-9607-1-git-send-email-vapier@gentoo.org>
References: <1307384537-9607-1-git-send-email-vapier@gentoo.org>
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
 flash_info.c |   36 +++++++++++++++++++++---------------
 1 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/flash_info.c b/flash_info.c
index d4887da..6c518b2 100644
--- a/flash_info.c
+++ b/flash_info.c
@@ -18,39 +18,45 @@
 static void usage(int status)
 {
 	fprintf(status ? stderr : stdout,
-		"Usage: %s <device>\n",
+		"Usage: %s <device> [devices]\n",
 		PROGRAM_NAME);
 	exit(status);
 }
 
 int main(int argc, char *argv[])
 {
-	int regcount;
-	int fd;
+	int fd, i, regcount;
 
 	if (argc < 2)
 		usage(1);
 	if (!strcmp(argv[1], "-h") || !strcmp(argv[1], "--help"))
 		usage(0);
 
-	/* Open and size the device */
-	fd = open(argv[1], O_RDONLY);
-	if (fd < 0)
-		sys_errmsg_die("could not open: %s", argv[1]);
-
-	if (ioctl(fd, MEMGETREGIONCOUNT, &regcount) == 0) {
-		int i;
+	for (i = 1; i < argc; ++i) {
+		const char *dev = argv[i];
+		int r;
 		region_info_t reginfo;
-		printf("Device %s has %d erase regions\n", argv[1], regcount);
-		for (i = 0; i < regcount; i++) {
-			reginfo.regionindex = i;
+
+		/* Open and size the device */
+		fd = open(dev, O_RDONLY);
+		if (fd < 0) {
+			sys_errmsg("could not open: %s", dev);
+			continue;
+		}
+
+		if (ioctl(fd, MEMGETREGIONCOUNT, &regcount))
+			continue;
+
+		printf("%s: %d erase regions\n", dev, regcount);
+		for (r = 0; r < regcount; ++r) {
+			reginfo.regionindex = r;
 			if (ioctl(fd, MEMGETREGIONINFO, &reginfo) == 0) {
 				printf("Region %d is at 0x%x with size 0x%x and "
-						"has 0x%x blocks\n", i, reginfo.offset,
+						"has 0x%x blocks\n", r, reginfo.offset,
 						reginfo.erasesize, reginfo.numblocks);
 			} else {
 				warnmsg("can not read region %d from a %d region device",
-					i, regcount);
+					r, regcount);
 			}
 		}
 	}
-- 
1.7.5.3
