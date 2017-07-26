Received: from [167.98.27.226] (helo=devhw0)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1daJSG-0003m0-Dk
 for linux-mtd@lists.infradead.org; Wed, 26 Jul 2017 10:22:14 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>
Cc: linux-kernel@lists.codethink.co.uk, linux-kernel@vger.kernel.org,
 Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] ubi: pr_err() strings should end with newlines
Date: Wed, 26 Jul 2017 10:42:54 +0100
Message-Id: <20170726094254.6090-1-ben.dooks@codethink.co.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The ubi_init() function has a few error paths that use the
pr_err() to output errors. These should have new lines on
them as pr_err() does not automatically do this.

This fixes issues where if multiple mtd fail to bind to
ubi the console output starts wrapping around.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/mtd/ubi/build.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index d854521962ef..f9c576b8463e 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1166,7 +1166,7 @@ static int __init ubi_init(void)
 	BUILD_BUG_ON(sizeof(struct ubi_vid_hdr) != 64);
 
 	if (mtd_devs > UBI_MAX_DEVICES) {
-		pr_err("UBI error: too many MTD devices, maximum is %d",
+		pr_err("UBI error: too many MTD devices, maximum is %d\n",
 		       UBI_MAX_DEVICES);
 		return -EINVAL;
 	}
@@ -1178,7 +1178,7 @@ static int __init ubi_init(void)
 
 	err = misc_register(&ubi_ctrl_cdev);
 	if (err) {
-		pr_err("UBI error: cannot register device");
+		pr_err("UBI error: cannot register device\n");
 		goto out;
 	}
 
@@ -1205,7 +1205,7 @@ static int __init ubi_init(void)
 		mtd = open_mtd_device(p->name);
 		if (IS_ERR(mtd)) {
 			err = PTR_ERR(mtd);
-			pr_err("UBI error: cannot open mtd %s, error %d",
+			pr_err("UBI error: cannot open mtd %s, error %d\n",
 			       p->name, err);
 			/* See comment below re-ubi_is_module(). */
 			if (ubi_is_module())
@@ -1218,7 +1218,7 @@ static int __init ubi_init(void)
 					 p->vid_hdr_offs, p->max_beb_per1024);
 		mutex_unlock(&ubi_devices_mutex);
 		if (err < 0) {
-			pr_err("UBI error: cannot attach mtd%d",
+			pr_err("UBI error: cannot attach mtd%d\n",
 			       mtd->index);
 			put_mtd_device(mtd);
 
@@ -1242,7 +1242,7 @@ static int __init ubi_init(void)
 
 	err = ubiblock_init();
 	if (err) {
-		pr_err("UBI error: block: cannot initialize, error %d", err);
+		pr_err("UBI error: block: cannot initialize, error %d\n", err);
 
 		/* See comment above re-ubi_is_module(). */
 		if (ubi_is_module())
@@ -1265,7 +1265,7 @@ static int __init ubi_init(void)
 	misc_deregister(&ubi_ctrl_cdev);
 out:
 	class_unregister(&ubi_class);
-	pr_err("UBI error: cannot initialize UBI, error %d", err);
+	pr_err("UBI error: cannot initialize UBI, error %d\n", err);
 	return err;
 }
 late_initcall(ubi_init);
-- 
2.11.0
