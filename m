Received: from e7.ny.us.ibm.com ([32.97.182.137])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VcNOS-00033O-0S
 for linux-mtd@lists.infradead.org; Fri, 01 Nov 2013 22:40:41 +0000
Received: from /spool/local
 by e7.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <cody@linux.vnet.ibm.com>;
 Fri, 1 Nov 2013 18:40:22 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id C40C16E8044
 for <linux-mtd@lists.infradead.org>; Fri,  1 Nov 2013 18:40:18 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
 by b01cxnp23033.gho.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
 rA1MeKFB57933990
 for <linux-mtd@lists.infradead.org>; Fri, 1 Nov 2013 22:40:20 GMT
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
 by d01av01.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
 rA1MeKXa005378
 for <linux-mtd@lists.infradead.org>; Fri, 1 Nov 2013 18:40:20 -0400
From: Cody P Schafer <cody@linux.vnet.ibm.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 7/8] mtd/ubi: use rbtree postorder iteration helper instead of
 opencoding
Date: Fri,  1 Nov 2013 15:38:51 -0700
Message-Id: <1383345566-25087-7-git-send-email-cody@linux.vnet.ibm.com>
In-Reply-To: <1383345566-25087-1-git-send-email-cody@linux.vnet.ibm.com>
References: <1383345566-25087-1-git-send-email-cody@linux.vnet.ibm.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Cody P Schafer <cody@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
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
 drivers/mtd/ubi/attach.c | 49 +++++++-----------------------------------------
 drivers/mtd/ubi/wl.c     | 25 +++---------------------
 2 files changed, 10 insertions(+), 64 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index c071d41..6de0786 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1133,27 +1133,11 @@ static int late_analysis(struct ubi_device *ubi, struct ubi_attach_info *ai)
  */
 static void destroy_av(struct ubi_attach_info *ai, struct ubi_ainf_volume *av)
 {
-	struct ubi_ainf_peb *aeb;
-	struct rb_node *this = av->root.rb_node;
-
-	while (this) {
-		if (this->rb_left)
-			this = this->rb_left;
-		else if (this->rb_right)
-			this = this->rb_right;
-		else {
-			aeb = rb_entry(this, struct ubi_ainf_peb, u.rb);
-			this = rb_parent(this);
-			if (this) {
-				if (this->rb_left == &aeb->u.rb)
-					this->rb_left = NULL;
-				else
-					this->rb_right = NULL;
-			}
+	struct ubi_ainf_peb *aeb, *next;
+
+	rbtree_postorder_for_each_entry_safe(aeb, next, &av->root, u.rb)
+		kmem_cache_free(ai->aeb_slab_cache, aeb);
 
-			kmem_cache_free(ai->aeb_slab_cache, aeb);
-		}
-	}
 	kfree(av);
 }
 
@@ -1164,8 +1148,7 @@ static void destroy_av(struct ubi_attach_info *ai, struct ubi_ainf_volume *av)
 static void destroy_ai(struct ubi_attach_info *ai)
 {
 	struct ubi_ainf_peb *aeb, *aeb_tmp;
-	struct ubi_ainf_volume *av;
-	struct rb_node *rb;
+	struct ubi_ainf_volume *av, *next;
 
 	list_for_each_entry_safe(aeb, aeb_tmp, &ai->alien, u.list) {
 		list_del(&aeb->u.list);
@@ -1185,26 +1168,8 @@ static void destroy_ai(struct ubi_attach_info *ai)
 	}
 
 	/* Destroy the volume RB-tree */
-	rb = ai->volumes.rb_node;
-	while (rb) {
-		if (rb->rb_left)
-			rb = rb->rb_left;
-		else if (rb->rb_right)
-			rb = rb->rb_right;
-		else {
-			av = rb_entry(rb, struct ubi_ainf_volume, rb);
-
-			rb = rb_parent(rb);
-			if (rb) {
-				if (rb->rb_left == &av->rb)
-					rb->rb_left = NULL;
-				else
-					rb->rb_right = NULL;
-			}
-
-			destroy_av(ai, av);
-		}
-	}
+	rbtree_postorder_for_each_entry_safe(av, next, &ai->volumes, rb)
+		destroy_av(ai, av);
 
 	if (ai->aeb_slab_cache)
 		kmem_cache_destroy(ai->aeb_slab_cache);
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index c95bfb1..1af3899 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1760,29 +1760,10 @@ int ubi_wl_flush(struct ubi_device *ubi, int vol_id, int lnum)
  */
 static void tree_destroy(struct rb_root *root)
 {
-	struct rb_node *rb;
-	struct ubi_wl_entry *e;
-
-	rb = root->rb_node;
-	while (rb) {
-		if (rb->rb_left)
-			rb = rb->rb_left;
-		else if (rb->rb_right)
-			rb = rb->rb_right;
-		else {
-			e = rb_entry(rb, struct ubi_wl_entry, u.rb);
-
-			rb = rb_parent(rb);
-			if (rb) {
-				if (rb->rb_left == &e->u.rb)
-					rb->rb_left = NULL;
-				else
-					rb->rb_right = NULL;
-			}
+	struct ubi_wl_entry *e, *next;
 
-			kmem_cache_free(ubi_wl_entry_slab, e);
-		}
-	}
+	rbtree_postorder_for_each_entry_safe(e, next, root, u.rb)
+		kmem_cache_free(ubi_wl_entry_slab, e);
 }
 
 /**
-- 
1.8.4.2
