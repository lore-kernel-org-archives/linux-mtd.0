Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayThS-0006Lf-T4
 for linux-mtd@lists.infradead.org; Fri, 06 May 2016 00:32:59 +0000
Received: by mail-pa0-x230.google.com with SMTP id xk12so41518355pac.0
 for <linux-mtd@lists.infradead.org>; Thu, 05 May 2016 17:32:38 -0700 (PDT)
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
Subject: [PATCH v7 04/10] mtd: mtk-quadspi: return amount of data transferred
 or error in read/write
Date: Thu,  5 May 2016 17:31:50 -0700
Message-Id: <1462494716-95312-5-git-send-email-computersforpeace@gmail.com>
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

Add checking of SPI transfer errors and return them from read/write
functions. Also return the amount of data transferred.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
New in v7

 drivers/mtd/spi-nor/mtk-quadspi.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/mtk-quadspi.c b/drivers/mtd/spi-nor/mtk-quadspi.c
index ab92ac0f6b2b..e85687126c25 100644
--- a/drivers/mtd/spi-nor/mtk-quadspi.c
+++ b/drivers/mtd/spi-nor/mtk-quadspi.c
@@ -261,7 +261,7 @@ static ssize_t mt8173_nor_read(struct spi_nor *nor, loff_t from, size_t length,
 			return ret;
 		buf[i] = readb(mt8173_nor->base + MTK_NOR_RDATA_REG);
 	}
-	return 0;
+	return length;
 }
 
 static int mt8173_nor_write_single_byte(struct mt8173_nor *mt8173_nor,
@@ -302,6 +302,7 @@ static ssize_t mt8173_nor_write(struct spi_nor *nor, loff_t to, size_t len,
 {
 	int ret;
 	struct mt8173_nor *mt8173_nor = nor->priv;
+	size_t i;
 
 	ret = mt8173_nor_write_buffer_enable(mt8173_nor);
 	if (ret < 0) {
@@ -309,13 +310,12 @@ static ssize_t mt8173_nor_write(struct spi_nor *nor, loff_t to, size_t len,
 		return ret;
 	}
 
-	while (len >= SFLASH_WRBUF_SIZE) {
+	for (i = 0; i + SFLASH_WRBUF_SIZE <= len; i += SFLASH_WRBUF_SIZE) {
 		ret = mt8173_nor_write_buffer(mt8173_nor, to, buf);
 		if (ret < 0) {
 			dev_err(mt8173_nor->dev, "write buffer failed!\n");
 			return ret;
 		}
-		len -= SFLASH_WRBUF_SIZE;
 		to += SFLASH_WRBUF_SIZE;
 		buf += SFLASH_WRBUF_SIZE;
 		(*retlen) += SFLASH_WRBUF_SIZE;
@@ -326,9 +326,9 @@ static ssize_t mt8173_nor_write(struct spi_nor *nor, loff_t to, size_t len,
 		return ret;
 	}
 
-	if (len) {
-		ret = mt8173_nor_write_single_byte(mt8173_nor, to, (int)len,
-						   (u8 *)buf);
+	if (i < len) {
+		ret = mt8173_nor_write_single_byte(mt8173_nor, to,
+						   (int)(len - i), (u8 *)buf);
 		if (ret < 0) {
 			dev_err(mt8173_nor->dev, "write single byte failed!\n");
 			return ret;
@@ -336,7 +336,7 @@ static ssize_t mt8173_nor_write(struct spi_nor *nor, loff_t to, size_t len,
 		(*retlen) += len;
 	}
 
-	return 0;
+	return len;
 }
 
 static int mt8173_nor_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
-- 
2.8.0.rc3.226.g39d4020
