Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMKe3-00057Z-6u
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2015 18:39:33 +0000
Date: 3 Aug 2015 18:39:02 -0000
Message-Id: <46587362a5dc20aa9c3424ceed3bdb028ec263a6.1438626500.git.hramrach@gmail.com>
In-Reply-To: <cover.1438626500.git.hramrach@gmail.com>
References: <cover.1438626500.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH v2 3/6] mtd: fsl-quadspi: update read/write function prototype
To: David Woodhouse <dwmw2@infradead.org>,
  Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
  "Rafał Miłecki" <zajec5@gmail.com>, Michal Suchanek <hramrach@gmail.com>,
  Huang Shijie <b32955@freescale.com>, Ben Hutchings <ben@decadent.org.uk>,
  Marek Vasut <marex@denx.de>, Gabor Juhos <juhosg@openwrt.org>,
  "Bean Huo 霍斌斌" <beanhuo@micron.com>, linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org, , Hou Zhiqiang <B48286@freescale.com>,
  shijie.huang@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Return read/written amount of data as read(2)/write(2) does.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 52a872f..a39f09e 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -525,7 +525,7 @@ static inline void fsl_qspi_invalid(struct fsl_qspi *q)
 	writel(reg, q->iobase + QUADSPI_MCR);
 }
 
-static int fsl_qspi_nor_write(struct fsl_qspi *q, struct spi_nor *nor,
+static ssize_t fsl_qspi_nor_write(struct fsl_qspi *q, struct spi_nor *nor,
 				u8 opcode, unsigned int to, u32 *txbuf,
 				unsigned count, size_t *retlen)
 {
@@ -549,8 +549,11 @@ static int fsl_qspi_nor_write(struct fsl_qspi *q, struct spi_nor *nor,
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
@@ -704,6 +707,8 @@ static int fsl_qspi_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len,
 	} else if (len > 0) {
 		ret = fsl_qspi_nor_write(q, nor, opcode, 0,
 					(u32 *)buf, len, NULL);
+		if (ret > 0)
+			return 0;
 	} else {
 		dev_err(q->dev, "invalid cmd %d\n", opcode);
 		ret = -EINVAL;
@@ -712,19 +717,20 @@ static int fsl_qspi_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len,
 	return ret;
 }
 
-static void fsl_qspi_write(struct spi_nor *nor, loff_t to,
+static ssize_t fsl_qspi_write(struct spi_nor *nor, loff_t to,
 		size_t len, size_t *retlen, const u_char *buf)
 {
 	struct fsl_qspi *q = nor->priv;
 
-	fsl_qspi_nor_write(q, nor, nor->program_opcode, to,
+	ssize_t ret = fsl_qspi_nor_write(q, nor, nor->program_opcode, to,
 				(u32 *)buf, len, retlen);
 
 	/* invalid the data in the AHB buffer. */
 	fsl_qspi_invalid(q);
+	return ret;
 }
 
-static int fsl_qspi_read(struct spi_nor *nor, loff_t from,
+static ssize_t fsl_qspi_read(struct spi_nor *nor, loff_t from,
 		size_t len, size_t *retlen, u_char *buf)
 {
 	struct fsl_qspi *q = nor->priv;
@@ -736,8 +742,7 @@ static int fsl_qspi_read(struct spi_nor *nor, loff_t from,
 	/* Read out the data directly from the AHB buffer.*/
 	memcpy(buf, q->ahb_base + q->chip_base_addr + from, len);
 
-	*retlen += len;
-	return 0;
+	return len;
 }
 
 static int fsl_qspi_erase(struct spi_nor *nor, loff_t offs)
-- 
2.1.4
