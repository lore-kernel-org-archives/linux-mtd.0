Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCjTG-0007On-28
 for linux-mtd@lists.infradead.org; Tue, 14 Jun 2016 08:13:15 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 7/7] ubi: Use bitmaps in Fastmap self-check code
Date: Tue, 14 Jun 2016 10:12:18 +0200
Message-Id: <1465891938-4063-7-git-send-email-richard@nod.at>
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

...don't waste memory by allocating one sizeof(int) per
PEB.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index b66cb3e..48eb55f 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -15,20 +15,22 @@
  */
 
 #include <linux/crc32.h>
+#include <linux/bitmap.h>
 #include "ubi.h"
 
 /**
  * init_seen - allocate memory for used for debugging.
  * @ubi: UBI device description object
  */
-static inline int *init_seen(struct ubi_device *ubi)
+static inline unsigned long *init_seen(struct ubi_device *ubi)
 {
-	int *ret;
+	unsigned long *ret;
 
 	if (!ubi_dbg_chk_fastmap(ubi))
 		return NULL;
 
-	ret = kcalloc(ubi->peb_count, sizeof(int), GFP_KERNEL);
+	ret = kcalloc(BITS_TO_LONGS(ubi->peb_count), sizeof(unsigned long),
+		      GFP_KERNEL);
 	if (!ret)
 		return ERR_PTR(-ENOMEM);
 
@@ -39,7 +41,7 @@ static inline int *init_seen(struct ubi_device *ubi)
  * free_seen - free the seen logic integer array.
  * @seen: integer array of @ubi->peb_count size
  */
-static inline void free_seen(int *seen)
+static inline void free_seen(unsigned long *seen)
 {
 	kfree(seen);
 }
@@ -50,12 +52,12 @@ static inline void free_seen(int *seen)
  * @pnum: The PEB to be makred as seen
  * @seen: integer array of @ubi->peb_count size
  */
-static inline void set_seen(struct ubi_device *ubi, int pnum, int *seen)
+static inline void set_seen(struct ubi_device *ubi, int pnum, unsigned long *seen)
 {
 	if (!ubi_dbg_chk_fastmap(ubi) || !seen)
 		return;
 
-	seen[pnum] = 1;
+	set_bit(pnum, seen);
 }
 
 /**
@@ -63,7 +65,7 @@ static inline void set_seen(struct ubi_device *ubi, int pnum, int *seen)
  * @ubi: UBI device description object
  * @seen: integer array of @ubi->peb_count size
  */
-static int self_check_seen(struct ubi_device *ubi, int *seen)
+static int self_check_seen(struct ubi_device *ubi, unsigned long *seen)
 {
 	int pnum, ret = 0;
 
@@ -71,7 +73,7 @@ static int self_check_seen(struct ubi_device *ubi, int *seen)
 		return 0;
 
 	for (pnum = 0; pnum < ubi->peb_count; pnum++) {
-		if (!seen[pnum] && ubi->lookuptbl[pnum]) {
+		if (test_bit(pnum, seen) && ubi->lookuptbl[pnum]) {
 			ubi_err(ubi, "self-check failed for PEB %d, fastmap didn't see it", pnum);
 			ret = -EINVAL;
 		}
@@ -1139,7 +1141,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 	struct rb_node *tmp_rb;
 	int ret, i, j, free_peb_count, used_peb_count, vol_count;
 	int scrub_peb_count, erase_peb_count;
-	int *seen_pebs = NULL;
+	unsigned long *seen_pebs = NULL;
 
 	fm_raw = ubi->fm_buf;
 	memset(ubi->fm_buf, 0, ubi->fm_size);
-- 
2.7.3
