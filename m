Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oh22r-0007TX-WA
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 15:07:50 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 5/7] mtd: Blackfin NFC: make sure to check NAND_ALE in cmd_ctrl
Date: Thu,  5 Aug 2010 11:07:42 -0400
Message-Id: <1281020864-26842-5-git-send-email-vapier@gentoo.org>
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

The NAND base may send some controls which are neither CLE nor ALE, so
we need to explicitly check both instead of assuming things are always
one or the other.  Otherwise, we sometimes send out illegal addresses
to the NAND device.

Signed-off-by: Barry Song <barry.song@analog.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 drivers/mtd/nand/bf5xx_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 949f656..2f90cac 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -203,7 +203,7 @@ static void bf5xx_nand_hwcontrol(struct mtd_info *mtd, int cmd,
 
 	if (ctrl & NAND_CLE)
 		bfin_write_NFC_CMD(cmd);
-	else
+	else if (ctrl & NAND_ALE)
 		bfin_write_NFC_ADDR(cmd);
 	SSYNC();
 }
-- 
1.7.2
