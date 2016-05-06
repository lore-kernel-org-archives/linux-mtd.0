Received: from mail-pf0-x22f.google.com ([2607:f8b0:400e:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayThP-0006LN-Qa
 for linux-mtd@lists.infradead.org; Fri, 06 May 2016 00:32:56 +0000
Received: by mail-pf0-x22f.google.com with SMTP id 77so43021130pfv.2
 for <linux-mtd@lists.infradead.org>; Thu, 05 May 2016 17:32:35 -0700 (PDT)
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
Subject: [PATCH v7 01/10] mtd: spi-nor: change return value of read/write
Date: Thu,  5 May 2016 17:31:47 -0700
Message-Id: <1462494716-95312-2-git-send-email-computersforpeace@gmail.com>
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

Change the return value of spi-nor device read and write methods to
allow returning amount of data transferred and errors as
read(2)/write(2) does.

Also, start handling positive returns in spi_nor_read(), since we want
to convert drivers to start returning the read-length both via *retlen
and the return code. (We don't need to do the same transition process
for spi_nor_write(), since ->write() didn't used to have a return code
at all.)

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v6 -> v7:
 * added handling of positive return codes to spi_nor_read() to help preserve
   bisectability

 drivers/mtd/devices/m25p80.c      |  5 +++--
 drivers/mtd/spi-nor/fsl-quadspi.c |  5 +++--
 drivers/mtd/spi-nor/mtk-quadspi.c | 26 ++++++++++++++++++--------
 drivers/mtd/spi-nor/nxp-spifi.c   | 12 ++++++------
 drivers/mtd/spi-nor/spi-nor.c     |  5 ++++-
 include/linux/mtd/spi-nor.h       |  4 ++--
 6 files changed, 36 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 9d6854467651..3bd75e87ed89 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -73,7 +73,7 @@ static int m25p80_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 	return spi_write(spi, flash->command, len + 1);
 }
 
-static void m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
+static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
 			size_t *retlen, const u_char *buf)
 {
 	struct m25p *flash = nor->priv;
@@ -101,6 +101,7 @@ static void m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
 	spi_sync(spi, &m);
 
 	*retlen += m.actual_length - cmd_sz;
+	return 0;
 }
 
 static inline unsigned int m25p80_rx_nbits(struct spi_nor *nor)
@@ -119,7 +120,7 @@ static inline unsigned int m25p80_rx_nbits(struct spi_nor *nor)
  * Read an address range from the nor chip.  The address range
  * may be any size provided it is within the physical boundaries.
  */
-static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
+static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 			size_t *retlen, u_char *buf)
 {
 	struct m25p *flash = nor->priv;
diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 9ab2b51d54b8..74dc155e1b3b 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -868,7 +868,7 @@ static int fsl_qspi_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 	return ret;
 }
 
-static void fsl_qspi_write(struct spi_nor *nor, loff_t to,
+static ssize_t fsl_qspi_write(struct spi_nor *nor, loff_t to,
 		size_t len, size_t *retlen, const u_char *buf)
 {
 	struct fsl_qspi *q = nor->priv;
@@ -878,9 +878,10 @@ static void fsl_qspi_write(struct spi_nor *nor, loff_t to,
 
 	/* invalid the data in the AHB buffer. */
 	fsl_qspi_invalid(q);
+	return 0;
 }
 
-static int fsl_qspi_read(struct spi_nor *nor, loff_t from,
+static ssize_t fsl_qspi_read(struct spi_nor *nor, loff_t from,
 		size_t len, size_t *retlen, u_char *buf)
 {
 	struct fsl_qspi *q = nor->priv;
diff --git a/drivers/mtd/spi-nor/mtk-quadspi.c b/drivers/mtd/spi-nor/mtk-quadspi.c
index 8bed1a4cb79c..ab92ac0f6b2b 100644
--- a/drivers/mtd/spi-nor/mtk-quadspi.c
+++ b/drivers/mtd/spi-nor/mtk-quadspi.c
@@ -243,8 +243,8 @@ static void mt8173_nor_set_addr(struct mt8173_nor *mt8173_nor, u32 addr)
 	writeb(addr & 0xff, mt8173_nor->base + MTK_NOR_RADR3_REG);
 }
 
-static int mt8173_nor_read(struct spi_nor *nor, loff_t from, size_t length,
-			   size_t *retlen, u_char *buffer)
+static ssize_t mt8173_nor_read(struct spi_nor *nor, loff_t from, size_t length,
+			       size_t *retlen, u_char *buffer)
 {
 	int i, ret;
 	int addr = (int)from;
@@ -297,36 +297,46 @@ static int mt8173_nor_write_buffer(struct mt8173_nor *mt8173_nor, int addr,
 	return mt8173_nor_execute_cmd(mt8173_nor, MTK_NOR_WR_CMD);
 }
 
-static void mt8173_nor_write(struct spi_nor *nor, loff_t to, size_t len,
-			     size_t *retlen, const u_char *buf)
+static ssize_t mt8173_nor_write(struct spi_nor *nor, loff_t to, size_t len,
+				size_t *retlen, const u_char *buf)
 {
 	int ret;
 	struct mt8173_nor *mt8173_nor = nor->priv;
 
 	ret = mt8173_nor_write_buffer_enable(mt8173_nor);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_warn(mt8173_nor->dev, "write buffer enable failed!\n");
+		return ret;
+	}
 
 	while (len >= SFLASH_WRBUF_SIZE) {
 		ret = mt8173_nor_write_buffer(mt8173_nor, to, buf);
-		if (ret < 0)
+		if (ret < 0) {
 			dev_err(mt8173_nor->dev, "write buffer failed!\n");
+			return ret;
+		}
 		len -= SFLASH_WRBUF_SIZE;
 		to += SFLASH_WRBUF_SIZE;
 		buf += SFLASH_WRBUF_SIZE;
 		(*retlen) += SFLASH_WRBUF_SIZE;
 	}
 	ret = mt8173_nor_write_buffer_disable(mt8173_nor);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_warn(mt8173_nor->dev, "write buffer disable failed!\n");
+		return ret;
+	}
 
 	if (len) {
 		ret = mt8173_nor_write_single_byte(mt8173_nor, to, (int)len,
 						   (u8 *)buf);
-		if (ret < 0)
+		if (ret < 0) {
 			dev_err(mt8173_nor->dev, "write single byte failed!\n");
+			return ret;
+		}
 		(*retlen) += len;
 	}
+
+	return 0;
 }
 
 static int mt8173_nor_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
diff --git a/drivers/mtd/spi-nor/nxp-spifi.c b/drivers/mtd/spi-nor/nxp-spifi.c
index ae428cb0e04b..187adba5e69f 100644
--- a/drivers/mtd/spi-nor/nxp-spifi.c
+++ b/drivers/mtd/spi-nor/nxp-spifi.c
@@ -172,8 +172,8 @@ static int nxp_spifi_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 	return nxp_spifi_wait_for_cmd(spifi);
 }
 
-static int nxp_spifi_read(struct spi_nor *nor, loff_t from, size_t len,
-			  size_t *retlen, u_char *buf)
+static ssize_t nxp_spifi_read(struct spi_nor *nor, loff_t from, size_t len,
+			      size_t *retlen, u_char *buf)
 {
 	struct nxp_spifi *spifi = nor->priv;
 	int ret;
@@ -188,8 +188,8 @@ static int nxp_spifi_read(struct spi_nor *nor, loff_t from, size_t len,
 	return 0;
 }
 
-static void nxp_spifi_write(struct spi_nor *nor, loff_t to, size_t len,
-			    size_t *retlen, const u_char *buf)
+static ssize_t nxp_spifi_write(struct spi_nor *nor, loff_t to, size_t len,
+			       size_t *retlen, const u_char *buf)
 {
 	struct nxp_spifi *spifi = nor->priv;
 	u32 cmd;
@@ -197,7 +197,7 @@ static void nxp_spifi_write(struct spi_nor *nor, loff_t to, size_t len,
 
 	ret = nxp_spifi_set_memory_mode_off(spifi);
 	if (ret)
-		return;
+		return ret;
 
 	writel(to, spifi->io_base + SPIFI_ADDR);
 	*retlen += len;
@@ -212,7 +212,7 @@ static void nxp_spifi_write(struct spi_nor *nor, loff_t to, size_t len,
 	while (len--)
 		writeb(*buf++, spifi->io_base + SPIFI_DATA);
 
-	nxp_spifi_wait_for_cmd(spifi);
+	return nxp_spifi_wait_for_cmd(spifi);
 }
 
 static int nxp_spifi_erase(struct spi_nor *nor, loff_t offs)
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 157841dc3e99..f7ffec60a460 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1033,7 +1033,10 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 	ret = nor->read(nor, from, len, retlen, buf);
 
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_READ);
-	return ret;
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 3c36113a88e1..a21c9e4f1fdf 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -172,9 +172,9 @@ struct spi_nor {
 	int (*read_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len);
 	int (*write_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len);
 
-	int (*read)(struct spi_nor *nor, loff_t from,
+	ssize_t (*read)(struct spi_nor *nor, loff_t from,
 			size_t len, size_t *retlen, u_char *read_buf);
-	void (*write)(struct spi_nor *nor, loff_t to,
+	ssize_t (*write)(struct spi_nor *nor, loff_t to,
 			size_t len, size_t *retlen, const u_char *write_buf);
 	int (*erase)(struct spi_nor *nor, loff_t offs);
 
-- 
2.8.0.rc3.226.g39d4020
