From: Murali Karicheri <m-karicheri2@ti.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <wsa@the-dreams.de>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RESEND: PATCH v1] mtd: nand: davinci: add support for 4K page size
 nand devices.
Date: Mon, 13 Jul 2015 16:07:16 -0400
Message-ID: <1436818036-7093-1-git-send-email-m-karicheri2@ti.com>
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

K2L EVM uses NAND with 4K page size. This patch add support for
ECC layout requires to enable Micron MT29F16G08ADBCAH4 NAND available
on this EVM.

Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
Signed-off-by: Hao Zhang <hzhang@ti.com>
---
 - Resend after subscribing to linux-mtd mailing list. I assume
   no one has seen this on this mailing list as I don't have any
   comments. So re-sending.
 - v1 - Remove the comment as well from the code as now 4K page
   is supported
 drivers/mtd/nand/davinci_nand.c | 42 +++++++++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index feb6d18..90b177b 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -520,6 +520,31 @@ static struct nand_ecclayout hwecc4_2048 = {
 	},
 };
 
+/* An ECC layout for using 4-bit ECC with large-page (4096bytes) flash,
+ * storing ten ECC bytes plus the manufacturer's bad block marker byte,
+ * and not overlapping the default BBT markers.
+ */
+static struct nand_ecclayout hwecc4_4096 = {
+	.eccbytes = 80,
+	.eccpos = {
+		/* at the end of spare sector */
+		48, 49, 50, 51, 52, 53, 54, 55, 56, 57,
+		58, 59, 60, 61, 62, 63, 64, 65, 66, 67,
+		68, 69, 70, 71, 72, 73, 74, 75, 76, 77,
+		78, 79, 80, 81, 82, 83, 84, 85, 86, 87,
+		88, 89, 90, 91, 92, 93, 94, 95, 96, 97,
+		98, 99, 100, 101, 102, 103, 104, 105, 106, 107,
+		108, 109, 110, 111, 112, 113, 114, 115, 116, 117,
+		118, 119, 120, 121, 122, 123, 124, 125, 126, 127,
+		},
+	.oobfree = {
+		/* 2 bytes at offset 0 hold manufacturer badblock markers */
+		{.offset = 2, .length = 46, },
+		/* 5 bytes at offset 8 hold BBT markers */
+		/* 8 bytes at offset 16 hold JFFS2 clean markers */
+	},
+};
+
 #if defined(CONFIG_OF)
 static const struct of_device_id davinci_nand_of_match[] = {
 	{.compatible = "ti,davinci-nand", },
@@ -796,18 +821,11 @@ static int nand_davinci_probe(struct platform_device *pdev)
 			info->chip.ecc.mode = NAND_ECC_HW_OOB_FIRST;
 			goto syndrome_done;
 		}
-
-		/* 4KiB page chips are not yet supported. The eccpos from
-		 * nand_ecclayout cannot hold 80 bytes and change to eccpos[]
-		 * breaks userspace ioctl interface with mtd-utils. Once we
-		 * resolve this issue, NAND_ECC_HW_OOB_FIRST mode can be used
-		 * for the 4KiB page chips.
-		 *
-		 * TODO: Note that nand_ecclayout has now been expanded and can
-		 *  hold plenty of OOB entries.
-		 */
-		dev_warn(&pdev->dev, "no 4-bit ECC support yet "
-				"for 4KiB-page NAND\n");
+		if (chunks == 8) {
+			info->ecclayout = hwecc4_4096;
+			info->chip.ecc.mode = NAND_ECC_HW_OOB_FIRST;
+			goto syndrome_done;
+		}
 		ret = -EIO;
 		goto err;
 
-- 
1.9.1
