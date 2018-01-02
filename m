Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eWSy3-0002kV-JZ
 for linux-mtd@lists.infradead.org; Tue, 02 Jan 2018 20:15:51 +0000
Received: by mail-qt0-x241.google.com with SMTP id g9so64209823qth.9
 for <linux-mtd@lists.infradead.org>; Tue, 02 Jan 2018 12:15:12 -0800 (PST)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com
Cc: computersforpeace@gmail.com, richard@nod.at, dwmw2@infradead.org,
 marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr,
 Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH] mtd: brcmnand: Disable prefetch by default
Date: Tue,  2 Jan 2018 15:14:57 -0500
Message-Id: <1514924097-1630-1-git-send-email-kdasu.kdev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brcm nand controller prefetch feature needs to be disabled
by default. Enabling effects performance on random reads as
well as dma reads.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index dd56a67..2a978d9 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -2193,16 +2193,9 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
 	if (ctrl->nand_version >= 0x0702)
 		tmp |= ACC_CONTROL_RD_ERASED;
 	tmp &= ~ACC_CONTROL_FAST_PGM_RDIN;
-	if (ctrl->features & BRCMNAND_HAS_PREFETCH) {
-		/*
-		 * FIXME: Flash DMA + prefetch may see spurious erased-page ECC
-		 * errors
-		 */
-		if (has_flash_dma(ctrl))
-			tmp &= ~ACC_CONTROL_PREFETCH;
-		else
-			tmp |= ACC_CONTROL_PREFETCH;
-	}
+	if (ctrl->features & BRCMNAND_HAS_PREFETCH)
+		tmp &= ~ACC_CONTROL_PREFETCH;
+
 	nand_writereg(ctrl, offs, tmp);
 
 	return 0;
-- 
2.7.4
