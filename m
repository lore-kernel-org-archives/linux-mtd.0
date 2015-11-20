Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZziiP-0006Q1-Fv
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 10:14:49 +0000
Received: by pacej9 with SMTP id ej9so112625158pac.2
 for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2015 02:14:28 -0800 (PST)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] UBI: fix return error code
Date: Fri, 20 Nov 2015 15:44:20 +0530
Message-Id: <1448014460-1371-1-git-send-email-sudipm.mukherjee@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We are checking dfs_rootdir for error value or NULL. But in the
conditional ternary operator we returned -ENODEV if dfs_rootdir contains
an error value and returned PTR_ERR(dfs_rootdir) if dfs_rootdir is NULL.
So in the case of dfs_rootdir being NULL we actually assigned 0 to err
and returned it to the caller implying a success.
Lets return -ENODEV when dfs_rootdir is NULL else return
PTR_ERR(dfs_rootdir).

Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
---
 drivers/mtd/ubi/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index b077e43..c4cb15a 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -236,7 +236,7 @@ int ubi_debugfs_init(void)
 
 	dfs_rootdir = debugfs_create_dir("ubi", NULL);
 	if (IS_ERR_OR_NULL(dfs_rootdir)) {
-		int err = dfs_rootdir ? -ENODEV : PTR_ERR(dfs_rootdir);
+		int err = dfs_rootdir ? PTR_ERR(dfs_rootdir) : -ENODEV;
 
 		pr_err("UBI error: cannot create \"ubi\" debugfs directory, error %d\n",
 		       err);
-- 
1.9.1
