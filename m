Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T4wg4-0007rj-LE
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 16:24:09 +0000
From: Jan Luebbe <jlu@pengutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] mtd: m25p80: add support for Micron N25Q128
Date: Fri, 24 Aug 2012 18:23:50 +0200
Message-Id: <1345825430-15758-1-git-send-email-jlu@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, Jan Luebbe <jlu@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 drivers/mtd/devices/m25p80.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 980cd6d..33ab2b7 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -663,6 +663,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
 
 	/* Micron */
+	{ "n25q128",  INFO(0x20ba18, 0, 64 * 1024, 256, 0) },
 	{ "n25q256a", INFO(0x20ba19, 0, 64 * 1024, 512, SECT_4K) },
 
 	/* Spansion -- single (large) sector size only, at least
-- 
1.7.10.4
