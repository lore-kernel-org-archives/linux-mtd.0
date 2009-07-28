Received: from mba.ocn.ne.jp ([122.28.14.163] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MVo87-0004CD-0s
	for linux-mtd@lists.infradead.org; Tue, 28 Jul 2009 14:58:16 +0000
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd/nand: Fix tmio_nand ecc correction
Date: Tue, 28 Jul 2009 23:53:12 +0900
Message-Id: <1248792792-20197-2-git-send-email-anemo@mba.ocn.ne.jp>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, dwmw2@infradead.org,
	vimal singh <vimal.newwork@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This driver may be reading 512 bytes at a times, but still calculates
256-byte sector ECC.  So the nand_correct_data() is not appropriate
for this driver.  Implement its ecc.correct function calling
__nand_correct_data() twice.

Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Acked-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Acked-by: Vimal Singh <vimalsingh@ti.com>
---
 drivers/mtd/nand/tmio_nand.c |   17 ++++++++++++++++-
 1 files changed, 16 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/tmio_nand.c b/drivers/mtd/nand/tmio_nand.c
index daa6a4c..92c7334 100644
--- a/drivers/mtd/nand/tmio_nand.c
+++ b/drivers/mtd/nand/tmio_nand.c
@@ -301,6 +301,21 @@ static int tmio_nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat,
 	return 0;
 }
 
+static int tmio_nand_correct_data(struct mtd_info *mtd, unsigned char *buf,
+		unsigned char *read_ecc, unsigned char *calc_ecc)
+{
+	int r0, r1;
+
+	/* assume ecc.size = 512 and ecc.bytes = 6 */
+	r0 = __nand_correct_data(buf, read_ecc, calc_ecc, 256);
+	if (r0 < 0)
+		return r0;
+	r1 = __nand_correct_data(buf + 256, read_ecc + 3, calc_ecc + 3, 256);
+	if (r1 < 0)
+		return r1;
+	return r0 + r1;
+}
+
 static int tmio_hw_init(struct platform_device *dev, struct tmio_nand *tmio)
 {
 	struct mfd_cell *cell = (struct mfd_cell *)dev->dev.platform_data;
@@ -424,7 +439,7 @@ static int tmio_probe(struct platform_device *dev)
 	nand_chip->ecc.bytes = 6;
 	nand_chip->ecc.hwctl = tmio_nand_enable_hwecc;
 	nand_chip->ecc.calculate = tmio_nand_calculate_ecc;
-	nand_chip->ecc.correct = nand_correct_data;
+	nand_chip->ecc.correct = tmio_nand_correct_data;
 
 	if (data)
 		nand_chip->badblock_pattern = data->badblock_pattern;
-- 
1.5.6.5
