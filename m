Message-ID: <558BADE1.2070704@huawei.com>
Date: Thu, 25 Jun 2015 15:29:37 +0800
From: Wei Fang <fangwei1@huawei.com>
MIME-Version: 1.0
To: <computersforpeace@gmail.com>, <dwmw2@infradead.org>
Subject: [PATCH] jffs2: remove unneeded kfree
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
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
-- 1.8.3.1
