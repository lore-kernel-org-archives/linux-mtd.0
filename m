Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YnpWv-0005aQ-RB
 for linux-mtd@lists.infradead.org; Thu, 30 Apr 2015 14:33:35 +0000
Message-Id: <50c40ef17ab6566f35ef5a4426bf23567f896db7.1430403750.git.hramrach@gmail.com>
In-Reply-To: <cover.1430403750.git.hramrach@gmail.com>
References: <cover.1430403750.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Thu, 30 Apr 2015 15:38:50 +0200
Subject: [PATCH 2/3] MTD: spi-nor: check for short writes in spi_nor_write.
To: linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
  Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
  Ian Campbell <ijc+devicetree@hellion.org.uk>,
  Kumar Gala <galak@codeaurora.org>, David Woodhouse <dwmw2@infradead.org>,
  Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marex@denx.de>,
  Huang Shijie <b32955@freescale.com>, Michal Suchanek <hramrach@gmail.com>,
  "Rafał Miłecki" <zajec5@gmail.com>, Ben Hutchings <ben@decadent.org.uk>,
  Alison Chaiken <alison_chaiken@mentor.com>,
  Mika Westerberg <mika.westerberg@linux.intel.com>,
  "Bean Huo 霍斌斌 \(beanhuo\)" <beanhuo@micron.com>,
  "grmoore@altera.com" <grmoore@altera.com>, devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

My SPI controller driver does not support DMA so writes are truncated to
FIFO size.
Check the amount of data actually written by the driver.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 42 +++++++++++++++++-------------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 14a5d23..75904b5 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -807,7 +807,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	size_t *retlen, const u_char *buf)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
-	u32 page_offset, page_size, i;
+	u32 page_offset, page_remainder, page_size, i;
 	int ret;
 
 	dev_dbg(nor->dev, "to 0x%08x, len %zd\n", (u32)to, len);
@@ -816,36 +816,28 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	if (ret)
 		return ret;
 
-	write_enable(nor);
-
-	page_offset = to & (nor->page_size - 1);
-
-	/* do all the bytes fit onto one page? */
-	if (page_offset + len <= nor->page_size) {
-		nor->write(nor, to, len, retlen, buf);
-	} else {
-		/* the size of data remaining on the first page */
-		page_size = nor->page_size - page_offset;
-		nor->write(nor, to, page_size, retlen, buf);
+	/* write everything in nor->page_size chunks */
+	/* check the size of data actually written */
+	for (i = 0; i < len; i += *retlen) {
+		page_size = len - i;
+		page_offset = (to + i) & (nor->page_size - 1);
+		page_remainder = nor->page_size - page_offset;
+		if (page_size > nor->page_size)
+			page_size = nor->page_size;
+		if (page_remainder && (page_size > page_remainder))
+			page_size = page_remainder;
 
-		/* write everything in nor->page_size chunks */
-		for (i = page_size; i < len; i += page_size) {
-			page_size = len - i;
-			if (page_size > nor->page_size)
-				page_size = nor->page_size;
-
-			ret = spi_nor_wait_till_ready(nor);
-			if (ret)
-				goto write_err;
+		write_enable(nor);
 
-			write_enable(nor);
+		nor->write(nor, to + i, page_size, retlen, buf + i);
 
-			nor->write(nor, to + i, page_size, retlen, buf + i);
-		}
+		ret = spi_nor_wait_till_ready(nor);
+		if (ret)
+			goto write_err;
 	}
 
-	ret = spi_nor_wait_till_ready(nor);
 write_err:
+	*retlen = i;
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_WRITE);
 	return ret;
 }
-- 
2.1.4
