Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QjDlX-0004Ov-Vb
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2011 17:07:29 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 01/11] mtd: nand: change KERN_DEBUG to KERN_INFO
Date: Tue, 19 Jul 2011 10:06:06 -0700
Message-ID: <1311095176-5407-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1311095176-5407-1-git-send-email-computersforpeace@gmail.com>
References: <1311095176-5407-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Soon we will change many printk statements into pr_* statements, i.e.,
'printk(KERN_INFO, ...)' becomes 'pr_info(...)'. However, this means that
KERN_DEBUG messages will become pr_debug() statements and therefore will
not be activated by default - they must be enabled using dynamic debug.
So, for important DEBUG messages, we will simply upgrade these to INFO
so that they appear by default.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_bbt.c |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index a4fcbf1..0d2eaa7 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -219,7 +219,7 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 				if (tmp == msk)
 					continue;
 				if (reserved_block_code && (tmp == reserved_block_code)) {
-					printk(KERN_DEBUG "nand_read_bbt: Reserved block at 0x%012llx\n",
+					printk(KERN_INFO "nand_read_bbt: Reserved block at 0x%012llx\n",
 					       (loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
 					this->bbt[offs + (act >> 3)] |= 0x2 << (act & 0x06);
 					mtd->ecc_stats.bbtblocks++;
@@ -227,9 +227,9 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 				}
 				/*
 				 * Leave it for now, if it's matured we can
-				 * move this message to MTD_DEBUG_LEVEL0.
+				 * move this message to pr_debug.
 				 */
-				printk(KERN_DEBUG "nand_read_bbt: Bad block at 0x%012llx\n",
+				printk(KERN_INFO "nand_read_bbt: Bad block at 0x%012llx\n",
 				       (loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
 				/* Factory marked bad or worn out? */
 				if (tmp == 0)
@@ -389,7 +389,7 @@ static int read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 		scan_read_raw(mtd, buf, (loff_t)td->pages[0] << this->page_shift,
 			      mtd->writesize, td);
 		td->version[0] = buf[bbt_get_ver_offs(mtd, td)];
-		printk(KERN_DEBUG "Bad block table at page %d, version 0x%02X\n",
+		printk(KERN_INFO "Bad block table at page %d, version 0x%02X\n",
 		       td->pages[0], td->version[0]);
 	}
 
@@ -398,7 +398,7 @@ static int read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 		scan_read_raw(mtd, buf, (loff_t)md->pages[0] << this->page_shift,
 			      mtd->writesize, td);
 		md->version[0] = buf[bbt_get_ver_offs(mtd, md)];
-		printk(KERN_DEBUG "Bad block table at page %d, version 0x%02X\n",
+		printk(KERN_INFO "Bad block table at page %d, version 0x%02X\n",
 		       md->pages[0], md->version[0]);
 	}
 	return 1;
@@ -616,7 +616,7 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 		if (td->pages[i] == -1)
 			printk(KERN_WARNING "Bad block table not found for chip %d\n", i);
 		else
-			printk(KERN_DEBUG "Bad block table found at page %d, version 0x%02X\n", td->pages[i],
+			printk(KERN_INFO "Bad block table found at page %d, version 0x%02X\n", td->pages[i],
 			       td->version[i]);
 	}
 	return 0;
@@ -847,7 +847,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		if (res < 0)
 			goto outerr;
 
-		printk(KERN_DEBUG "Bad block table written to 0x%012llx, version "
+		printk(KERN_INFO "Bad block table written to 0x%012llx, version "
 		       "0x%02X\n", (unsigned long long)to, td->version[chip]);
 
 		/* Mark it as used */
-- 
1.7.0.4
