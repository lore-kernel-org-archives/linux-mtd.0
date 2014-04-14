Received: from andre.telenet-ops.be ([195.130.132.53])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZjy5-0007uI-EJ
 for linux-mtd@lists.infradead.org; Mon, 14 Apr 2014 16:42:50 +0000
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH resend] mtd: m25p80: Enable Dual and Quad SPI read transfers
 for s25sl032p
Date: Mon, 14 Apr 2014 18:42:22 +0200
Message-Id: <1397493742-21384-1-git-send-email-geert@linux-m68k.org>
Cc: linux-mtd@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Spansion s25sl032p supports Dual and Quad SPI transfers, hence set the
M25P80_DUAL_READ and M25P80_QUAD_READ flags.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
I think this one fell through the cracks... (sent before on 2014-02-25)

 drivers/mtd/devices/m25p80.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 524dab3ac938..e62cee93c919 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -957,7 +957,7 @@ static const struct spi_device_id m25p_ids[] = {
 	/* Spansion -- single (large) sector size only, at least
 	 * for the chips listed here (without boot sectors).
 	 */
-	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, 0) },
+	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, M25P80_DUAL_READ | M25P80_QUAD_READ) },
 	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, 0) },
 	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, 0) },
 	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, M25P80_DUAL_READ | M25P80_QUAD_READ) },
-- 
1.7.9.5
