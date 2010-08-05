Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oh22p-0007QS-Km
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 15:07:47 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 1/7] mtd: Blackfin NFC: fix nand busy detection
Date: Thu,  5 Aug 2010 11:07:38 -0400
Message-Id: <1281020864-26842-1-git-send-email-vapier@gentoo.org>
Cc: uclinux-dist-devel@blackfin.uclinux.org, Barry Song <barry.song@analog.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Barry Song <barry.song@analog.com>

The IRQSTAT register is a W1C register used by the interrupt handler and
may have its BUSY bit changed.  This makes it somewhat unreliable for the
polling devready function.  So switch it over to use the BUSY bit in the
STAT register that always reflects the current state of the hardware.

This fixes driver hangs seen when the NAND flash is under heavy system
load (like I/O benchmarks).

Signed-off-by: Barry Song <barry.song@analog.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 drivers/mtd/nand/bf5xx_nand.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 2974995..f3e3e74 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -218,9 +218,9 @@ static void bf5xx_nand_hwcontrol(struct mtd_info *mtd, int cmd,
  */
 static int bf5xx_nand_devready(struct mtd_info *mtd)
 {
-	unsigned short val = bfin_read_NFC_IRQSTAT();
+	unsigned short val = bfin_read_NFC_STAT();
 
-	if ((val & NBUSYIRQ) == NBUSYIRQ)
+	if ((val & NBUSY) == NBUSY)
 		return 1;
 	else
 		return 0;
-- 
1.7.2
