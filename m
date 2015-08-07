Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNnxm-0006c8-3g
 for linux-mtd@lists.infradead.org; Fri, 07 Aug 2015 20:10:01 +0000
Date: 7 Aug 2015 20:01:32 -0000
Message-Id: <724d829f0cd3bd21fe0f1ee696cefb29e90dd208.1438977111.git.hramrach@gmail.com>
In-Reply-To: <cover.1438977111.git.hramrach@gmail.com>
References: <cover.1438977111.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH v3 4/6] mtd: spi-nor: check return value from read/write
To: David Woodhouse <dwmw2@infradead.org>,
  Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
  "Rafał Miłecki" <zajec5@gmail.com>, Michal Suchanek <hramrach@gmail.com>,
  Alison Chaiken <alison_chaiken@mentor.com>, Marek Vasut <marex@denx.de>,
  Ben Hutchings <ben@decadent.org.uk>, Huang Shijie <b32955@freescale.com>,
  Gabor Juhos <juhosg@openwrt.org>, "Bean Huo 霍斌斌" <beanhuo@micron.com>,
  linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, ,
  Hou Zhiqiang <B48286@freescale.com>, shijie.huang@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SPI NOR hardware drivers now return useful value from their read/write
functions so check them.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 50 +++++++++++++++++++++++++++++++------------
 1 file changed, 36 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d78831b..5116bbd 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -741,7 +741,10 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 	ret = nor->read(nor, from, len, retlen, buf);
 
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_READ);
-	return ret;
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
@@ -767,10 +770,14 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
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
 
@@ -779,10 +786,14 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
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
@@ -791,21 +802,24 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
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
@@ -834,14 +848,18 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
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
@@ -852,7 +870,11 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
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
2.1.4
