Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSUhL-0004hg-QR
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 13:46:07 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p53Djuqh013884
	for <linux-mtd@lists.infradead.org>; Fri, 3 Jun 2011 16:45:57 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 04/10] UBIFS: fix recovery broken by the previous recovery fix
Date: Fri,  3 Jun 2011 16:49:55 +0300
Message-Id: <1307109001-19761-5-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1307109001-19761-1-git-send-email-dedekind1@gmail.com>
References: <1307109001-19761-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Unfortunately, the recovery fix d1606a59b6be4ea392eabd40d1250aa1eeb19efb
(UBIFS: fix extremely rare mount failure) broke recovery. This commit make
UBIFS drop the last min. I/O unit in all journal heads, but this is needed only
for the GC head. And this does not work for non-GC heads. For example, if
suppose we have min. I/O units A and B, and A contains a valid node X, which
was fsynced, and then a group of nodes Y which spans the rest of A and B. In
this case we'll drop not only Y, but also X, which is obviously incorrect.

This patch fixes the issue and additionally makes recovery to drop last min.
I/O unit only for the GC head, and leave things as they have been for ages for
the other heads - this is safer.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/recovery.c |  152 +++++++++++++++++++++++++++++----------------------
 1 files changed, 87 insertions(+), 65 deletions(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 6adb532..783d8e0 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -564,19 +564,15 @@ static int fix_unclean_leb(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 }
 
 /**
- * drop_last_node - drop the last node or group of nodes.
+ * drop_last_group - drop the last group of nodes.
  * @sleb: scanned LEB information
  * @offs: offset of dropped nodes is returned here
- * @grouped: non-zero if whole group of nodes have to be dropped
  *
  * This is a helper function for 'ubifs_recover_leb()' which drops the last
- * node of the scanned LEB or the last group of nodes if @grouped is not zero.
- * This function returns %1 if a node was dropped and %0 otherwise.
+ * group of nodes of the scanned LEB.
  */
-static int drop_last_node(struct ubifs_scan_leb *sleb, int *offs, int grouped)
+static void drop_last_group(struct ubifs_scan_leb *sleb, int *offs)
 {
-	int dropped = 0;
-
 	while (!list_empty(&sleb->nodes)) {
 		struct ubifs_scan_node *snod;
 		struct ubifs_ch *ch;
@@ -585,17 +581,40 @@ static int drop_last_node(struct ubifs_scan_leb *sleb, int *offs, int grouped)
 				  list);
 		ch = snod->node;
 		if (ch->group_type != UBIFS_IN_NODE_GROUP)
-			return dropped;
-		dbg_rcvry("dropping node at %d:%d", sleb->lnum, snod->offs);
+			break;
+
+		dbg_rcvry("dropping grouped node at %d:%d",
+			  sleb->lnum, snod->offs);
+		*offs = snod->offs;
+		list_del(&snod->list);
+		kfree(snod);
+		sleb->nodes_cnt -= 1;
+	}
+}
+
+/**
+ * drop_last_node - drop the last node.
+ * @sleb: scanned LEB information
+ * @offs: offset of dropped nodes is returned here
+ * @grouped: non-zero if whole group of nodes have to be dropped
+ *
+ * This is a helper function for 'ubifs_recover_leb()' which drops the last
+ * node of the scanned LEB.
+ */
+static void drop_last_node(struct ubifs_scan_leb *sleb, int *offs)
+{
+	struct ubifs_scan_node *snod;
+
+	if (!list_empty(&sleb->nodes)) {
+		snod = list_entry(sleb->nodes.prev, struct ubifs_scan_node,
+				  list);
+
+		dbg_rcvry("dropping last node at %d:%d", sleb->lnum, snod->offs);
 		*offs = snod->offs;
 		list_del(&snod->list);
 		kfree(snod);
 		sleb->nodes_cnt -= 1;
-		dropped = 1;
-		if (!grouped)
-			break;
 	}
-	return dropped;
 }
 
 /**
@@ -697,59 +716,62 @@ struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 		 * If nodes are grouped, always drop the incomplete group at
 		 * the end.
 		 */
-		drop_last_node(sleb, &offs, 1);
+		drop_last_group(sleb, &offs);
 
-	/*
-	 * While we are in the middle of the same min. I/O unit keep dropping
-	 * nodes. So basically, what we want is to make sure that the last min.
-	 * I/O unit where we saw the corruption is dropped completely with all
-	 * the uncorrupted nodes which may possibly sit there.
-	 *
-	 * In other words, let's name the min. I/O unit where the corruption
-	 * starts B, and the previous min. I/O unit A. The below code tries to
-	 * deal with a situation when half of B contains valid nodes or the end
-	 * of a valid node, and the second half of B contains corrupted data or
-	 * garbage. This means that UBIFS had been writing to B just before the
-	 * power cut happened. I do not know how realistic is this scenario
-	 * that half of the min. I/O unit had been written successfully and the
-	 * other half not, but this is possible in our 'failure mode emulation'
-	 * infrastructure at least.
-	 *
-	 * So what is the problem, why we need to drop those nodes? Whey can't
-	 * we just clean-up the second half of B by putting a padding node
-	 * there? We can, and this works fine with one exception which was
-	 * reproduced with power cut emulation testing and happens extremely
-	 * rarely. The description follows, but it is worth noting that that is
-	 * only about the GC head, so we could do this trick only if the bud
-	 * belongs to the GC head, but it does not seem to be worth an
-	 * additional "if" statement.
-	 *
-	 * So, imagine the file-system is full, we run GC which is moving valid
-	 * nodes from LEB X to LEB Y (obviously, LEB Y is the current GC head
-	 * LEB). The @c->gc_lnum is -1, which means that GC will retain LEB X
-	 * and will try to continue. Imagine that LEB X is currently the
-	 * dirtiest LEB, and the amount of used space in LEB Y is exactly the
-	 * same as amount of free space in LEB X.
-	 *
-	 * And a power cut happens when nodes are moved from LEB X to LEB Y. We
-	 * are here trying to recover LEB Y which is the GC head LEB. We find
-	 * the min. I/O unit B as described above. Then we clean-up LEB Y by
-	 * padding min. I/O unit. And later 'ubifs_rcvry_gc_commit()' function
-	 * fails, because it cannot find a dirty LEB which could be GC'd into
-	 * LEB Y! Even LEB X does not match because the amount of valid nodes
-	 * there does not fit the free space in LEB Y any more! And this is
-	 * because of the padding node which we added to LEB Y. The
-	 * user-visible effect of this which I once observed and analysed is
-	 * that we cannot mount the file-system with -ENOSPC error.
-	 *
-	 * So obviously, to make sure that situation does not happen we should
-	 * free min. I/O unit B in LEB Y completely and the last used min. I/O
-	 * unit in LEB Y should be A. This is basically what the below code
-	 * tries to do.
-	 */
-	while (min_io_unit == round_down(offs, c->min_io_size) &&
-	       min_io_unit != offs &&
-	       drop_last_node(sleb, &offs, grouped));
+	if (jhead == GCHD) {
+		/*
+		 * If this LEB belongs to the GC head then while we are in the
+		 * middle of the same min. I/O unit keep dropping nodes. So
+		 * basically, what we want is to make sure that the last min.
+		 * I/O unit where we saw the corruption is dropped completely
+		 * with all the uncorrupted nodes which may possibly sit there.
+		 *
+		 * In other words, let's name the min. I/O unit where the
+		 * corruption starts B, and the previous min. I/O unit A. The
+		 * below code tries to deal with a situation when half of B
+		 * contains valid nodes or the end of a valid node, and the
+		 * second half of B contains corrupted data or garbage. This
+		 * means that UBIFS had been writing to B just before the power
+		 * cut happened. I do not know how realistic is this scenario
+		 * that half of the min. I/O unit had been written successfully
+		 * and the other half not, but this is possible in our 'failure
+		 * mode emulation' infrastructure at least.
+		 *
+		 * So what is the problem, why we need to drop those nodes? Why
+		 * can't we just clean-up the second half of B by putting a
+		 * padding node there? We can, and this works fine with one
+		 * exception which was reproduced with power cut emulation
+		 * testing and happens extremely rarely.
+		 *
+		 * Imagine the file-system is full, we run GC which starts
+		 * moving valid nodes from LEB X to LEB Y (obviously, LEB Y is
+		 * the current GC head LEB). The @c->gc_lnum is -1, which means
+		 * that GC will retain LEB X and will try to continue. Imagine
+		 * that LEB X is currently the dirtiest LEB, and the amount of
+		 * used space in LEB Y is exactly the same as amount of free
+		 * space in LEB X.
+		 *
+		 * And a power cut happens when nodes are moved from LEB X to
+		 * LEB Y. We are here trying to recover LEB Y which is the GC
+		 * head LEB. We find the min. I/O unit B as described above.
+		 * Then we clean-up LEB Y by padding min. I/O unit. And later
+		 * 'ubifs_rcvry_gc_commit()' function fails, because it cannot
+		 * find a dirty LEB which could be GC'd into LEB Y! Even LEB X
+		 * does not match because the amount of valid nodes there does
+		 * not fit the free space in LEB Y any more! And this is
+		 * because of the padding node which we added to LEB Y. The
+		 * user-visible effect of this which I once observed and
+		 * analysed is that we cannot mount the file-system with
+		 * -ENOSPC error.
+		 *
+		 * So obviously, to make sure that situation does not happen we
+		 * should free min. I/O unit B in LEB Y completely and the last
+		 * used min. I/O unit in LEB Y should be A. This is basically
+		 * what the below code tries to do.
+		 */
+		while (offs > min_io_unit)
+			drop_last_node(sleb, &offs);
+	}
 
 	buf = sbuf + offs;
 	len = c->leb_size - offs;
-- 
1.7.2.3
