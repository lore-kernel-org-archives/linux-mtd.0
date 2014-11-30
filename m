Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xv2z8-0003Vm-Qs
 for linux-mtd@lists.infradead.org; Sun, 30 Nov 2014 11:48:17 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 1/6] UBI: Remove alloc_ai() slab name from parameter list
Date: Sun, 30 Nov 2014 12:47:41 +0100
Message-Id: <1417348066-7043-2-git-send-email-richard@nod.at>
In-Reply-To: <1417348066-7043-1-git-send-email-richard@nod.at>
References: <1417348066-7043-1-git-send-email-richard@nod.at>
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

There is always exactly one ubi_attach_info object allocated,
therefore we don't have to care about the name.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/attach.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 32cad5c..40e6bf6 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1301,7 +1301,7 @@ out_ech:
 	return err;
 }
 
-static struct ubi_attach_info *alloc_ai(const char *slab_name)
+static struct ubi_attach_info *alloc_ai(void)
 {
 	struct ubi_attach_info *ai;
 
@@ -1314,7 +1314,7 @@ static struct ubi_attach_info *alloc_ai(const char *slab_name)
 	INIT_LIST_HEAD(&ai->erase);
 	INIT_LIST_HEAD(&ai->alien);
 	ai->volumes = RB_ROOT;
-	ai->aeb_slab_cache = kmem_cache_create(slab_name,
+	ai->aeb_slab_cache = kmem_cache_create("ubi_aeb_slab_cache",
 					       sizeof(struct ubi_ainf_peb),
 					       0, 0, NULL);
 	if (!ai->aeb_slab_cache) {
@@ -1375,7 +1375,7 @@ static int scan_fast(struct ubi_device *ubi, struct ubi_attach_info **ai)
 		return UBI_NO_FASTMAP;
 
 	destroy_ai(*ai);
-	*ai = alloc_ai("ubi_aeb_slab_cache");
+	*ai = alloc_ai();
 	if (!*ai)
 		return -ENOMEM;
 
@@ -1404,7 +1404,7 @@ int ubi_attach(struct ubi_device *ubi, int force_scan)
 	int err;
 	struct ubi_attach_info *ai;
 
-	ai = alloc_ai("ubi_aeb_slab_cache");
+	ai = alloc_ai();
 	if (!ai)
 		return -ENOMEM;
 
@@ -1422,7 +1422,7 @@ int ubi_attach(struct ubi_device *ubi, int force_scan)
 		if (err > 0) {
 			if (err != UBI_NO_FASTMAP) {
 				destroy_ai(ai);
-				ai = alloc_ai("ubi_aeb_slab_cache2");
+				ai = alloc_ai();
 				if (!ai)
 					return -ENOMEM;
 
@@ -1461,7 +1461,7 @@ int ubi_attach(struct ubi_device *ubi, int force_scan)
 	if (ubi->fm && ubi_dbg_chk_gen(ubi)) {
 		struct ubi_attach_info *scan_ai;
 
-		scan_ai = alloc_ai("ubi_ckh_aeb_slab_cache");
+		scan_ai = alloc_ai();
 		if (!scan_ai) {
 			err = -ENOMEM;
 			goto out_wl;
-- 
1.8.4.5
