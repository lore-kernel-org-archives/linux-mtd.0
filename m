Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fL4xE-0005qJ-6D
 for linux-mtd@lists.infradead.org; Tue, 22 May 2018 10:55:48 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Mark Brown <broonie@kernel.org>,
	linux-spi@vger.kernel.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] mtd: devices: m25p80: Use spi_mem_set_drvdata() instead of
 spi_set_drvdata()
Date: Tue, 22 May 2018 12:55:14 +0200
Message-Id: <20180522105514.8145-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SPI mem drivers should use spi_mem_set_drvdata() not spi_set_drvdata()
to store their private data. Using spi_set_drvdata() will mess the
spi -> spi-mem link up and cause a kernel panic at shutdown or
device removal time.

Fixes: 4120f8d158ef ("mtd: spi-nor: Use the spi_mem_xx() API")
Reported-by: Marek Vasut <marek.vasut@gmail.com>
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Marek Vasut <marek.vasut+renesas@gmail.com> on R8A7791 Porter
---
Hi Mark,

Could you take this patch through the SPI tree? The bug has been
introduced by 4120f8d158ef ("mtd: spi-nor: Use the spi_mem_xx() API")
which is in the spi/for-4.18 branch (I didn't pull these changes in the
MTD tree yet, and if possible I'd like to avoid doing that unless we
end up with a conflict between the MTD and SPI tree).

Let me know if that's not possible and I'll find another solution (wait
-rc1 or merge the spi/for-4.18 branch into the MTD tree).

Thanks,

Boris
---
 drivers/mtd/devices/m25p80.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 3dc022d3b53e..e84563d2067f 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -182,7 +182,7 @@ static int m25p_probe(struct spi_mem *spimem)
 	spi_nor_set_flash_node(nor, spi->dev.of_node);
 	nor->priv = flash;
 
-	spi_set_drvdata(spi, flash);
+	spi_mem_set_drvdata(spimem, flash);
 	flash->spimem = spimem;
 
 	if (spi->mode & SPI_RX_QUAD) {
-- 
2.14.1
