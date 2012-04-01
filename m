Received: from rcsinet15.oracle.com ([148.87.113.117])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SENAR-0003af-05
 for linux-mtd@lists.infradead.org; Sun, 01 Apr 2012 15:58:11 +0000
Date: Sun, 1 Apr 2012 18:57:59 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [patch] UBIFS: remove douple initialization in change_category()
Message-ID: <20120401155759.GA21238@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
 Adrian Hunter <adrian.hunter@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"heap" is initialized twice.  I removed the first one, because it makes
Smatch complain that we use "new_cat" as an offset before checking it.

This doesn't change how the code works, it's just a cleanup.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
index f8a181e..b5c95a6 100644
--- a/fs/ubifs/lprops.c
+++ b/fs/ubifs/lprops.c
@@ -447,7 +447,7 @@ static void change_category(struct ubifs_info *c, struct ubifs_lprops *lprops)
 	int new_cat = ubifs_categorize_lprops(c, lprops);
 
 	if (old_cat == new_cat) {
-		struct ubifs_lpt_heap *heap = &c->lpt_heap[new_cat - 1];
+		struct ubifs_lpt_heap *heap;
 
 		/* lprops on a heap now must be moved up or down */
 		if (new_cat < 1 || new_cat > LPROPS_HEAP_CNT)
