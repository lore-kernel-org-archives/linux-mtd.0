Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YfOY3-0007b8-Tg
 for linux-mtd@lists.infradead.org; Tue, 07 Apr 2015 08:07:53 +0000
Message-ID: <55239023.5000107@huawei.com>
Date: Tue, 7 Apr 2015 16:06:59 +0800
From: fangwei <fangwei1@huawei.com>
MIME-Version: 1.0
To: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH] jffs2: remove unneeded kfree.
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

c->oobbuf hasn't been kmalloced in jffs2_dataflash_setup, so
there is no need to free it.

Signed-off-by: Wei Fang <fangwei1@huawei.com>
---
 fs/jffs2/wbuf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index 09ed551..63f31c0 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -1274,7 +1274,6 @@ int jffs2_dataflash_setup(struct jffs2_sb_info *c) {
 #ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
        c->wbuf_verify = kmalloc(c->wbuf_pagesize, GFP_KERNEL);
        if (!c->wbuf_verify) {
-               kfree(c->oobbuf);
                kfree(c->wbuf);
                return -ENOMEM;
        }
-- 
1.8.3.1
