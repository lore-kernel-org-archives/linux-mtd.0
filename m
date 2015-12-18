Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aA0t5-0001n1-86
 for linux-mtd@lists.infradead.org; Fri, 18 Dec 2015 19:40:23 +0000
Received: by mail-pa0-x22d.google.com with SMTP id ur14so64899450pab.0
 for <linux-mtd@lists.infradead.org>; Fri, 18 Dec 2015 11:40:02 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH] mtd: nand: docg4: simplify error case
Date: Fri, 18 Dec 2015 11:39:53 -0800
Message-Id: <1450467593-90957-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Other refactorings have left the 'fail' label much simpler, so it
shouldn't have to handle the failed allocation case.

This also fixes a -Wshadow warning.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/docg4.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
index cb6efadd712e..24d478d90dcc 100644
--- a/drivers/mtd/nand/docg4.c
+++ b/drivers/mtd/nand/docg4.c
@@ -1353,14 +1353,10 @@ static int __init probe_docg4(struct platform_device *pdev)
 	doc->mtd = mtd;
 	return 0;
 
- fail:
-	if (nand) {
-		/* re-declarations avoid compiler warning */
-		struct docg4_priv *doc = nand->priv;
-		nand_release(mtd); /* deletes partitions and mtd devices */
-		free_bch(doc->bch);
-		kfree(nand);
-	}
+fail:
+	nand_release(mtd); /* deletes partitions and mtd devices */
+	free_bch(doc->bch);
+	kfree(nand);
 
 fail_unmap:
 	iounmap(virtadr);
-- 
2.6.0.rc2.230.g3dd15c0
