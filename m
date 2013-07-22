Date: Mon, 22 Jul 2013 23:43:40 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [patch v2] mtd: tiny debugfs related fixes
Message-ID: <20130722204340.GC22020@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130719054938.GC9729@elgon.mountain>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

debugfs_create_dir() can't return an error pointer because we tested for
IS_ENABLED(CONFIG_DEBUG_FS) earlier so we don't need to test for that.
Also the way debugfs is designed, callers should not normally care about
error pointer returns.

The current code is a little buggy because it return success if
debugfs_create_dir() fails instead of -ENODEV which was intended.

I have also changed the error message slightly.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: completely different

diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 63cb1d7..d3c99a6 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -235,12 +235,9 @@ int ubi_debugfs_init(void)
 		return 0;
 
 	dfs_rootdir = debugfs_create_dir("ubi", NULL);
-	if (IS_ERR_OR_NULL(dfs_rootdir)) {
-		int err = dfs_rootdir ? -ENODEV : PTR_ERR(dfs_rootdir);
-
-		ubi_err("cannot create \"ubi\" debugfs directory, error %d\n",
-			err);
-		return err;
+	if (!dfs_rootdir) {
+		ubi_err("cannot create \"ubi\" debugfs directory.\n");
+		return -ENODEV;
 	}
 
 	return 0;
diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index cb38f3d..3971465 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -523,24 +523,20 @@ static int nandsim_debugfs_create(struct nandsim *dev)
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
+		NS_ERR("cannot create \"nandsim\" debugfs directory.");
+		return -ENODEV;
 	}
 	dbg->dfs_root = dent;
 
 	dent = debugfs_create_file("wear_report", S_IRUSR,
 				   dbg->dfs_root, dev, &dfs_fops);
-	if (IS_ERR_OR_NULL(dent))
+	if (!dent)
 		goto out_remove;
 	dbg->dfs_wear_report = dent;
 
@@ -548,8 +544,7 @@ static int nandsim_debugfs_create(struct nandsim *dev)
 
 out_remove:
 	debugfs_remove_recursive(dbg->dfs_root);
-	err = dent ? PTR_ERR(dent) : -ENODEV;
-	return err;
+	return -ENODEV;
 }
 
 /**
