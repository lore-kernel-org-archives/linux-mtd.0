Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by casper.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXWvM-0004sz-C2
 for linux-mtd@lists.infradead.org; Thu, 03 Sep 2015 15:59:41 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Andrea Scian <rnd4@dave-tech.it>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v3 5/5] mtd: nand: sunxi: fix bitflips in erased pages
Date: Thu,  3 Sep 2015 17:58:52 +0200
Message-Id: <1441295932-14868-11-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1441295932-14868-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1441295932-14868-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use the and_check_erased_ecc_chunk() function to test if the ECC error
was triggered by an erased page containing a few bitflips.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/sunxi_nand.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
index ae07850..0ae45ce 100644
--- a/drivers/mtd/nand/sunxi_nand.c
+++ b/drivers/mtd/nand/sunxi_nand.c
@@ -614,7 +614,9 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct mtd_info *mtd,
 	sunxi_nfc_read_buf(mtd, oob, ecc->bytes + 4);
 
 	if (status & NFC_ECC_ERR(0)) {
-		ret = -EIO;
+		ret = nand_check_erased_ecc_chunk(data,	ecc->size,
+						  oob, ecc->bytes + 4,
+						  NULL, 0, ecc->strength);
 	} else {
 		/*
 		 * The engine protects 4 bytes OOB data per chunk.
-- 
1.9.1
