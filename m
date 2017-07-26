Received: from [167.98.27.226] (helo=devhw0)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1daJSd-0003nu-FN
 for linux-mtd@lists.infradead.org; Wed, 26 Jul 2017 10:22:37 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>
Cc: linux-kernel@lists.codethink.co.uk, linux-kernel@vger.kernel.org,
 Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] ubi: pr_err() strings should end with newlines
Date: Wed, 26 Jul 2017 10:53:50 +0100
Message-Id: <20170726095350.8739-1-ben.dooks@codethink.co.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In build.c, the following pr_err calls should be terminated with
a new-line to avoid other messages being concatenated onto the end.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/mtd/ubi/block.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index c3963f880448..b210fdb31c98 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -383,7 +383,7 @@ int ubiblock_create(struct ubi_volume_info *vi)
 	/* Initialize the gendisk of this ubiblock device */
 	gd = alloc_disk(1);
 	if (!gd) {
-		pr_err("UBI: block: alloc_disk failed");
+		pr_err("UBI: block: alloc_disk failed\n");
 		ret = -ENODEV;
 		goto out_free_dev;
 	}
@@ -607,7 +607,7 @@ static void __init ubiblock_create_from_param(void)
 		desc = open_volume_desc(p->name, p->ubi_num, p->vol_id);
 		if (IS_ERR(desc)) {
 			pr_err(
-			       "UBI: block: can't open volume on ubi%d_%d, err=%ld",
+			       "UBI: block: can't open volume on ubi%d_%d, err=%ld\n",
 			       p->ubi_num, p->vol_id, PTR_ERR(desc));
 			continue;
 		}
@@ -618,7 +618,7 @@ static void __init ubiblock_create_from_param(void)
 		ret = ubiblock_create(&vi);
 		if (ret) {
 			pr_err(
-			       "UBI: block: can't add '%s' volume on ubi%d_%d, err=%d",
+			       "UBI: block: can't add '%s' volume on ubi%d_%d, err=%d\n",
 			       vi.name, p->ubi_num, p->vol_id, ret);
 			continue;
 		}
-- 
2.11.0
