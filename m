Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MoFyL-0008Rt-4R
	for linux-mtd@lists.infradead.org; Thu, 17 Sep 2009 12:20:29 +0000
Received: from esebh105.NOE.Nokia.com (esebh105.ntc.nokia.com [172.21.138.211])
	by mgw-mx09.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	n8HCJ0xY007444
	for <linux-mtd@lists.infradead.org>; Thu, 17 Sep 2009 07:19:38 -0500
From: Artem Bityutskiy <dedekind@infradead.org>
To: Adrian Hunter <Adrian.Hunter@nokia.com>
Subject: [PATCH 3/5] UBIFS: various minor commentary fixes
Date: Thu, 17 Sep 2009 15:19:54 +0300
Message-Id: <1253189996-14191-4-git-send-email-dedekind@infradead.org>
In-Reply-To: <1253189996-14191-1-git-send-email-dedekind@infradead.org>
References: <1253189996-14191-1-git-send-email-dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/budget.c |    2 +-
 fs/ubifs/lprops.c |   14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/ubifs/budget.c b/fs/ubifs/budget.c
index eaf6d89..c1f3f99 100644
--- a/fs/ubifs/budget.c
+++ b/fs/ubifs/budget.c
@@ -741,7 +741,7 @@ long long ubifs_get_free_space_nolock(struct ubifs_info *c)
  * ubifs_get_free_space - return amount of free space.
  * @c: UBIFS file-system description object
  *
- * This function calculates and retuns amount of free space to report to
+ * This function calculates and returns amount of free space to report to
  * user-space.
  */
 long long ubifs_get_free_space(struct ubifs_info *c)
diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
index 00f19b4..89b355a 100644
--- a/fs/ubifs/lprops.c
+++ b/fs/ubifs/lprops.c
@@ -281,7 +281,7 @@ void ubifs_add_to_cat(struct ubifs_info *c, struct ubifs_lprops *lprops,
 	case LPROPS_FREE:
 		if (add_to_lpt_heap(c, lprops, cat))
 			break;
-		/* No more room on heap so make it uncategorized */
+		/* No more room on heap so make it un-categorized */
 		cat = LPROPS_UNCAT;
 		/* Fall through */
 	case LPROPS_UNCAT:
@@ -375,8 +375,8 @@ void ubifs_replace_cat(struct ubifs_info *c, struct ubifs_lprops *old_lprops,
  * @lprops: LEB properties
  *
  * A LEB may have fallen off of the bottom of a heap, and ended up as
- * uncategorized even though it has enough space for us now. If that is the case
- * this function will put the LEB back onto a heap.
+ * un-categorized even though it has enough space for us now. If that is the
+ * case this function will put the LEB back onto a heap.
  */
 void ubifs_ensure_cat(struct ubifs_info *c, struct ubifs_lprops *lprops)
 {
@@ -436,10 +436,10 @@ int ubifs_categorize_lprops(const struct ubifs_info *c,
 /**
  * change_category - change LEB properties category.
  * @c: UBIFS file-system description object
- * @lprops: LEB properties to recategorize
+ * @lprops: LEB properties to re-categorize
  *
  * LEB properties are categorized to enable fast find operations. When the LEB
- * properties change they must be recategorized.
+ * properties change they must be re-categorized.
  */
 static void change_category(struct ubifs_info *c, struct ubifs_lprops *lprops)
 {
@@ -518,7 +518,7 @@ static int is_lprops_dirty(struct ubifs_info *c, struct ubifs_lprops *lprops)
  * @free: new free space amount
  * @dirty: new dirty space amount
  * @flags: new flags
- * @idx_gc_cnt: change to the count of idx_gc list
+ * @idx_gc_cnt: change to the count of @idx_gc list
  *
  * This function changes LEB properties (@free, @dirty or @flag). However, the
  * property which has the %LPROPS_NC value is not changed. Returns a pointer to
@@ -535,7 +535,7 @@ const struct ubifs_lprops *ubifs_change_lp(struct ubifs_info *c,
 {
 	/*
 	 * This is the only function that is allowed to change lprops, so we
-	 * discard the const qualifier.
+	 * discard the "const" qualifier.
 	 */
 	struct ubifs_lprops *lprops = (struct ubifs_lprops *)lp;
 
-- 
1.6.2.5
