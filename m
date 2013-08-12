Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8pHK-0005GE-OV
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2013 10:23:12 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/4] mtd: m25p80: add support for mr25h10
Date: Mon, 12 Aug 2013 12:22:25 +0200
Message-Id: <1376302946-11534-4-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1376302946-11534-1-git-send-email-s.hauer@pengutronix.de>
References: <1376302946-11534-1-git-send-email-s.hauer@pengutronix.de>
Cc: Marek Vasut <marex@denx.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, Markus Niebel <Markus.Niebel@tqs.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Markus Niebel <Markus.Niebel@tqs.de>

This adds support for the Everspin mr25h10 MRAM chip to the m25p80
driver.

Signed-off-by: Markus Niebel <Markus.Niebel@tqs.de>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/devices/m25p80.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 8e30b07..d179188 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -734,6 +734,7 @@ static const struct spi_device_id m25p_ids[] = {
 
 	/* Everspin */
 	{ "mr25h256", CAT25_INFO(  32 * 1024, 1, 256, 2, M25P_NO_ERASE | M25P_NO_FR) },
+	{ "mr25h10", CAT25_INFO(128 * 1024, 1, 256, 3, M25P_NO_ERASE | M25P_NO_FR) },
 
 	/* GigaDevice */
 	{ "gd25q32", INFO(0xc84016, 0, 64 * 1024,  64, SECT_4K) },
-- 
1.8.4.rc1
