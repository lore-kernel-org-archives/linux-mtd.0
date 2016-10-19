Received: from mail-bn3nam01on070c.outbound.protection.outlook.com
 ([2a01:111:f400:fe41::70c]
 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bwz5s-0003ip-Vd
 for linux-mtd@lists.infradead.org; Wed, 19 Oct 2016 22:12:19 +0000
From: =?UTF-8?q?Jo=C3=ABl=20Esponde?= <joel.esponde@honeywell.com>
To: <linux-mtd@lists.infradead.org>
CC: =?UTF-8?q?Jo=C3=ABl=20Esponde?= <joel.esponde@honeywell.com>
Subject: [PATCH] mtd: spi-nor: fixed spansion quad enable
Date: Thu, 20 Oct 2016 00:11:18 +0200
Message-ID: <1476915078-98841-1-git-send-email-joel.esponde@honeywell.com>
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

With the S25FL127S nor flash part, each writing to the configuration 
register takes hundreds of ms. During that  time, no more accesses to 
the flash should be done (even reads).

This commit adds:
- a pre check of the quad enable bit to avoid a useless and time 
  consuming writing to the flash,
- a wait loop after the register writing until the flash finishes its 
  work.

This issue could make rootfs mounting fail when the latter was done too 
much closely to this quad enable bit setting step. And in this case, a 
driver as UBIFS may try to recover the filesystem and may broke it 
completely.
---
 drivers/mtd/spi-nor/spi-nor.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d0fc165..df43cd7 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1246,18 +1246,41 @@ static int spansion_quad_enable(struct spi_nor *nor)
 	int ret;
 	int quad_en = CR_QUAD_EN_SPAN << 8;
 
+	/* check quad enable bit
+	 * as S25FL127S takes 200 ms to execute each write of SR & CR 
+	 * registers even if data is the same, write step will be shorted 
+	 * if not needed
+	 */
+	ret = read_cr(nor);
+	if (ret < 0) {
+		dev_err(nor->dev, "error %d reading CR\n", ret);
+		return ret;
+	} 
+	if (ret & CR_QUAD_EN_SPAN) {
+		/* quad enable bit is already set */
+		return 0;
+	}
+
+	/* set SR & CR, enable quad I/O */
 	write_enable(nor);
 
 	ret = write_sr_cr(nor, quad_en);
 	if (ret < 0) {
-		dev_err(nor->dev,
-			"error while writing configuration register\n");
+		dev_err(nor->dev, "error while writing SR and CR registers\n");
 		return -EINVAL;
 	}
 
-	/* read back and check it */
+	ret = spi_nor_wait_till_ready(nor);
+	if (ret)
+		return ret;
+	
+	/* read CR and check it */
 	ret = read_cr(nor);
-	if (!(ret > 0 && (ret & CR_QUAD_EN_SPAN))) {
+	if (ret < 0) {
+		dev_err(nor->dev, "error %d reading CR\n", ret);
+		return ret;
+	}
+	if (!(ret & CR_QUAD_EN_SPAN)) {
 		dev_err(nor->dev, "Spansion Quad bit not set\n");
 		return -EINVAL;
 	}
-- 
2.7.4
