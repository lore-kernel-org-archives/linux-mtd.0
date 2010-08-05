Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oh22q-0007RJ-3s
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 15:07:50 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 3/7] mtd: Blackfin NFC: fix typo for read/write delay setup
Date: Thu,  5 Aug 2010 11:07:40 -0400
Message-Id: <1281020864-26842-3-git-send-email-vapier@gentoo.org>
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

We used the platform rd_dly field when we meant to use the wr_dly field.

Signed-off-by: Barry Song <barry.song@analog.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 drivers/mtd/nand/bf5xx_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 81a05cd..b553705 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -632,7 +632,7 @@ static int bf5xx_nand_hw_init(struct bf5xx_nand_info *info)
 	val = (plat->page_size << NFC_PG_SIZE_OFFSET) |
 		(plat->data_width << NFC_NWIDTH_OFFSET) |
 		(plat->rd_dly << NFC_RDDLY_OFFSET) |
-		(plat->rd_dly << NFC_WRDLY_OFFSET);
+		(plat->wr_dly << NFC_WRDLY_OFFSET);
 	dev_dbg(info->device, "NFC_CTL is 0x%04x\n", val);
 
 	bfin_write_NFC_CTL(val);
-- 
1.7.2
