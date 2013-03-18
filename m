Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHTsB-0002jH-NZ
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 06:48:44 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/7] mtd: mtdchar: use proper kernel print level
Date: Mon, 18 Mar 2013 08:50:17 +0200
Message-Id: <1363589422-1378-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1363589422-1378-1-git-send-email-dedekind1@gmail.com>
References: <1363260463-10609-1-git-send-email-dedekind1@gmail.com>
 <1363589422-1378-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

We normally use 'pr_err()' for error messages, not 'pr_notice()'.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdchar.c |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index c2b6729..c729252 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -1249,16 +1249,18 @@ static int __init init_mtdchar(void)
 	ret = __register_chrdev(MTD_CHAR_MAJOR, 0, 1 << MINORBITS,
 				   "mtd", &mtd_fops);
 	if (ret < 0) {
-		pr_notice("Can't allocate major number %d for "
-				"Memory Technology Devices.\n", MTD_CHAR_MAJOR);
+		pr_err("Can't allocate major number %d for MTD\n",
+		       MTD_CHAR_MAJOR);
 		return ret;
 	}
 
 	ret = register_filesystem(&mtd_inodefs_type);
 	if (ret) {
-		pr_notice("Can't register mtd_inodefs filesystem: %d\n", ret);
+		pr_err("Can't register mtd_inodefs filesystem, error %d\n",
+		       ret);
 		goto err_unregister_chdev;
 	}
+
 	return ret;
 
 err_unregister_chdev:
-- 
1.7.10.4
