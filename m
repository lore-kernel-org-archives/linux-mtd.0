Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJKse-00058Z-KO
 for linux-mtd@lists.infradead.org; Tue, 20 Dec 2016 13:55:01 +0000
Received: by mail-pg0-x242.google.com with SMTP id w68so5996694pgw.3
 for <linux-mtd@lists.infradead.org>; Tue, 20 Dec 2016 05:54:39 -0800 (PST)
From: Geliang Tang <geliangtang@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Geliang Tang <geliangtang@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: mtdswap: use MTDSWAP_ECNT_MIN/MAX
Date: Tue, 20 Dec 2016 21:54:33 +0800
Message-Id: <254e9f859fdb1f850c1d3bd5777e97bf468b4e5a.1482225376.git.geliangtang@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since macros MTDSWAP_ECNT_MIN() and MTDSWAP_ECNT_MAX() have been
defined in mtdswap.c, use them instead of open-coding.

Signed-off-by: Geliang Tang <geliangtang@gmail.com>
---
 drivers/mtd/mtdswap.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index c40e2c9..f12879a 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -1235,10 +1235,8 @@ static int mtdswap_show(struct seq_file *s, void *data)
 
 		if (root->rb_node) {
 			count[i] = d->trees[i].count;
-			min[i] = rb_entry(rb_first(root), struct swap_eb,
-					rb)->erase_count;
-			max[i] = rb_entry(rb_last(root), struct swap_eb,
-					rb)->erase_count;
+			min[i] = MTDSWAP_ECNT_MIN(root);
+			max[i] = MTDSWAP_ECNT_MAX(root);
 		} else
 			count[i] = 0;
 	}
-- 
2.9.3
