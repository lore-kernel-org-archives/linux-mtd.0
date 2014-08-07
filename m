Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFCO5-0002zS-8n
 for linux-mtd@lists.infradead.org; Thu, 07 Aug 2014 01:21:01 +0000
Received: by mail-pa0-f48.google.com with SMTP id et14so4403154pad.35
 for <linux-mtd@lists.infradead.org>; Wed, 06 Aug 2014 18:20:40 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/8] mtd: spi-nor: move "wait-till-ready" checks into
 erase/write functions
Date: Wed,  6 Aug 2014 18:16:57 -0700
Message-Id: <1407374222-8448-4-git-send-email-computersforpeace@gmail.com>
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

We shouldn't have *every* function checking if a previous write is
complete; this should be done synchronously after each write/erase.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 36 +++++++++---------------------------
 1 file changed, 9 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d77c93232b76..227e2743203e 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -229,15 +229,8 @@ static int wait_till_ready(struct spi_nor *nor)
  */
 static int erase_chip(struct spi_nor *nor)
 {
-	int ret;
-
 	dev_dbg(nor->dev, " %lldKiB\n", (long long)(nor->mtd->size >> 10));
 
-	/* Wait until finished previous write command. */
-	ret = wait_till_ready(nor);
-	if (ret)
-		return ret;
-
 	/* Send write enable, then erase commands. */
 	write_enable(nor);
 
@@ -300,6 +293,10 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 			goto erase_err;
 		}
 
+		ret = spi_nor_wait_till_ready(nor);
+		if (ret)
+			goto erase_err;
+
 	/* REVISIT in some cases we could speed up erasing large regions
 	 * by using SPINOR_OP_SE instead of SPINOR_OP_BE_4K.  We may have set up
 	 * to use "small sector erase", but that's not always optimal.
@@ -315,6 +312,10 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 
 			addr += mtd->erasesize;
 			len -= mtd->erasesize;
+
+			ret = spi_nor_wait_till_ready(nor);
+			if (ret)
+				goto erase_err;
 		}
 	}
 
@@ -342,11 +343,6 @@ static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	if (ret)
 		return ret;
 
-	/* Wait until finished previous command */
-	ret = wait_till_ready(nor);
-	if (ret)
-		goto err;
-
 	status_old = read_sr(nor);
 
 	if (offset < mtd->size - (mtd->size / 2))
@@ -389,11 +385,6 @@ static int spi_nor_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	if (ret)
 		return ret;
 
-	/* Wait until finished previous command */
-	ret = wait_till_ready(nor);
-	if (ret)
-		goto err;
-
 	status_old = read_sr(nor);
 
 	if (offset+len > mtd->size - (mtd->size / 64))
@@ -710,11 +701,6 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 	if (ret)
 		return ret;
 
-	/* Wait until finished previous write command. */
-	ret = wait_till_ready(nor);
-	if (ret)
-		goto time_out;
-
 	write_enable(nor);
 
 	nor->sst_write_second = false;
@@ -786,11 +772,6 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	if (ret)
 		return ret;
 
-	/* Wait until finished previous write command. */
-	ret = wait_till_ready(nor);
-	if (ret)
-		goto write_err;
-
 	write_enable(nor);
 
 	page_offset = to & (nor->page_size - 1);
@@ -819,6 +800,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 		}
 	}
 
+	ret = spi_nor_wait_till_ready(nor);
 write_err:
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_WRITE);
 	return ret;
-- 
1.9.1
