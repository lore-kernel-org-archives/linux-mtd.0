Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YxBpZ-0006xd-O3
 for linux-mtd@lists.infradead.org; Tue, 26 May 2015 10:11:33 +0000
From: Sheng Yong <shengyong1@huawei.com>
To: <richard@nod.at>
Subject: [RFC PATCH v2 6/6] UBI: add a helper function for updatting on-flash
 layout volumes
Date: Tue, 26 May 2015 10:07:10 +0000
Message-ID: <1432634830-129590-7-git-send-email-shengyong1@huawei.com>
In-Reply-To: <1432634830-129590-1-git-send-email-shengyong1@huawei.com>
References: <1432634830-129590-1-git-send-email-shengyong1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Sheng Yong <shengyong1@huawei.com>
---
 drivers/mtd/ubi/vtbl.c | 45 ++++++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 68c9c5ea..80bdd5b 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -70,6 +70,26 @@ static void self_vtbl_check(const struct ubi_device *ubi);
 static struct ubi_vtbl_record empty_vtbl_record;
 
 /**
+ * ubi_update_layout_vol - helper for updatting layout volumes on flash
+ * @ubi: UBI device description object
+ */
+static int ubi_update_layout_vol(struct ubi_device *ubi)
+{
+	struct ubi_volume *layout_vol;
+	int i, err;
+
+	layout_vol = ubi->volumes[vol_id2idx(ubi, UBI_LAYOUT_VOLUME_ID)];
+	for (i = 0; i < UBI_LAYOUT_VOLUME_EBS; i++) {
+		err = ubi_eba_atomic_leb_change(ubi, layout_vol, i, ubi->vtbl,
+						ubi->vtbl_size);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+/**
  * ubi_change_vtbl_record - change volume table record.
  * @ubi: UBI device description object
  * @idx: table index to change
@@ -83,12 +103,10 @@ static struct ubi_vtbl_record empty_vtbl_record;
 int ubi_change_vtbl_record(struct ubi_device *ubi, int idx,
 			   struct ubi_vtbl_record *vtbl_rec)
 {
-	int i, err;
+	int err;
 	uint32_t crc;
-	struct ubi_volume *layout_vol;
 
 	ubi_assert(idx >= 0 && idx < ubi->vtbl_slots);
-	layout_vol = ubi->volumes[vol_id2idx(ubi, UBI_LAYOUT_VOLUME_ID)];
 
 	if (!vtbl_rec)
 		vtbl_rec = &empty_vtbl_record;
@@ -98,15 +116,10 @@ int ubi_change_vtbl_record(struct ubi_device *ubi, int idx,
 	}
 
 	memcpy(&ubi->vtbl[idx], vtbl_rec, sizeof(struct ubi_vtbl_record));
-	for (i = 0; i < UBI_LAYOUT_VOLUME_EBS; i++) {
-		err = ubi_eba_atomic_leb_change(ubi, layout_vol, i, ubi->vtbl,
-						ubi->vtbl_size);
-		if (err)
-			return err;
-	}
+	err = ubi_update_layout_vol(ubi);
 
 	self_vtbl_check(ubi);
-	return 0;
+	return err ? err : 0;
 }
 
 /**
@@ -121,9 +134,7 @@ int ubi_change_vtbl_record(struct ubi_device *ubi, int idx,
 int ubi_vtbl_rename_volumes(struct ubi_device *ubi,
 			    struct list_head *rename_list)
 {
-	int i, err;
 	struct ubi_rename_entry *re;
-	struct ubi_volume *layout_vol;
 
 	list_for_each_entry(re, rename_list, list) {
 		uint32_t crc;
@@ -145,15 +156,7 @@ int ubi_vtbl_rename_volumes(struct ubi_device *ubi,
 		vtbl_rec->crc = cpu_to_be32(crc);
 	}
 
-	layout_vol = ubi->volumes[vol_id2idx(ubi, UBI_LAYOUT_VOLUME_ID)];
-	for (i = 0; i < UBI_LAYOUT_VOLUME_EBS; i++) {
-		err = ubi_eba_atomic_leb_change(ubi, layout_vol, i, ubi->vtbl,
-						ubi->vtbl_size);
-		if (err)
-			return err;
-	}
-
-	return 0;
+	return ubi_update_layout_vol(ubi);
 }
 
 /**
-- 
1.8.3.4
