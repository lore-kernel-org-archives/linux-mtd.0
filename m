Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cg5Cw-0007t2-2g
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 07:50:00 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH 06/11] nand: spi: Add erase function support
Date: Tue, 21 Feb 2017 16:00:05 +0800
Message-ID: <1487664010-25926-7-git-send-email-peterpandong@micron.com>
In-Reply-To: <1487664010-25926-1-git-send-email-peterpandong@micron.com>
References: <1487664010-25926-1-git-send-email-peterpandong@micron.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add erase support for SPI NAND. Will be registered
under struct mtd_info later.

Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/nand/spi/spi-nand-base.c | 85 +++++++++++++++++++++++++++++++++++-
 1 file changed, 83 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/spi-nand-base.c b/drivers/mtd/nand/spi/spi-nand-base.c
index d0cf552..5c335e2 100644
--- a/drivers/mtd/nand/spi/spi-nand-base.c
+++ b/drivers/mtd/nand/spi/spi-nand-base.c
@@ -20,6 +20,7 @@
 #include <linux/module.h>
 #include <linux/sched.h>
 #include <linux/delay.h>
+#include <linux/jiffies.h>
 #include <linux/mtd/spi-nand.h>
 
 /**
@@ -373,12 +374,15 @@ static int spi_nand_erase_block(struct spi_nand_chip *chip,
 static int spi_nand_wait(struct spi_nand_chip *chip, u8 *s)
 {
 	unsigned long timeo = jiffies;
-	u8 status;
+	u8 status, state = chip->state;
 	int ret = -ETIMEDOUT;
 	int count = 0;
 
 	#define MIN_TRY_COUNT 3
-	timeo += msecs_to_jiffies(20);
+	if (state == FL_ERASING)
+		timeo += msecs_to_jiffies(400);
+	else
+		timeo += msecs_to_jiffies(20);
 
 	while (time_before(jiffies, timeo) || count < MIN_TRY_COUNT) {
 		spi_nand_read_status(chip, &status);
@@ -912,6 +916,83 @@ static int spi_nand_write_oob(struct mtd_info *mtd, loff_t to,
 
 	return ret;
 }
+
+/**
+ * spi_nand_erase - [MTD Interface] erase block(s)
+ * @mtd: MTD device structure
+ * @einfo: erase instruction
+ *
+ * Erase one ore more blocks
+ */
+static int spi_nand_erase(struct mtd_info *mtd, struct erase_info *einfo)
+{
+	struct spi_nand_chip *chip = mtd_to_spi_nand(mtd);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	loff_t offs = einfo->addr, len = einfo->len;
+	u8 status;
+	int ret = 0;
+
+
+	/* check address align on block boundary */
+	if (offs & (nand_eraseblock_size(nand) - 1)) {
+		pr_err("%s: Unaligned address\n", __func__);
+		return -EINVAL;
+	}
+
+	if (len & (nand_eraseblock_size(nand) - 1)) {
+		pr_err("%s: Length not block aligned\n", __func__);
+		return -EINVAL;
+	}
+
+	/* Do not allow erase past end of device */
+	if ((offs + len) > chip->size) {
+		pr_err("%s: Erase past end of device\n", __func__);
+		return -EINVAL;
+	}
+
+	einfo->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
+
+	/* Grab the lock and see if the device is available */
+	spi_nand_get_device(mtd, FL_ERASING);
+
+	einfo->state = MTD_ERASING;
+
+	while (len) {
+		spi_nand_write_enable(chip);
+		spi_nand_erase_block(chip, nand_offs_to_page(nand, offs));
+		ret = spi_nand_wait(chip, &status);
+		if (ret < 0) {
+			pr_err("block erase command wait failed\n");
+			einfo->state = MTD_ERASE_FAILED;
+			goto erase_exit;
+		}
+		if ((status & STATUS_E_FAIL_MASK) == STATUS_E_FAIL) {
+			pr_err("erase block 0x%012llx failed\n", offs);
+			einfo->state = MTD_ERASE_FAILED;
+			einfo->fail_addr = offs;
+			goto erase_exit;
+		}
+
+		/* Increment page address and decrement length */
+		len -= nand_eraseblock_size(nand);
+		offs += nand_eraseblock_size(nand);
+	}
+
+	einfo->state = MTD_ERASE_DONE;
+
+erase_exit:
+
+	ret = einfo->state == MTD_ERASE_DONE ? 0 : -EIO;
+
+	spi_nand_release_device(mtd);
+
+	/* Do call back function */
+	if (!ret)
+		mtd_erase_callback(einfo);
+
+	/* Return more or less happy */
+	return ret;
+}
 MODULE_DESCRIPTION("SPI NAND framework");
 MODULE_AUTHOR("Peter Pan<peterpandong@micron.com>");
 MODULE_LICENSE("GPL v2");
-- 
1.9.1
