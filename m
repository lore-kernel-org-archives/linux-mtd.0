Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFCOA-0002zb-FF
 for linux-mtd@lists.infradead.org; Thu, 07 Aug 2014 01:21:06 +0000
Received: by mail-pd0-f177.google.com with SMTP id p10so4185046pdj.8
 for <linux-mtd@lists.infradead.org>; Wed, 06 Aug 2014 18:20:45 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [RFC 8/8] debug: mtd: spi-nor: add BUG_ON() prints to check for !ready
Date: Wed,  6 Aug 2014 18:17:02 -0700
Message-Id: <1407374222-8448-9-git-send-email-computersforpeace@gmail.com>
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

I hacked around the wait-till-ready sequencing just now, so let's add
some debug checks for now.

These probably shouldn't be included in mainline (or at least they
should be toned down to something less drastic; WARN_ON() perhaps?). I'm
just using these for test purposes.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
This patch is really just for testing. I don't think we really need it,
although I suppose some form of it couldn't hurt...

 drivers/mtd/spi-nor/spi-nor.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d08d9f8bb9bd..c2e53e02fe27 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -226,6 +226,8 @@ static int erase_chip(struct spi_nor *nor)
 {
 	dev_dbg(nor->dev, " %lldKiB\n", (long long)(nor->mtd->size >> 10));
 
+	BUG_ON(spi_nor_ready(nor) <= 0);
+
 	return nor->write_reg(nor, SPINOR_OP_CHIP_ERASE, NULL, 0, 0);
 }
 
@@ -278,6 +280,8 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	if (ret)
 		return ret;
 
+	BUG_ON(spi_nor_ready(nor) <= 0);
+
 	write_enable(nor);
 
 	/* whole-chip erase? */
@@ -339,6 +343,8 @@ static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	if (ret)
 		return ret;
 
+	BUG_ON(spi_nor_ready(nor) <= 0);
+
 	status_old = read_sr(nor);
 
 	if (offset < mtd->size - (mtd->size / 2))
@@ -381,6 +387,8 @@ static int spi_nor_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	if (ret)
 		return ret;
 
+	BUG_ON(spi_nor_ready(nor) <= 0);
+
 	status_old = read_sr(nor);
 
 	if (offset+len > mtd->size - (mtd->size / 64))
@@ -678,6 +686,8 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 	if (ret)
 		return ret;
 
+	BUG_ON(spi_nor_ready(nor) <= 0);
+
 	ret = nor->read(nor, from, len, retlen, buf);
 
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_READ);
@@ -697,6 +707,8 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 	if (ret)
 		return ret;
 
+	BUG_ON(spi_nor_ready(nor) <= 0);
+
 	write_enable(nor);
 
 	nor->sst_write_second = false;
@@ -768,6 +780,8 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	if (ret)
 		return ret;
 
+	BUG_ON(spi_nor_ready(nor) <= 0);
+
 	write_enable(nor);
 
 	page_offset = to & (nor->page_size - 1);
-- 
1.9.1
