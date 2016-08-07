Received: from mail-pa0-f68.google.com ([209.85.220.68])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bWTF8-0003N7-TQ
 for linux-mtd@lists.infradead.org; Sun, 07 Aug 2016 18:56:16 +0000
Received: by mail-pa0-f68.google.com with SMTP id cf3so22556070pad.2
 for <linux-mtd@lists.infradead.org>; Sun, 07 Aug 2016 11:55:54 -0700 (PDT)
From: Jagan Teki <jteki@openedev.com>
To: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Jagan Teki <jteki@openedev.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Yunhui Cui <yunhui.cui@nxp.com>,
 Michael Trimarchi <michael@amarulasolutions.com>
Subject: [PATCH] mtd: spi-nor: Add s25fs256s1 spi-nor flash support
Date: Mon,  8 Aug 2016 00:24:48 +0530
Message-Id: <1470596088-8172-1-git-send-email-jteki@openedev.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add Atmel s25fs256s1 spi-nor flash to the list of spi_nor_ids.

In spansion S25FS-S family the physical sectors are grouped as
normal and parameter sectors. Parameter sectors are 4kB in size
with 8 set located at the bottom or top address of a device.
Normal sectors are similar to other flash family with sizes of
64kB or 32 kB.

To erase whole flash using sector erase(D8h or DCh) won't effect
the parameter sectors, so in order to erase these we must use 4K
sector erase commands (20h or 21h) separately.

So better to erase the whole flash using 4K sector erase instead
of detecting these family parts again and do two different erase
operations.

Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Yunhui Cui <yunhui.cui@nxp.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Jagan Teki <jteki@openedev.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d0fc165..6ad7779 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -901,6 +901,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, 0) },
 	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25fs256s1", INFO6(0x010219, 0x4d0181, 64 * 1024, 512, SECT_4K) },
 	{ "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
-- 
2.7.4
