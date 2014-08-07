Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFCO7-0002zZ-GG
 for linux-mtd@lists.infradead.org; Thu, 07 Aug 2014 01:21:04 +0000
Received: by mail-pd0-f176.google.com with SMTP id y10so4240397pdj.35
 for <linux-mtd@lists.infradead.org>; Wed, 06 Aug 2014 18:20:43 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 6/8] mtd: spi-nor: drop replaceable wait-till-ready function
 pointer
Date: Wed,  6 Aug 2014 18:17:00 -0700
Message-Id: <1407374222-8448-7-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1407374222-8448-1-git-send-email-computersforpeace@gmail.com>
References: <1407374222-8448-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, zajec5@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We don't need to expose a 'wait-till-ready' interface to drivers. Status
register polling should be handled by the core spi-nor.c library, and as
of now, I see no need to provide a special driver-specific hook for it.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 27 ++++++++++-----------------
 include/linux/mtd/spi-nor.h   |  2 --
 2 files changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 227e2743203e..874e6d9a0b02 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -193,6 +193,10 @@ static int spi_nor_ready(struct spi_nor *nor)
 	return sr && fsr;
 }
 
+/*
+ * Service routine to read status register until ready, or timeout occurs.
+ * Returns non-zero if error.
+ */
 static int spi_nor_wait_till_ready(struct spi_nor *nor)
 {
 	unsigned long deadline;
@@ -214,15 +218,6 @@ static int spi_nor_wait_till_ready(struct spi_nor *nor)
 }
 
 /*
- * Service routine to read status register until ready, or timeout occurs.
- * Returns non-zero if error.
- */
-static int wait_till_ready(struct spi_nor *nor)
-{
-	return nor->wait_till_ready(nor);
-}
-
-/*
  * Erase the whole flash memory
  *
  * Returns 0 if successful, non-zero otherwise.
@@ -712,7 +707,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 		/* write one byte. */
 		nor->write(nor, to, 1, retlen, buf);
-		ret = wait_till_ready(nor);
+		ret = spi_nor_wait_till_ready(nor);
 		if (ret)
 			goto time_out;
 	}
@@ -724,7 +719,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 		/* write two bytes. */
 		nor->write(nor, to, 2, retlen, buf + actual);
-		ret = wait_till_ready(nor);
+		ret = spi_nor_wait_till_ready(nor);
 		if (ret)
 			goto time_out;
 		to += 2;
@@ -733,7 +728,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 	nor->sst_write_second = false;
 
 	write_disable(nor);
-	ret = wait_till_ready(nor);
+	ret = spi_nor_wait_till_ready(nor);
 	if (ret)
 		goto time_out;
 
@@ -744,7 +739,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 		nor->program_opcode = SPINOR_OP_BP;
 		nor->write(nor, to, 1, retlen, buf + actual);
 
-		ret = wait_till_ready(nor);
+		ret = spi_nor_wait_till_ready(nor);
 		if (ret)
 			goto time_out;
 		write_disable(nor);
@@ -790,7 +785,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 			if (page_size > nor->page_size)
 				page_size = nor->page_size;
 
-			ret = wait_till_ready(nor);
+			ret = spi_nor_wait_till_ready(nor);
 			if (ret)
 				goto write_err;
 
@@ -816,7 +811,7 @@ static int macronix_quad_enable(struct spi_nor *nor)
 	nor->cmd_buf[0] = val | SR_QUAD_EN_MX;
 	nor->write_reg(nor, SPINOR_OP_WRSR, nor->cmd_buf, 1, 0);
 
-	if (wait_till_ready(nor))
+	if (spi_nor_wait_till_ready(nor))
 		return 1;
 
 	ret = read_sr(nor);
@@ -898,8 +893,6 @@ static int spi_nor_check(struct spi_nor *nor)
 
 	if (!nor->read_id)
 		nor->read_id = spi_nor_read_id;
-	if (!nor->wait_till_ready)
-		nor->wait_till_ready = spi_nor_wait_till_ready;
 
 	return 0;
 }
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 603ac0306663..d7c12506d7ed 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -146,7 +146,6 @@ enum spi_nor_option_flags {
  * @write_reg:		[DRIVER-SPECIFIC] write data to the register
  * @read_id:		[REPLACEABLE] read out the ID data, and find
  *			the proper spi_device_id
- * @wait_till_ready:	[REPLACEABLE] wait till the NOR becomes ready
  * @read:		[DRIVER-SPECIFIC] read data from the SPI NOR
  * @write:		[DRIVER-SPECIFIC] write data to the SPI NOR
  * @erase:		[DRIVER-SPECIFIC] erase a sector of the SPI NOR
@@ -179,7 +178,6 @@ struct spi_nor {
 	int (*write_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len,
 			int write_enable);
 	const struct spi_device_id *(*read_id)(struct spi_nor *nor);
-	int (*wait_till_ready)(struct spi_nor *nor);
 
 	int (*read)(struct spi_nor *nor, loff_t from,
 			size_t len, size_t *retlen, u_char *read_buf);
-- 
1.9.1
