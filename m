From: Wei Fang <fangwei1@huawei.com>
To: <computersforpeace@gmail.com>
CC: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>, Wei Fang
 <fangwei1@huawei.com>
Subject: [PATCH RESEND] jffs2: remove unneeded kfree
Date: Tue, 7 Jul 2015 10:54:26 +0800
Message-ID: <1436237666-27398-1-git-send-email-fangwei1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
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
 fs/jffs2/wbuf.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index 09ed551..63f31c0 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -1274,7 +1274,6 @@ int jffs2_dataflash_setup(struct jffs2_sb_info *c) {
 #ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
 	c->wbuf_verify = kmalloc(c->wbuf_pagesize, GFP_KERNEL);
 	if (!c->wbuf_verify) {
-		kfree(c->oobbuf);
 		kfree(c->wbuf);
 		return -ENOMEM;
 	}
-- 
1.7.1
