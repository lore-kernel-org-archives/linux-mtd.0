Received: from mail-cys01nam02on071c.outbound.protection.outlook.com
 ([2a01:111:f400:fe45::71c]
 helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c9W3V-0006LX-Fg
 for linux-mtd@lists.infradead.org; Wed, 23 Nov 2016 11:49:38 +0000
From: =?UTF-8?q?Jo=C3=ABl=20Esponde?= <joel.esponde@honeywell.com>
To: <linux-mtd@lists.infradead.org>
CC: =?UTF-8?q?Jo=C3=ABl=20Esponde?= <joel.esponde@honeywell.com>
Subject: [PATCH v3] mtd: spi-nor: fix spansion quad enable
Date: Wed, 23 Nov 2016 12:47:40 +0100
Message-ID: <1479901660-124876-1-git-send-email-joel.esponde@honeywell.com>
In-Reply-To: <1476971026-9665-1-git-send-email-joel.esponde@honeywell.com>
References: <1476971026-9665-1-git-send-email-joel.esponde@honeywell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

This commit adds a wait loop after the register writing until the flash
finishes its work.

This issue could make rootfs mounting fail when the latter was done too
much closely to this quad enable bit setting step. And in this case, a
driver as UBIFS may try to recover the filesystem and may broke it
completely.

Signed-off-by: Joël Esponde <joel.esponde@honeywell.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d0fc165..21dde52 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1255,6 +1255,13 @@ static int spansion_quad_enable(struct spi_nor *nor)
 		return -EINVAL;
 	}
 
+	ret = spi_nor_wait_till_ready(nor);
+	if (ret) {
+		dev_err(nor->dev,
+			"timeout while writing configuration register\n");
+		return ret;
+	}
+
 	/* read back and check it */
 	ret = read_cr(nor);
 	if (!(ret > 0 && (ret & CR_QUAD_EN_SPAN))) {
-- 
2.7.4
