Received: from mail-ie0-x231.google.com ([2607:f8b0:4001:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YT1RR-000617-Jv
 for linux-mtd@lists.infradead.org; Wed, 04 Mar 2015 05:01:59 +0000
Received: by iery20 with SMTP id y20so11046304ier.13
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 21:01:31 -0800 (PST)
From: Nicholas Krause <xerofoify@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH 1/3] mtd:Remove unneeded to comments and call to
 check_free_sectors in the function, INFTL_formatblock
Date: Wed,  4 Mar 2015 00:01:23 -0500
Message-Id: <1425445285-17678-1-git-send-email-xerofoify@gmail.com>
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Removes two no longer needed fix mes related to a unnessary call to check_free_sectors
in the function,INFTL_formatblock and the unneeded call to check_free_sectors. This call
to check_free_sectors is no longer needed as we check if the sectors are free by checking
the state of the erase info structure pointer, insr's state to be not equal to MTD_ERASE_FAILED
as this is the same as calling check_free_sectors to check for the sectors being no longer
allocated or in use.

Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
---
 drivers/mtd/inftlmount.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index 1388c8d..8f16de1 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -367,7 +367,6 @@ static int check_free_sectors(struct INFTLrecord *inftl, unsigned int address,
  *
  * Return: 0 when succeed, -1 on error.
  *
- * ToDo: 1. Is it necessary to check_free_sector after erasing ??
  */
 int INFTL_formatblock(struct INFTLrecord *inftl, int block)
 {
@@ -400,14 +399,6 @@ int INFTL_formatblock(struct INFTLrecord *inftl, int block)
 				block);
 			goto fail;
 		}
-
-		/*
-		 * Check the "freeness" of Erase Unit before updating metadata.
-		 * FixMe: is this check really necessary? Since we have check
-		 * the return code after the erase operation.
-		 */
-		if (check_free_sectors(inftl, instr->addr, instr->len, 1) != 0)
-			goto fail;
 	}
 
 	uci.EraseMark = cpu_to_le16(ERASE_MARK);
-- 
2.1.0
