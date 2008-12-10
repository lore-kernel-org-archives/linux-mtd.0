Received: from moutng.kundenserver.de ([212.227.126.171])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LALar-000347-2T
	for linux-mtd@lists.infradead.org; Wed, 10 Dec 2008 09:42:57 +0000
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] UBI: Return -ENOMEM upon failing malloc
Date: Wed, 10 Dec 2008 10:42:54 +0100
Message-Id: <1228902174-24597-1-git-send-email-sr@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Return with correct error code (-ENOMEM) from ubi_attach_mtd_dev() upon
failing malloc().

Signed-off-by: Stefan Roese <sr@denx.de>
---
 drivers/mtd/ubi/build.c |   16 +++++++++++-----
 1 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index c7630a2..485c0fc 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -816,18 +816,24 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
 		goto out_free;
 
 	ubi->peb_buf1 = vmalloc(ubi->peb_size);
-	if (!ubi->peb_buf1)
+	if (!ubi->peb_buf1) {
+		err = -ENOMEM;
 		goto out_free;
+	}
 
 	ubi->peb_buf2 = vmalloc(ubi->peb_size);
-	if (!ubi->peb_buf2)
-		 goto out_free;
+	if (!ubi->peb_buf2) {
+		err = -ENOMEM;
+		goto out_free;
+	}
 
 #ifdef CONFIG_MTD_UBI_DEBUG
 	mutex_init(&ubi->dbg_buf_mutex);
 	ubi->dbg_peb_buf = vmalloc(ubi->peb_size);
-	if (!ubi->dbg_peb_buf)
-		 goto out_free;
+	if (!ubi->dbg_peb_buf) {
+		err = -ENOMEM;
+		goto out_free;
+	}
 #endif
 
 	err = attach_by_scanning(ubi);
-- 
1.6.0.5
