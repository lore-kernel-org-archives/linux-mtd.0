Received: from smtp.gentoo.org ([140.211.166.183])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTeRP-0003yf-49
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 18:22:20 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 0A7DE1B400C
	for <linux-mtd@lists.infradead.org>;
	Mon,  6 Jun 2011 18:22:14 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/4] flash_info: convert to common.h
Date: Mon,  6 Jun 2011 14:22:14 -0400
Message-Id: <1307384537-9607-1-git-send-email-vapier@gentoo.org>
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
 flash_info.c |   27 +++++++++++++++++----------
 1 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/flash_info.c b/flash_info.c
index f8b7efa..d4887da 100644
--- a/flash_info.c
+++ b/flash_info.c
@@ -12,24 +12,31 @@
 #include <sys/ioctl.h>
 #include <sys/mount.h>
 
+#include "common.h"
 #include <mtd/mtd-user.h>
 
+static void usage(int status)
+{
+	fprintf(status ? stderr : stdout,
+		"Usage: %s <device>\n",
+		PROGRAM_NAME);
+	exit(status);
+}
+
 int main(int argc, char *argv[])
 {
 	int regcount;
 	int fd;
 
-	if (1 >= argc) {
-		fprintf(stderr, "Usage: %s device\n", PROGRAM_NAME);
-		return 16;
-	}
+	if (argc < 2)
+		usage(1);
+	if (!strcmp(argv[1], "-h") || !strcmp(argv[1], "--help"))
+		usage(0);
 
 	/* Open and size the device */
 	fd = open(argv[1], O_RDONLY);
-	if (fd < 0) {
-		fprintf(stderr, "File open error\n");
-		return 8;
-	}
+	if (fd < 0)
+		sys_errmsg_die("could not open: %s", argv[1]);
 
 	if (ioctl(fd, MEMGETREGIONCOUNT, &regcount) == 0) {
 		int i;
@@ -42,8 +49,8 @@ int main(int argc, char *argv[])
 						"has 0x%x blocks\n", i, reginfo.offset,
 						reginfo.erasesize, reginfo.numblocks);
 			} else {
-				printf("Strange can not read region %d from a %d region device\n",
-						i, regcount);
+				warnmsg("can not read region %d from a %d region device",
+					i, regcount);
 			}
 		}
 	}
-- 
1.7.5.3
