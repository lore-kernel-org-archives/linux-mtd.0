Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayThX-0006RC-51
 for linux-mtd@lists.infradead.org; Fri, 06 May 2016 00:33:04 +0000
Received: by mail-pa0-x22b.google.com with SMTP id bt5so40909051pac.3
 for <linux-mtd@lists.infradead.org>; Thu, 05 May 2016 17:32:42 -0700 (PDT)
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
Subject: [PATCH v7 08/10] mtd: spi-nor: simplify write loop
Date: Thu,  5 May 2016 17:31:54 -0700
Message-Id: <1462494716-95312-9-git-send-email-computersforpeace@gmail.com>
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

The spi-nor write loop assumes that what is passed to the hardware
driver write() is what gets written.

When write() writes less than page size at once data is dropped on the
floor. Check the amount of data writen and exit if it does not match
requested amount.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v6 -> v7:
 * fix the page_offset calculation, as suggested by Han

 drivers/mtd/spi-nor/spi-nor.c | 58 +++++++++++++++++++------------------------
 1 file changed, 25 insertions(+), 33 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 937e8d6a28bb..ff96e1b54384 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1128,8 +1128,8 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	size_t *retlen, const u_char *buf)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
-	u32 page_offset, page_size, i;
-	int ret;
+	size_t page_offset, page_remain, i;
+	ssize_t ret;
 
 	dev_dbg(nor->dev, "to 0x%08x, len %zd\n", (u32)to, len);
 
@@ -1137,45 +1137,37 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	if (ret)
 		return ret;
 
-	write_enable(nor);
-
-	page_offset = to & (nor->page_size - 1);
+	for (i = 0; i < len; ) {
+		ssize_t written;
 
-	/* do all the bytes fit onto one page? */
-	if (page_offset + len <= nor->page_size) {
-		ret = nor->write(nor, to, len, buf);
-		if (ret < 0)
-			goto write_err;
-		*retlen += ret;
-	} else {
+		page_offset = (to + i) & (nor->page_size - 1);
+		WARN_ONCE(page_offset,
+			  "Writing at offset %zu into a NOR page. Writing partial pages may decrease reliability and increase wear of NOR flash.",
+			  page_offset);
 		/* the size of data remaining on the first page */
-		page_size = nor->page_size - page_offset;
-		ret = nor->write(nor, to, page_size, buf);
+		page_remain = min_t(size_t,
+				    nor->page_size - page_offset, len - i);
+
+		write_enable(nor);
+		ret = nor->write(nor, to + i, page_remain, buf + i);
 		if (ret < 0)
 			goto write_err;
-		*retlen += ret;
-
-		/* write everything in nor->page_size chunks */
-		for (i = ret; i < len; ) {
-			page_size = len - i;
-			if (page_size > nor->page_size)
-				page_size = nor->page_size;
-
-			ret = spi_nor_wait_till_ready(nor);
-			if (ret)
-				goto write_err;
+		written = ret;
 
-			write_enable(nor);
-
-			ret = nor->write(nor, to + i, page_size, buf + i);
-			if (ret < 0)
-				goto write_err;
-			*retlen += ret;
-			i += ret;
+		ret = spi_nor_wait_till_ready(nor);
+		if (ret)
+			goto write_err;
+		*retlen += written;
+		i += written;
+		if (written != page_remain) {
+			dev_err(nor->dev,
+				"While writing %zu bytes written %zd bytes\n",
+				page_remain, written);
+			ret = -EIO;
+			goto write_err;
 		}
 	}
 
-	ret = spi_nor_wait_till_ready(nor);
 write_err:
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_WRITE);
 	return ret;
-- 
2.8.0.rc3.226.g39d4020
