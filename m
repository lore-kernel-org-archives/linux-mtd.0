Received: from out1.zte.com.cn ([202.103.147.172] helo=mxct.zte.com.cn)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2RqC-0004Do-4T
 for linux-mtd@lists.infradead.org; Thu, 12 Oct 2017 00:59:16 +0000
From: Liu Song <liu.song11@zte.com.cn>
To: dwmw2@infradead.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 liu.song11@zte.com.cn, jiang.biao2@zte.com.cn, zhong.weidong@zte.com.cn
Subject: [PATCH] jffs2: fix potential deadlock in jffs2_do_setattr
Date: Thu, 12 Oct 2017 08:56:05 +0800
Message-Id: <1507769765-13478-1-git-send-email-liu.song11@zte.com.cn>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In jffs2_do_setattr, we hold two mutexes which are 
A) c->alloc_sem 
B) f->sem 
If new_metadata is error, then we release mutexes in bad sequence 
which could cause ABAB deadlock. 
This patch adjusts release sequence which could avoid deadlock. 

Signed-off-by: Liu Song <liu.song11@zte.com.cn>
Reviewed-by: Jiang Biao <jiang.biao2@zte.com.cn>
---
 fs/jffs2/fs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index 76fa814..f998126 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -140,9 +140,9 @@ int jffs2_do_setattr (struct inode *inode, struct iattr *iattr)
 		kfree(mdata);
 
 	if (IS_ERR(new_metadata)) {
-		jffs2_complete_reservation(c);
 		jffs2_free_raw_inode(ri);
 		mutex_unlock(&f->sem);
+		jffs2_complete_reservation(c);
 		return PTR_ERR(new_metadata);
 	}
 	/* It worked. Update the inode */
-- 
2.1.0.GIT
