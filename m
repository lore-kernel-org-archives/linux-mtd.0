Received: from e39.co.us.ibm.com ([32.97.110.160])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VcNOT-00033N-3X
 for linux-mtd@lists.infradead.org; Fri, 01 Nov 2013 22:40:42 +0000
Received: from /spool/local
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <cody@linux.vnet.ibm.com>;
 Fri, 1 Nov 2013 16:40:19 -0600
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id D5DC26E803C
 for <linux-mtd@lists.infradead.org>; Fri,  1 Nov 2013 18:40:14 -0400 (EDT)
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
 by b01cxnp23034.gho.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
 rA1MeGQA2162986
 for <linux-mtd@lists.infradead.org>; Fri, 1 Nov 2013 22:40:16 GMT
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
 by d01av02.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
 rA1MeFZC003166
 for <linux-mtd@lists.infradead.org>; Fri, 1 Nov 2013 20:40:16 -0200
From: Cody P Schafer <cody@linux.vnet.ibm.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 5/8] fs/jffs2: use rbtree postorder iteration helper instead
 of opencoding
Date: Fri,  1 Nov 2013 15:38:49 -0700
Message-Id: <1383345566-25087-5-git-send-email-cody@linux.vnet.ibm.com>
In-Reply-To: <1383345566-25087-1-git-send-email-cody@linux.vnet.ibm.com>
References: <1383345566-25087-1-git-send-email-cody@linux.vnet.ibm.com>
Cc: linux-mtd@lists.infradead.org, Cody P Schafer <cody@linux.vnet.ibm.com>,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use rbtree_postorder_for_each_entry_safe() to destroy the rbtree instead
of opencoding an alternate postorder iteration that modifies the tree

Signed-off-by: Cody P Schafer <cody@linux.vnet.ibm.com>
---
 fs/jffs2/nodelist.c  | 28 ++--------------------------
 fs/jffs2/readinode.c | 26 +++-----------------------
 2 files changed, 5 insertions(+), 49 deletions(-)

diff --git a/fs/jffs2/nodelist.c b/fs/jffs2/nodelist.c
index 975a1f5..9a5449b 100644
--- a/fs/jffs2/nodelist.c
+++ b/fs/jffs2/nodelist.c
@@ -564,25 +564,10 @@ struct jffs2_node_frag *jffs2_lookup_node_frag(struct rb_root *fragtree, uint32_
    they're killed. */
 void jffs2_kill_fragtree(struct rb_root *root, struct jffs2_sb_info *c)
 {
-	struct jffs2_node_frag *frag;
-	struct jffs2_node_frag *parent;
-
-	if (!root->rb_node)
-		return;
+	struct jffs2_node_frag *frag, *next;
 
 	dbg_fragtree("killing\n");
-
-	frag = (rb_entry(root->rb_node, struct jffs2_node_frag, rb));
-	while(frag) {
-		if (frag->rb.rb_left) {
-			frag = frag_left(frag);
-			continue;
-		}
-		if (frag->rb.rb_right) {
-			frag = frag_right(frag);
-			continue;
-		}
-
+	rbtree_postorder_for_each_entry_safe(frag, next, root, rb) {
 		if (frag->node && !(--frag->node->frags)) {
 			/* Not a hole, and it's the final remaining frag
 			   of this node. Free the node */
@@ -591,17 +576,8 @@ void jffs2_kill_fragtree(struct rb_root *root, struct jffs2_sb_info *c)
 
 			jffs2_free_full_dnode(frag->node);
 		}
-		parent = frag_parent(frag);
-		if (parent) {
-			if (frag_left(parent) == frag)
-				parent->rb.rb_left = NULL;
-			else
-				parent->rb.rb_right = NULL;
-		}
 
 		jffs2_free_node_frag(frag);
-		frag = parent;
-
 		cond_resched();
 	}
 }
diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index ae81b01..386303d 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -543,33 +543,13 @@ static int jffs2_build_inode_fragtree(struct jffs2_sb_info *c,
 
 static void jffs2_free_tmp_dnode_info_list(struct rb_root *list)
 {
-	struct rb_node *this;
-	struct jffs2_tmp_dnode_info *tn;
-
-	this = list->rb_node;
+	struct jffs2_tmp_dnode_info *tn, *next;
 
-	/* Now at bottom of tree */
-	while (this) {
-		if (this->rb_left)
-			this = this->rb_left;
-		else if (this->rb_right)
-			this = this->rb_right;
-		else {
-			tn = rb_entry(this, struct jffs2_tmp_dnode_info, rb);
+	rbtree_postorder_for_each_entry_safe(tn, next, list, rb) {
 			jffs2_free_full_dnode(tn->fn);
 			jffs2_free_tmp_dnode_info(tn);
-
-			this = rb_parent(this);
-			if (!this)
-				break;
-
-			if (this->rb_left == &tn->rb)
-				this->rb_left = NULL;
-			else if (this->rb_right == &tn->rb)
-				this->rb_right = NULL;
-			else BUG();
-		}
 	}
+
 	*list = RB_ROOT;
 }
 
-- 
1.8.4.2
