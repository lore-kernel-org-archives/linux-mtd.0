Received: from mx.dave-tech.it ([2.229.21.40])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YTr7e-0003Ua-Va
 for linux-mtd@lists.infradead.org; Fri, 06 Mar 2015 12:12:56 +0000
From: rnd4@dave-tech.it
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: nand: use a lower value for badblockbits when
 working with MLC NAND
Date: Fri,  6 Mar 2015 13:12:17 +0100
Message-Id: <1425643938-24749-2-git-send-email-rnd4@dave-tech.it>
In-Reply-To: <1425643938-24749-1-git-send-email-rnd4@dave-tech.it>
References: <1425643938-24749-1-git-send-email-rnd4@dave-tech.it>
Cc: boris.brezillon@free-electrons.com, Andrea Scian <andrea.scian@dave.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Andrea Scian <andrea.scian@dave.eu>

MLC NANDs have more bit flips that SLC. When looking for bad block
marker we have a lot of false positive if we check for the whole byte. To
avoid this tolerate a few (4 here) bit flips for byte.

Signed-off-by: Andrea Scian <andrea.scian@dave.eu>
---
 drivers/mtd/nand/nand_base.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index dfcd0a5..bdca223 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3315,7 +3315,10 @@ ident_done:
 		chip->chip_shift += 32 - 1;
 	}
 
-	chip->badblockbits = 8;
+	if (nand_is_slc(chip))
+		chip->badblockbits = 8;
+	else
+		chip->badblockbits = 4;
 	chip->erase_cmd = single_erase_cmd;
 
 	/* Do not replace user supplied command function! */
-- 
1.7.9.5
