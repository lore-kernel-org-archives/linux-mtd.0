Date: Mon, 16 Feb 2009 21:29:31 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] JFFS2: fix mount crash caused by removed nodes
Message-ID: <alpine.LFD.2.00.0902162125190.3523@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Impact: fix long standing mount scan bug

At scan time we observed following scenario:

   node A inserted
   node B inserted
   node C inserted -> sets overlapped flag on node B

   node A is removed -> overlapped flag on node B remains
   
   while (tn->overlapped)
   	 tn = tn_prev(tn);

   ==> crash, when tn_prev(B) is referenced.

When the ultimate node is removed at scan time and the overlapped flag
is set on the penultimate node, then nothing updates the overlapped
flag of that node. The overlapped iterators blindly expect that the
ultimate node does not have the overlapped flag set, which causes the
scan code to crash.

It would be a huge overhead to go through the node chain on node
removal and fix up the overlapped flags, so detecting such a case on
the fly in the overlapped iterators is a simpler and reliable
solution.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: stable@kernel.org
---
 fs/jffs2/readinode.c |   42 +++++++++++++++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 9 deletions(-)

Index: linux-2.6/fs/jffs2/readinode.c
===================================================================
--- linux-2.6.orig/fs/jffs2/readinode.c
+++ linux-2.6/fs/jffs2/readinode.c
@@ -220,7 +220,7 @@ static int jffs2_add_tn_to_tree(struct j
 				struct jffs2_tmp_dnode_info *tn)
 {
 	uint32_t fn_end = tn->fn->ofs + tn->fn->size;
-	struct jffs2_tmp_dnode_info *this;
+	struct jffs2_tmp_dnode_info *this, *ptn;
 
 	dbg_readinode("insert fragment %#04x-%#04x, ver %u at %08x\n", tn->fn->ofs, fn_end, tn->version, ref_offset(tn->fn->raw));
 
@@ -251,11 +251,18 @@ static int jffs2_add_tn_to_tree(struct j
 	if (this) {
 		/* If the node is coincident with another at a lower address,
 		   back up until the other node is found. It may be relevant */
-		while (this->overlapped)
-			this = tn_prev(this);
-
-		/* First node should never be marked overlapped */
-		BUG_ON(!this);
+		while (this->overlapped) {
+			ptn = tn_prev(this);
+			if (!ptn) {
+				/*
+				 * We killed a node which set the overlapped
+				 * flags during the scan. Fix it up.
+				 */
+				this->overlapped = 0;
+				break;
+			}
+			this = ptn;
+		}
 		dbg_readinode("'this' found %#04x-%#04x (%s)\n", this->fn->ofs, this->fn->ofs + this->fn->size, this->fn ? "data" : "hole");
 	}
 
@@ -360,7 +367,17 @@ static int jffs2_add_tn_to_tree(struct j
 			}
 			if (!this->overlapped)
 				break;
-			this = tn_prev(this);
+
+			ptn = tn_prev(this);
+			if (!ptn) {
+				/*
+				 * We killed a node which set the overlapped
+				 * flags during the scan. Fix it up.
+				 */
+				this->overlapped = 0;
+				break;
+			}
+			this = ptn;
 		}
 	}
 
@@ -456,8 +473,15 @@ static int jffs2_build_inode_fragtree(st
 		eat_last(&rii->tn_root, &last->rb);
 		ver_insert(&ver_root, last);
 
-		if (unlikely(last->overlapped))
-			continue;
+		if (unlikely(last->overlapped)) {
+			if (pen)
+				continue;
+			/*
+			 * We killed a node which set the overlapped
+			 * flags during the scan. Fix it up.
+			 */
+			last->overlapped = 0;
+		}
 
 		/* Now we have a bunch of nodes in reverse version
 		   order, in the tree at ver_root. Most of the time,
