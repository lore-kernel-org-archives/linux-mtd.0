Received: from wf-out-1314.google.com ([209.85.200.175])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LAQwP-0008Eg-4c
	for linux-mtd@lists.infradead.org; Wed, 10 Dec 2008 15:25:33 +0000
Received: by wf-out-1314.google.com with SMTP id 28so192276wfc.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 10 Dec 2008 07:25:31 -0800 (PST)
Message-ID: <f17812d70812100725g1826a878yef86f086c06133b7@mail.gmail.com>
Date: Wed, 10 Dec 2008 23:25:31 +0800
From: "Eric Miao" <eric.y.miao@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] [MTD][NAND] pxa3xx: fix non-page-aligned reads
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: David Woodhouse <dwmw2@infradead.org>,
	ARM Linux <linux-arm-kernel@lists.arm.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 64957c00b7da6101a6b9aa221f6ae26a2e7d88b3 Mon Sep 17 00:00:00 2001
From: Matt Reimer <mreimer@vpop.net>
Date: Tue, 18 Nov 2008 10:47:42 -0800
Subject: [PATCH] [MTD][NAND] pxa3xx: fix non-page-aligned reads

Reads from non-page-aligned addresses were broken because while the
address to read from was correctly written to NDCB*, a full page was
always read. Fix this by ignoring the column and only using the page
address.

I suspect this whole-page behavior is due to the controller's need to
read the entire page in order to generate correct ECC. In the non-ECC
case this could be optimized to use the column address, and to set the
read length to what is being requested rather than the length of an
entire page.

Signed-off-by: Matt Reimer <mreimer@vpop.net>
Signed-off-by: Eric Miao <eric.miao@marvell.com>
---
 drivers/mtd/nand/pxa3xx_nand.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index ce5752a..b797c1c 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -367,14 +367,14 @@ static int prepare_read_prog_cmd(struct
pxa3xx_nand_info *info,
 		/* large block, 2 cycles for column address
 		 * row address starts from 3rd cycle
 		 */
-		info->ndcb1 |= (page_addr << 16) | (column & 0xffff);
+		info->ndcb1 |= page_addr << 16;
 		if (info->row_addr_cycles == 3)
 			info->ndcb2 = (page_addr >> 16) & 0xff;
 	} else
 		/* small block, 1 cycles for column address
 		 * row address starts from 2nd cycle
 		 */
-		info->ndcb1 = (page_addr << 8) | (column & 0xff);
+		info->ndcb1 = page_addr << 8;

 	if (cmd == cmdset->program)
 		info->ndcb0 |= NDCB0_CMD_TYPE(1) | NDCB0_AUTO_RS;
-- 
1.6.0.4
