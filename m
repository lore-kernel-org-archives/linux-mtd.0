Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cg5DB-0007vi-2v
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 07:50:14 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH 11/11] nand: spi: Add arguments check for read/write
Date: Tue, 21 Feb 2017 16:00:10 +0800
Message-ID: <1487664010-25926-12-git-send-email-peterpandong@micron.com>
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

Check offset and length in spi_nand_do_read_ops and
spi_nand_do_write_ops.

Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/nand/spi/spi-nand-base.c | 44 ++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/mtd/nand/spi/spi-nand-base.c b/drivers/mtd/nand/spi/spi-nand-base.c
index 5ac4b26..c7616d6 100644
--- a/drivers/mtd/nand/spi/spi-nand-base.c
+++ b/drivers/mtd/nand/spi/spi-nand-base.c
@@ -685,6 +685,7 @@ static int spi_nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 			  struct mtd_oob_ops *ops)
 {
 	struct spi_nand_chip *chip = mtd_to_spi_nand(mtd);
+	struct nand_device *nand = mtd_to_nand(mtd);
 	int ret;
 	struct mtd_ecc_stats stats;
 	unsigned int max_bitflips = 0;
@@ -693,7 +694,24 @@ static int spi_nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 	int ooblen = ops->mode == MTD_OPS_AUTO_OOB ?
 		mtd->oobavail : mtd->oobsize;
 
+	if (unlikely(from >= mtd->size)) {
+		pr_err("%s: attempt to read beyond end of device\n",
+				__func__);
+		return -EINVAL;
+	}
 	if (oobreadlen > 0) {
+		if (unlikely(ops->ooboffs >= ooblen)) {
+			pr_err("%s: attempt to start read outside oob\n",
+					__func__);
+			return -EINVAL;
+		}
+		if (unlikely(ops->ooboffs + oobreadlen >
+		(nand_len_to_pages(nand, mtd->size) - nand_offs_to_page(nand, from))
+		* ooblen)) {
+			pr_err("%s: attempt to read beyond end of device\n",
+					__func__);
+			return -EINVAL;
+		}
 		ooblen -= ops->ooboffs;
 		ops->oobretlen = 0;
 	}
@@ -789,12 +807,38 @@ static int spi_nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 		mtd->oobavail : mtd->oobsize;
 	bool ecc_off = ops->mode == MTD_OPS_RAW;
 
+	/* Do not allow reads past end of device */
+	if (unlikely(to >= mtd->size)) {
+		pr_err("%s: attempt to write beyond end of device\n",
+				__func__);
+		return -EINVAL;
+	}
+
 	page_addr = nand_offs_to_page(nand, to);
 	page_offset = to & (nand_page_size(nand) - 1);
 	ops->retlen = 0;
 
 	/* for oob */
 	if (oobwritelen > 0) {
+		/* Do not allow write past end of page */
+		if ((ops->ooboffs + oobwritelen) > ooblen) {
+			pr_err("%s: attempt to write past end of page\n",
+					__func__);
+			return -EINVAL;
+		}
+
+		if (unlikely(ops->ooboffs >= ooblen)) {
+			pr_err("%s: attempt to start write outside oob\n",
+					__func__);
+			return -EINVAL;
+		}
+		if (unlikely(ops->ooboffs + oobwritelen >
+		(nand_len_to_pages(nand, mtd->size) - nand_offs_to_page(nand, to))
+			* ooblen)) {
+			pr_err("%s: attempt to write beyond end of device\n",
+					__func__);
+			return -EINVAL;
+		}
 		ooblen -= ops->ooboffs;
 		ops->oobretlen = 0;
 	}
-- 
1.9.1
