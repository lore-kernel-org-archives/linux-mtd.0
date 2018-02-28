Received: from mxhk.zte.com.cn ([63.217.80.70])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eqrRB-000175-14
 for linux-mtd@lists.infradead.org; Wed, 28 Feb 2018 02:25:46 +0000
From: Jiang Biao <jiang.biao2@zte.com.cn>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 jiang.biao2@zte.com.cn, zhong.weidong@zte.com.cn
Subject: [PATCH] fs/ubifs: remove useless parameter of lpt_heap_replace
Date: Wed, 28 Feb 2018 10:22:37 +0800
Message-Id: <1519784557-105528-1-git-send-email-jiang.biao2@zte.com.cn>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The parameter *old_lprops* is never used in lpt_heap_replace(),
remove it to avoid compile warning.

Signed-off-by: Jiang Biao <jiang.biao2@zte.com.cn>
---
 fs/ubifs/lprops.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
index 6c3a1ab..f5a4684 100644
--- a/fs/ubifs/lprops.c
+++ b/fs/ubifs/lprops.c
@@ -244,7 +244,6 @@ static void remove_from_lpt_heap(struct ubifs_info *c,
 /**
  * lpt_heap_replace - replace lprops in a category heap.
  * @c: UBIFS file-system description object
- * @old_lprops: LEB properties to replace
  * @new_lprops: LEB properties with which to replace
  * @cat: LEB category
  *
@@ -254,7 +253,6 @@ static void remove_from_lpt_heap(struct ubifs_info *c,
  * lprops.  This function does that.
  */
 static void lpt_heap_replace(struct ubifs_info *c,
-			     struct ubifs_lprops *old_lprops,
 			     struct ubifs_lprops *new_lprops, int cat)
 {
 	struct ubifs_lpt_heap *heap;
@@ -362,7 +360,7 @@ void ubifs_replace_cat(struct ubifs_info *c, struct ubifs_lprops *old_lprops,
 	case LPROPS_DIRTY:
 	case LPROPS_DIRTY_IDX:
 	case LPROPS_FREE:
-		lpt_heap_replace(c, old_lprops, new_lprops, cat);
+		lpt_heap_replace(c, new_lprops, cat);
 		break;
 	case LPROPS_UNCAT:
 	case LPROPS_EMPTY:
-- 
2.7.4
