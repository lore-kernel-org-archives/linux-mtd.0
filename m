Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YzWzT-00087g-A7
 for linux-mtd@lists.infradead.org; Mon, 01 Jun 2015 21:11:24 +0000
From: Richard Weinberger <richard@nod.at>
To: computersforpeace@gmail.com
Subject: [PATCH 3/6] mtd: cs553x_nand: Fix kasprintf() usage
Date: Mon,  1 Jun 2015 23:10:51 +0200
Message-Id: <1433193054-26865-4-git-send-email-richard@nod.at>
In-Reply-To: <1433193054-26865-1-git-send-email-richard@nod.at>
References: <1433193054-26865-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, maximlevitsky@gmail.com, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

kasprintf() does a dynamic memory allocation and can fail.
We have to handle that case.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/cs553x_nand.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/cs553x_nand.c b/drivers/mtd/nand/cs553x_nand.c
index 88109d3..aec6045 100644
--- a/drivers/mtd/nand/cs553x_nand.c
+++ b/drivers/mtd/nand/cs553x_nand.c
@@ -237,17 +237,23 @@ static int __init cs553x_init_one(int cs, int mmio, unsigned long adr)
 	/* Enable the following for a flash based bad block table */
 	this->bbt_options = NAND_BBT_USE_FLASH;
 
+	new_mtd->name = kasprintf(GFP_KERNEL, "cs553x_nand_cs%d", cs);
+	if (!new_mtd->name) {
+		err = -ENOMEM;
+		goto out_ior;
+	}
+
 	/* Scan to find existence of the device */
 	if (nand_scan(new_mtd, 1)) {
 		err = -ENXIO;
-		goto out_ior;
+		goto out_free;
 	}
 
-	new_mtd->name = kasprintf(GFP_KERNEL, "cs553x_nand_cs%d", cs);
-
 	cs553x_mtd[cs] = new_mtd;
 	goto out;
 
+out_free:
+	kfree(new_mtd->name);
 out_ior:
 	iounmap(this->IO_ADDR_R);
 out_mtd:
-- 
1.8.4.5
