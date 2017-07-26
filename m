Received: from [167.98.27.226] (helo=devhw0)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1daJRs-0003kl-HU
 for linux-mtd@lists.infradead.org; Wed, 26 Jul 2017 10:21:50 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>
Cc: linux-kernel@lists.codethink.co.uk, linux-kernel@vger.kernel.org,
 Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] ubi: pr_err() strings should end with newlines
Date: Wed, 26 Jul 2017 10:51:10 +0100
Message-Id: <20170726095110.8458-1-ben.dooks@codethink.co.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In ubi_attach_mtd_dev() the pr_err() calls should have their
messgaes terminated with a new-line to avoid other messages
being concatenated onto the end.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/mtd/ubi/build.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index f9c576b8463e..842550b5712a 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -825,7 +825,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 	for (i = 0; i < UBI_MAX_DEVICES; i++) {
 		ubi = ubi_devices[i];
 		if (ubi && mtd->index == ubi->mtd->index) {
-			pr_err("ubi: mtd%d is already attached to ubi%d",
+			pr_err("ubi: mtd%d is already attached to ubi%d\n",
 				mtd->index, i);
 			return -EEXIST;
 		}
@@ -840,7 +840,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 	 * no sense to attach emulated MTD devices, so we prohibit this.
 	 */
 	if (mtd->type == MTD_UBIVOLUME) {
-		pr_err("ubi: refuse attaching mtd%d - it is already emulated on top of UBI",
+		pr_err("ubi: refuse attaching mtd%d - it is already emulated on top of UBI\n",
 			mtd->index);
 		return -EINVAL;
 	}
@@ -851,7 +851,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 			if (!ubi_devices[ubi_num])
 				break;
 		if (ubi_num == UBI_MAX_DEVICES) {
-			pr_err("ubi: only %d UBI devices may be created",
+			pr_err("ubi: only %d UBI devices may be created\n",
 				UBI_MAX_DEVICES);
 			return -ENFILE;
 		}
@@ -861,7 +861,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 
 		/* Make sure ubi_num is not busy */
 		if (ubi_devices[ubi_num]) {
-			pr_err("ubi: ubi%i already exists", ubi_num);
+			pr_err("ubi: ubi%i already exists\n", ubi_num);
 			return -EEXIST;
 		}
 	}
-- 
2.11.0
