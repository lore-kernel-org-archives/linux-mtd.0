Received: from gprs189-60.eurotel.cz ([160.218.189.60] helo=amd.ucw.cz)
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FGIgp-0001ao-Rd
	for linux-mtd@lists.infradead.org; Mon, 06 Mar 2006 16:36:20 +0000
Date: Mon, 6 Mar 2006 14:35:38 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Andrew Morton <akpm@osdl.org>, kernel list <linux-kernel@vger.kernel.org>,
	linux-mtd@lists.infradead.org
Message-ID: <20060306133538.GA7256@elf.ucw.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: 
Subject: [patch] Kill ifdefs in mtdcore.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kill unneccessary ifdefs in mtdcore.c.

Signed-off-by: Pavel Machek <pavel@suse.cz>

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index dade02a..f1f72ed 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -19,9 +19,7 @@
 #include <linux/ioctl.h>
 #include <linux/init.h>
 #include <linux/mtd/compatmac.h>
-#ifdef CONFIG_PROC_FS
 #include <linux/proc_fs.h>
-#endif
 
 #include <linux/mtd/mtd.h>
 
@@ -351,19 +349,15 @@ done:
 
 static int __init init_mtd(void)
 {
-#ifdef CONFIG_PROC_FS
 	if ((proc_mtd = create_proc_entry( "mtd", 0, NULL )))
 		proc_mtd->read_proc = mtd_read_proc;
-#endif
 	return 0;
 }
 
 static void __exit cleanup_mtd(void)
 {
-#ifdef CONFIG_PROC_FS
         if (proc_mtd)
 		remove_proc_entry( "mtd", NULL);
-#endif
 }
 
 module_init(init_mtd);


-- 
Web maintainer for suspend.sf.net (www.sf.net/projects/suspend) wanted...
