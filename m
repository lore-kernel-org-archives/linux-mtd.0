Received: from mail-ig0-x22a.google.com ([2607:f8b0:4001:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YCBHh-0001hj-Tb
 for linux-mtd@lists.infradead.org; Fri, 16 Jan 2015 18:06:14 +0000
Received: by mail-ig0-f170.google.com with SMTP id l13so4912791iga.1
 for <linux-mtd@lists.infradead.org>; Fri, 16 Jan 2015 10:05:52 -0800 (PST)
From: Nicholas Krause <xerofoify@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH 1/2] mtd: Remove unneeded call to check_free_sectors in the
 function, INFTL_formatblock
Date: Fri, 16 Jan 2015 13:05:44 -0500
Message-Id: <1421431545-7883-1-git-send-email-xerofoify@gmail.com>
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

Removes unneeded call to check_free_sectors internally in the function,INFTL_formatblock.
This call is no longer needed due to us checking to see if erasing the block against the
structure pointer passed to the function,inftl internal variable state is equal to the
macro,MTD_ERASE_FAILED to see if the block has failed in being erased successfully.Due
to this we can remove the no longer needed check to check_free_sectors and comments
related to questioning the reason for it's use with the check against MTD_ERASE_FAILED
for inftl's state variable already checking for successfully erasing of the mtd block.

Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
---
 drivers/mtd/inftlmount.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index 1388c8d..f5808ad 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -362,12 +362,9 @@ static int check_free_sectors(struct INFTLrecord *inftl, unsigned int address,
 
 /*
  * INFTL_format: format a Erase Unit by erasing ALL Erase Zones in the Erase
- *		 Unit and Update INFTL metadata. Each erase operation is
- *		 checked with check_free_sectors.
- *
+ *		 Unit and Update INFTL metadata. *
  * Return: 0 when succeed, -1 on error.
  *
- * ToDo: 1. Is it necessary to check_free_sector after erasing ??
  */
 int INFTL_formatblock(struct INFTLrecord *inftl, int block)
 {
@@ -401,13 +398,6 @@ int INFTL_formatblock(struct INFTLrecord *inftl, int block)
 			goto fail;
 		}
 
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
