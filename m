Received: from smtpout.microchip.com ([198.175.253.82]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byiEI-0002N8-IM
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 16:36:07 +0000
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <nicolas.ferre@atmel.com>, <boris.brezillon@free-electrons.com>,
 <marex@denx.de>, <richard@nod.at>, <linux-kernel@vger.kernel.org>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v3 4/9] mtd: spi-nor: remove unused set_quad_mode() function
Date: Mon, 24 Oct 2016 18:34:41 +0200
Message-ID: <48d795fb0507dc356ac284520170c5be0882c431.1477325128.git.cyrille.pitchen@atmel.com>
In-Reply-To: <cover.1477325128.git.cyrille.pitchen@atmel.com>
References: <cover.1477325128.git.cyrille.pitchen@atmel.com>
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

The set_quad_mode() function is no longer used, so we remove it.

This patch is not squashed into the previous patch on purpose for
readiness issue and to ease the review process of the whole series.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 05000b010e7f..a06fcf400b39 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1331,30 +1331,6 @@ static int spansion_quad_enable(struct spi_nor *nor)
 	return 0;
 }
 
-static int set_quad_mode(struct spi_nor *nor, const struct flash_info *info)
-{
-	int status;
-
-	switch (JEDEC_MFR(info)) {
-	case SNOR_MFR_MACRONIX:
-		status = macronix_quad_enable(nor);
-		if (status) {
-			dev_err(nor->dev, "Macronix quad-read not enabled\n");
-			return -EINVAL;
-		}
-		return status;
-	case SNOR_MFR_MICRON:
-		return 0;
-	default:
-		status = spansion_quad_enable(nor);
-		if (status) {
-			dev_err(nor->dev, "Spansion quad-read not enabled\n");
-			return -EINVAL;
-		}
-		return status;
-	}
-}
-
 static int spi_nor_check(struct spi_nor *nor)
 {
 	if (!nor->dev || !nor->read || !nor->write ||
-- 
2.7.4
