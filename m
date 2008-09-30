Received: from smtpeu1.atmel.com ([195.65.72.27] helo=bagnes.atmel.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kkdr7-0004zE-C8
	for linux-mtd@lists.infradead.org; Tue, 30 Sep 2008 11:57:30 +0000
From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: AT49BV6416 has swapped erase regions
Date: Tue, 30 Sep 2008 13:55:33 +0200
Message-Id: <1222775733-6690-1-git-send-email-haavard.skinnemoen@atmel.com>
Cc: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The CFI information read from AT49BV6416 lists the erase regions in the
wrong order, causing problems when trying to erase or update the first
or last 64K block.

Work around this by inverting the "top boot" flag, which will
effectively reverse the order of the erase regions.

This chip is obsolete, but it's used in some existing designs.

Signed-off-by: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
---
I'd like this fix to be applied before 2.6.27. However, it's not a big
deal since the affected regions are write protected on STK1000, which
is the only board I know that's affected by this.

This bug will hurt people who are un-protecting those sectors in order
to reflash the boot loader from Linux.

 drivers/mtd/chips/cfi_cmdset_0002.c |   16 ++++++++++++----
 1 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index a972cc6..c6c7e75 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -178,10 +178,18 @@ static void fixup_convert_atmel_pri(struct mtd_info *mtd, void *param)
 	if (atmel_pri.Features & 0x02)
 		extp->EraseSuspend = 2;
 
-	if (atmel_pri.BottomBoot)
-		extp->TopBottom = 2;
-	else
-		extp->TopBottom = 3;
+	/* Some chips got it backwards... */
+	if (cfi->id == AT49BV6416) {
+		if (atmel_pri.BottomBoot)
+			extp->TopBottom = 3;
+		else
+			extp->TopBottom = 2;
+	} else {
+		if (atmel_pri.BottomBoot)
+			extp->TopBottom = 2;
+		else
+			extp->TopBottom = 3;
+	}
 
 	/* burst write mode not supported */
 	cfi->cfiq->BufWriteTimeoutTyp = 0;
-- 
1.5.6.5
