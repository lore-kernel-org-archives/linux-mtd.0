Received: from szxga02-in.huawei.com ([119.145.14.65])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VwWWj-0007HF-4V
 for linux-mtd@lists.infradead.org; Fri, 27 Dec 2013 12:28:31 +0000
Date: Fri, 27 Dec 2013 20:26:23 +0800
From: Wang Nan <wangnan0@huawei.com>
To: <akpm@linux-foundation.org>
Subject: [PATCH resend] jffs2: unlock f->sem on error in jffs2_new_inode()
Message-ID: <20131227122623.GA44535@kernel-host>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Andrew,

Could you please have a look at the following patch?

This patch fixes an obvious bug in jffs2. I have already sent it to mtd
list, but Woodhouse hasn't been responsive.

Thanks.


===================


>From 1e5e695840fbb5b4a0583e20789fae76c6119d48 Mon Sep 17 00:00:00 2001
From: Wang Guoli <andy.wangguoli@huawei.com>
Date: Wed, 18 Dec 2013 10:14:54 +0800
Subject: [PATCH] jffs2: unlock f->sem on error in jffs2_new_inode()

If jffs2_new_inode() succeeds, it returns with f->sem held, and
the caller is responsible for releasing the lock. If it fails,
it still returns with the lock held, but the caller won't release
the lock, which will lead to deadlock.

Fix it by releasing the lock in jffs2_new_inode() on error.

Cc: <stable@vger.kernel.org> # 2.6.34+
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Wang Guoli <andy.wangguoli@huawei.com>
Signed-off-by: Wang Guoli <andy.wangguoli@huawei.com>
Signed-off-by: Wang Nan <wangnan0@huawei.com>

---
 fs/jffs2/fs.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index fe3c052..2f30fae 100644
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
