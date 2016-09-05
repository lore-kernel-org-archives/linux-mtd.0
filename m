Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgm1C-0005vC-Qn
 for linux-mtd@lists.infradead.org; Mon, 05 Sep 2016 05:00:28 +0000
From: Heiko Schocher <hs@denx.de>
To: linux-mtd@lists.infradead.org
Cc: Heiko Schocher <hs@denx.de>, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ubifs: compress lines for immediate return
Date: Mon,  5 Sep 2016 06:59:57 +0200
Message-Id: <1473051597-30078-1-git-send-email-hs@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

fix the following code:

-ret = expression;
-if (ret)
-        return ret;
-return 0;
+return expression;

From: Masahiro Yamada <yamada.masahiro@socionext.com>
posted on the U-Boot mailinglist.

Signed-off-by: Heiko Schocher <hs@denx.de>
---

 fs/ubifs/budget.c     | 7 ++-----
 fs/ubifs/gc.c         | 6 ++----
 fs/ubifs/lpt_commit.c | 5 +----
 3 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/fs/ubifs/budget.c b/fs/ubifs/budget.c
index 11a11b3..48d6851 100644
--- a/fs/ubifs/budget.c
+++ b/fs/ubifs/budget.c
@@ -77,7 +77,7 @@ static void shrink_liability(struct ubifs_info *c, int nr_to_write)
  */
 static int run_gc(struct ubifs_info *c)
 {
-	int err, lnum;
+	int lnum;
 
 	/* Make some free space by garbage-collecting dirty space */
 	down_read(&c->commit_sem);
@@ -88,10 +88,7 @@ static int run_gc(struct ubifs_info *c)
 
 	/* GC freed one LEB, return it to lprops */
 	dbg_budg("GC freed LEB %d", lnum);
-	err = ubifs_return_leb(c, lnum);
-	if (err)
-		return err;
-	return 0;
+	return = ubifs_return_leb(c, lnum);
 }
 
 /**
diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 821b348..88cd61d 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -297,10 +297,8 @@ static int sort_nodes(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 	err = dbg_check_data_nodes_order(c, &sleb->nodes);
 	if (err)
 		return err;
-	err = dbg_check_nondata_nodes_order(c, nondata);
-	if (err)
-		return err;
-	return 0;
+
+	return dbg_check_nondata_nodes_order(c, nondata);
 }
 
 /**
diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index ce89bdc..79a8e96 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -313,10 +313,7 @@ static int layout_cnodes(struct ubifs_info *c)
 	alen = ALIGN(offs, c->min_io_size);
 	upd_ltab(c, lnum, c->leb_size - alen, alen - offs);
 	dbg_chk_lpt_sz(c, 4, alen - offs);
-	err = dbg_chk_lpt_sz(c, 3, alen);
-	if (err)
-		return err;
-	return 0;
+	return dbg_chk_lpt_sz(c, 3, alen);
 
 no_space:
 	ubifs_err(c, "LPT out of space at LEB %d:%d needing %d, done_ltab %d, done_lsave %d",
-- 
2.5.5
