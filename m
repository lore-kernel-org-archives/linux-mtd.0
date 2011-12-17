Received: from mail-ey0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rbtqn-0008Ij-1L
 for linux-mtd@lists.infradead.org; Sat, 17 Dec 2011 12:58:53 +0000
Received: by eaak12 with SMTP id k12so3598652eaa.36
 for <linux-mtd@lists.infradead.org>; Sat, 17 Dec 2011 04:58:52 -0800 (PST)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/5] MTD: bcm63xxpart: check version marker string for newer
 CFEs
Date: Sat, 17 Dec 2011 13:58:14 +0100
Message-Id: <1324126698-9919-2-git-send-email-jonas.gorski@gmail.com>
In-Reply-To: <1324126698-9919-1-git-send-email-jonas.gorski@gmail.com>
References: <1324126698-9919-1-git-send-email-jonas.gorski@gmail.com>
Cc: linux-mips@linux-mips.org, Artem Bityutskiy <Artem.Bityutskiy@intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Recent CFEs do not contain the CFE1CFE1 magic anymore, so check for the
"cfe-v" version marker string instead. As very old CFEs do not have
this string, leave the CFE1CFE1 magic as a fallback for detection.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 drivers/mtd/bcm63xxpart.c |   22 +++++++++++++++++-----
 1 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/bcm63xxpart.c b/drivers/mtd/bcm63xxpart.c
index ac7d3c8..9933b34 100644
--- a/drivers/mtd/bcm63xxpart.c
+++ b/drivers/mtd/bcm63xxpart.c
@@ -32,22 +32,34 @@
 #include <linux/mtd/partitions.h>
 
 #include <asm/mach-bcm63xx/bcm963xx_tag.h>
+#include <asm/mach-bcm63xx/board_bcm963xx.h>
 
 #define BCM63XX_EXTENDED_SIZE	0xBFC00000	/* Extended flash address */
 
+#define BCM63XX_CFE_MAGIC_OFFSET 0x4e0
+
 static int bcm63xx_detect_cfe(struct mtd_info *master)
 {
-	int idoffset = 0x4e0;
-	static char idstring[8] = "CFE1CFE1";
 	char buf[9];
 	int ret;
 	size_t retlen;
 
-	ret = master->read(master, idoffset, 8, &retlen, (void *)buf);
+	ret = master->read(master, BCM963XX_CFE_VERSION_OFFSET, 5, &retlen,
+			   (void *)buf);
+	buf[retlen] = 0;
+
+	if (ret)
+		return ret;
+
+	if (strncmp("cfe-v", buf, 5) == 0)
+		return 0;
+
+	/* very old CFE's do not have the cfe-v string, so check for magic */
+	ret = master->read(master, BCM63XX_CFE_MAGIC_OFFSET, 8, &retlen,
+			   (void *)buf);
 	buf[retlen] = 0;
-	pr_info("Read Signature value of %s\n", buf);
 
-	return strncmp(idstring, buf, 8);
+	return strncmp("CFE1CFE1", buf, 8);
 }
 
 static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
-- 
1.7.2.5
