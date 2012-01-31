From: Huang Shijie <b32955@freescale.com>
To: <artem.bityutskiy@intel.com>
Subject: [PATCH v2] mtd/gpmi : add BBT support to gpmi nand driver
Date: Tue, 31 Jan 2012 18:38:23 +0800
Message-ID: <1328006303-26844-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: marek.vasut@gmail.com, linux-mtd@lists.infradead.org, w.sang@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Huang Shijie <b32955@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a new field to gpmi_nand_platform_data{}.
Make the BBT support to board specific.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    2 ++
 include/linux/mtd/gpmi-nand.h          |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 493ec2f..4d369df 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1493,6 +1493,8 @@ static int __devinit gpmi_nfc_init(struct gpmi_nand_data *this)
 	chip->ecc.mode		= NAND_ECC_HW;
 	chip->ecc.size		= 1;
 	chip->ecc.layout	= &gpmi_hw_ecclayout;
+	if (pdata->enable_bbt)
+		chip->bbt_options = NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB;
 
 	/* Allocate a temporary DMA buffer for reading ID in the nand_scan() */
 	this->bch_geometry.payload_size = 1024;
diff --git a/include/linux/mtd/gpmi-nand.h b/include/linux/mtd/gpmi-nand.h
index 69b6dbf..12078c9 100644
--- a/include/linux/mtd/gpmi-nand.h
+++ b/include/linux/mtd/gpmi-nand.h
@@ -51,6 +51,7 @@
  * @partitions:              An optional pointer to an array of partition
  *                           descriptions.
  * @partition_count:         The number of elements in the partitions array.
+ * @enable_bbt:              Enable the BBT or not.
  */
 struct gpmi_nand_platform_data {
 	/* SoC hardware information. */
@@ -64,5 +65,6 @@ struct gpmi_nand_platform_data {
 	/* Medium information. */
 	struct		mtd_partition *partitions;
 	unsigned	partition_count;
+	int		enable_bbt;
 };
 #endif
-- 
1.7.0.4
