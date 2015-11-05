Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZuTTH-0005Hy-CD
 for linux-mtd@lists.infradead.org; Thu, 05 Nov 2015 22:57:33 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, alex@nextthing.co,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 2/5] UBI: Introduce in_pq()
Date: Thu,  5 Nov 2015 23:56:54 +0100
Message-Id: <1446764217-15021-3-git-send-email-richard@nod.at>
In-Reply-To: <1446764217-15021-1-git-send-email-richard@nod.at>
References: <1446764217-15021-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This function works like in_wl_tree() but checks whether an ubi_wl_entry
is currently in the protection queue.
We need this function to query the current state of an ubi_wl_entry.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index beaf3c4..a7b0543 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -278,6 +278,27 @@ static int in_wl_tree(struct ubi_wl_entry *e, struct rb_root *root)
 }
 
 /**
+ * in_pq - check if a wear-leveling entry is present in the protection queue.
+ * @ubi: UBI device description object
+ * @e: the wear-leveling entry to check
+ *
+ * This function returns non-zero if @e is in the protection queue and zero
+ * if it is not.
+ */
+static inline int in_pq(const struct ubi_device *ubi, struct ubi_wl_entry *e)
+{
+	struct ubi_wl_entry *p;
+	int i;
+
+	for (i = 0; i < UBI_PROT_QUEUE_LEN; ++i)
+		list_for_each_entry(p, &ubi->pq[i], u.list)
+			if (p == e)
+				return 1;
+
+	return 0;
+}
+
+/**
  * prot_queue_add - add physical eraseblock to the protection queue.
  * @ubi: UBI device description object
  * @e: the physical eraseblock to add
@@ -1758,16 +1779,11 @@ static int self_check_in_wl_tree(const struct ubi_device *ubi,
 static int self_check_in_pq(const struct ubi_device *ubi,
 			    struct ubi_wl_entry *e)
 {
-	struct ubi_wl_entry *p;
-	int i;
-
 	if (!ubi_dbg_chk_gen(ubi))
 		return 0;
 
-	for (i = 0; i < UBI_PROT_QUEUE_LEN; ++i)
-		list_for_each_entry(p, &ubi->pq[i], u.list)
-			if (p == e)
-				return 0;
+	if (in_pq(ubi, e))
+		return 0;
 
 	ubi_err(ubi, "self-check failed for PEB %d, EC %d, Protect queue",
 		e->pnum, e->ec);
-- 
1.8.4.5
