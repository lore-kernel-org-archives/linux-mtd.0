Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVKy8-0005YM-CJ
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 11:03:38 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 16/22] UBI: rename ubi_scan_leb_slab
Date: Fri, 18 May 2012 14:03:59 +0300
Message-Id: <1337339045-8199-17-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1337339045-8199-1-git-send-email-dedekind1@gmail.com>
References: <1337339045-8199-1-git-send-email-dedekind1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

The old name is not logical anymore - rename it to 'aeb_slab_cache'.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/scan.c |   28 ++++++++++++++--------------
 drivers/mtd/ubi/scan.h |    4 ++--
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index daa53a8..06a2d70 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -125,7 +125,7 @@ static int add_to_list(struct ubi_attach_info *ai, int pnum, int ec,
 	} else
 		BUG();
 
-	aeb = kmem_cache_alloc(ai->scan_leb_slab, GFP_KERNEL);
+	aeb = kmem_cache_alloc(ai->aeb_slab_cache, GFP_KERNEL);
 	if (!aeb)
 		return -ENOMEM;
 
@@ -154,7 +154,7 @@ static int add_corrupted(struct ubi_attach_info *ai, int pnum, int ec)
 
 	dbg_bld("add to corrupted: PEB %d, EC %d", pnum, ec);
 
-	aeb = kmem_cache_alloc(ai->scan_leb_slab, GFP_KERNEL);
+	aeb = kmem_cache_alloc(ai->aeb_slab_cache, GFP_KERNEL);
 	if (!aeb)
 		return -ENOMEM;
 
@@ -562,7 +562,7 @@ int ubi_add_to_av(struct ubi_device *ubi, struct ubi_attach_info *ai, int pnum,
 	if (err)
 		return err;
 
-	aeb = kmem_cache_alloc(ai->scan_leb_slab, GFP_KERNEL);
+	aeb = kmem_cache_alloc(ai->aeb_slab_cache, GFP_KERNEL);
 	if (!aeb)
 		return -ENOMEM;
 
@@ -1133,10 +1133,10 @@ struct ubi_attach_info *ubi_scan(struct ubi_device *ubi)
 	ai->volumes = RB_ROOT;
 
 	err = -ENOMEM;
-	ai->scan_leb_slab = kmem_cache_create("ubi_scan_leb_slab",
-					      sizeof(struct ubi_ainf_peb),
-					      0, 0, NULL);
-	if (!ai->scan_leb_slab)
+	ai->aeb_slab_cache = kmem_cache_create("ubi_aeb_slab_cache",
+					       sizeof(struct ubi_ainf_peb),
+					       0, 0, NULL);
+	if (!ai->aeb_slab_cache)
 		goto out_ai;
 
 	ech = kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);
@@ -1235,7 +1235,7 @@ static void destroy_av(struct ubi_attach_info *ai, struct ubi_ainf_volume *av)
 					this->rb_right = NULL;
 			}
 
-			kmem_cache_free(ai->scan_leb_slab, aeb);
+			kmem_cache_free(ai->aeb_slab_cache, aeb);
 		}
 	}
 	kfree(av);
@@ -1253,19 +1253,19 @@ void ubi_destroy_ai(struct ubi_attach_info *ai)
 
 	list_for_each_entry_safe(aeb, aeb_tmp, &ai->alien, u.list) {
 		list_del(&aeb->u.list);
-		kmem_cache_free(ai->scan_leb_slab, aeb);
+		kmem_cache_free(ai->aeb_slab_cache, aeb);
 	}
 	list_for_each_entry_safe(aeb, aeb_tmp, &ai->erase, u.list) {
 		list_del(&aeb->u.list);
-		kmem_cache_free(ai->scan_leb_slab, aeb);
+		kmem_cache_free(ai->aeb_slab_cache, aeb);
 	}
 	list_for_each_entry_safe(aeb, aeb_tmp, &ai->corr, u.list) {
 		list_del(&aeb->u.list);
-		kmem_cache_free(ai->scan_leb_slab, aeb);
+		kmem_cache_free(ai->aeb_slab_cache, aeb);
 	}
 	list_for_each_entry_safe(aeb, aeb_tmp, &ai->free, u.list) {
 		list_del(&aeb->u.list);
-		kmem_cache_free(ai->scan_leb_slab, aeb);
+		kmem_cache_free(ai->aeb_slab_cache, aeb);
 	}
 
 	/* Destroy the volume RB-tree */
@@ -1290,8 +1290,8 @@ void ubi_destroy_ai(struct ubi_attach_info *ai)
 		}
 	}
 
-	if (ai->scan_leb_slab)
-		kmem_cache_destroy(ai->scan_leb_slab);
+	if (ai->aeb_slab_cache)
+		kmem_cache_destroy(ai->aeb_slab_cache);
 
 	kfree(ai);
 }
diff --git a/drivers/mtd/ubi/scan.h b/drivers/mtd/ubi/scan.h
index aa76b3b..20bec7c 100644
--- a/drivers/mtd/ubi/scan.h
+++ b/drivers/mtd/ubi/scan.h
@@ -110,7 +110,7 @@ struct ubi_ainf_volume {
  * @mean_ec: mean erase counter value
  * @ec_sum: a temporary variable used when calculating @mean_ec
  * @ec_count: a temporary variable used when calculating @mean_ec
- * @scan_leb_slab: slab cache for &struct ubi_ainf_peb objects
+ * @aeb_slab_cache: slab cache for &struct ubi_ainf_peb objects
  *
  * This data structure contains the result of attaching an MTD device and may
  * be used by other UBI sub-systems to build final UBI data structures, further
@@ -136,7 +136,7 @@ struct ubi_attach_info {
 	int mean_ec;
 	uint64_t ec_sum;
 	int ec_count;
-	struct kmem_cache *scan_leb_slab;
+	struct kmem_cache *aeb_slab_cache;
 };
 
 struct ubi_device;
-- 
1.7.10
