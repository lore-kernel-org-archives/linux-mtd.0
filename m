Received: from mail-pd0-f202.google.com ([209.85.192.202])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W9KTI-0004H7-DD
 for linux-mtd@lists.infradead.org; Fri, 31 Jan 2014 20:13:52 +0000
Received: by mail-pd0-f202.google.com with SMTP id v10so678786pde.3
 for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2014 12:13:28 -0800 (PST)
Subject: [patch 1/1] jffs2: unlock f->sem on error in jffs2_new_inode()
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Fri, 31 Jan 2014 12:13:24 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset=ASCII
Content-Transfer-Encoding: 8bit
Message-Id: <20140131201325.1023231C19E@corp2gmr1-1.hot.corp.google.com>
Cc: wangnan0@huawei.com, artem.bityutskiy@linux.intel.com,
 stable@vger.kernel.org, linux-mtd@lists.infradead.org,
 andy.wangguoli@huawei.com, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Wang Guoli <andy.wangguoli@huawei.com>
Subject: jffs2: unlock f->sem on error in jffs2_new_inode()

If jffs2_new_inode() succeeds, it returns with f->sem held, and the caller
is responsible for releasing the lock.  If it fails, it still returns with
the lock held, but the caller won't release the lock, which will lead to
deadlock.

Fix it by releasing the lock in jffs2_new_inode() on error.

Signed-off-by: Wang Guoli <andy.wangguoli@huawei.com>
Signed-off-by: Wang Nan <wangnan0@huawei.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Wang Guoli <andy.wangguoli@huawei.com>
Cc: <stable@vger.kernel.org> # 2.6.34+
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 fs/jffs2/fs.c |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff -puN fs/jffs2/fs.c~jffs2-unlock-f-sem-on-error-in-jffs2_new_inode fs/jffs2/fs.c
--- a/fs/jffs2/fs.c~jffs2-unlock-f-sem-on-error-in-jffs2_new_inode
+++ a/fs/jffs2/fs.c
@@ -457,12 +457,14 @@ struct inode *jffs2_new_inode (struct in
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
@@ -479,6 +481,7 @@ struct inode *jffs2_new_inode (struct in
 	inode->i_size = 0;
 
 	if (insert_inode_locked(inode) < 0) {
+		mutex_unlock(&f->sem);
 		make_bad_inode(inode);
 		iput(inode);
 		return ERR_PTR(-EINVAL);
_
