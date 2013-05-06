Received: from mail-pd0-f180.google.com ([209.85.192.180])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UZ9cB-0004xd-BR
 for linux-mtd@lists.infradead.org; Mon, 06 May 2013 00:49:16 +0000
Received: by mail-pd0-f180.google.com with SMTP id t10so1723933pdi.11
 for <linux-mtd@lists.infradead.org>; Sun, 05 May 2013 17:48:53 -0700 (PDT)
From: Brian Pomerantz <bapper@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] UBI: fastmap convert used list to rb tree
Date: Sun,  5 May 2013 17:47:47 -0700
Message-Id: <1367801267-15659-1-git-send-email-bapper@gmail.com>
Cc: Brian Pomerantz <bapper@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

After some profiling of the attach process, it was found that
a considerable amount of time was spent spinning through the list of
used PEBs in ubi_attach_fastmap().  This patch converts the list into
a RB tree saving considerable time when the volumes fill up.

Signed-off-by: Brian Pomerantz <bapper@gmail.com>
---
 drivers/mtd/ubi/fastmap.c | 98 +++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 87 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 0648c69..15180c9 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -103,6 +103,85 @@ static int add_aeb(struct ubi_attach_info *ai, struct list_head *list,
 }
 
 /**
+ * find_aeb_in_rb - find an eraseblock in the given rb tree
+ * @pnum: PEB number of the erase block to find
+ * @root: tree to search in
+ *
+ * Returns struct ubi_ainf_peb of the found erase block on success, NULL if it
+ * was not found
+ */
+static struct ubi_ainf_peb *find_aeb_in_rb(struct rb_root *root,
+			     int pnum)
+{
+	struct ubi_ainf_peb *tmp_aeb;
+	struct rb_node *node = root->rb_node;
+
+	while (node) {
+		tmp_aeb = rb_entry(node, struct ubi_ainf_peb, u.rb);
+		if (pnum < tmp_aeb->pnum)
+			node = node->rb_left;
+		else if (pnum > tmp_aeb->pnum)
+			node = node->rb_right;
+		else
+			return tmp_aeb;
+	}
+
+	return NULL;
+}
+
+/**
+ * add_aeb - create and add a attach erase block to a given rb tree root.
+ * @ai: UBI attach info object
+ * @root: the target rb tree
+ * @pnum: PEB number of the new attach erase block
+ * @ec: erease counter of the new LEB
+ * @scrub: scrub this PEB after attaching
+ *
+ * Returns 0 on success, < 0 indicates an internal error.
+ */
+static int add_aeb_rb(struct ubi_attach_info *ai, struct rb_root *root,
+		   int pnum, int ec, int scrub)
+{
+	struct ubi_ainf_peb *aeb;
+	struct ubi_ainf_peb *tmp_aeb;
+	struct rb_node **p = &root->rb_node, *parent = NULL;
+
+	aeb = kmem_cache_alloc(ai->aeb_slab_cache, GFP_KERNEL);
+	if (!aeb)
+		return -ENOMEM;
+
+	aeb->pnum = pnum;
+	aeb->ec = ec;
+	aeb->lnum = -1;
+	aeb->scrub = scrub;
+	aeb->copy_flag = aeb->sqnum = 0;
+
+	ai->ec_sum += aeb->ec;
+	ai->ec_count++;
+
+	if (ai->max_ec < aeb->ec)
+		ai->max_ec = aeb->ec;
+
+	if (ai->min_ec > aeb->ec)
+		ai->min_ec = aeb->ec;
+
+	while (*p) {
+		parent = *p;
+
+		tmp_aeb = rb_entry(parent, struct ubi_ainf_peb, u.rb);
+		if (aeb->pnum < tmp_aeb->pnum)
+			p = &(*p)->rb_left;
+		else
+			p = &(*p)->rb_right;
+	}
+
+	rb_link_node(&aeb->u.rb, parent, p);
+	rb_insert_color(&aeb->u.rb, root);
+
+	return 0;
+}
+
+/**
  * add_vol - create and add a new volume to ubi_attach_info.
  * @ai: ubi_attach_info object
  * @vol_id: VID of the new volume
@@ -154,8 +233,7 @@ out:
 }
 
 /**
- * assign_aeb_to_av - assigns a SEB to a given ainf_volume and removes it
- * from it's original list.
+ * assign_aeb_to_av - assigns a SEB to a given ainf_volume
  * @ai: ubi_attach_info object
  * @aeb: the to be assigned SEB
  * @av: target scan volume
@@ -183,7 +261,6 @@ static void assign_aeb_to_av(struct ubi_attach_info *ai,
 			break;
 	}
 
-	list_del(&aeb->u.list);
 	av->leb_count++;
 
 	rb_link_node(&aeb->u.rb, parent, p);
@@ -534,7 +611,8 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 			      struct ubi_attach_info *ai,
 			      struct ubi_fastmap_layout *fm)
 {
-	struct list_head used, eba_orphans, free;
+	struct list_head eba_orphans, free;
+	struct rb_root used = RB_ROOT;
 	struct ubi_ainf_volume *av;
 	struct ubi_ainf_peb *aeb, *tmp_aeb, *_tmp_aeb;
 	struct ubi_ec_hdr *ech;
@@ -549,7 +627,6 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 	unsigned long long max_sqnum = 0;
 	void *fm_raw = ubi->fm_buf;
 
-	INIT_LIST_HEAD(&used);
 	INIT_LIST_HEAD(&free);
 	INIT_LIST_HEAD(&eba_orphans);
 	INIT_LIST_HEAD(&ai->corr);
@@ -650,7 +727,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 		if (fm_pos >= fm_size)
 			goto fail_bad;
 
-		add_aeb(ai, &used, be32_to_cpu(fmec->pnum),
+		add_aeb_rb(ai, &used, be32_to_cpu(fmec->pnum),
 			be32_to_cpu(fmec->ec), 0);
 	}
 
@@ -661,7 +738,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 		if (fm_pos >= fm_size)
 			goto fail_bad;
 
-		add_aeb(ai, &used, be32_to_cpu(fmec->pnum),
+		add_aeb_rb(ai, &used, be32_to_cpu(fmec->pnum),
 			be32_to_cpu(fmec->ec), 1);
 	}
 
@@ -726,10 +803,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 				continue;
 
 			aeb = NULL;
-			list_for_each_entry(tmp_aeb, &used, u.list) {
-				if (tmp_aeb->pnum == pnum)
-					aeb = tmp_aeb;
-			}
+			aeb = find_aeb_in_rb(&used, pnum);
 
 			/* This can happen if a PEB is already in an EBA known
 			 * by this fastmap but the PEB itself is not in the used
@@ -760,6 +834,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 			if (av->highest_lnum <= aeb->lnum)
 				av->highest_lnum = aeb->lnum;
 
+			rb_erase(&aeb->u.rb, &used);
 			assign_aeb_to_av(ai, aeb, av);
 
 			dbg_bld("inserting PEB:%i (LEB %i) to vol %i",
@@ -795,6 +870,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 				tmp_aeb->scrub = 1;
 
 			tmp_aeb->ec = be64_to_cpu(ech->ec);
+			list_del(&tmp_aeb->u.list);
 			assign_aeb_to_av(ai, tmp_aeb, av);
 		}
 
-- 
1.7.11.7
