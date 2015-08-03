Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMKlk-0000xi-9R
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2015 18:47:29 +0000
Date: 3 Aug 2015 18:39:03 -0000
Message-Id: <35f40bc5c10ed649986d91bd58f6cacf49d6b8c7.1438626500.git.hramrach@gmail.com>
In-Reply-To: <cover.1438626500.git.hramrach@gmail.com>
References: <cover.1438626500.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH v2 6/6] mtd: spi-nor: simplify write loop
To: David Woodhouse <dwmw2@infradead.org>,
  Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
  "Rafał Miłecki" <zajec5@gmail.com>, Michal Suchanek <hramrach@gmail.com>,
  Huang Shijie <b32955@freescale.com>, Ben Hutchings <ben@decadent.org.uk>,
  Marek Vasut <marex@denx.de>, Gabor Juhos <juhosg@openwrt.org>,
  "Bean Huo 霍斌斌" <beanhuo@micron.com>, linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org, , Hou Zhiqiang <B48286@freescale.com>,
  shijie.huang@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The spi-nor write loop assumes that what is passed to the hardware
driver write() is what gets written.

When write() writes less than page size at once data is dropped on the
floor. Check the amount of data writen.

This also means that write can start mid-page any time so there is
no special case for first page.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 48 ++++++++++++++-----------------------------
 1 file changed, 15 insertions(+), 33 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 837e3df..e0ae9cf 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -836,7 +836,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	size_t *retlen, const u_char *buf)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
-	u32 page_offset, page_size, i;
+	size_t page_offset, page_remain, i;
 	int ret;
 
 	dev_dbg(nor->dev, "to 0x%08x, len %zd\n", (u32)to, len);
@@ -845,45 +845,27 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	if (ret)
 		return ret;
 
-	write_enable(nor);
-
-	page_offset = to & (nor->page_size - 1);
+	for (i = 0; i < len; ) {
+		int written;
 
-	/* do all the bytes fit onto one page? */
-	if (page_offset + len <= nor->page_size) {
-		ret = nor->write(nor, to, len, buf);
-		if (ret < 0)
-			goto write_err;
-		*retlen += ret;
-	} else {
+		page_offset = to & (nor->page_size - 1);
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
-		}
+		ret = spi_nor_wait_till_ready(nor);
+		if (ret)
+			goto write_err;
+		*retlen += written;
+		i += written;
 	}
 
-	ret = spi_nor_wait_till_ready(nor);
 write_err:
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_WRITE);
 	return ret;
-- 
2.1.4
