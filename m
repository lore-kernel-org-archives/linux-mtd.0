Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SaTb3-0001hV-6K
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 15:17:10 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 10/23] UBI: Fastmap: Allocate and free ubi_attach_info in
 ubi_attach()
Date: Fri,  1 Jun 2012 17:16:31 +0200
Message-Id: <1338563804-85990-11-git-send-email-richard@nod.at>
In-Reply-To: <1338563804-85990-1-git-send-email-richard@nod.at>
References: <1338563804-85990-1-git-send-email-richard@nod.at>
Cc: dedekind1@gmail.com, Richard Weinberger <richard@nod.at>,
 adrian.hunter@intel.com, Heinz.Egger@linutronix.de, shmulik.ladkani@gmail.com,
 tglx@linutronix.de, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/attach.c  |   28 ++++++++++++----------------
 drivers/mtd/ubi/fastmap.c |   29 ++++++++++-------------------
 drivers/mtd/ubi/ubi.h     |    2 +-
 3 files changed, 23 insertions(+), 36 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index c4e7a3f..1ee4a2f 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1110,22 +1110,18 @@ static int late_analysis(struct ubi_device *ubi, struct ubi_attach_info *ai)
 /**
  * scan_all - scan entire MTD device.
  * @ubi: UBI device description object
+ * @ai: attach info object
  *
  * This function does full scanning of an MTD device and returns complete
  * information about it in form of a "struct ubi_attach_info" object. In case
  * of failure, an error code is returned.
  */
-static struct ubi_attach_info *scan_all(struct ubi_device *ubi)
+static int scan_all(struct ubi_device *ubi, struct ubi_attach_info *ai)
 {
 	int err, pnum;
 	struct rb_node *rb1, *rb2;
 	struct ubi_ainf_volume *av;
 	struct ubi_ainf_peb *aeb;
-	struct ubi_attach_info *ai;
-
-	ai = kzalloc(sizeof(struct ubi_attach_info), GFP_KERNEL);
-	if (!ai)
-		return ERR_PTR(-ENOMEM);
 
 	INIT_LIST_HEAD(&ai->corr);
 	INIT_LIST_HEAD(&ai->free);
@@ -1197,7 +1193,7 @@ static struct ubi_attach_info *scan_all(struct ubi_device *ubi)
 	ubi_free_vid_hdr(ubi, vidh);
 	kfree(ech);
 
-	return ai;
+	return 0;
 
 out_vidh:
 	ubi_free_vid_hdr(ubi, vidh);
@@ -1205,7 +1201,7 @@ out_ech:
 	kfree(ech);
 out_ai:
 	ubi_destroy_ai(ubi, ai);
-	return ERR_PTR(err);
+	return err;
 }
 
 /**
@@ -1218,11 +1214,13 @@ out_ai:
 int ubi_attach(struct ubi_device *ubi)
 {
 	int err;
-	struct ubi_attach_info *ai = NULL;
+	struct ubi_attach_info *ai;
 
-	/* TODO: Allocate ai in this fuction. And destroy it here as well */
+	ai = kzalloc(sizeof(struct ubi_attach_info), GFP_KERNEL);
+	if (!ai)
+		return -ENOMEM;
 
-	err = ubi_scan_fastmap(ubi, &ai);
+	err = ubi_scan_fastmap(ubi, ai);
 	if (err > 0) {
 		/* TODO: in UBIFS we have a convention: every function prints
 		 * its own error messages. This makes things cleaner and easier
@@ -1234,11 +1232,9 @@ int ubi_attach(struct ubi_device *ubi)
 			ubi_err("Attach by fastmap failed! "
 				"Falling back to attach by scanning.");
 
-		ai = scan_all(ubi);
-		if (IS_ERR(ai))
-			return PTR_ERR(ai);
-		else
-			printk(KERN_ERR "attached by scanning!\n");
+		err = scan_all(ubi, ai);
+		if (err)
+			return err;
 	} else if (err < 0)
 		return err;
 
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 1a5f82e..74e7963 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -417,13 +417,12 @@ out:
  * @fm_size: size of the fastmap in bytes
  */
 static int ubi_attach_fastmap(struct ubi_device *ubi,
-			      struct ubi_attach_info **aip,
+			      struct ubi_attach_info *ai,
 			      char *fm_raw, size_t fm_size)
 {
 	struct list_head used;
 	struct ubi_ainf_volume *av;
 	struct ubi_ainf_peb *aeb, *tmp_aeb, *_tmp_aeb;
-	struct ubi_attach_info *ai;
 
 	struct ubi_fm_sb *fmsb;
 	struct ubi_fm_hdr *fmhdr;
@@ -436,12 +435,6 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 	size_t fm_pos = 0;
 	unsigned long long max_sqnum = 0;
 
-	*aip = kzalloc(sizeof(struct ubi_attach_info), GFP_KERNEL);
-	if (!*aip)
-		return -ENOMEM;
-
-	ai = *aip;
-
 	INIT_LIST_HEAD(&used);
 	INIT_LIST_HEAD(&ai->corr);
 	INIT_LIST_HEAD(&ai->free);
@@ -587,7 +580,6 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 fail_bad:
 	ret = UBI_BAD_FASTMAP;
 fail:
-	ubi_destroy_ai(ubi, ai);
 	return ret;
 }
 
@@ -642,7 +634,7 @@ out:
  * @ubi: UBI device object
  * @ai: UBI attach info to be filled
  */
-int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info **ai)
+int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 {
 	struct ubi_fm_sb *fmsb;
 	struct ubi_vid_hdr *vh;
@@ -830,20 +822,19 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info **ai)
 	if (ret) {
 		if (ret > 0)
 			ret = UBI_BAD_FASTMAP;
-		ubi_destroy_ai(ubi, *ai);
 
 		goto free_hdr;
 	}
 
-	(*ai)->fm = kzalloc(sizeof(*(*ai)->fm), GFP_KERNEL);
-	if (!(*ai)->fm) {
+	ai->fm = kzalloc(sizeof(*ai->fm), GFP_KERNEL);
+	if (!ai->fm) {
 		ret = -ENOMEM;
 
 		goto free_hdr;
 	}
 
-	(*ai)->fm->size = fm_size;
-	(*ai)->fm->used_blocks = nblocks;
+	ai->fm->size = fm_size;
+	ai->fm->used_blocks = nblocks;
 
 	for (i = 0; i < nblocks; i++) {
 		struct ubi_wl_entry *e;
@@ -851,10 +842,10 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info **ai)
 		e = kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
 		if (!e) {
 			while (i--)
-				kfree((*ai)->fm->e[i]);
+				kfree(ai->fm->e[i]);
 
-			kfree((*ai)->fm);
-			(*ai)->fm = NULL;
+			kfree(ai->fm);
+			ai->fm = NULL;
 			ret = -ENOMEM;
 
 			goto free_hdr;
@@ -862,7 +853,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info **ai)
 		e->pnum = be32_to_cpu(fmsb->block_loc[i]);
 		e->ec = be32_to_cpu(fmsb->block_ec[i]);
 
-		(*ai)->fm->e[i] = e;
+		ai->fm->e[i] = e;
 	}
 
 free_hdr:
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index c677c19..0db97b0 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -774,7 +774,7 @@ int ubi_compare_lebs(struct ubi_device *ubi, const struct ubi_ainf_peb *aeb,
 
 /* fastmap.c */
 int ubi_update_fastmap(struct ubi_device *ubi);
-int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info **ai);
+int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai);
 
 /*
  * ubi_rb_for_each_entry - walk an RB-tree.
-- 
1.7.6.5
