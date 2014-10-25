Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xi5OR-0002dd-OK
 for linux-mtd@lists.infradead.org; Sat, 25 Oct 2014 17:44:48 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH] UBI: vtbl: Use ubi_eba_atomic_leb_change()
Date: Sat, 25 Oct 2014 19:43:41 +0200
Message-Id: <1414259021-5691-1-git-send-email-richard@nod.at>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is more a cosmetic change than a fix.
By using ubi_eba_atomic_leb_change()
we can guarantee that the first VTBL record is always
correct and we don't really need the second one anymore.
But we have to keep the second one to not break anything.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/vtbl.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 07cac5f..0d26051 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -96,12 +96,8 @@ int ubi_change_vtbl_record(struct ubi_device *ubi, int idx,
 
 	memcpy(&ubi->vtbl[idx], vtbl_rec, sizeof(struct ubi_vtbl_record));
 	for (i = 0; i < UBI_LAYOUT_VOLUME_EBS; i++) {
-		err = ubi_eba_unmap_leb(ubi, layout_vol, i);
-		if (err)
-			return err;
-
-		err = ubi_eba_write_leb(ubi, layout_vol, i, ubi->vtbl, 0,
-					ubi->vtbl_size);
+		err = ubi_eba_atomic_leb_change(ubi, layout_vol, i, ubi->vtbl,
+						ubi->vtbl_size);
 		if (err)
 			return err;
 	}
@@ -148,12 +144,8 @@ int ubi_vtbl_rename_volumes(struct ubi_device *ubi,
 
 	layout_vol = ubi->volumes[vol_id2idx(ubi, UBI_LAYOUT_VOLUME_ID)];
 	for (i = 0; i < UBI_LAYOUT_VOLUME_EBS; i++) {
-		err = ubi_eba_unmap_leb(ubi, layout_vol, i);
-		if (err)
-			return err;
-
-		err = ubi_eba_write_leb(ubi, layout_vol, i, ubi->vtbl, 0,
-					ubi->vtbl_size);
+		err = ubi_eba_atomic_leb_change(ubi, layout_vol, i, ubi->vtbl,
+						ubi->vtbl_size);
 		if (err)
 			return err;
 	}
-- 
1.8.4.5
