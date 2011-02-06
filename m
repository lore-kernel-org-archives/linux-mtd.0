Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pm8Xb-0001xP-Od
	for linux-mtd@lists.infradead.org; Sun, 06 Feb 2011 17:36:55 +0000
Received: from eru.research.nokia.com (esdhcp034110.research.nokia.com
	[172.21.34.110])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p16Han8B014624
	for <linux-mtd@lists.infradead.org>; Sun, 6 Feb 2011 19:36:49 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/5] UBI: add slab cache for ubi_scan_leb objects
Date: Sun,  6 Feb 2011 19:39:11 +0200
Message-Id: <1297013953-28886-4-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1297013953-28886-1-git-send-email-dedekind1@gmail.com>
References: <1297013953-28886-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

During scanning UBI allocates one struct ubi_scan_leb object for each PEB,
so it can end up allocating thousands of them. Use slab cache to reduce
memory consumption for these 48-byte objects, because currently used
'kmalloc()' ends up allocating 64 bytes per object, instead of 48.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/build.c |    2 ++
 drivers/mtd/ubi/scan.c  |   32 +++++++++++++++++++++-----------
 drivers/mtd/ubi/scan.h  |    2 ++
 3 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index ef29635..ec0ad19 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -923,6 +923,8 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
 	spin_lock_init(&ubi->volumes_lock);
 
 	ubi_msg("attaching mtd%d to ubi%d", mtd->index, ubi_num);
+	dbg_msg("sizeof(struct ubi_scan_leb) %zu", sizeof(struct ubi_scan_leb));
+	dbg_msg("sizeof(struct ubi_wl_entry) %zu", sizeof(struct ubi_wl_entry));
 
 	err = io_init(ubi);
 	if (err)
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 79ca304..0028bf2 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -115,7 +115,7 @@ static int add_to_list(struct ubi_scan_info *si, int pnum, int ec, int to_head,
 	} else
 		BUG();
 
-	seb = kmalloc(sizeof(struct ubi_scan_leb), GFP_KERNEL);
+	seb = kmem_cache_alloc(si->scan_leb_slab, GFP_KERNEL);
 	if (!seb)
 		return -ENOMEM;
 
@@ -144,7 +144,7 @@ static int add_corrupted(struct ubi_scan_info *si, int pnum, int ec)
 
 	dbg_bld("add to corrupted: PEB %d, EC %d", pnum, ec);
 
-	seb = kmalloc(sizeof(struct ubi_scan_leb), GFP_KERNEL);
+	seb = kmem_cache_alloc(si->scan_leb_slab, GFP_KERNEL);
 	if (!seb)
 		return -ENOMEM;
 
@@ -553,7 +553,7 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_scan_info *si,
 	if (err)
 		return err;
 
-	seb = kmalloc(sizeof(struct ubi_scan_leb), GFP_KERNEL);
+	seb = kmem_cache_alloc(si->scan_leb_slab, GFP_KERNEL);
 	if (!seb)
 		return -ENOMEM;
 
@@ -1152,9 +1152,15 @@ struct ubi_scan_info *ubi_scan(struct ubi_device *ubi)
 	si->volumes = RB_ROOT;
 
 	err = -ENOMEM;
+	si->scan_leb_slab = kmem_cache_create("ubi_scan_leb_slab",
+					      sizeof(struct ubi_scan_leb),
+					      0, 0, NULL);
+	if (!si->scan_leb_slab)
+		goto out_si;
+
 	ech = kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);
 	if (!ech)
-		goto out_si;
+		goto out_slab;
 
 	vidh = ubi_zalloc_vid_hdr(ubi, GFP_KERNEL);
 	if (!vidh)
@@ -1215,6 +1221,8 @@ out_vidh:
 	ubi_free_vid_hdr(ubi, vidh);
 out_ech:
 	kfree(ech);
+out_slab:
+	kmem_cache_destroy(si->scan_leb_slab);
 out_si:
 	ubi_scan_destroy_si(si);
 	return ERR_PTR(err);
@@ -1223,11 +1231,12 @@ out_si:
 /**
  * destroy_sv - free the scanning volume information
  * @sv: scanning volume information
+ * @si: scanning information
  *
  * This function destroys the volume RB-tree (@sv->root) and the scanning
  * volume information.
  */
-static void destroy_sv(struct ubi_scan_volume *sv)
+static void destroy_sv(struct ubi_scan_info *si, struct ubi_scan_volume *sv)
 {
 	struct ubi_scan_leb *seb;
 	struct rb_node *this = sv->root.rb_node;
@@ -1247,7 +1256,7 @@ static void destroy_sv(struct ubi_scan_volume *sv)
 					this->rb_right = NULL;
 			}
 
-			kfree(seb);
+			kmem_cache_free(si->scan_leb_slab, seb);
 		}
 	}
 	kfree(sv);
@@ -1265,19 +1274,19 @@ void ubi_scan_destroy_si(struct ubi_scan_info *si)
 
 	list_for_each_entry_safe(seb, seb_tmp, &si->alien, u.list) {
 		list_del(&seb->u.list);
-		kfree(seb);
+		kmem_cache_free(si->scan_leb_slab, seb);
 	}
 	list_for_each_entry_safe(seb, seb_tmp, &si->erase, u.list) {
 		list_del(&seb->u.list);
-		kfree(seb);
+		kmem_cache_free(si->scan_leb_slab, seb);
 	}
 	list_for_each_entry_safe(seb, seb_tmp, &si->corr, u.list) {
 		list_del(&seb->u.list);
-		kfree(seb);
+		kmem_cache_free(si->scan_leb_slab, seb);
 	}
 	list_for_each_entry_safe(seb, seb_tmp, &si->free, u.list) {
 		list_del(&seb->u.list);
-		kfree(seb);
+		kmem_cache_free(si->scan_leb_slab, seb);
 	}
 
 	/* Destroy the volume RB-tree */
@@ -1298,10 +1307,11 @@ void ubi_scan_destroy_si(struct ubi_scan_info *si)
 					rb->rb_right = NULL;
 			}
 
-			destroy_sv(sv);
+			destroy_sv(si, sv);
 		}
 	}
 
+	kmem_cache_destroy(si->scan_leb_slab);
 	kfree(si);
 }
 
diff --git a/drivers/mtd/ubi/scan.h b/drivers/mtd/ubi/scan.h
index a3264f0..d48aef1 100644
--- a/drivers/mtd/ubi/scan.h
+++ b/drivers/mtd/ubi/scan.h
@@ -109,6 +109,7 @@ struct ubi_scan_volume {
  * @mean_ec: mean erase counter value
  * @ec_sum: a temporary variable used when calculating @mean_ec
  * @ec_count: a temporary variable used when calculating @mean_ec
+ * @scan_leb_slab: slab cache for &struct ubi_scan_leb objects
  *
  * This data structure contains the result of scanning and may be used by other
  * UBI sub-systems to build final UBI data structures, further error-recovery
@@ -134,6 +135,7 @@ struct ubi_scan_info {
 	int mean_ec;
 	uint64_t ec_sum;
 	int ec_count;
+	struct kmem_cache *scan_leb_slab;
 };
 
 struct ubi_device;
-- 
1.7.2.3
