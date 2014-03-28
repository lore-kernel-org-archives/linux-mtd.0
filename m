Received: from mout.web.de ([212.227.15.4])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTdyB-0004B9-AJ
 for linux-mtd@lists.infradead.org; Fri, 28 Mar 2014 21:05:43 +0000
From: Alexander Stein <alexanders83@web.de>
To: Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] UBI: Fix potential NULL-pointer dereference
Date: Fri, 28 Mar 2014 22:04:49 +0100
Message-Id: <1396040689-12419-1-git-send-email-alexanders83@web.de>
Cc: Alexander Stein <alexanders83@web.de>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It's no use to debug print a string before checking on NULL.

Signed-off-by: Alexander Stein <alexanders83@web.de>
---
 drivers/mtd/ubi/kapi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index 3aac1ac..e40864f 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -242,11 +242,11 @@ struct ubi_volume_desc *ubi_open_volume_nm(int ubi_num, const char *name,
 	struct ubi_device *ubi;
 	struct ubi_volume_desc *ret;
 
-	dbg_gen("open device %d, volume %s, mode %d", ubi_num, name, mode);
-
 	if (!name)
 		return ERR_PTR(-EINVAL);
 
+	dbg_gen("open device %d, volume %s, mode %d", ubi_num, name, mode);
+
 	len = strnlen(name, UBI_VOL_NAME_MAX + 1);
 	if (len > UBI_VOL_NAME_MAX)
 		return ERR_PTR(-EINVAL);
-- 
1.9.1
