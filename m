Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SH5Jq-0007xf-H6
 for linux-mtd@lists.infradead.org; Mon, 09 Apr 2012 03:31:07 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dedekind1@gmail.com>
Subject: [PATCH] mtd : print out the page size and oob size after parsing out
 the nand
Date: Mon, 9 Apr 2012 11:41:37 +0800
Message-ID: <1333942897-7392-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some not-supported nand chips may pass the current parsing code,
and get the wrong page size and oob size. Sometimes, it's hard to notice
that you get the wrong values, because there is no warning or error.

So it's useful to print out the page size and oob size in the end of
the parsing function. We can check these values with the datasheet of the nand
chip as soon as possible.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 47b19c0..6315b94 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3155,9 +3155,10 @@ ident_done:
 		chip->cmdfunc = nand_command_lp;
 
 	pr_info("NAND device: Manufacturer ID:"
-		" 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id, *dev_id,
-		nand_manuf_ids[maf_idx].name,
-		chip->onfi_version ? chip->onfi_params.model : type->name);
+		" 0x%02x, Chip ID: 0x%02x (%s %s), pagesize: %d, oobsize: %d\n",
+		*maf_id, *dev_id, nand_manuf_ids[maf_idx].name,
+		chip->onfi_version ? chip->onfi_params.model : type->name,
+		mtd->writesize, mtd->oobsize);
 
 	return type;
 }
-- 
1.7.0.4
