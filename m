Received: from sh78.surpasshosting.com ([72.29.64.142])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QE8Du-000471-MS
	for linux-mtd@lists.infradead.org; Sun, 24 Apr 2011 22:56:18 +0000
From: Felix Radensky <felix@embedded-sol.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtdconcat: Fix NAND OOB write
Date: Mon, 25 Apr 2011 01:57:12 +0300
Message-Id: <1303685832-17285-1-git-send-email-felix@embedded-sol.com>
Cc: Felix Radensky <felix@embedded-sol.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently mtdconcat is broken for NAND. An attemtpt to create
JFFS2 filesystem on concatenation of several NAND devices fails
with OOB write errors. This patch fixes that problem.

Signed-off-by: Felix Radensky <felix@embedded-sol.com>
---
 drivers/mtd/mtdconcat.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 5060e60..e601672 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -319,7 +319,7 @@ concat_write_oob(struct mtd_info *mtd, loff_t to, struct mtd_oob_ops *ops)
 	if (!(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
 
-	ops->retlen = 0;
+	ops->retlen = ops->oobretlen = 0;
 
 	for (i = 0; i < concat->num_subdev; i++) {
 		struct mtd_info *subdev = concat->subdev[i];
@@ -334,7 +334,7 @@ concat_write_oob(struct mtd_info *mtd, loff_t to, struct mtd_oob_ops *ops)
 			devops.len = subdev->size - to;
 
 		err = subdev->write_oob(subdev, to, &devops);
-		ops->retlen += devops.retlen;
+		ops->retlen += devops.oobretlen;
 		if (err)
 			return err;
 
-- 
1.7.4.4
