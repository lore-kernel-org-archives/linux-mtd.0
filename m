Received: from 3.mo179.mail-out.ovh.net ([178.33.251.175])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cU8nG-0005Xp-T4
 for linux-mtd@lists.infradead.org; Thu, 19 Jan 2017 09:14:08 +0000
Received: from player698.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 3A7D414819
 for <linux-mtd@lists.infradead.org>; Thu, 19 Jan 2017 10:13:45 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH] mtd: aspeed: fix compile warning in aspeed_smc_read_from_ahb()
Date: Thu, 19 Jan 2017 10:13:18 +0100
Message-Id: <1484817198-22477-1-git-send-email-clg@kaod.org>
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

The first argument of ioread32_rep() and ioread8_rep is not
const. Change aspeed_smc_read_from_ahb() prototype to fix compile
warning :

   drivers/mtd/spi-nor/aspeed-smc.c: In function 'aspeed_smc_read_from_ahb':
   drivers/mtd/spi-nor/aspeed-smc.c:212:16: warning: passing argument 1 of 'ioread32_rep' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
      ioread32_rep(src, buf, len >> 2);

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 6bb4c7d1788c..7c86099450be 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -222,8 +222,7 @@ struct aspeed_smc_controller {
  * the memory buffer pointer and count via explicit code. The final updates
  * to len are optimistically suppressed.
  */
-static int aspeed_smc_read_from_ahb(void *buf, const void __iomem *src,
-				    size_t len)
+static int aspeed_smc_read_from_ahb(void *buf, void __iomem *src, size_t len)
 {
 	size_t offset = 0;
 
-- 
2.7.4
