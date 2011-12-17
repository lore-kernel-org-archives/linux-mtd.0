Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rbtqr-0008JX-H5
 for linux-mtd@lists.infradead.org; Sat, 17 Dec 2011 12:58:58 +0000
Received: by mail-ee0-f49.google.com with SMTP id c13so2862499eek.36
 for <linux-mtd@lists.infradead.org>; Sat, 17 Dec 2011 04:58:57 -0800 (PST)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 5/5] MTD: bcm63xxpart: check the image tag's crc32
Date: Sat, 17 Dec 2011 13:58:18 +0100
Message-Id: <1324126698-9919-6-git-send-email-jonas.gorski@gmail.com>
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

Only use the values from the image tag if it is valid. Always create
the CFE, NVRAM and linux partitions, to allow flashing a new image even
if the old is invalid without overwriting CFE or NVRAM.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 drivers/mtd/bcm63xxpart.c |   45 +++++++++++++++++++++++++++++----------------
 1 files changed, 29 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/bcm63xxpart.c b/drivers/mtd/bcm63xxpart.c
index 3becb4d..0d5fecf 100644
--- a/drivers/mtd/bcm63xxpart.c
+++ b/drivers/mtd/bcm63xxpart.c
@@ -24,6 +24,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/crc32.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
@@ -80,8 +81,7 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 	unsigned int cfelen, nvramlen;
 	int namelen = 0;
 	int i;
-	char *boardid;
-	char *tagversion;
+	u32 computed_crc;
 
 	if (bcm63xx_detect_cfe(master))
 		return -EINVAL;
@@ -103,20 +103,33 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 		return -EIO;
 	}
 
-	sscanf(buf->kernel_address, "%u", &kerneladdr);
-	sscanf(buf->kernel_length, "%u", &kernellen);
-	sscanf(buf->total_length, "%u", &totallen);
-	tagversion = &(buf->tag_version[0]);
-	boardid = &(buf->board_id[0]);
-
-	pr_info("CFE boot tag found with version %s and board type %s\n",
-		tagversion, boardid);
-
-	kerneladdr = kerneladdr - BCM63XX_EXTENDED_SIZE;
-	rootfsaddr = kerneladdr + kernellen;
-	spareaddr = roundup(totallen, master->erasesize) + cfelen;
-	sparelen = master->size - spareaddr - nvramlen;
-	rootfslen = spareaddr - rootfsaddr;
+	computed_crc = crc32_le(IMAGETAG_CRC_START, (u8 *)buf,
+				offsetof(struct bcm_tag, header_crc));
+	if (computed_crc == buf->header_crc) {
+		char *boardid = &(buf->board_id[0]);
+		char *tagversion = &(buf->tag_version[0]);
+
+		sscanf(buf->kernel_address, "%u", &kerneladdr);
+		sscanf(buf->kernel_length, "%u", &kernellen);
+		sscanf(buf->total_length, "%u", &totallen);
+
+		pr_info("CFE boot tag found with version %s and board type %s\n",
+			tagversion, boardid);
+
+		kerneladdr = kerneladdr - BCM63XX_EXTENDED_SIZE;
+		rootfsaddr = kerneladdr + kernellen;
+		spareaddr = roundup(totallen, master->erasesize) + cfelen;
+		sparelen = master->size - spareaddr - nvramlen;
+		rootfslen = spareaddr - rootfsaddr;
+	} else {
+		pr_warn("CFE boot tag CRC invalid (expected %08x, actual %08x)\n",
+			buf->header_crc, computed_crc);
+		kernellen = 0;
+		rootfslen = 0;
+		rootfsaddr = 0;
+		spareaddr = cfelen;
+		sparelen = master->size - cfelen - nvramlen;
+	}
 
 	/* Determine number of partitions */
 	namelen = 8;
-- 
1.7.2.5
