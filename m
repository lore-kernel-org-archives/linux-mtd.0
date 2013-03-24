Received: from mail-ea0-x22f.google.com ([2a00:1450:4013:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UJrtM-0000p3-Dt
 for linux-mtd@lists.infradead.org; Sun, 24 Mar 2013 20:51:49 +0000
Received: by mail-ea0-f175.google.com with SMTP id o10so2045791eaj.34
 for <linux-mtd@lists.infradead.org>; Sun, 24 Mar 2013 13:51:46 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>
Subject: [PATCH 2/2] mtd: bcm47xxsflash: implement polling chip status
Date: Sun, 24 Mar 2013 21:51:31 +0100
Message-Id: <1364158291-22591-2-git-send-email-zajec5@gmail.com>
In-Reply-To: <1364158291-22591-1-git-send-email-zajec5@gmail.com>
References: <1364158291-22591-1-git-send-email-zajec5@gmail.com>
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
 drivers/mtd/devices/bcm47xxsflash.c |   55 +++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
index d1f0dec..2060856 100644
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
@@ -12,6 +13,57 @@ MODULE_DESCRIPTION("Serial flash driver for BCMA bus");
 
 static const char * const probes[] = { "bcm47xxpart", NULL };
 
+/**************************************************
+ * Various helpers
+ **************************************************/
+
+static void bcm47xxsflash_cmd(struct bcm47xxsflash *b47s, u32 opcode)
+{
+	int i;
+
+	b47s->cc_write(b47s, BCMA_CC_FLASHCTL, BCMA_CC_FLASHCTL_START | opcode);
+	for (i = 0; i < 1000; i++) {
+		if (!(b47s->cc_read(b47s, BCMA_CC_FLASHCTL) &
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
+			if (!(b47s->cc_read(b47s, BCMA_CC_FLASHDATA) &
+			      SR_ST_WIP))
+				return 0;
+			break;
+		case BCM47XXSFLASH_TYPE_ATMEL:
+			bcm47xxsflash_cmd(b47s, OPCODE_AT_STATUS);
+			if (b47s->cc_read(b47s, BCMA_CC_FLASHDATA) &
+			    SR_AT_READY)
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
@@ -97,6 +149,9 @@ static int bcm47xxsflash_bcma_probe(struct platform_device *pdev)
 		goto err_dev_reg;
 	}
 
+	if (bcm47xxsflash_poll(b47s, HZ / 10))
+		pr_warn("Serial flash busy\n");
+
 	return 0;
 
 err_dev_reg:
-- 
1.7.10.4
