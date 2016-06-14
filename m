Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCjSt-0007BL-0D
 for linux-mtd@lists.infradead.org; Tue, 14 Jun 2016 08:12:53 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 2/7] ubi: Introduce vol_ignored()
Date: Tue, 14 Jun 2016 10:12:13 +0200
Message-Id: <1465891938-4063-2-git-send-email-richard@nod.at>
In-Reply-To: <1465891938-4063-1-git-send-email-richard@nod.at>
References: <1465891938-4063-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This makes the logic more easy to follow.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/attach.c | 24 ++++++++++++++++++------
 drivers/mtd/ubi/ubi.h    | 15 +++++++++++++++
 2 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index cc04ca8..6e5fb1d 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -803,6 +803,20 @@ out_unlock:
 	return err;
 }
 
+static bool vol_ignored(int vol_id)
+{
+	switch (vol_id) {
+		case UBI_LAYOUT_VOLUME_ID:
+		return true;
+	}
+
+#ifdef CONFIG_MTD_UBI_FASTMAP
+	return ubi_is_fm_vol(vol_id);
+#else
+	return false;
+#endif
+}
+
 /**
  * scan_peb - scan and process UBI headers of a PEB.
  * @ubi: UBI device description object
@@ -995,17 +1009,15 @@ static int scan_peb(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		*vid = vol_id;
 	if (sqnum)
 		*sqnum = be64_to_cpu(vidh->sqnum);
-	if (vol_id > UBI_MAX_VOLUMES && vol_id != UBI_LAYOUT_VOLUME_ID) {
+	if (vol_id > UBI_MAX_VOLUMES && !vol_ignored(vol_id)) {
 		int lnum = be32_to_cpu(vidh->lnum);
 
 		/* Unsupported internal volume */
 		switch (vidh->compat) {
 		case UBI_COMPAT_DELETE:
-			if (vol_id != UBI_FM_SB_VOLUME_ID
-			    && vol_id != UBI_FM_DATA_VOLUME_ID) {
-				ubi_msg(ubi, "\"delete\" compatible internal volume %d:%d found, will remove it",
-					vol_id, lnum);
-			}
+			ubi_msg(ubi, "\"delete\" compatible internal volume %d:%d found, will remove it",
+				vol_id, lnum);
+
 			err = add_to_list(ai, pnum, vol_id, lnum,
 					  ec, 1, &ai->erase);
 			if (err)
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 61d4e99..91075b6 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -1105,4 +1105,19 @@ static inline int idx2vol_id(const struct ubi_device *ubi, int idx)
 		return idx;
 }
 
+/**
+ * ubi_is_fm_vol - check whether a volume ID is a Fastmap volume.
+ * @vol_id: volume ID
+ */
+static inline bool ubi_is_fm_vol(int vol_id)
+{
+	switch (vol_id) {
+		case UBI_FM_SB_VOLUME_ID:
+		case UBI_FM_DATA_VOLUME_ID:
+		return true;
+	}
+
+	return false;
+}
+
 #endif /* !__UBI_UBI_H__ */
-- 
2.7.3
