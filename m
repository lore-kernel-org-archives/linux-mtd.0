Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e8h5H-0005JW-8i
 for linux-mtd@lists.infradead.org; Sun, 29 Oct 2017 06:28:36 +0000
Received: by mail-pf0-x241.google.com with SMTP id x7so8097728pfa.1
 for <linux-mtd@lists.infradead.org>; Sat, 28 Oct 2017 23:28:13 -0700 (PDT)
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: mtdswap: fix spelling mistake: 'TRESHOLD' -> 'THRESHOLD'
Date: Sun, 29 Oct 2017 11:58:00 +0530
Message-Id: <a8a84a48c54dd741405ff20f5275910910f8020a.1509258323.git.arvind.yadav.cs@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Trivial fix to spelling mistakes.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/mtd/mtdswap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index 7d9080e..f07492c 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -50,7 +50,7 @@
  * Number of free eraseblocks below which GC can also collect low frag
  * blocks.
  */
-#define LOW_FRAG_GC_TRESHOLD	5
+#define LOW_FRAG_GC_THRESHOLD	5
 
 /*
  * Wear level cost amortization. We want to do wear leveling on the background
@@ -805,7 +805,7 @@ static int __mtdswap_choose_gc_tree(struct mtdswap_dev *d)
 {
 	int idx, stopat;
 
-	if (TREE_COUNT(d, CLEAN) < LOW_FRAG_GC_TRESHOLD)
+	if (TREE_COUNT(d, CLEAN) < LOW_FRAG_GC_THRESHOLD)
 		stopat = MTDSWAP_LOWFRAG;
 	else
 		stopat = MTDSWAP_HIFRAG;
-- 
2.7.4
