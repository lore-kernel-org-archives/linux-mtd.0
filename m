Received: from xavier.telenet-ops.be ([195.130.132.52])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wca5L-0007lK-Gl
 for linux-mtd@lists.infradead.org; Tue, 22 Apr 2014 12:46:04 +0000
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 1/2] mtd: m25p80: Revive dual read support
Date: Tue, 22 Apr 2014 14:45:31 +0200
Message-Id: <1398170732-19773-1-git-send-email-geert+renesas@glider.be>
Cc: linux-mtd@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-spi@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 03e296f613affcc2671c1e86d8c25ecad867204e ("mtd: m25p80: use the SPI
nor framework") accidentally removed support for Dual SPI read transfers.
Add it back.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/mtd/devices/m25p80.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 1557d8f672c1..ed7e0a1bed3c 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -221,6 +221,8 @@ static int m25p_probe(struct spi_device *spi)
 
 	if (spi->mode & SPI_RX_QUAD)
 		mode = SPI_NOR_QUAD;
+	else if (spi->mode & SPI_RX_DUAL)
+		mode = SPI_NOR_DUAL;
 	ret = spi_nor_scan(nor, spi_get_device_id(spi), mode);
 	if (ret)
 		return ret;
-- 
1.7.9.5
