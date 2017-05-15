Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAOPi-0007c6-2w
 for linux-mtd@lists.infradead.org; Mon, 15 May 2017 22:24:37 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: [PATCH 2/2] mtd: nand: sunxi: Remove unneeded
 ->cmdfunc(NAND_CMD_READ0, 0, page)
Date: Tue, 16 May 2017 00:23:46 +0200
Message-Id: <1494887026-20970-2-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1494887026-20970-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1494887026-20970-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The core already sends the NAND_CMD_READ0 for us. Duplicating this call
in the driver is useless and introduces a perf penalty.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/sunxi_nand.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
index a4e43026c35d..84bcee5b0fa0 100644
--- a/drivers/mtd/nand/sunxi_nand.c
+++ b/drivers/mtd/nand/sunxi_nand.c
@@ -1301,7 +1301,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct mtd_info *mtd,
 
 	sunxi_nfc_hw_ecc_enable(mtd);
 
-	chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
 	for (i = data_offs / ecc->size;
 	     i < DIV_ROUND_UP(data_offs + readlen, ecc->size); i++) {
 		int data_off = i * ecc->size;
-- 
2.7.4
