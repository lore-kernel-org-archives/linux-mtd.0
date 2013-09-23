Received: from szxga02-in.huawei.com ([119.145.14.65])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VO1tj-00080X-QX
 for linux-mtd@lists.infradead.org; Mon, 23 Sep 2013 08:53:41 +0000
Message-ID: <5240014E.1080804@huawei.com>
Date: Mon, 23 Sep 2013 16:52:30 +0800
From: Li Zefan <lizefan@huawei.com>
MIME-Version: 1.0
To: David Woodhouse <David.Woodhouse@intel.com>
Subject: [PATCH] jffs2: fix unbalanced locking
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In the failure path in jffs2_do_crccheck_inode() the lock isn't released
before returning.

This probably won't cause real bug, because the structure that contains
the lock is freed in this case.

Signed-off-by: Li Zefan <lizefan@huawei.com>
---
 fs/jffs2/readinode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index ae81b01..55cf63d 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -1425,7 +1425,8 @@ int jffs2_do_crccheck_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *i
 		jffs2_do_clear_inode(c, f);
 	}
 	jffs2_xattr_do_crccheck_inode(c, ic);
-	kfree (f);
+	mutex_unlock(&f->sem);
+	kfree(f);
 	return ret;
 }
 
-- 
1.8.0.2
