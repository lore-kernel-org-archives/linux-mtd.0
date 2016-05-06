Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayThT-0006NF-TF
 for linux-mtd@lists.infradead.org; Fri, 06 May 2016 00:33:01 +0000
Received: by mail-pa0-x233.google.com with SMTP id bt5so40908788pac.3
 for <linux-mtd@lists.infradead.org>; Thu, 05 May 2016 17:32:40 -0700 (PDT)
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
Subject: [PATCH v7 06/10] mtd: spi-nor: check return value from write
Date: Thu,  5 May 2016 17:31:52 -0700
Message-Id: <1462494716-95312-7-git-send-email-computersforpeace@gmail.com>
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

SPI NOR hardware drivers now return useful value from their write
functions so check them.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v6 -> v7:
 * no change

 drivers/mtd/spi-nor/spi-nor.c | 45 ++++++++++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index f7ffec60a460..dd5c9eb9b9e0 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1062,10 +1062,14 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 		nor->program_opcode = SPINOR_OP_BP;
 
 		/* write one byte. */
-		nor->write(nor, to, 1, retlen, buf);
+		ret = nor->write(nor, to, 1, retlen, buf);
+		if (ret < 0)
+			goto sst_write_err;
+		WARN(ret != 1, "While writing 1 byte written %i bytes\n",
+		     (int)ret);
 		ret = spi_nor_wait_till_ready(nor);
 		if (ret)
-			goto time_out;
+			goto sst_write_err;
 	}
 	to += actual;
 
@@ -1074,10 +1078,14 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 		nor->program_opcode = SPINOR_OP_AAI_WP;
 
 		/* write two bytes. */
-		nor->write(nor, to, 2, retlen, buf + actual);
+		ret = nor->write(nor, to, 2, retlen, buf + actual);
+		if (ret < 0)
+			goto sst_write_err;
+		WARN(ret != 2, "While writing 2 bytes written %i bytes\n",
+		     (int)ret);
 		ret = spi_nor_wait_till_ready(nor);
 		if (ret)
-			goto time_out;
+			goto sst_write_err;
 		to += 2;
 		nor->sst_write_second = true;
 	}
@@ -1086,21 +1094,24 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 	write_disable(nor);
 	ret = spi_nor_wait_till_ready(nor);
 	if (ret)
-		goto time_out;
+		goto sst_write_err;
 
 	/* Write out trailing byte if it exists. */
 	if (actual != len) {
 		write_enable(nor);
 
 		nor->program_opcode = SPINOR_OP_BP;
-		nor->write(nor, to, 1, retlen, buf + actual);
-
+		ret = nor->write(nor, to, 1, retlen, buf + actual);
+		if (ret < 0)
+			goto sst_write_err;
+		WARN(ret != 1, "While writing 1 byte written %i bytes\n",
+		     (int)ret);
 		ret = spi_nor_wait_till_ready(nor);
 		if (ret)
-			goto time_out;
+			goto sst_write_err;
 		write_disable(nor);
 	}
-time_out:
+sst_write_err:
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_WRITE);
 	return ret;
 }
@@ -1129,14 +1140,18 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 	/* do all the bytes fit onto one page? */
 	if (page_offset + len <= nor->page_size) {
-		nor->write(nor, to, len, retlen, buf);
+		ret = nor->write(nor, to, len, retlen, buf);
+		if (ret < 0)
+			goto write_err;
 	} else {
 		/* the size of data remaining on the first page */
 		page_size = nor->page_size - page_offset;
-		nor->write(nor, to, page_size, retlen, buf);
+		ret = nor->write(nor, to, page_size, retlen, buf);
+		if (ret < 0)
+			goto write_err;
 
 		/* write everything in nor->page_size chunks */
-		for (i = page_size; i < len; i += page_size) {
+		for (i = ret; i < len; ) {
 			page_size = len - i;
 			if (page_size > nor->page_size)
 				page_size = nor->page_size;
@@ -1147,7 +1162,11 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 			write_enable(nor);
 
-			nor->write(nor, to + i, page_size, retlen, buf + i);
+			ret = nor->write(nor, to + i, page_size, retlen,
+					 buf + i);
+			if (ret < 0)
+				goto write_err;
+			i += ret;
 		}
 	}
 
-- 
2.8.0.rc3.226.g39d4020
