Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dSoOb-0005jk-HK
 for linux-mtd@lists.infradead.org; Wed, 05 Jul 2017 17:47:27 +0000
Received: by mail-wr0-x244.google.com with SMTP id z45so50831338wrb.2
 for <linux-mtd@lists.infradead.org>; Wed, 05 Jul 2017 10:47:04 -0700 (PDT)
From: Karl Beldan <karl.beldan@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Karl Beldan <karl.beldan+oss@gmail.com>
Subject: [PATCH] brcmnand: Fix up the flash cache register offset for older
 controllers
Date: Wed,  5 Jul 2017 17:46:53 +0000
Message-Id: <20170705174653.21797-1-karl.beldan+oss@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Karl Beldan <karl.beldan-ext@sagemcom.com>

Tested on BCM{63138,6838,63268} and cross checked with the various
*_map_part.h which the brcmnand_regs_v* in brcmnand.c have historically
been derived from.

Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Signed-off-by: Karl Beldan <karl.beldan-ext@sagemcom.com>
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index 7419c5c..e6371ff6 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -250,7 +250,7 @@ static const u16 brcmnand_regs_v40[] = {
 	[BRCMNAND_OOB_READ_10_BASE]	= 0x130,
 	[BRCMNAND_OOB_WRITE_BASE]	=  0x30,
 	[BRCMNAND_OOB_WRITE_10_BASE]	=     0,
-	[BRCMNAND_FC_BASE]		= 0x200,
+	[BRCMNAND_FC_BASE]		= 0x400,
 };
 
 /* BRCMNAND v5.0 */
@@ -280,7 +280,7 @@ static const u16 brcmnand_regs_v50[] = {
 	[BRCMNAND_OOB_READ_10_BASE]	= 0x130,
 	[BRCMNAND_OOB_WRITE_BASE]	=  0x30,
 	[BRCMNAND_OOB_WRITE_10_BASE]	= 0x140,
-	[BRCMNAND_FC_BASE]		= 0x200,
+	[BRCMNAND_FC_BASE]		= 0x400,
 };
 
 /* BRCMNAND v6.0 - v7.1 */
-- 
2.10.1
