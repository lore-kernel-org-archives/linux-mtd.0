Received: from exsmtp01.microchip.com ([198.175.253.37]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cWRhj-0006fB-P7
 for linux-mtd@lists.infradead.org; Wed, 25 Jan 2017 17:49:57 +0000
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: <marek.vasut@gmail.com>
CC: <computersforpeace@gmail.com>, <boris.brezillon@free-electrons.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 2/3] mtd: spi-nor: remove unused set_quad_mode() function
Date: Wed, 25 Jan 2017 18:49:27 +0100
Message-ID: <76880aa711f94195e050d8dcfd240659b263a20f.1485365439.git.cyrille.pitchen@atmel.com>
In-Reply-To: <cover.1485365439.git.cyrille.pitchen@atmel.com>
References: <cover.1485365439.git.cyrille.pitchen@atmel.com>
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
index 64a3abbc9917..5aef1fb8a80f 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1432,30 +1432,6 @@ static int spansion_quad_enable(struct spi_nor *nor)
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
