Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TXqh5-00014w-9d
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2012 09:52:40 +0000
Received: by mail-bk0-f49.google.com with SMTP id j4so2247441bkw.36
 for <linux-mtd@lists.infradead.org>; Mon, 12 Nov 2012 01:52:39 -0800 (PST)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/5] MTD: bcm63xxpart: make fixed part length calculation more
 generic
Date: Mon, 12 Nov 2012 10:52:49 +0100
Message-Id: <1352713971-1685-4-git-send-email-jonas.gorski@gmail.com>
In-Reply-To: <1352713971-1685-1-git-send-email-jonas.gorski@gmail.com>
References: <1352713971-1685-1-git-send-email-jonas.gorski@gmail.com>
Cc: Maxime Bizon <mbizon@freebox.fr>, Kevin Cernekee <cernekee@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Florian Fainelli <florian@openwrt.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The CFE does not use 4K sectors even if the flash supports it, so
for the fixed partitions like CFE itself or NVRAM the erase block
size is always 64k or bigger.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 drivers/mtd/bcm63xxpart.c |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/bcm63xxpart.c b/drivers/mtd/bcm63xxpart.c
index ba7eeb8..b3db8e3 100644
--- a/drivers/mtd/bcm63xxpart.c
+++ b/drivers/mtd/bcm63xxpart.c
@@ -37,8 +37,7 @@
 
 #define BCM63XX_EXTENDED_SIZE	0xBFC00000	/* Extended flash address */
 
-#define BCM63XX_MIN_CFE_SIZE	0x10000		/* always at least 64KiB */
-#define BCM63XX_MIN_NVRAM_SIZE	0x10000		/* always at least 64KiB */
+#define BCM63XX_CFE_BLOCK_SIZE	0x10000		/* always at least 64KiB */
 
 #define BCM63XX_CFE_MAGIC_OFFSET 0x4e0
 
@@ -79,6 +78,7 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 	unsigned int rootfsaddr, kerneladdr, spareaddr;
 	unsigned int rootfslen, kernellen, sparelen, totallen;
 	unsigned int cfelen, nvramlen;
+	unsigned int cfe_erasesize;
 	int i;
 	u32 computed_crc;
 	bool rootfs_first = false;
@@ -86,8 +86,11 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 	if (bcm63xx_detect_cfe(master))
 		return -EINVAL;
 
-	cfelen = max_t(uint32_t, master->erasesize, BCM63XX_MIN_CFE_SIZE);
-	nvramlen = max_t(uint32_t, master->erasesize, BCM63XX_MIN_NVRAM_SIZE);
+	cfe_erasesize = max_t(uint32_t, master->erasesize,
+			      BCM63XX_CFE_BLOCK_SIZE);
+
+	cfelen = cfe_erasesize;
+	nvramlen = cfe_erasesize;
 
 	/* Allocate memory for buffer */
 	buf = vmalloc(sizeof(struct bcm_tag));
-- 
1.7.2.5
