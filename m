Received: from mailserver5.natinst.com ([130.164.80.5]
 helo=spamkiller05.natinst.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UciZH-0001K1-JD
 for linux-mtd@lists.infradead.org; Wed, 15 May 2013 20:45:01 +0000
Received: from US-AUS-MAIL4.amer.corp.natinst.com (nb-chan1-1338.natinst.com
 [130.164.19.134])
 by spamkiller05.natinst.com (8.14.5/8.14.5) with ESMTP id r4FKiZ39015913
 for <linux-mtd@lists.infradead.org>; Wed, 15 May 2013 15:44:35 -0500
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Subject: [PATCH] mtd: nand: nand_bbt: scan for next free bbt block if writing
 bbt fails
From: Jeff Westfahl <jeff.westfahl@ni.com>
Message-ID: <OF97DE13B9.4C0523A2-ON86257B6C.00717E04-86257B6C.0071F1E7@ni.com>
Date: Wed, 15 May 2013 15:44:34 -0500
Content-Type: text/plain; charset="US-ASCII"
Cc: jeff.westfahl@ni.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If erasing or writing the BBT fails, we should mark the current BBT block
as bad and use the BBT descriptor to scan for the next available unused
block in the BBT. We should only return a failure if there isn't any space
left.

Signed-off-by: Jeff Westfahl <jeff.westfahl@ni.com>
---
 drivers/mtd/nand/nand_bbt.c |   21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 2672643..900bda1 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -697,6 +697,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t 
*buf,
                                                 page = td->pages[chip];
                                                 goto write;
                                 }
+                next:
 
                                 /*
                                  * Automatic placement of the bad block 
table. Search direction
@@ -831,14 +832,26 @@ static int write_bbt(struct mtd_info *mtd, uint8_t 
*buf,
                                 einfo.addr = to;
                                 einfo.len = 1 << this->bbt_erase_shift;
                                 res = nand_erase_nand(mtd, &einfo, 1);
-                                if (res < 0)
-                                                goto outerr;
+                                if (res < 0) {
+                                                /* This block is bad. 
Mark it as such and see if there's
+                                                   another available in 
the BBT area. */
+                                                int block = page >>
+ (this->bbt_erase_shift - this->page_shift);
+                                                this->bbt[block >> 2] |= 
0x01 << ((block & 0x03) << 1);
+                                                goto next;
+                                }
 
                                 res = scan_write_bbt(mtd, to, len, buf,
 td->options & NAND_BBT_NO_OOB ? NULL :
 &buf[len]);
-                                if (res < 0)
-                                                goto outerr;
+                                if (res < 0) {
+                                                /* This block is bad. 
Mark it as such and see if there's
+                                                   another available in 
the BBT area. */
+                                                int block = page >>
+ (this->bbt_erase_shift - this->page_shift);
+                                                this->bbt[block >> 2] |= 
0x01 << ((block & 0x03) << 1);
+                                                goto next;
+                                }
 
                                 pr_info("Bad block table written to 
0x%012llx, version 0x%02X\n",
                                                  (unsigned long long)to, 
td->version[chip]);
-- 
1.7.10
