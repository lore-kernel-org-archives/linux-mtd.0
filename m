Received: from baptiste.telenet-ops.be ([195.130.132.51])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wca5L-0007lS-S4
 for linux-mtd@lists.infradead.org; Tue, 22 Apr 2014 12:46:04 +0000
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 2/2] mtd: spi-nor: Enable Dual and Quad SPI read transfers for
 s25sl032p
Date: Tue, 22 Apr 2014 14:45:32 +0200
Message-Id: <1398170732-19773-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1398170732-19773-1-git-send-email-geert+renesas@glider.be>
References: <1398170732-19773-1-git-send-email-geert+renesas@glider.be>
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

Spansion s25sl032p supports Dual and Quad SPI transfers, hence set the
SPI_NOR_DUAL_READ and SPI_NOR_QUAD_READ flags.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Updated for m25p80 -> spi-nor

 drivers/mtd/spi-nor/spi-nor.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d6f44d527701..c713c8656710 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -497,7 +497,7 @@ const struct spi_device_id spi_nor_ids[] = {
 	/* Spansion -- single (large) sector size only, at least
 	 * for the chips listed here (without boot sectors).
 	 */
-	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, 0) },
+	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, 0) },
 	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, 0) },
 	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-- 
1.7.9.5
