Received: from qw-out-1920.google.com ([74.125.92.149])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LqACw-0008Ek-9a
	for linux-mtd@lists.infradead.org; Sat, 04 Apr 2009 18:03:14 +0000
Received: by qw-out-1920.google.com with SMTP id 5so1159591qwf.24
	for <linux-mtd@lists.infradead.org>;
	Sat, 04 Apr 2009 11:03:05 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 4 Apr 2009 11:03:04 -0700
Message-ID: <a95a62fe0904041103w7fb5a647h5b8469060ed70abc@mail.gmail.com>
Subject: [PATCH] [MTD] sysfs support should not depend on CONFIG_PROC_FS
From: Kevin Cernekee <kpc.mtd@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>, David Brownell <david-b@pacbell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Move the driver model init code out of the "#ifdef CONFIG_PROC_FS"
block.

Tested with both values of CONFIG_PROC_FS .  Tested with CONFIG_MTD=m .

Issue was reported here: http://lkml.org/lkml/2009/4/4/107

Signed-off-by: Kevin Cernekee <kpc.mtd@gmail.com>
---
 drivers/mtd/mtdcore.c |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 89c1e5d..fdd6ae8 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -585,6 +585,8 @@ done:
         return ((count < begin+len-off) ? count : begin+len-off);
 }

+#endif /* CONFIG_PROC_FS */
+
 /*====================================================================*/
 /* Init code */

@@ -596,24 +598,25 @@ static int __init init_mtd(void)
 		pr_err("Error creating mtd class.\n");
 		return PTR_ERR(mtd_class);
 	}
+#ifdef CONFIG_PROC_FS
 	if ((proc_mtd = create_proc_entry( "mtd", 0, NULL )))
 		proc_mtd->read_proc = mtd_read_proc;
+#endif /* CONFIG_PROC_FS */
 	return 0;
 }

 static void __exit cleanup_mtd(void)
 {
+#ifdef CONFIG_PROC_FS
         if (proc_mtd)
 		remove_proc_entry( "mtd", NULL);
+#endif /* CONFIG_PROC_FS */
 	class_destroy(mtd_class);
 }

 module_init(init_mtd);
 module_exit(cleanup_mtd);

-#endif /* CONFIG_PROC_FS */
-
-
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");
 MODULE_DESCRIPTION("Core MTD registration and access routines");
-- 
1.5.6.3
