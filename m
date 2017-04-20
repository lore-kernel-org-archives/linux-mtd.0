Received: from 6.mo4.mail-out.ovh.net ([188.165.36.253])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1AiD-0003k9-Gp
 for linux-mtd@lists.infradead.org; Thu, 20 Apr 2017 11:57:27 +0000
Received: from player159.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 4F5575F7FA
 for <linux-mtd@lists.infradead.org>; Thu, 20 Apr 2017 13:57:03 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 1/4] mtd: spi-nor: aspeed: remove dummies from keep mask
Date: Thu, 20 Apr 2017 13:56:34 +0200
Message-Id: <1492689397-4704-2-git-send-email-clg@kaod.org>
In-Reply-To: <1492689397-4704-1-git-send-email-clg@kaod.org>
References: <1492689397-4704-1-git-send-email-clg@kaod.org>
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

There is no need to keep the dummy bytes in the control register if
the command mode is not kept also. This could lead to an inconsistent
setting : normal read mode (command 0x3) and dummy bytes. It is to be
noted that the HW allows such a configuration.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 56051d30f000..2940f2098420 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -180,8 +180,7 @@ struct aspeed_smc_controller {
 
 #define CONTROL_KEEP_MASK						\
 	(CONTROL_AAF_MODE | CONTROL_CE_INACTIVE_MASK | CONTROL_CLK_DIV4 | \
-	 CONTROL_IO_DUMMY_MASK | CONTROL_CLOCK_FREQ_SEL_MASK |		\
-	 CONTROL_LSB_FIRST | CONTROL_CLOCK_MODE_3)
+	 CONTROL_CLOCK_FREQ_SEL_MASK | CONTROL_LSB_FIRST | CONTROL_CLOCK_MODE_3)
 
 /*
  * The Segment Register uses a 8MB unit to encode the start address
-- 
2.7.4
