Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eYeAV-0001Mf-6Y
 for linux-mtd@lists.infradead.org; Mon, 08 Jan 2018 20:37:17 +0000
Received: by mail-qk0-x244.google.com with SMTP id o126so15836122qke.12
 for <linux-mtd@lists.infradead.org>; Mon, 08 Jan 2018 12:37:04 -0800 (PST)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com
Cc: computersforpeace@gmail.com, richard@nod.at, dwmw2@infradead.org,
 marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr,
 Kamal Dasu <kdasu.kdev@gmail.com>, stable@vger.kernel.org
Subject: [PATCH v3] mtd: nand: brcmnand: Disable prefetch by default
Date: Mon,  8 Jan 2018 15:36:48 -0500
Message-Id: <1515443808-31105-1-git-send-email-kdasu.kdev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brcm nand controller prefetch feature needs to be disabled
by default. Enabling affects performance on random reads as
well as dma reads.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
Fixes: 27c5b17cd1b1 ("mtd: nand: add NAND driver "library" for Broadcom STB NAND controller")
Cc: stable@vger.kernel.org
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
