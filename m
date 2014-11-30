Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xv3U9-0005Zl-Pw
 for linux-mtd@lists.infradead.org; Sun, 30 Nov 2014 12:20:19 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 2/6] UBI: Add accessor functions for WL data structures
Date: Sun, 30 Nov 2014 13:19:44 +0100
Message-Id: <1417349988-9238-3-git-send-email-richard@nod.at>
In-Reply-To: <1417349988-9238-1-git-send-email-richard@nod.at>
References: <1417349988-9238-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fastmap need access to various WL data structures as
fastmap tightly depends on WL.
To make the access less invasive add accessor functions.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/ubi.h | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index d3ad165..4fe33fe 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -897,6 +897,42 @@ static inline int ubiblock_remove(struct ubi_volume_info *vi)
 }
 #endif
 
+/*
+ * ubi_for_each_free_peb - walk the UBI free RB tree.
+ * @ubi: UBI device description object
+ * @e: a pointer to a ubi_wl_entry to use as cursor
+ * @pos: a pointer to RB-tree entry type to use as a loop counter
+ */
+#define ubi_for_each_free_peb(ubi, e, tmp_rb)	\
+	ubi_rb_for_each_entry((tmp_rb), (e), &(ubi)->free, u.rb)
+
+/*
+ * ubi_for_each_used_peb - walk the UBI used RB tree.
+ * @ubi: UBI device description object
+ * @e: a pointer to a ubi_wl_entry to use as cursor
+ * @pos: a pointer to RB-tree entry type to use as a loop counter
+ */
+#define ubi_for_each_used_peb(ubi, e, tmp_rb)	\
+	ubi_rb_for_each_entry((tmp_rb), (e), &(ubi)->used, u.rb)
+
+/*
+ * ubi_for_each_scub_peb - walk the UBI scub RB tree.
+ * @ubi: UBI device description object
+ * @e: a pointer to a ubi_wl_entry to use as cursor
+ * @pos: a pointer to RB-tree entry type to use as a loop counter
+ */
+#define ubi_for_each_scrub_peb(ubi, e, tmp_rb)	\
+	ubi_rb_for_each_entry((tmp_rb), (e), &(ubi)->scrub, u.rb)
+
+/*
+ * ubi_for_each_protected_peb - walk the UBI protection queue.
+ * @ubi: UBI device description object
+ * @i: a integer used as counter
+ * @e: a pointer to a ubi_wl_entry to use as cursor
+ */
+#define ubi_for_each_protected_peb(ubi, i, e)	\
+	for ((i) = 0; (i) < UBI_PROT_QUEUE_LEN; (i)++)	\
+		list_for_each_entry((e), &(ubi->pq[(i)]), u.list)
 
 /*
  * ubi_rb_for_each_entry - walk an RB-tree.
-- 
1.8.4.5
