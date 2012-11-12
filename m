Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TXqh3-00014O-5W
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2012 09:52:38 +0000
Received: by mail-bk0-f49.google.com with SMTP id j4so2247427bkw.36
 for <linux-mtd@lists.infradead.org>; Mon, 12 Nov 2012 01:52:36 -0800 (PST)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/5] MTD: bcm63xxpart: merge sparelen calculation
Date: Mon, 12 Nov 2012 10:52:48 +0100
Message-Id: <1352713971-1685-3-git-send-email-jonas.gorski@gmail.com>
In-Reply-To: <1352713971-1685-1-git-send-email-jonas.gorski@gmail.com>
References: <1352713971-1685-1-git-send-email-jonas.gorski@gmail.com>
Cc: Maxime Bizon <mbizon@freebox.fr>, Kevin Cernekee <cernekee@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Florian Fainelli <florian@openwrt.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The length of the spare part is calculated the same way in both branches
so move to a common place.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 drivers/mtd/bcm63xxpart.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/bcm63xxpart.c b/drivers/mtd/bcm63xxpart.c
index 1eb1416..ba7eeb8 100644
--- a/drivers/mtd/bcm63xxpart.c
+++ b/drivers/mtd/bcm63xxpart.c
@@ -120,7 +120,6 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 		kerneladdr = kerneladdr - BCM63XX_EXTENDED_SIZE;
 		rootfsaddr = rootfsaddr - BCM63XX_EXTENDED_SIZE;
 		spareaddr = roundup(totallen, master->erasesize) + cfelen;
-		sparelen = master->size - spareaddr - nvramlen;
 
 		if (rootfsaddr < kerneladdr) {
 			/* default Broadcom layout */
@@ -138,8 +137,8 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 		rootfslen = 0;
 		rootfsaddr = 0;
 		spareaddr = cfelen;
-		sparelen = master->size - cfelen - nvramlen;
 	}
+	sparelen = master->size - spareaddr - nvramlen;
 
 	/* Determine number of partitions */
 	if (rootfslen > 0)
-- 
1.7.2.5
