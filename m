Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkuce-0006wZ-2z
 for linux-mtd@lists.infradead.org; Fri, 16 Sep 2016 15:00:21 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v3 06/18] UBI: factorize code used to manipulate volumes at
 attach time
Date: Fri, 16 Sep 2016 16:59:14 +0200
Message-Id: <1474037966-5524-7-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1474037966-5524-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1474037966-5524-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Volume creation/search code is duplicated in a few places (fastmap and
non fastmap code). Create some helpers to factorize the code.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/ubi/attach.c  | 151 +++++++++++++++++++++++++++++++++-------------
 drivers/mtd/ubi/fastmap.c |  27 +--------
 drivers/mtd/ubi/ubi.h     |   1 +
 3 files changed, 112 insertions(+), 67 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 95138ae2062f..6d34cd7b0263 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -95,6 +95,92 @@ static int self_check_ai(struct ubi_device *ubi, struct ubi_attach_info *ai);
 static struct ubi_ec_hdr *ech;
 static struct ubi_vid_hdr *vidh;
 
+#define AV_FIND		BIT(0)
+#define AV_ADD		BIT(1)
+#define AV_FIND_OR_ADD	(AV_FIND | AV_ADD)
+
+/**
+ * find_or_add_av - internal function to find a volume, add a volume or do
+ *		    both (find and add if missing).
+ * @ai: attaching information
+ * @vol_id: the requested volume ID
+ * @flags: a combination of the %AV_FIND and %AV_ADD flags describing the
+ *	   expected operation. If only %AV_ADD is set, -EEXIST is returned
+ *	   if the volume already exists. If only %AV_FIND is set, NULL is
+ *	   returned if the volume does not exist. And if both flags are
+ *	   set, the helper first tries to find an existing volume, and if
+ *	   it does not exist it creates a new one.
+ * @created: in value used to inform the caller whether it"s a newly created
+ *	     volume or not.
+ *
+ * This function returns a pointer to a volume description or an ERR_PTR if
+ * the operation failed. It can also return NULL if only %AV_FIND is set and
+ * the volume does not exist.
+ */
+static struct ubi_ainf_volume *find_or_add_av(struct ubi_attach_info *ai,
+					      int vol_id, unsigned int flags,
+					      bool *created)
+{
+	struct ubi_ainf_volume *av;
+	struct rb_node **p = &ai->volumes.rb_node, *parent = NULL;
+
+	/* Walk the volume RB-tree to look if this volume is already present */
+	while (*p) {
+		parent = *p;
+		av = rb_entry(parent, struct ubi_ainf_volume, rb);
+
+		if (vol_id == av->vol_id) {
+			*created = false;
+
+			if (!(flags & AV_FIND))
+				return ERR_PTR(-EEXIST);
+
+			return av;
+		}
+
+		if (vol_id > av->vol_id)
+			p = &(*p)->rb_left;
+		else
+			p = &(*p)->rb_right;
+	}
+
+	if (!(flags & AV_ADD))
+		return NULL;
+
+	/* The volume is absent - add it */
+	av = kzalloc(sizeof(*av), GFP_KERNEL);
+	if (!av)
+		return ERR_PTR(-ENOMEM);
+
+	av->vol_id = vol_id;
+
+	if (vol_id > ai->highest_vol_id)
+		ai->highest_vol_id = vol_id;
+
+	rb_link_node(&av->rb, parent, p);
+	rb_insert_color(&av->rb, &ai->volumes);
+	ai->vols_found += 1;
+	*created = true;
+	dbg_bld("added volume %d", vol_id);
+	return av;
+}
+
+/**
+ * ubi_find_or_add_av - search for a volume in the attaching information and
+ *			add one if it does not exist.
+ * @ai: attaching information
+ * @vol_id: the requested volume ID
+ * @created: whether the volume has been created or not
+ *
+ * This function returns a pointer to the new volume description or an
+ * ERR_PTR if the operation failed.
+ */
+static struct ubi_ainf_volume *ubi_find_or_add_av(struct ubi_attach_info *ai,
+						  int vol_id, bool *created)
+{
+	return find_or_add_av(ai, vol_id, AV_FIND_OR_ADD, created);
+}
+
 /**
  * add_to_list - add physical eraseblock to a list.
  * @ai: attaching information
@@ -294,44 +380,20 @@ static struct ubi_ainf_volume *add_volume(struct ubi_attach_info *ai,
 					  const struct ubi_vid_hdr *vid_hdr)
 {
 	struct ubi_ainf_volume *av;
-	struct rb_node **p = &ai->volumes.rb_node, *parent = NULL;
+	bool created;
 
 	ubi_assert(vol_id == be32_to_cpu(vid_hdr->vol_id));
 
-	/* Walk the volume RB-tree to look if this volume is already present */
-	while (*p) {
-		parent = *p;
-		av = rb_entry(parent, struct ubi_ainf_volume, rb);
-
-		if (vol_id == av->vol_id)
-			return av;
+	av = ubi_find_or_add_av(ai, vol_id, &created);
+	if (IS_ERR(av) || !created)
+		return av;
 
-		if (vol_id > av->vol_id)
-			p = &(*p)->rb_left;
-		else
-			p = &(*p)->rb_right;
-	}
-
-	/* The volume is absent - add it */
-	av = kmalloc(sizeof(struct ubi_ainf_volume), GFP_KERNEL);
-	if (!av)
-		return ERR_PTR(-ENOMEM);
-
-	av->highest_lnum = av->leb_count = 0;
-	av->vol_id = vol_id;
-	av->root = RB_ROOT;
 	av->used_ebs = be32_to_cpu(vid_hdr->used_ebs);
 	av->data_pad = be32_to_cpu(vid_hdr->data_pad);
 	av->compat = vid_hdr->compat;
 	av->vol_type = vid_hdr->vol_type == UBI_VID_DYNAMIC ? UBI_DYNAMIC_VOLUME
 							    : UBI_STATIC_VOLUME;
-	if (vol_id > ai->highest_vol_id)
-		ai->highest_vol_id = vol_id;
 
-	rb_link_node(&av->rb, parent, p);
-	rb_insert_color(&av->rb, &ai->volumes);
-	ai->vols_found += 1;
-	dbg_bld("added volume %d", vol_id);
 	return av;
 }
 
@@ -629,6 +691,21 @@ int ubi_add_to_av(struct ubi_device *ubi, struct ubi_attach_info *ai, int pnum,
 }
 
 /**
+ * ubi_add_av - add volume to the attaching information.
+ * @ai: attaching information
+ * @vol_id: the requested volume ID
+ *
+ * This function returns a pointer to the new volume description or an
+ * ERR_PTR if the operation failed.
+ */
+struct ubi_ainf_volume *ubi_add_av(struct ubi_attach_info *ai, int vol_id)
+{
+	bool created;
+
+	return find_or_add_av(ai, vol_id, AV_ADD, &created);
+}
+
+/**
  * ubi_find_av - find volume in the attaching information.
  * @ai: attaching information
  * @vol_id: the requested volume ID
@@ -639,22 +716,10 @@ int ubi_add_to_av(struct ubi_device *ubi, struct ubi_attach_info *ai, int pnum,
 struct ubi_ainf_volume *ubi_find_av(const struct ubi_attach_info *ai,
 				    int vol_id)
 {
-	struct ubi_ainf_volume *av;
-	struct rb_node *p = ai->volumes.rb_node;
-
-	while (p) {
-		av = rb_entry(p, struct ubi_ainf_volume, rb);
-
-		if (vol_id == av->vol_id)
-			return av;
-
-		if (vol_id > av->vol_id)
-			p = p->rb_left;
-		else
-			p = p->rb_right;
-	}
+	bool created;
 
-	return NULL;
+	return find_or_add_av((struct ubi_attach_info *)ai, vol_id, AV_FIND,
+			      &created);
 }
 
 /**
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index a6ed78d14055..bae80699c2f2 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -186,40 +186,19 @@ static struct ubi_ainf_volume *add_vol(struct ubi_attach_info *ai, int vol_id,
 				       int last_eb_bytes)
 {
 	struct ubi_ainf_volume *av;
-	struct rb_node **p = &ai->volumes.rb_node, *parent = NULL;
 
-	while (*p) {
-		parent = *p;
-		av = rb_entry(parent, struct ubi_ainf_volume, rb);
-
-		if (vol_id > av->vol_id)
-			p = &(*p)->rb_left;
-		else if (vol_id < av->vol_id)
-			p = &(*p)->rb_right;
-		else
-			return ERR_PTR(-EINVAL);
-	}
+	av = ubi_add_av(ai, vol_id);
+	if (IS_ERR(av))
+		return av;
 
-	av = kmalloc(sizeof(struct ubi_ainf_volume), GFP_KERNEL);
-	if (!av)
-		goto out;
-
-	av->highest_lnum = av->leb_count = av->used_ebs = 0;
-	av->vol_id = vol_id;
 	av->data_pad = data_pad;
 	av->last_data_size = last_eb_bytes;
 	av->compat = 0;
 	av->vol_type = vol_type;
-	av->root = RB_ROOT;
 	if (av->vol_type == UBI_STATIC_VOLUME)
 		av->used_ebs = used_ebs;
 
 	dbg_bld("found volume (ID %i)", vol_id);
-
-	rb_link_node(&av->rb, parent, p);
-	rb_insert_color(&av->rb, &ai->volumes);
-
-out:
 	return av;
 }
 
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index b616a115c9d3..fce142666bf3 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -794,6 +794,7 @@ extern struct blocking_notifier_head ubi_notifiers;
 /* attach.c */
 int ubi_add_to_av(struct ubi_device *ubi, struct ubi_attach_info *ai, int pnum,
 		  int ec, const struct ubi_vid_hdr *vid_hdr, int bitflips);
+struct ubi_ainf_volume *ubi_add_av(struct ubi_attach_info *ai, int vol_id);
 struct ubi_ainf_volume *ubi_find_av(const struct ubi_attach_info *ai,
 				    int vol_id);
 void ubi_remove_av(struct ubi_attach_info *ai, struct ubi_ainf_volume *av);
-- 
2.7.4
