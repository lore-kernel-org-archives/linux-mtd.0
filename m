Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayThR-0006La-VO
 for linux-mtd@lists.infradead.org; Fri, 06 May 2016 00:32:58 +0000
Received: by mail-pa0-x22a.google.com with SMTP id iv1so41145780pac.2
 for <linux-mtd@lists.infradead.org>; Thu, 05 May 2016 17:32:37 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@nxp.com>,
 Michal Suchanek <hramrach@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Rafal Milecki <zajec5@gmail.com>, Jagan Teki <jteki@openedev.com>,
 "Andrew F. Davis" <afd@ti.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Gabor Juhos <juhosg@openwrt.org>, Bean Huo <beanhuo@micron.com>,
 linux-kernel@vger.kernel.org, Bayi Cheng <bayi.cheng@mediatek.com>,
 Joachim Eastwood <manabian@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v7 03/10] mtd: fsl-quadspi: return amount of data read/written
 or error
Date: Thu,  5 May 2016 17:31:49 -0700
Message-Id: <1462494716-95312-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1462494716-95312-1-git-send-email-computersforpeace@gmail.com>
References: <1462494716-95312-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Michal Suchanek <hramrach@gmail.com>

Return amount of data read/written or error as read(2)/write(2) does.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v6 -> v7:
 * moved some *retlen changes to patch 7 to preserve bisectability

 drivers/mtd/spi-nor/fsl-quadspi.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 74dc155e1b3b..ea296769f015 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -618,7 +618,7 @@ static inline void fsl_qspi_invalid(struct fsl_qspi *q)
 	qspi_writel(q, reg, q->iobase + QUADSPI_MCR);
 }
 
-static int fsl_qspi_nor_write(struct fsl_qspi *q, struct spi_nor *nor,
+static ssize_t fsl_qspi_nor_write(struct fsl_qspi *q, struct spi_nor *nor,
 				u8 opcode, unsigned int to, u32 *txbuf,
 				unsigned count, size_t *retlen)
 {
@@ -647,8 +647,11 @@ static int fsl_qspi_nor_write(struct fsl_qspi *q, struct spi_nor *nor,
 	/* Trigger it */
 	ret = fsl_qspi_runcmd(q, opcode, to, count);
 
-	if (ret == 0 && retlen)
-		*retlen += count;
+	if (ret == 0) {
+		if (retlen)
+			*retlen += count;
+		return count;
+	}
 
 	return ret;
 }
@@ -860,6 +863,8 @@ static int fsl_qspi_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 	} else if (len > 0) {
 		ret = fsl_qspi_nor_write(q, nor, opcode, 0,
 					(u32 *)buf, len, NULL);
+		if (ret > 0)
+			return 0;
 	} else {
 		dev_err(q->dev, "invalid cmd %d\n", opcode);
 		ret = -EINVAL;
@@ -873,12 +878,12 @@ static ssize_t fsl_qspi_write(struct spi_nor *nor, loff_t to,
 {
 	struct fsl_qspi *q = nor->priv;
 
-	fsl_qspi_nor_write(q, nor, nor->program_opcode, to,
+	ssize_t ret = fsl_qspi_nor_write(q, nor, nor->program_opcode, to,
 				(u32 *)buf, len, retlen);
 
 	/* invalid the data in the AHB buffer. */
 	fsl_qspi_invalid(q);
-	return 0;
+	return ret;
 }
 
 static ssize_t fsl_qspi_read(struct spi_nor *nor, loff_t from,
@@ -925,7 +930,7 @@ static ssize_t fsl_qspi_read(struct spi_nor *nor, loff_t from,
 		len);
 
 	*retlen += len;
-	return 0;
+	return len;
 }
 
 static int fsl_qspi_erase(struct spi_nor *nor, loff_t offs)
-- 
2.8.0.rc3.226.g39d4020
