Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oh22q-0007Sb-UO
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 15:07:50 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 4/7] mtd: Blackfin NFC: wait for the ECC reset to finish
Date: Thu,  5 Aug 2010 11:07:41 -0400
Message-Id: <1281020864-26842-4-git-send-email-vapier@gentoo.org>
In-Reply-To: <1281020864-26842-1-git-send-email-vapier@gentoo.org>
References: <1281020864-26842-1-git-send-email-vapier@gentoo.org>
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

When resetting the ECC registers/counters, the bit will automatically
clear itself once the reset has actually finished.  So make sure we
wait for that to occur before doing anything else rather than assuming
everything is peachy and proceeding with stale ECC values.

Signed-off-by: Barry Song <barry.song@analog.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 drivers/mtd/nand/bf5xx_nand.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index b553705..949f656 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -507,6 +507,8 @@ static void bf5xx_nand_dma_rw(struct mtd_info *mtd,
 	 */
 	bfin_write_NFC_RST(ECC_RST);
 	SSYNC();
+	while (bfin_read_NFC_RST() & ECC_RST)
+		cpu_relax();
 
 	disable_dma(CH_NFC);
 	clear_dma_irqstat(CH_NFC);
-- 
1.7.2
