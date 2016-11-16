Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6vBi-0000Z2-A9
 for linux-mtd@lists.infradead.org; Wed, 16 Nov 2016 08:03:23 +0000
Received: by mail-wm0-x243.google.com with SMTP id g23so8358741wme.1
 for <linux-mtd@lists.infradead.org>; Wed, 16 Nov 2016 00:03:01 -0800 (PST)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH v2] mtd: nand: nandsim: fix error check
Date: Wed, 16 Nov 2016 08:02:55 +0000
Message-Id: <1479283375-4335-1-git-send-email-sudipm.mukherjee@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

debugfs_create_dir() and debugfs_create_file() returns NULL on error or
a pointer on success. They do not return the error value with ERR_PTR.
So we should not check the return with IS_ERR_OR_NULL, instead we
should just check for NULL.

Signed-off-by: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
---

v2: nuked err

 drivers/mtd/nand/nandsim.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index c76287a..c847426 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -525,24 +525,20 @@ static int nandsim_debugfs_create(struct nandsim *dev)
 {
 	struct nandsim_debug_info *dbg = &dev->dbg;
 	struct dentry *dent;
-	int err;
 
 	if (!IS_ENABLED(CONFIG_DEBUG_FS))
 		return 0;
 
 	dent = debugfs_create_dir("nandsim", NULL);
-	if (IS_ERR_OR_NULL(dent)) {
-		int err = dent ? -ENODEV : PTR_ERR(dent);
-
-		NS_ERR("cannot create \"nandsim\" debugfs directory, err %d\n",
-			err);
-		return err;
+	if (!dent) {
+		NS_ERR("cannot create \"nandsim\" debugfs directory\n");
+		return -ENODEV;
 	}
 	dbg->dfs_root = dent;
 
 	dent = debugfs_create_file("wear_report", S_IRUSR,
 				   dbg->dfs_root, dev, &dfs_fops);
-	if (IS_ERR_OR_NULL(dent))
+	if (!dent)
 		goto out_remove;
 	dbg->dfs_wear_report = dent;
 
@@ -550,8 +546,7 @@ static int nandsim_debugfs_create(struct nandsim *dev)
 
 out_remove:
 	debugfs_remove_recursive(dbg->dfs_root);
-	err = dent ? PTR_ERR(dent) : -ENODEV;
-	return err;
+	return -ENODEV;
 }
 
 /**
-- 
1.9.1
