Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bKA9L-0002gE-AZ
 for linux-mtd@lists.infradead.org; Mon, 04 Jul 2016 20:07:24 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: computersforpeace@gmail.com, dwmw2@infradead.org, richard@nod.at,
 dedekind1@gmail.com, stable@vger.kernel.org
Subject: [PATCH 2/2] ubi: Fix early logging
Date: Mon,  4 Jul 2016 22:06:51 +0200
Message-Id: <1467662811-7463-2-git-send-email-richard@nod.at>
In-Reply-To: <1467662811-7463-1-git-send-email-richard@nod.at>
References: <1467662811-7463-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We cannot use ubi_* logging functions before the UBI
object is initialized.

Cc: <stable@vger.kernel.org>
Fixes: 3260870331 ("UBI: Extend UBI layer debug/messaging capabilities")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/build.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index ef36182..4536109 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -874,7 +874,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 	for (i = 0; i < UBI_MAX_DEVICES; i++) {
 		ubi = ubi_devices[i];
 		if (ubi && mtd->index == ubi->mtd->index) {
-			ubi_err(ubi, "mtd%d is already attached to ubi%d",
+			pr_err("ubi: mtd%d is already attached to ubi%d",
 				mtd->index, i);
 			return -EEXIST;
 		}
@@ -889,7 +889,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 	 * no sense to attach emulated MTD devices, so we prohibit this.
 	 */
 	if (mtd->type == MTD_UBIVOLUME) {
-		ubi_err(ubi, "refuse attaching mtd%d - it is already emulated on top of UBI",
+		pr_err("ubi: refuse attaching mtd%d - it is already emulated on top of UBI",
 			mtd->index);
 		return -EINVAL;
 	}
@@ -900,7 +900,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 			if (!ubi_devices[ubi_num])
 				break;
 		if (ubi_num == UBI_MAX_DEVICES) {
-			ubi_err(ubi, "only %d UBI devices may be created",
+			pr_err("ubi: only %d UBI devices may be created",
 				UBI_MAX_DEVICES);
 			return -ENFILE;
 		}
@@ -910,7 +910,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 
 		/* Make sure ubi_num is not busy */
 		if (ubi_devices[ubi_num]) {
-			ubi_err(ubi, "already exists");
+			pr_err("ubi: ubi%i already exists", ubi_num);
 			return -EEXIST;
 		}
 	}
-- 
2.7.3
