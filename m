Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCPk-0000zd-Tr
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 09:27:31 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: Vignesh R <vigneshr@ti.com>,
 Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: [RFC PATCH 15/34] mtd: spi-nor: Expose some functions to manufacturer
 drivers
Date: Fri,  7 Dec 2018 10:26:18 +0100
Message-Id: <20181207092637.18687-16-boris.brezillon@bootlin.com>
In-Reply-To: <20181207092637.18687-1-boris.brezillon@bootlin.com>
References: <20181207092637.18687-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some manufacturers rely on the generic quad_enable()/set_4byte()
implementations. Remove the static specifier and expose their
prototypes in internals.h.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/core.c      | 24 +++++++++---------------
 drivers/mtd/spi-nor/internals.h | 16 ++++++++++++++++
 2 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index f3c8e4ac1158..0bdbedb464c1 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -113,7 +113,7 @@ static int write_sr(struct spi_nor *nor, u8 val)
  * Set write enable latch with Write Enable command.
  * Returns negative if error occurred.
  */
-static int write_enable(struct spi_nor *nor)
+int write_enable(struct spi_nor *nor)
 {
 	return nor->write_reg(nor, SPINOR_OP_WREN, NULL, 0);
 }
@@ -121,17 +121,11 @@ static int write_enable(struct spi_nor *nor)
 /*
  * Send write disable instruction to the chip.
  */
-static int write_disable(struct spi_nor *nor)
+int write_disable(struct spi_nor *nor)
 {
 	return nor->write_reg(nor, SPINOR_OP_WRDI, NULL, 0);
 }
 
-static struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
-{
-	return mtd->priv;
-}
-
-
 static u8 spi_nor_convert_opcode(u8 opcode, const u8 table[][2], size_t size)
 {
 	size_t i;
@@ -322,7 +316,7 @@ static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
 	return -ETIMEDOUT;
 }
 
-static int spi_nor_wait_till_ready(struct spi_nor *nor)
+int spi_nor_wait_till_ready(struct spi_nor *nor)
 {
 	return spi_nor_wait_till_ready_with_timeout(nor,
 						    DEFAULT_READY_WAIT_JIFFIES);
@@ -340,7 +334,7 @@ static int erase_chip(struct spi_nor *nor)
 	return nor->write_reg(nor, SPINOR_OP_CHIP_ERASE, NULL, 0);
 }
 
-static int spi_nor_lock_and_prep(struct spi_nor *nor, enum spi_nor_ops ops)
+int spi_nor_lock_and_prep(struct spi_nor *nor, enum spi_nor_ops ops)
 {
 	int ret = 0;
 
@@ -357,7 +351,7 @@ static int spi_nor_lock_and_prep(struct spi_nor *nor, enum spi_nor_ops ops)
 	return ret;
 }
 
-static void spi_nor_unlock_and_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
+void spi_nor_unlock_and_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
 {
 	if (nor->unprepare)
 		nor->unprepare(nor, ops);
@@ -1140,7 +1134,7 @@ static int write_sr_cr(struct spi_nor *nor, u8 *sr_cr)
 	return 0;
 }
 
-static int no_quad_enable(struct spi_nor *nor)
+int no_quad_enable(struct spi_nor *nor)
 {
 	return 0;
 }
@@ -1155,7 +1149,7 @@ static int no_quad_enable(struct spi_nor *nor)
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int sr1_bit6_quad_enable(struct spi_nor *nor)
+int sr1_bit6_quad_enable(struct spi_nor *nor)
 {
 	int ret, val;
 
@@ -3324,13 +3318,13 @@ void spi_nor_restore(struct spi_nor *nor)
 }
 EXPORT_SYMBOL_GPL(spi_nor_restore);
 
-static int en4_ex4_set_4byte(struct spi_nor *nor, bool enable)
+int en4_ex4_set_4byte(struct spi_nor *nor, bool enable)
 {
 	return nor->write_reg(nor, enable ? SPINOR_OP_EN4B : SPINOR_OP_EX4B,
 			      NULL, 0);
 }
 
-static int en4_ex4_wen_set_4byte(struct spi_nor *nor, bool enable)
+int en4_ex4_wen_set_4byte(struct spi_nor *nor, bool enable)
 {
 	int ret;
 
diff --git a/drivers/mtd/spi-nor/internals.h b/drivers/mtd/spi-nor/internals.h
index c442d0bfa21a..5ed65f46333d 100644
--- a/drivers/mtd/spi-nor/internals.h
+++ b/drivers/mtd/spi-nor/internals.h
@@ -332,4 +332,20 @@ struct spi_nor_manufacturer {
 	const struct spi_nor_fixups *fixups;
 };
 
+/* Core helpers. */
+int en4_ex4_set_4byte(struct spi_nor *nor, bool enable);
+int en4_ex4_wen_set_4byte(struct spi_nor *nor, bool enable);
+int sr1_bit6_quad_enable(struct spi_nor *nor);
+int no_quad_enable(struct spi_nor *nor);
+int write_enable(struct spi_nor *nor);
+int write_disable(struct spi_nor *nor);
+int spi_nor_lock_and_prep(struct spi_nor *nor, enum spi_nor_ops ops);
+void spi_nor_unlock_and_unprep(struct spi_nor *nor, enum spi_nor_ops ops);
+int spi_nor_wait_till_ready(struct spi_nor *nor);
+
+static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
+{
+	return mtd->priv;
+}
+
 #endif /* __LINUX_MTD_SPI_NOR_INTERNALS_H */
-- 
2.17.1
