Received: from mail-pz0-f197.google.com ([209.85.222.197])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MagHp-0004Ej-5K
	for linux-mtd@lists.infradead.org; Tue, 11 Aug 2009 01:36:29 +0000
Received: by pzk35 with SMTP id 35so3340288pzk.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 10 Aug 2009 18:36:23 -0700 (PDT)
Date: Tue, 11 Aug 2009 09:44:55 +0800
From: JiSheng Zhang <jszhang3@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] UBI: Fix allocation of volume table
Message-ID: <20090811094455.6f9cbbfe@ustc>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Artem.Bityutskiy@nokia.com, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org, rmk@arm.linux.org.uk, adrian.hunter@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


We can't use vmalloc for the buffer used for volume table for some NAND
or NOR drivers may pass the buffer to DMA. And the volume table size
a.k.a vtbl_size is small so we can use kmalloc or kzalloc for it instead

Signed-off-by: JiSheng Zhang <jszhang3@gmail.com>
---
 drivers/mtd/ubi/build.c |    6 +++---
 drivers/mtd/ubi/vtbl.c  |   18 ++++++++----------
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index e1f7d0a..1c1f877 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -605,7 +605,7 @@ out_wl:
 	ubi_wl_close(ubi);
 out_vtbl:
 	free_internal_volumes(ubi);
-	vfree(ubi->vtbl);
+	kfree(ubi->vtbl);
 out_si:
 	ubi_scan_destroy_si(si);
 	return err;
@@ -1031,7 +1031,7 @@ out_detach:
 	if (do_free)
 		free_user_volumes(ubi);
 	free_internal_volumes(ubi);
-	vfree(ubi->vtbl);
+	kfree(ubi->vtbl);
 out_free:
 	vfree(ubi->peb_buf1);
 	vfree(ubi->peb_buf2);
@@ -1102,7 +1102,7 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
 	uif_close(ubi);
 	ubi_wl_close(ubi);
 	free_internal_volumes(ubi);
-	vfree(ubi->vtbl);
+	kfree(ubi->vtbl);
 	put_mtd_device(ubi->mtd);
 	vfree(ubi->peb_buf1);
 	vfree(ubi->peb_buf2);
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 1afc61e..59e452a 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -424,12 +424,11 @@ static struct ubi_vtbl_record *process_lvol(struct ubi_device *ubi,
 
 	/* Read both LEB 0 and LEB 1 into memory */
 	ubi_rb_for_each_entry(rb, seb, &sv->root, u.rb) {
-		leb[seb->lnum] = vmalloc(ubi->vtbl_size);
+		leb[seb->lnum] = kzalloc(ubi->vtbl_size, GFP_KERNEL);
 		if (!leb[seb->lnum]) {
 			err = -ENOMEM;
 			goto out_free;
 		}
-		memset(leb[seb->lnum], 0, ubi->vtbl_size);
 
 		err = ubi_io_read_data(ubi, leb[seb->lnum], seb->pnum, 0,
 				       ubi->vtbl_size);
@@ -470,7 +469,7 @@ static struct ubi_vtbl_record *process_lvol(struct ubi_device *ubi,
 		}
 
 		/* Both LEB 1 and LEB 2 are OK and consistent */
-		vfree(leb[1]);
+		kfree(leb[1]);
 		return leb[0];
 	} else {
 		/* LEB 0 is corrupted or does not exist */
@@ -491,13 +490,13 @@ static struct ubi_vtbl_record *process_lvol(struct ubi_device *ubi,
 			goto out_free;
 		ubi_msg("volume table was restored");
 
-		vfree(leb[0]);
+		kfree(leb[0]);
 		return leb[1];
 	}
 
 out_free:
-	vfree(leb[0]);
-	vfree(leb[1]);
+	kfree(leb[0]);
+	kfree(leb[1]);
 	return ERR_PTR(err);
 }
 
@@ -515,10 +514,9 @@ static struct ubi_vtbl_record *create_empty_lvol(struct ubi_device *ubi,
 	int i;
 	struct ubi_vtbl_record *vtbl;
 
-	vtbl = vmalloc(ubi->vtbl_size);
+	vtbl = kzalloc(ubi->vtbl_size, GFP_KERNEL);
 	if (!vtbl)
 		return ERR_PTR(-ENOMEM);
-	memset(vtbl, 0, ubi->vtbl_size);
 
 	for (i = 0; i < ubi->vtbl_slots; i++)
 		memcpy(&vtbl[i], &empty_vtbl_record, UBI_VTBL_RECORD_SIZE);
@@ -528,7 +526,7 @@ static struct ubi_vtbl_record *create_empty_lvol(struct ubi_device *ubi,
 
 		err = create_vtbl(ubi, si, i, vtbl);
 		if (err) {
-			vfree(vtbl);
+			kfree(vtbl);
 			return ERR_PTR(err);
 		}
 	}
@@ -856,7 +854,7 @@ int ubi_read_volume_table(struct ubi_device *ubi, struct ubi_scan_info *si)
 	return 0;
 
 out_free:
-	vfree(ubi->vtbl);
+	kfree(ubi->vtbl);
 	for (i = 0; i < ubi->vtbl_slots + UBI_INT_VOL_COUNT; i++) {
 		kfree(ubi->volumes[i]);
 		ubi->volumes[i] = NULL;
-- 
1.6.3.3
