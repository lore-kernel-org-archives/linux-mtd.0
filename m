Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SL9uo-0001Y8-RG
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2012 09:14:10 +0000
Received: by mail-we0-f177.google.com with SMTP id p11so7261649wer.36
 for <linux-mtd@lists.infradead.org>; Fri, 20 Apr 2012 02:14:06 -0700 (PDT)
From: Bastian Hecht <hechtb@googlemail.com>
To: linux-mtd@lists.infradead.org,
	linux-sh@vger.kernel.org
Subject: [PATCH 8/9] mtd: sh_flctl: Use user oob data in hardware ECC mode
Date: Fri, 20 Apr 2012 11:13:49 +0200
Message-Id: <1334913230-23615-9-git-send-email-hechtb@gmail.com>
In-Reply-To: <1334913230-23615-1-git-send-email-hechtb@gmail.com>
References: <1334913230-23615-1-git-send-email-hechtb@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pichart <laurent.pinchart@ideasonboard.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In hardware ecc mode, the flctl now writes and reads the oob data
provided by the user. Additionally the ECC is now returned in normal
page reads, not only when using the explicit NAND_CMD_READOOB command.

Signed-off-by: Bastian Hecht <hechtb@gmail.com>
---
 drivers/mtd/nand/sh_flctl.c |   23 +++++++++++++++++------
 1 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index 408e013..2766ce4 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -319,6 +319,19 @@ static void write_fiforeg(struct sh_flctl *flctl, int rlen, int offset)
 	}
 }
 
+static void write_ec_fiforeg(struct sh_flctl *flctl, int rlen, int offset)
+{
+	int i, len_4align;
+	unsigned long *data = (unsigned long *)&flctl->done_buff[offset];
+	void *fifo_addr = (void *)FLECFIFO(flctl);
+
+	len_4align = (rlen + 3) / 4;
+	for (i = 0; i < len_4align; i++) {
+		wait_wecfifo_ready(flctl);
+		writel(cpu_to_be32(data[i]), fifo_addr);
+	}
+}
+
 static void set_cmd_regs(struct mtd_info *mtd, uint32_t cmd, uint32_t flcmcdr_val)
 {
 	struct sh_flctl *flctl = mtd_to_flctl(mtd);
@@ -385,6 +398,7 @@ static int flctl_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 				uint8_t *buf, int page)
 {
 	chip->read_buf(mtd, buf, mtd->writesize);
+	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
 	return 0;
 }
 
@@ -392,6 +406,7 @@ static void flctl_write_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 				   const uint8_t *buf)
 {
 	chip->write_buf(mtd, buf, mtd->writesize);
+	chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
 }
 
 static void execmd_read_page_sector(struct mtd_info *mtd, int page_addr)
@@ -467,7 +482,7 @@ static void execmd_read_oob(struct mtd_info *mtd, int page_addr)
 static void execmd_write_page_sector(struct mtd_info *mtd)
 {
 	struct sh_flctl *flctl = mtd_to_flctl(mtd);
-	int i, page_addr = flctl->seqin_page_addr;
+	int page_addr = flctl->seqin_page_addr;
 	int sector, page_sectors;
 
 	page_sectors = flctl->page_size ? 4 : 1;
@@ -483,11 +498,7 @@ static void execmd_write_page_sector(struct mtd_info *mtd)
 
 	for (sector = 0; sector < page_sectors; sector++) {
 		write_fiforeg(flctl, 512, 512 * sector);
-
-		for (i = 0; i < 4; i++) {
-			wait_wecfifo_ready(flctl); /* wait for write ready */
-			writel(0xFFFFFFFF, FLECFIFO(flctl));
-		}
+		write_ec_fiforeg(flctl, 16, mtd->writesize + 16 * sector);
 	}
 
 	wait_completion(flctl);
-- 
1.7.5.4
