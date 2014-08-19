Received: from mail-we0-x236.google.com ([2a00:1450:400c:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJdiY-0008AN-8I
 for linux-mtd@lists.infradead.org; Tue, 19 Aug 2014 07:20:30 +0000
Received: by mail-we0-f182.google.com with SMTP id k48so6036919wev.13
 for <linux-mtd@lists.infradead.org>; Tue, 19 Aug 2014 00:20:08 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 1/4] mtd: bcm47xxnflash: fix typo in freq calculation
Date: Tue, 19 Aug 2014 09:14:13 +0200
Message-Id: <1408432456-27280-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We are supposed to mask value, not multiply it. Add some comments btw.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
index b2ab373..dc204f3 100644
--- a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
+++ b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
@@ -364,11 +364,13 @@ int bcm47xxnflash_ops_bcm4706_init(struct bcm47xxnflash *b47n)
 
 	/* Configure wait counters */
 	if (b47n->cc->status & BCMA_CC_CHIPST_4706_PKG_OPTION) {
-		freq = 100000000;
+		/* 400 MHz */
+		freq = 400000000 / 4;
 	} else {
 		freq = bcma_chipco_pll_read(b47n->cc, 4);
-		freq = (freq * 0xFFF) >> 3;
-		freq = (freq * 25000000) >> 3;
+		freq = (freq & 0xFFF) >> 3;
+		/* Fixed reference clock 25 MHz and m = 2 */
+		freq = (freq * 25000000 / 2) / 4;
 	}
 	clock = freq / 1000000;
 	w0 = bcm47xxnflash_ops_bcm4706_ns_to_cycle(15, clock);
-- 
1.8.4.5
