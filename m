Received: from szxga01-in.huawei.com ([119.145.14.64])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vt7Tv-0001mO-8n
 for linux-mtd@lists.infradead.org; Wed, 18 Dec 2013 03:07:32 +0000
From: Wang Nan <wangnan0@huawei.com>
To: <dwmw2@infradead.org>
Subject: [PATCH] jffs2: unlock f->sem on error in jffs2_new_inode()
Date: Wed, 18 Dec 2013 11:05:45 +0800
Message-ID: <1387335945-58945-1-git-send-email-wangnan0@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Wang Nan <wangnan0@huawei.com>, kernel.openeuler@huawei.com,
 linux-mtd@lists.infradead.org, Wang Guoli <andy.wangguoli@huawei.com>,
 hui.geng@huawei.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Wang Guoli <andy.wangguoli@huawei.com>

If jffs2_new_inode() succeeds, it returns with f->sem held, and
the caller is responsible for releasing the lock. If it fails,
it still returns with the lock held, but the caller won't release
the lock, which will lead to deadlock.

Fix it by releasing the lock in jffs2_new_inode() on error.

Cc: linux-mtd@lists.infradead.org
Signed-off-by: Wang Guoli <andy.wangguoli@huawei.com>
Signed-off-by: Wang Nan <wangnan0@huawei.com>

---
 fs/jffs2/fs.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index 09b3ed4..2b91675 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -456,12 +456,14 @@ struct inode *jffs2_new_inode (struct inode *dir_i, umode_t mode, struct jffs2_r
 	   The umask is only applied if there's no default ACL */
 	ret = jffs2_init_acl_pre(dir_i, inode, &mode);
 	if (ret) {
-	    make_bad_inode(inode);
-	    iput(inode);
-	    return ERR_PTR(ret);
+		mutex_unlock(&f->sem);
+		make_bad_inode(inode);
+		iput(inode);
+		return ERR_PTR(ret);
 	}
 	ret = jffs2_do_new_inode (c, f, mode, ri);
 	if (ret) {
+		mutex_unlock(&f->sem);
 		make_bad_inode(inode);
 		iput(inode);
 		return ERR_PTR(ret);
@@ -478,6 +480,7 @@ struct inode *jffs2_new_inode (struct inode *dir_i, umode_t mode, struct jffs2_r
 	inode->i_size = 0;
 
 	if (insert_inode_locked(inode) < 0) {
+		mutex_unlock(&f->sem);
 		make_bad_inode(inode);
 		iput(inode);
 		return ERR_PTR(-EINVAL);
-- 
1.8.4
