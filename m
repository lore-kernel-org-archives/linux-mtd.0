Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SmKdu-0006q7-2Z
 for linux-mtd@lists.infradead.org; Wed, 04 Jul 2012 08:08:59 +0000
Received: by mail-wg0-f49.google.com with SMTP id ds1so4897615wgb.18
 for <linux-mtd@lists.infradead.org>; Wed, 04 Jul 2012 01:08:57 -0700 (PDT)
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 5/5] ubi: harmonize the update of ubi->beb_rsvd_pebs
Date: Wed,  4 Jul 2012 11:06:04 +0300
Message-Id: <1341389164-24409-6-git-send-email-shmulik.ladkani@gmail.com>
In-Reply-To: <1341389164-24409-1-git-send-email-shmulik.ladkani@gmail.com>
References: <1341389164-24409-1-git-send-email-shmulik.ladkani@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently, there are several locations where an attempt to reserve more
PEBs for bad PEB handling is made, with the same code being duplicated.

Harmonize it by introducing 'ubi_update_reserved()'.

Also, improve the debug message issued, making it more descriptive.

Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
---
 drivers/mtd/ubi/misc.c |   26 ++++++++++++++++++++++++++
 drivers/mtd/ubi/ubi.h  |    1 +
 drivers/mtd/ubi/vmt.c  |   20 ++------------------
 3 files changed, 29 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/ubi/misc.c b/drivers/mtd/ubi/misc.c
index 25b564f..b7d26ed 100644
--- a/drivers/mtd/ubi/misc.c
+++ b/drivers/mtd/ubi/misc.c
@@ -92,6 +92,32 @@ int ubi_check_volume(struct ubi_device *ubi, int vol_id)
 }
 
 /**
+ * ubi_update_reserved - update the number of PEBs reserved for bad
+ * eraseblock handling.
+ * @ubi: UBI device description object
+ *
+ * This function calculates the gap between current number of
+ * PEBs reserved for bad eraseblock handling and the required level of PEBs
+ * that must be reserved, and if necessary, reserves more PEBs to fill that
+ * gap, according to availability.
+ *
+ * Should be called with ubi->volumes_lock held.
+ */
+void ubi_update_reserved(struct ubi_device *ubi)
+{
+	int need = ubi->beb_rsvd_level - ubi->beb_rsvd_pebs;
+
+	if (need <= 0 || ubi->avail_pebs == 0)
+		return;
+
+	need = ubi->avail_pebs >= need ? need : ubi->avail_pebs;
+	ubi->avail_pebs -= need;
+	ubi->rsvd_pebs += need;
+	ubi->beb_rsvd_pebs += need;
+	ubi_msg("reserved more %d PEBs for bad PEB handling", need);
+}
+
+/**
  * ubi_calculate_reserved - calculate how many PEBs must be reserved for bad
  * eraseblock handling.
  * @ubi: UBI device description object
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 80c394eb..c94612e 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -646,6 +646,7 @@ int ubi_more_leb_change_data(struct ubi_device *ubi, struct ubi_volume *vol,
 int ubi_calc_data_len(const struct ubi_device *ubi, const void *buf,
 		      int length);
 int ubi_check_volume(struct ubi_device *ubi, int vol_id);
+void ubi_update_reserved(struct ubi_device *ubi);
 void ubi_calculate_reserved(struct ubi_device *ubi);
 int ubi_check_pattern(const void *buf, uint8_t patt, int size);
 
diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 0669cff..9169e58 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -443,15 +443,7 @@ int ubi_remove_volume(struct ubi_volume_desc *desc, int no_vtbl)
 	spin_lock(&ubi->volumes_lock);
 	ubi->rsvd_pebs -= reserved_pebs;
 	ubi->avail_pebs += reserved_pebs;
-	i = ubi->beb_rsvd_level - ubi->beb_rsvd_pebs;
-	if (i > 0) {
-		i = ubi->avail_pebs >= i ? i : ubi->avail_pebs;
-		ubi->avail_pebs -= i;
-		ubi->rsvd_pebs += i;
-		ubi->beb_rsvd_pebs += i;
-		if (i > 0)
-			ubi_msg("reserve more %d PEBs", i);
-	}
+	ubi_update_reserved(ubi);
 	ubi->vol_count -= 1;
 	spin_unlock(&ubi->volumes_lock);
 
@@ -558,15 +550,7 @@ int ubi_resize_volume(struct ubi_volume_desc *desc, int reserved_pebs)
 		spin_lock(&ubi->volumes_lock);
 		ubi->rsvd_pebs += pebs;
 		ubi->avail_pebs -= pebs;
-		pebs = ubi->beb_rsvd_level - ubi->beb_rsvd_pebs;
-		if (pebs > 0) {
-			pebs = ubi->avail_pebs >= pebs ? pebs : ubi->avail_pebs;
-			ubi->avail_pebs -= pebs;
-			ubi->rsvd_pebs += pebs;
-			ubi->beb_rsvd_pebs += pebs;
-			if (pebs > 0)
-				ubi_msg("reserve more %d PEBs", pebs);
-		}
+		ubi_update_reserved(ubi);
 		for (i = 0; i < reserved_pebs; i++)
 			new_mapping[i] = vol->eba_tbl[i];
 		kfree(vol->eba_tbl);
-- 
1.7.9
