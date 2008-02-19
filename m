Received: from smtp2.sssup.it ([193.205.80.100] helo=smpt2.sssup.it)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JRXwk-00050y-L5
	for linux-mtd@lists.infradead.org; Tue, 19 Feb 2008 19:16:07 +0000
Message-ID: <47BB2AE4.1000206@gandalf.sssup.it>
Date: Tue, 19 Feb 2008 20:15:48 +0100
From: michael <trimarchi@gandalf.sssup.it>
MIME-Version: 1.0
To: linux-kernel@vger.kernel.org
Subject: [PATCH] Add write verify on dataflash.
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add the write verification buffer to the dataflash. The
mtd_dataflash has the CONFIG_DATAFLASH_WRITE_VERIFY so
is better a change to Kconfig.

Signed-off-by: Michael Trimarchi <trimarchimichael@yahoo.it>
---
 fs/jffs2/wbuf.c |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index d1d4f27..ba49f19 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -1236,12 +1236,24 @@ int jffs2_dataflash_setup(struct jffs2_sb_info *c) {
        if (!c->wbuf)
                return -ENOMEM;

+#ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
+       c->wbuf_verify = kmalloc(c->wbuf_pagesize, GFP_KERNEL);
+       if (!c->wbuf_verify) {
+               kfree(c->oobbuf);
+               kfree(c->wbuf);
+               return -ENOMEM;
+       }
+#endif
+
        printk(KERN_INFO "JFFS2 write-buffering enabled buffer (%d) 
erasesize (%d)\n", c->wbuf_pagesize, c->sector_size);

        return 0;
 }

 void jffs2_dataflash_cleanup(struct jffs2_sb_info *c) {
+#ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
+       kfree(c->wbuf_verify);
+#endif
        kfree(c->wbuf);
 }

--
1.5.2.1.174.gcd03
