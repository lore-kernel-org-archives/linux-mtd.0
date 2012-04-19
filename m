Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SKpLZ-0005FZ-NA
 for linux-mtd@lists.infradead.org; Thu, 19 Apr 2012 11:16:25 +0000
Received: by bkcjk13 with SMTP id jk13so8517009bkc.36
 for <linux-mtd@lists.infradead.org>; Thu, 19 Apr 2012 04:16:18 -0700 (PDT)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: =?UTF-8?q?=5BPATCH=5D=20MTD=3A=20bcm63xxpart=3A=20handle=20Broadcom=20partition=20order?=
Date: Thu, 19 Apr 2012 13:15:57 +0200
Message-Id: <1334834157-16860-1-git-send-email-jonas.gorski@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
 Florian Fainelli <florian@openwrt.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The original Broadcom partition order has the root fs in front of the
kernel, which resulted in miscalculated partition sizes.
Detect when such an image is on the flash and also reorder the partitions
accordingly.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---

This patch is made on top of l2-mtd.

 drivers/mtd/bcm63xxpart.c |   41 ++++++++++++++++++++++++++++++-----------
 1 files changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/bcm63xxpart.c b/drivers/mtd/bcm63xxpart.c
index 608321e..63d2a64 100644
--- a/drivers/mtd/bcm63xxpart.c
+++ b/drivers/mtd/bcm63xxpart.c
@@ -4,7 +4,7 @@
  * Copyright © 2006-2008  Florian Fainelli <florian@openwrt.org>
  *			  Mike Albon <malbon@openwrt.org>
  * Copyright © 2009-2010  Daniel Dickinson <openwrt@cshore.neomailbox.net>
- * Copyright © 2011 Jonas Gorski <jonas.gorski@gmail.com>
+ * Copyright © 2011-2012  Jonas Gorski <jonas.gorski@gmail.com>
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -82,6 +82,7 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 	int namelen = 0;
 	int i;
 	u32 computed_crc;
+	bool rootfs_first = false;
 
 	if (bcm63xx_detect_cfe(master))
 		return -EINVAL;
@@ -109,6 +110,7 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 		char *boardid = &(buf->board_id[0]);
 		char *tagversion = &(buf->tag_version[0]);
 
+		sscanf(buf->flash_image_start, "%u", &rootfsaddr);
 		sscanf(buf->kernel_address, "%u", &kerneladdr);
 		sscanf(buf->kernel_length, "%u", &kernellen);
 		sscanf(buf->total_length, "%u", &totallen);
@@ -117,10 +119,19 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 			tagversion, boardid);
 
 		kerneladdr = kerneladdr - BCM63XX_EXTENDED_SIZE;
-		rootfsaddr = kerneladdr + kernellen;
+		rootfsaddr = rootfsaddr - BCM63XX_EXTENDED_SIZE;
 		spareaddr = roundup(totallen, master->erasesize) + cfelen;
 		sparelen = master->size - spareaddr - nvramlen;
-		rootfslen = spareaddr - rootfsaddr;
+
+		if (rootfsaddr < kerneladdr) {
+			/* default Broadcom layout */
+			rootfslen = kerneladdr - rootfsaddr;
+			rootfs_first = true;
+		} else {
+			/* OpenWrt layout */
+			rootfsaddr = kerneladdr + kernellen;
+			rootfslen = spareaddr - rootfsaddr;
+		}
 	} else {
 		pr_warn("CFE boot tag CRC invalid (expected %08x, actual %08x)\n",
 			buf->header_crc, computed_crc);
@@ -156,18 +167,26 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 	curpart++;
 
 	if (kernellen > 0) {
-		parts[curpart].name = "kernel";
-		parts[curpart].offset = kerneladdr;
-		parts[curpart].size = kernellen;
+		int kernelpart = curpart;
+
+		if (rootfslen > 0 && rootfs_first)
+			kernelpart++;
+		parts[kernelpart].name = "kernel";
+		parts[kernelpart].offset = kerneladdr;
+		parts[kernelpart].size = kernellen;
 		curpart++;
 	}
 
 	if (rootfslen > 0) {
-		parts[curpart].name = "rootfs";
-		parts[curpart].offset = rootfsaddr;
-		parts[curpart].size = rootfslen;
-		if (sparelen > 0)
-			parts[curpart].size += sparelen;
+		int rootfspart = curpart;
+
+		if (kernellen > 0 && rootfs_first)
+			rootfspart--;
+		parts[rootfspart].name = "rootfs";
+		parts[rootfspart].offset = rootfsaddr;
+		parts[rootfspart].size = rootfslen;
+		if (sparelen > 0  && !rootfs_first)
+			parts[rootfspart].size += sparelen;
 		curpart++;
 	}
 
-- 
1.7.2.5
