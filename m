Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8pHF-0005Fp-OI
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2013 10:23:06 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/4] mtd: m25p80: remove unnecessary ifdef
Date: Mon, 12 Aug 2013 12:22:26 +0200
Message-Id: <1376302946-11534-5-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1376302946-11534-1-git-send-email-s.hauer@pengutronix.de>
References: <1376302946-11534-1-git-send-email-s.hauer@pengutronix.de>
Cc: Marek Vasut <marex@denx.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

of_property_read_bool properly compiles away, no need to ifdef this
for non DT builds.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/devices/m25p80.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index d179188..f21af0e 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -1030,10 +1030,8 @@ static int m25p_probe(struct spi_device *spi)
 	flash->mtd.writebufsize = flash->page_size;
 
 	flash->fast_read = false;
-#ifdef CONFIG_OF
 	if (np && of_property_read_bool(np, "m25p,fast-read"))
 		flash->fast_read = true;
-#endif
 
 #ifdef CONFIG_M25PXX_USE_FAST_READ
 	flash->fast_read = true;
-- 
1.8.4.rc1
