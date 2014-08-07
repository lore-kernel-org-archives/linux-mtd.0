Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFCO3-0002zQ-Qa
 for linux-mtd@lists.infradead.org; Thu, 07 Aug 2014 01:21:00 +0000
Received: by mail-pa0-f43.google.com with SMTP id lf10so4410078pab.16
 for <linux-mtd@lists.infradead.org>; Wed, 06 Aug 2014 18:20:38 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/8] mtd: spi-nor: eliminate duplicate spi_nor_wait_till_{,
 fsr}_ready() code
Date: Wed,  6 Aug 2014 18:16:55 -0700
Message-Id: <1407374222-8448-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1407374222-8448-1-git-send-email-computersforpeace@gmail.com>
References: <1407374222-8448-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, zajec5@gmail.com,
 Graham Moore <grmoore@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These functions were near-carbon-copies due to a small per-flash quirk.
Let's add a new spi_nor::flags bitfield to support these types of
quirks.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Graham Moore <grmoore@altera.com>
Cc: Huang Shijie <b32955@freescale.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 66 ++++++++++++++++++++++---------------------
 include/linux/mtd/spi-nor.h   |  6 ++++
 2 files changed, 40 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index b5ad6bebf5e7..5825b8a12cee 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -163,48 +163,51 @@ static inline int set_4byte(struct spi_nor *nor, u32 jedec_id, int enable)
 		return nor->write_reg(nor, SPINOR_OP_BRWR, nor->cmd_buf, 1, 0);
 	}
 }
-
-static int spi_nor_wait_till_ready(struct spi_nor *nor)
+static inline int spi_nor_sr_ready(struct spi_nor *nor)
 {
-	unsigned long deadline;
-	int sr;
-
-	deadline = jiffies + MAX_READY_WAIT_JIFFIES;
-
-	do {
-		cond_resched();
+	int sr = read_sr(nor);
+	if (sr < 0)
+		return sr;
+	else
+		return !(sr & SR_WIP);
+}
 
-		sr = read_sr(nor);
-		if (sr < 0)
-			break;
-		else if (!(sr & SR_WIP))
-			return 0;
-	} while (!time_after_eq(jiffies, deadline));
+static inline int spi_nor_fsr_ready(struct spi_nor *nor)
+{
+	int fsr = read_fsr(nor);
+	if (fsr < 0)
+		return fsr;
+	else
+		return fsr & FSR_READY;
+}
 
-	return -ETIMEDOUT;
+static int spi_nor_ready(struct spi_nor *nor)
+{
+	int sr, fsr;
+	sr = spi_nor_sr_ready(nor);
+	if (sr < 0)
+		return sr;
+	fsr = nor->flags & SNOR_F_USE_FSR ? spi_nor_fsr_ready(nor) : 1;
+	if (fsr < 0)
+		return sr;
+	return sr && fsr;
 }
 
-static int spi_nor_wait_till_fsr_ready(struct spi_nor *nor)
+static int spi_nor_wait_till_ready(struct spi_nor *nor)
 {
 	unsigned long deadline;
-	int sr;
-	int fsr;
+	int ret;
 
 	deadline = jiffies + MAX_READY_WAIT_JIFFIES;
 
 	do {
 		cond_resched();
 
-		sr = read_sr(nor);
-		if (sr < 0) {
-			break;
-		} else if (!(sr & SR_WIP)) {
-			fsr = read_fsr(nor);
-			if (fsr < 0)
-				break;
-			if (fsr & FSR_READY)
-				return 0;
-		}
+		ret = spi_nor_ready(nor);
+		if (ret < 0)
+			return ret;
+		if (ret)
+			return 0;
 	} while (!time_after_eq(jiffies, deadline));
 
 	return -ETIMEDOUT;
@@ -1014,9 +1017,8 @@ int spi_nor_scan(struct spi_nor *nor, const struct spi_device_id *id,
 	else
 		mtd->_write = spi_nor_write;
 
-	if ((info->flags & USE_FSR) &&
-	    nor->wait_till_ready == spi_nor_wait_till_ready)
-		nor->wait_till_ready = spi_nor_wait_till_fsr_ready;
+	if (info->flags & USE_FSR)
+		nor->flags |= SNOR_F_USE_FSR;
 
 	/* prefer "small sector" erase if possible */
 	if (info->flags & SECT_4K) {
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 9e6294f32ba8..603ac0306663 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -116,6 +116,10 @@ enum spi_nor_ops {
 	SPI_NOR_OPS_UNLOCK,
 };
 
+enum spi_nor_option_flags {
+	SNOR_F_USE_FSR		= BIT(0),
+};
+
 /**
  * struct spi_nor - Structure for defining a the SPI NOR layer
  * @mtd:		point to a mtd_info structure
@@ -129,6 +133,7 @@ enum spi_nor_ops {
  * @program_opcode:	the program opcode
  * @flash_read:		the mode of the read
  * @sst_write_second:	used by the SST write operation
+ * @flags:		flag options for the current SPI-NOR (SNOR_F_*)
  * @cfg:		used by the read_xfer/write_xfer
  * @cmd_buf:		used by the write_reg
  * @prepare:		[OPTIONAL] do some preparations for the
@@ -160,6 +165,7 @@ struct spi_nor {
 	u8			program_opcode;
 	enum read_mode		flash_read;
 	bool			sst_write_second;
+	u32			flags;
 	struct spi_nor_xfer_cfg	cfg;
 	u8			cmd_buf[SPI_NOR_MAX_CMD_SIZE];
 
-- 
1.9.1
