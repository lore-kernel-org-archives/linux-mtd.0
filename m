Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyUhM-0000VA-8y
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2015 01:04:40 +0000
Received: by padhx2 with SMTP id hx2so192291231pad.1
 for <linux-mtd@lists.infradead.org>; Mon, 16 Nov 2015 17:04:17 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>,
	<bcm-kernel-feedback-list@broadcom.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: brcmnand: drop unused subpage_read() support
Date: Mon, 16 Nov 2015 17:04:08 -0800
Message-Id: <1447722248-135635-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

AFAIR this driver was never tested with subpage read support, and this
code is currently unused because we don't set the NAND_SUBPAGE_READ
flag. It can be resurrected if someone tests it properly.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index 2a437c7ed175..569d57b5a180 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -1546,16 +1546,6 @@ static int brcmnand_read_oob_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	return 0;
 }
 
-static int brcmnand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
-				 uint32_t data_offs, uint32_t readlen,
-				 uint8_t *bufpoi, int page)
-{
-	struct brcmnand_host *host = chip->priv;
-
-	return brcmnand_read(mtd, chip, host->last_addr + data_offs,
-			readlen >> FC_SHIFT, (u32 *)bufpoi, NULL);
-}
-
 static int brcmnand_write(struct mtd_info *mtd, struct nand_chip *chip,
 			  u64 addr, const u32 *buf, u8 *oob)
 {
@@ -1944,7 +1934,6 @@ static int brcmnand_init_cs(struct brcmnand_host *host)
 
 	chip->ecc.mode = NAND_ECC_HW;
 	chip->ecc.read_page = brcmnand_read_page;
-	chip->ecc.read_subpage = brcmnand_read_subpage;
 	chip->ecc.write_page = brcmnand_write_page;
 	chip->ecc.read_page_raw = brcmnand_read_page_raw;
 	chip->ecc.write_page_raw = brcmnand_write_page_raw;
-- 
2.6.0.rc2.230.g3dd15c0
