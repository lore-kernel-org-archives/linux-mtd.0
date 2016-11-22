Received: from mail-bn3nam01on0128.outbound.protection.outlook.com
 ([104.47.33.128] helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c9JVr-0001mf-Mw
 for linux-mtd@lists.infradead.org; Tue, 22 Nov 2016 22:26:04 +0000
From: =?UTF-8?q?Jo=C3=ABl=20Esponde?= <joel.esponde@honeywell.com>
To: <linux-mtd@lists.infradead.org>
CC: =?UTF-8?q?Jo=C3=ABl=20Esponde?= <joel.esponde@honeywell.com>
Subject: [PATCH v2] mtd: spi-nor: fixed spansion quad enable
Date: Tue, 22 Nov 2016 23:24:28 +0100
Message-ID: <1479853468-119195-1-git-send-email-joel.esponde@honeywell.com>
In-Reply-To: <1476971026-9665-1-git-send-email-joel.esponde@honeywell.com>
References: <1476971026-9665-1-git-send-email-joel.esponde@honeywell.com>
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

With the S25FL127S nor flash part, each writing to the configuration register takes hundreds of ms. During that  time, no more accesses to the flash should be done (even reads).

This commit adds a wait loop after the register writing until the flash finishes its work.

This issue could make rootfs mounting fail when the latter was done too much closely to this quad enable bit setting step. And in this case, a driver as UBIFS may try to recover the filesystem and may broke it completely.
---
 drivers/mtd/spi-nor/spi-nor.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d0fc165..a945122 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1255,7 +1255,11 @@ static int spansion_quad_enable(struct spi_nor *nor)
 		return -EINVAL;
 	}
 
-	/* read back and check it */
+	ret = spi_nor_wait_till_ready(nor);
+	if (ret)
+		return ret;
+	
+	/* read CR and check it */
 	ret = read_cr(nor);
 	if (!(ret > 0 && (ret & CR_QUAD_EN_SPAN))) {
 		dev_err(nor->dev, "Spansion Quad bit not set\n");
-- 
2.7.4
