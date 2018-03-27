Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0rzL-0003hk-RV
 for linux-mtd@lists.infradead.org; Tue, 27 Mar 2018 17:02:25 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Nicolas Ferre <nicolas.ferre@atmel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Olivier Schonken <olivier.schonken@gmail.com>, stable@vger.kernel.org
Subject: [PATCH] mtd: nand: atmel: Fix get_sectorsize() function
Date: Tue, 27 Mar 2018 19:01:58 +0200
Message-Id: <20180327170158.3351-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

get_sectorsize() was not using the appropriate macro to extract the
ECC sector size from the config cache, which led to buggy ECC when
using 1024 byte sectors.

Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
Cc: <stable@vger.kernel.org>
Reported-by: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/atmel/pmecc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/atmel/pmecc.c b/drivers/mtd/nand/atmel/pmecc.c
index 8268636675ef..4124bf91bee6 100644
--- a/drivers/mtd/nand/atmel/pmecc.c
+++ b/drivers/mtd/nand/atmel/pmecc.c
@@ -426,7 +426,7 @@ static int get_strength(struct atmel_pmecc_user *user)
 
 static int get_sectorsize(struct atmel_pmecc_user *user)
 {
-	return user->cache.cfg & PMECC_LOOKUP_TABLE_SIZE_1024 ? 1024 : 512;
+	return user->cache.cfg & PMECC_CFG_SECTOR1024 ? 1024 : 512;
 }
 
 static void atmel_pmecc_gen_syndrome(struct atmel_pmecc_user *user, int sector)
-- 
2.14.1
