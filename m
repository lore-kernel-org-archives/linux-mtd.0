Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1STuAk-0004i7-8q
 for linux-mtd@lists.infradead.org; Mon, 14 May 2012 12:14:43 +0000
Received: by werc12 with SMTP id c12so1848452wer.36
 for <linux-mtd@lists.infradead.org>; Mon, 14 May 2012 05:14:40 -0700 (PDT)
From: Bastian Hecht <hechtb@googlemail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v4 4/8] mtd: sh_flctl: Fix hardware ECC behaviour
Date: Mon, 14 May 2012 14:14:43 +0200
Message-Id: <1336997687-6868-5-git-send-email-hechtb@gmail.com>
In-Reply-To: <1336997687-6868-1-git-send-email-hechtb@gmail.com>
References: <1336997687-6868-1-git-send-email-hechtb@gmail.com>
Cc: Bastian Hecht <hechtb@gmail.com>, magnus.damm@gmail.com,
 laurent.pinchart@ideasonboard.com, linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The flctl uses 10 bytes ECC data for every 512 bytes sector. This patch
makes the controller write all 40 bytes instead of 10 bytes only.

Signed-off-by: Bastian Hecht <hechtb@gmail.com>
---
 drivers/mtd/nand/sh_flctl.c |   30 +++++++-----------------------
 1 files changed, 7 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index 4eaee54..642986f 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -427,30 +427,20 @@ static void execmd_read_page_sector(struct mtd_info *mtd, int page_addr)
 static void execmd_read_oob(struct mtd_info *mtd, int page_addr)
 {
 	struct sh_flctl *flctl = mtd_to_flctl(mtd);
+	int page_sectors = flctl->page_size ? 4 : 1;
+	int i;
 
 	set_cmd_regs(mtd, NAND_CMD_READ0,
 		(NAND_CMD_READSTART << 8) | NAND_CMD_READ0);
 
 	empty_fifo(flctl);
-	if (flctl->page_size) {
-		int i;
-		/* In case that the page size is 2k */
-		for (i = 0; i < 16 * 3; i++)
-			flctl->done_buff[i] = 0xFF;
-
-		set_addr(mtd, 3 * 528 + 512, page_addr);
-		writel(16, FLDTCNTR(flctl));
 
-		start_translation(flctl);
-		read_fiforeg(flctl, 16, 16 * 3);
-		wait_completion(flctl);
-	} else {
-		/* In case that the page size is 512b */
-		set_addr(mtd, 512, page_addr);
+	for (i = 0; i < page_sectors; i++) {
+		set_addr(mtd, (512 + 16) * i + 512 , page_addr);
 		writel(16, FLDTCNTR(flctl));
 
 		start_translation(flctl);
-		read_fiforeg(flctl, 16, 0);
+		read_fiforeg(flctl, 16, 16 * i);
 		wait_completion(flctl);
 	}
 }
@@ -495,18 +485,12 @@ static void execmd_write_oob(struct mtd_info *mtd)
 	int page_addr = flctl->seqin_page_addr;
 	int sector, page_sectors;
 
-	if (flctl->page_size) {
-		sector = 3;
-		page_sectors = 4;
-	} else {
-		sector = 0;
-		page_sectors = 1;
-	}
+	page_sectors = flctl->page_size ? 4 : 1;
 
 	set_cmd_regs(mtd, NAND_CMD_PAGEPROG,
 			(NAND_CMD_PAGEPROG << 8) | NAND_CMD_SEQIN);
 
-	for (; sector < page_sectors; sector++) {
+	for (sector = 0; sector < page_sectors; sector++) {
 		empty_fifo(flctl);
 		set_addr(mtd, sector * 528 + 512, page_addr);
 		writel(16, FLDTCNTR(flctl));	/* set read size */
-- 
1.7.5.4
