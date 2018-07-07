Received: from mail.bugwerft.de ([46.23.86.59])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbgzY-00064I-Tm
 for linux-mtd@lists.infradead.org; Sat, 07 Jul 2018 06:46:51 +0000
From: Daniel Mack <daniel@zonque.org>
To: miquel.raynal@bootlin.com
Cc: robert.jarzmik@free.fr, boris.brezillon@bootlin.com, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, Daniel Mack <daniel@zonque.org>
Subject: [PATCH v3 2/3] mtd: rawnand: marvell: remove bogus comment in
 marvell_nfc_select_chip()
Date: Sat,  7 Jul 2018 08:46:30 +0200
Message-Id: <20180707064631.799-2-daniel@zonque.org>
In-Reply-To: <20180707064631.799-1-daniel@zonque.org>
References: <20180707064631.799-1-daniel@zonque.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The comment in marvell_nfc_select_chip() about ndtr0 and ndtr1 didn't
reflect what the driver was doing.

The values of NDTR0 and NDTR1 are read from the registers at probe time
and a copy is retained in 'struct marvell_nand_chip'. If keep-config is
set in the DT properties, there are no other writers of these timing
variables so they can safely be used when the chip is selected.

As suggested by Miquel Raynal, simply remove the comment.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/mtd/nand/raw/marvell_nand.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 4644f6e3b930..e72070fe8af9 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -650,11 +650,6 @@ static void marvell_nfc_select_chip(struct mtd_info *mtd, int die_nr)
 		return;
 	}
 
-	/*
-	 * Do not change the timing registers when using the DT property
-	 * marvell,nand-keep-config; in that case ->ndtr0 and ->ndtr1 from the
-	 * marvell_nand structure are supposedly empty.
-	 */
 	writel_relaxed(marvell_nand->ndtr0, nfc->regs + NDTR0);
 	writel_relaxed(marvell_nand->ndtr1, nfc->regs + NDTR1);
 
-- 
2.17.1
