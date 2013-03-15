Received: from mail-ee0-f50.google.com ([74.125.83.50])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UGRvD-0008NK-AB
 for linux-mtd@lists.infradead.org; Fri, 15 Mar 2013 10:31:35 +0000
Received: by mail-ee0-f50.google.com with SMTP id e51so1539643eek.23
 for <linux-mtd@lists.infradead.org>; Fri, 15 Mar 2013 03:31:33 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>
Subject: [PATCH] mtd: bcm47xxsflash: implement chip polling
Date: Fri, 15 Mar 2013 11:31:26 +0100
Message-Id: <1363343486-3084-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/devices/bcm47xxsflash.c |   56 +++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
index 2f9e629..75f3cf0 100644
--- a/drivers/mtd/devices/bcm47xxsflash.c
+++ b/drivers/mtd/devices/bcm47xxsflash.c
@@ -1,6 +1,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/delay.h>
 #include <linux/mtd/mtd.h>
 #include <linux/platform_device.h>
 #include <linux/bcma/bcma.h>
@@ -12,6 +13,58 @@ MODULE_DESCRIPTION("Serial flash driver for BCMA bus");
 
 static const char * const probes[] = { "bcm47xxpart", NULL };
 
+/**************************************************
+ * Various helpers
+ **************************************************/
+
+static void bcm47xxsflash_cmd(struct bcm47xxsflash *b47s, u32 opcode)
+{
+	int i;
+
+	bcma_cc_write32(b47s->bcma_cc, BCMA_CC_FLASHCTL,
+			BCMA_CC_FLASHCTL_START | opcode);
+	for (i = 0; i < 1000; i++) {
+		if (!(bcma_cc_read32(b47s->bcma_cc, BCMA_CC_FLASHCTL) &
+		      BCMA_CC_FLASHCTL_BUSY))
+			return;
+		cpu_relax();
+	}
+	pr_err("Control command failed (timeout)!\n");
+}
+
+static int bcm47xxsflash_poll(struct bcm47xxsflash *b47s, int timeout)
+{
+	unsigned long deadline = jiffies + timeout;
+
+	do {
+		switch (b47s->type) {
+		case BCM47XXSFLASH_TYPE_ST:
+			bcm47xxsflash_cmd(b47s, OPCODE_ST_RDSR);
+			if (!(bcma_cc_read32(b47s->bcma_cc, BCMA_CC_FLASHDATA)
+			      & SR_ST_WIP))
+				return 0;
+			break;
+		case BCM47XXSFLASH_TYPE_ATMEL:
+			bcm47xxsflash_cmd(b47s, OPCODE_AT_STATUS);
+			if (bcma_cc_read32(b47s->bcma_cc, BCMA_CC_FLASHDATA)
+			    & SR_AT_READY)
+				return 0;
+			break;
+		}
+
+		cpu_relax();
+		udelay(1);
+	} while (!time_after_eq(jiffies, deadline));
+
+	pr_err("Timeout waiting for flash to be ready!\n");
+
+	return -EBUSY;
+}
+
+/**************************************************
+ * MTD ops
+ **************************************************/
+
 static int bcm47xxsflash_read(struct mtd_info *mtd, loff_t from, size_t len,
 			      size_t *retlen, u_char *buf)
 {
@@ -84,6 +137,9 @@ static int bcm47xxsflash_bcma_probe(struct platform_device *pdev)
 		goto err_dev_reg;
 	}
 
+	if (bcm47xxsflash_poll(b47s, HZ / 10))
+		pr_warn("Serial flash busy\n");
+
 	return 0;
 
 err_dev_reg:
-- 
1.7.10.4
