Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QLxGY-0005ws-Ts
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 12:51:20 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-da01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4GCpDUo021378
	for <linux-mtd@lists.infradead.org>; Mon, 16 May 2011 15:51:17 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/4] UBIFS: fix extremely rare mount failure
Date: Mon, 16 May 2011 15:55:13 +0300
Message-Id: <1305550513-27990-5-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1305550513-27990-1-git-send-email-dedekind1@gmail.com>
References: <1305550513-27990-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This patch fixes an extremely rare mount failure after a power cut, when mount
fails with ENOSPC error because UBIFS could not find the GC LEB.

In short, the reason for this failure is that after recovery the GC head LEB
contains less free space than it had contained just before the power cut
happened. As a result, if the FS is full, 'ubifs_rcvry_gc_commit()' is unable
to find a dirty LEB to GC and a free LEB, so mount fails.

This patch contains a huge comment with more detailed explanation, please refer
that comment.

Since this is really really rare and unlikely situation, I do not send this
patch to the stable tree, also because it requires a lot of preparation
patches which I did before. So sending this to -stable would be too risky.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/recovery.c |   82 ++++++++++++++++++++++++++++++++++++++++++++------
 1 files changed, 72 insertions(+), 10 deletions(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 74281f1..731d9e2 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -564,13 +564,16 @@ static int fix_unclean_leb(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 }
 
 /**
- * drop_incomplete_group - drop nodes from an incomplete group.
+ * drop_last_node - drop the last node or group of nodes.
  * @sleb: scanned LEB information
  * @offs: offset of dropped nodes is returned here
+ * @grouped: non-zero if whole group of nodes have to be dropped
  *
- * This function returns %1 if nodes are dropped and %0 otherwise.
+ * This is a helper function for 'ubifs_recover_leb()' which drops the last
+ * node of the scanned LEB or the last group of nodes if @grouped is not zero.
+ * This function returns %1 if a node was dropped and %0 otherwise.
  */
-static int drop_incomplete_group(struct ubifs_scan_leb *sleb, int *offs)
+static int drop_last_node(struct ubifs_scan_leb *sleb, int *offs, int grouped)
 {
 	int dropped = 0;
 
@@ -589,6 +592,8 @@ static int drop_incomplete_group(struct ubifs_scan_leb *sleb, int *offs)
 		kfree(snod);
 		sleb->nodes_cnt -= 1;
 		dropped = 1;
+		if (!grouped)
+			break;
 	}
 	return dropped;
 }
@@ -609,8 +614,7 @@ static int drop_incomplete_group(struct ubifs_scan_leb *sleb, int *offs)
 struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 					 int offs, void *sbuf, int grouped)
 {
-	int ret = 0, err, len = c->leb_size - offs;
-	int start = offs;
+	int ret = 0, err, len = c->leb_size - offs, start = offs, min_io_unit;
 	struct ubifs_scan_leb *sleb;
 	void *buf = sbuf + offs;
 
@@ -620,6 +624,7 @@ struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 	if (IS_ERR(sleb))
 		return sleb;
 
+	ubifs_assert(len >= 8);
 	while (len >= 8) {
 		dbg_scan("look at LEB %d:%d (%d bytes left)",
 			 lnum, offs, len);
@@ -684,11 +689,68 @@ struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 		}
 	}
 
-	/* Drop nodes from incomplete group */
-	if (grouped && drop_incomplete_group(sleb, &offs)) {
-		buf = sbuf + offs;
-		len = c->leb_size - offs;
-	}
+	min_io_unit = round_down(offs, c->min_io_size);
+	if (grouped)
+		/*
+		 * If nodes are grouped, always drop the incomplete group at
+		 * the end.
+		 */
+		drop_last_node(sleb, &offs, 1);
+
+	/*
+	 * While we are in the middle of the same min. I/O unit keep dropping
+	 * nodes. So basically, what we want is to make sure that the last min.
+	 * I/O unit where we saw the corruption is dropped completely with all
+	 * the uncorrupted node which may possibly sit there.
+	 *
+	 * In other words, let's name the min. I/O unit where the corruption
+	 * starts B, and the previous min. I/O unit A. The below code tries to
+	 * deal with a situation when half of B contains valid nodes or the end
+	 * of a valid node, and the second half of B contains corrupted data or
+	 * garbage. This means that UBIFS had been writing to B just before the
+	 * power cut happened. I do not know how realistic is this scenario
+	 * that half of the min. I/O unit had been written successfully and the
+	 * other half not, but this is possible in our 'failure mode emulation'
+	 * infrastructure at least.
+	 *
+	 * So what is the problem, why we need to drop those nodes? Whey can't
+	 * we just clean-up the second half of B by putting a padding node
+	 * there? We can, and this works fine with one exception which was
+	 * reproduced with power cut emulation testing and happens extremely
+	 * rarely. The description follows, but it is worth noting that that is
+	 * only about the GC head, so we could do this trick only if the bud
+	 * belongs to the GC head, but it does not seem to be worth an
+	 * additional "if" statement.
+	 *
+	 * So, imagine the file-system is full, we run GC which is moving valid
+	 * nodes from LEB X to LEB Y (obviously, LEB Y is the current GC head
+	 * LEB). The @c->gc_lnum is -1, which means that GC will retain LEB X
+	 * and will try to continue. Imagine that LEB X is currently the
+	 * dirtiest LEB, and the amount of used space in LEB Y is exactly the
+	 * same as amount of free space in LEB X.
+	 *
+	 * And a power cut happens when nodes are moved from LEB X to LEB Y. We
+	 * are here trying to recover LEB Y which is the GC head LEB. We find
+	 * the min. I/O unit B as described above. Then we clean-up LEB Y by
+	 * padding min. I/O unit. And later 'ubifs_rcvry_gc_commit()' function
+	 * fails, because it cannot find a dirty LEB which could be GC'd into
+	 * LEB Y! Even LEB X does not match because the amount of valid nodes
+	 * there does not fit the free space in LEB Y any more! And this is
+	 * because of the padding node which we added to LEB Y. The
+	 * user-visible effect of this which I once observed and analysed is
+	 * that we cannot mount the file-system with -ENOSPC error.
+	 *
+	 * So obviously, to make sure that situation does not happen we should
+	 * free min. I/O unit B in LEB Y completely and the last used min. I/O
+	 * unit in LEB Y should be A. This is basically what the below code
+	 * tries to do.
+	 */
+	while (min_io_unit == round_down(offs, c->min_io_size) &&
+	       min_io_unit != offs &&
+	       drop_last_node(sleb, &offs, grouped));
+
+	buf = sbuf + offs;
+	len = c->leb_size - offs;
 
 	clean_buf(c, &buf, lnum, &offs, &len);
 	ubifs_end_scan(c, sleb, lnum, offs);
-- 
1.7.2.3
