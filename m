Received: from mail.aswsp.com ([193.34.35.150])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bT3Pe-0007lE-MC
 for linux-mtd@lists.infradead.org; Fri, 29 Jul 2016 08:44:59 +0000
From: Camille Constans <camille.constans@parrot.com>
To: <dedekind1@gmail.com>, <richard@nod.at>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.co>, <linux-mtd@lists.infradead.org>
CC: Camille Constans <camille.constans@parrot.com>
Subject: [PATCH] UBI: Fix null pointer on error log
Date: Fri, 29 Jul 2016 10:44:12 +0200
Message-ID: <1469781852-12253-1-git-send-email-camille.constans@parrot.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It fixes UBI: Extend UBI layer debug/messaging capabilities
As with this commit ubi_err macro is now:

#define ubi_err(ubi, fmt, ...) pr_err("UBI-%d error: %s: " fmt "\n", \
				      ubi->ubi_num, __func__, ##__VA_ARGS__)

It leads to a null pointer when used before allocating ubi.

Signed-off-by: Camille Constans <camille.constans@parrot.com>
---
 drivers/mtd/ubi/build.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index ef36182..f98bfb9 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -889,7 +889,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 	 * no sense to attach emulated MTD devices, so we prohibit this.
 	 */
 	if (mtd->type == MTD_UBIVOLUME) {
-		ubi_err(ubi, "refuse attaching mtd%d - it is already emulated on top of UBI",
+		pr_err("UBI error: refuse attaching mtd%d - it is already emulated on top of UBI\n",
 			mtd->index);
 		return -EINVAL;
 	}
@@ -900,7 +900,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 			if (!ubi_devices[ubi_num])
 				break;
 		if (ubi_num == UBI_MAX_DEVICES) {
-			ubi_err(ubi, "only %d UBI devices may be created",
+			pr_err("UBI error: only %d UBI devices may be created\n",
 				UBI_MAX_DEVICES);
 			return -ENFILE;
 		}
@@ -910,7 +910,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 
 		/* Make sure ubi_num is not busy */
 		if (ubi_devices[ubi_num]) {
-			ubi_err(ubi, "already exists");
+			pr_err("UBI error: ubi%d already exists\n", ubi_num);
 			return -EEXIST;
 		}
 	}
-- 
1.9.1
