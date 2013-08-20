Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBgmh-0004j2-FQ
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2013 07:55:25 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 3/3] mtd: m25p80: add support for mr25h10
Date: Tue, 20 Aug 2013 09:54:41 +0200
Message-Id: <1376985281-16293-4-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1376985281-16293-1-git-send-email-s.hauer@pengutronix.de>
References: <1376985281-16293-1-git-send-email-s.hauer@pengutronix.de>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Markus Niebel <Markus.Niebel@tqs.de>
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

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/devices/m25p80.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 6f93d32..a48f152 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -743,6 +743,7 @@ static const struct spi_device_id m25p_ids[] = {
 
 	/* Everspin */
 	{ "mr25h256", CAT25_INFO(  32 * 1024, 1, 256, 2, M25P_NO_ERASE | M25P_NO_FR) },
+	{ "mr25h10", CAT25_INFO(128 * 1024, 1, 256, 3, M25P_NO_ERASE | M25P_NO_FR) },
 
 	/* GigaDevice */
 	{ "gd25q32", INFO(0xc84016, 0, 64 * 1024,  64, SECT_4K) },
-- 
1.8.4.rc3
