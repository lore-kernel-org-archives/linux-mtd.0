Received: from mail-pd0-f173.google.com ([209.85.192.173])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZS07f-00060o-Le
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 09:57:32 +0000
Received: by pdrh1 with SMTP id h1so80003978pdr.0
 for <linux-mtd@lists.infradead.org>; Wed, 19 Aug 2015 02:57:10 -0700 (PDT)
From: Jagan Teki <jteki@openedev.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Jagan Teki <jteki@openedev.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>
Subject: [PATCH 2/3] mtd: spi-nor: Zap unneeded write_enable from write_reg
Date: Wed, 19 Aug 2015 15:26:44 +0530
Message-Id: <1439978205-6092-2-git-send-email-jteki@openedev.com>
In-Reply-To: <1439978205-6092-1-git-send-email-jteki@openedev.com>
References: <1439978205-6092-1-git-send-email-jteki@openedev.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since write enabling shall do with buf and len without
need of exctra write_enable argument, hence removed the
same from write_reg.

Signed-off-by: Jagan Teki <jteki@openedev.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Han Xu <han.xu@freescale.com>
---
 drivers/mtd/devices/m25p80.c      |  3 +--
 drivers/mtd/spi-nor/fsl-quadspi.c |  3 +--
 drivers/mtd/spi-nor/spi-nor.c     | 16 ++++++++--------
 include/linux/mtd/spi-nor.h       |  3 +--
 4 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 9cd3631..ab69d2d 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -62,8 +62,7 @@ static int m25p_cmdsz(struct spi_nor *nor)
 	return 1 + nor->addr_width;
 }
 
-static int m25p80_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len,
-			int wr_en)
+static int m25p80_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 {
 	struct m25p *flash = nor->priv;
 	struct spi_device *spi = flash->spi;
diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index d32b7e0..2c8c578 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -798,8 +798,7 @@ static int fsl_qspi_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 	return 0;
 }
 
-static int fsl_qspi_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len,
-			int write_enable)
+static int fsl_qspi_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 {
 	struct fsl_qspi *q = nor->priv;
 	int ret;
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 3e198b4..f954d03 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -143,7 +143,7 @@ static inline int spi_nor_read_dummy_cycles(struct spi_nor *nor)
 static inline int write_sr(struct spi_nor *nor, u8 val)
 {
 	nor->cmd_buf[0] = val;
-	return nor->write_reg(nor, SPINOR_OP_WRSR, nor->cmd_buf, 1, 0);
+	return nor->write_reg(nor, SPINOR_OP_WRSR, nor->cmd_buf, 1);
 }
 
 /*
@@ -152,7 +152,7 @@ static inline int write_sr(struct spi_nor *nor, u8 val)
  */
 static inline int write_enable(struct spi_nor *nor)
 {
-	return nor->write_reg(nor, SPINOR_OP_WREN, NULL, 0, 0);
+	return nor->write_reg(nor, SPINOR_OP_WREN, NULL, 0);
 }
 
 /*
@@ -160,7 +160,7 @@ static inline int write_enable(struct spi_nor *nor)
  */
 static inline int write_disable(struct spi_nor *nor)
 {
-	return nor->write_reg(nor, SPINOR_OP_WRDI, NULL, 0, 0);
+	return nor->write_reg(nor, SPINOR_OP_WRDI, NULL, 0);
 }
 
 static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
@@ -186,7 +186,7 @@ static inline int set_4byte(struct spi_nor *nor, struct flash_info *info,
 			write_enable(nor);
 
 		cmd = enable ? SPINOR_OP_EN4B : SPINOR_OP_EX4B;
-		status = nor->write_reg(nor, cmd, NULL, 0, 0);
+		status = nor->write_reg(nor, cmd, NULL, 0);
 		if (need_wren)
 			write_disable(nor);
 
@@ -194,7 +194,7 @@ static inline int set_4byte(struct spi_nor *nor, struct flash_info *info,
 	default:
 		/* Spansion style */
 		nor->cmd_buf[0] = enable << 7;
-		return nor->write_reg(nor, SPINOR_OP_BRWR, nor->cmd_buf, 1, 0);
+		return nor->write_reg(nor, SPINOR_OP_BRWR, nor->cmd_buf, 1);
 	}
 }
 static inline int spi_nor_sr_ready(struct spi_nor *nor)
@@ -265,7 +265,7 @@ static int erase_chip(struct spi_nor *nor)
 {
 	dev_dbg(nor->dev, " %lldKiB\n", (long long)(nor->mtd->size >> 10));
 
-	return nor->write_reg(nor, SPINOR_OP_CHIP_ERASE, NULL, 0, 0);
+	return nor->write_reg(nor, SPINOR_OP_CHIP_ERASE, NULL, 0);
 }
 
 static int spi_nor_lock_and_prep(struct spi_nor *nor, enum spi_nor_ops ops)
@@ -894,7 +894,7 @@ static int write_sr_cr(struct spi_nor *nor, u16 val)
 	nor->cmd_buf[0] = val & 0xff;
 	nor->cmd_buf[1] = (val >> 8);
 
-	return nor->write_reg(nor, SPINOR_OP_WRSR, nor->cmd_buf, 2, 0);
+	return nor->write_reg(nor, SPINOR_OP_WRSR, nor->cmd_buf, 2);
 }
 
 static int spansion_quad_enable(struct spi_nor *nor)
@@ -936,7 +936,7 @@ static int micron_quad_enable(struct spi_nor *nor)
 
 	/* set EVCR, enable quad I/O */
 	nor->cmd_buf[0] = val & ~EVCR_QUAD_EN_MICRON;
-	ret = nor->write_reg(nor, SPINOR_OP_WD_EVCR, nor->cmd_buf, 1, 0);
+	ret = nor->write_reg(nor, SPINOR_OP_WD_EVCR, nor->cmd_buf, 1);
 	if (ret < 0) {
 		dev_err(nor->dev, "error while writing EVCR register\n");
 		return ret;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index e540952..c5a58c4 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -182,8 +182,7 @@ struct spi_nor {
 	int (*write_xfer)(struct spi_nor *nor, struct spi_nor_xfer_cfg *cfg,
 			  u8 *buf, size_t len);
 	int (*read_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len);
-	int (*write_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len,
-			int write_enable);
+	int (*write_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len);
 
 	int (*read)(struct spi_nor *nor, loff_t from,
 			size_t len, size_t *retlen, u_char *read_buf);
-- 
1.9.1
