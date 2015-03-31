Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YczQd-0006OD-BG
 for linux-mtd@lists.infradead.org; Tue, 31 Mar 2015 16:54:16 +0000
Received: by pdbni2 with SMTP id ni2so26340218pdb.1
 for <linux-mtd@lists.infradead.org>; Tue, 31 Mar 2015 09:53:52 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: docg3: remove invalid __exit annotations
Date: Tue, 31 Mar 2015 09:53:37 -0700
Message-Id: <1427820817-9446-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The .remove callback may be used when detaching a device via sysfs, so
we can't expect to free up this memory.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
---
Compile tested only

 drivers/mtd/devices/docg3.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 448ce42f951e..30b5be4e2109 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -1805,7 +1805,7 @@ static int __init doc_dbg_register(struct docg3 *docg3)
 	}
 }
 
-static void __exit doc_dbg_unregister(struct docg3 *docg3)
+static void doc_dbg_unregister(struct docg3 *docg3)
 {
 	debugfs_remove_recursive(docg3->debugfs_root);
 }
@@ -2103,7 +2103,7 @@ err_probe:
  *
  * Returns 0
  */
-static int __exit docg3_release(struct platform_device *pdev)
+static int docg3_release(struct platform_device *pdev)
 {
 	struct docg3_cascade *cascade = platform_get_drvdata(pdev);
 	struct docg3 *docg3 = cascade->floors[0]->priv;
@@ -2134,7 +2134,7 @@ static struct platform_driver g3_driver = {
 	},
 	.suspend	= docg3_suspend,
 	.resume		= docg3_resume,
-	.remove		= __exit_p(docg3_release),
+	.remove		= docg3_release,
 };
 
 module_platform_driver_probe(g3_driver, docg3_probe);
-- 
2.1.0
