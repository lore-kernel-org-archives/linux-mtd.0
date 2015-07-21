Received: from mail-by2on0107.outbound.protection.outlook.com
 ([207.46.100.107] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHWFd-0003jA-SM
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 12:02:26 +0000
From: Zhiqiang Hou <B48286@freescale.com>
To: <linux-mtd@lists.infradead.org>, <computersforpeace@gmail.com>,
 <dwmw2@infradead.org>
CC: <b21284@freescale.com>, Hou Zhiqiang <B48286@freescale.com>
Subject: [PATCH] RFC: mtd/spi-nor: add checking for the spi_nor_read
Date: Tue, 21 Jul 2015 19:57:08 +0800
Message-ID: <1437479828-30826-1-git-send-email-B48286@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Hou Zhiqiang <B48286@freescale.com>

Compare the var retlen with len to ensure the read operation successful.

There are some SPI controllers that have a maximum transfer length,
e.g. Freescale eSPI controller is able to transfer 0x10000 Bytes each time.
If the spi_nor_read diliver a transaction length that excced the ability of
the SPI controller, there should be multiple read operation to make sure
this transaction completion.

Signed-off-by: Hou Zhiqiang <B48286@freescale.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index fbc5035..ec10cd1 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -715,6 +715,8 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
 	int ret;
+	size_t cnt = 0;
+	u_char *cur = buf;
 
 	dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
 
@@ -722,8 +724,16 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 	if (ret)
 		return ret;
 
-	ret = nor->read(nor, from, len, retlen, buf);
-
+	*retlen = 0;
+	while (len > 0) {
+		ret = nor->read(nor, from, len, &cnt, cur);
+		if (ret < 0)
+			break;
+		len -= cnt;
+		cur += cnt;
+		*retlen += cnt;
+		from += cnt;
+	}
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_READ);
 	return ret;
 }
-- 
2.1.0.27.g96db324
