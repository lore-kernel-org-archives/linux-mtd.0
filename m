Received: from 8.mo2.mail-out.ovh.net ([188.165.52.147])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dNZjf-00084d-SN
 for linux-mtd@lists.infradead.org; Wed, 21 Jun 2017 07:07:33 +0000
Received: from player796.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id E8FEC91B06
 for <linux-mtd@lists.infradead.org>; Wed, 21 Jun 2017 09:07:06 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH] mtd: spi-nor: aspeed: include <linux/sizes.h>
Date: Wed, 21 Jun 2017 09:06:49 +0200
Message-Id: <1498028809-10595-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This fix a compile error on some platforms :

drivers/mtd/spi-nor/aspeed-smc.c: In function 'aspeed_smc_chip_set_segment':
drivers/mtd/spi-nor/aspeed-smc.c:554:14: error: 'SZ_128M' undeclared (first use in this function)
      size == SZ_128M) {
              ^
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index d91e0f3897b9..0106357421bd 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -19,6 +19,7 @@
 #include <linux/mtd/spi-nor.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/sizes.h>
 #include <linux/sysfs.h>
 
 #define DEVICE_NAME	"aspeed-smc"
-- 
2.7.5
