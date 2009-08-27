Received: from mail-fx0-f226.google.com ([209.85.220.226])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MgaaZ-00072F-Pv
	for linux-mtd@lists.infradead.org; Thu, 27 Aug 2009 08:44:16 +0000
Received: by fxm26 with SMTP id 26so816027fxm.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 27 Aug 2009 01:44:10 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 27 Aug 2009 10:44:09 +0200
Message-ID: <62cbdcd90908270144v2e52e3ceg36c31abad3fced61@mail.gmail.com>
Subject: [PATCH] [MTD] JFFS2: Missing verify buffer allocation/deallocation.
From: massimo cirillo <maxcir@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Massimo Cirillo <maxcir@gmail.com>

The function jffs2_nor_wbuf_flash_setup() doesn't allocate the verify buffer
if CONFIG_JFFS2_FS_WBUF_VERIFY is defined, so causing a kernel panic when
that macro is enabled and the verify function is called. Similarly the
jffs2_nor_wbuf_flash_cleanup() must free the buffer if
CONFIG_JFFS2_FS_WBUF_VERIFY is enabled.
The following patch fixes the problem.
The following patch applies to 2.6.30 kernel.

Signed-off-by: Massimo Cirillo <maxcir@gmail.com>
---
diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
old mode 100644
new mode 100755
index d9a721e..5ef7bac
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -1268,10 +1268,20 @@ int jffs2_nor_wbuf_flash_setup(struct
jffs2_sb_info *c) {
 	if (!c->wbuf)
 		return -ENOMEM;

+#ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
+	c->wbuf_verify = kmalloc(c->wbuf_pagesize, GFP_KERNEL);
+	if (!c->wbuf_verify) {
+		kfree(c->wbuf);
+		return -ENOMEM;
+	}
+#endif
 	return 0;
 }

 void jffs2_nor_wbuf_flash_cleanup(struct jffs2_sb_info *c) {
+#ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
+	kfree(c->wbuf_verify);
+#endif
 	kfree(c->wbuf);
 }
