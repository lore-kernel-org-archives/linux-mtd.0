Received: from michel.telenet-ops.be ([195.130.137.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5avw-0004iv-Tj
 for linux-mtd@lists.infradead.org; Tue, 21 Jan 2014 13:00:10 +0000
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 1/4] mtd: m25p80: Enable Quad SPI read transfers for s25fl512s
Date: Tue, 21 Jan 2014 13:59:16 +0100
Message-Id: <1390309159-19643-2-git-send-email-geert@linux-m68k.org>
In-Reply-To: <1390309159-19643-1-git-send-email-geert@linux-m68k.org>
References: <1390309159-19643-1-git-send-email-geert@linux-m68k.org>
Cc: Marek Vasut <marex@denx.de>, Sourav Poddar <sourav.poddar@ti.com>,
 linux-mtd@lists.infradead.org,
 Geert Uytterhoeven <geert+renesas@linux-m68k.org>, linux-spi@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Geert Uytterhoeven <geert+renesas@linux-m68k.org>

Spansion s25fl512s supports Quad SPI transfers, hence set the
M25P80_QUAD_READ flag.

Signed-off-by: Geert Uytterhoeven <geert+renesas@linux-m68k.org>
---
 drivers/mtd/devices/m25p80.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index d0f6475504f5..320c6a308630 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -943,7 +943,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, 0) },
 	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, 0) },
 	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, M25P80_QUAD_READ) },
-	{ "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, 0) },
+	{ "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, M25P80_QUAD_READ) },
 	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
 	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
-- 
1.7.9.5
