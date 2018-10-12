Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAqTs-0004wU-MV
 for linux-mtd@lists.infradead.org; Fri, 12 Oct 2018 05:59:26 +0000
From: Hou Tao <houtao1@huawei.com>
To: <gregkh@linuxfoundation.org>, <stable@vger.kernel.org>
CC: <linux-mtd@lists.infradead.org>, <agruenba@redhat.com>,
 <dwmw2@infradead.org>, <houtao1@huawei.com>
Subject: [RESEND][PATCH 4.4-stable] jffs2: return -ERANGE when xattr buffer is
 too small
Date: Fri, 12 Oct 2018 14:01:26 +0800
Message-ID: <20181012060126.33739-1-houtao1@huawei.com>
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

When a file have multiple xattrs and the passed buffer is
smaller than the required size, jffs2_listxattr() should
return -ERANGE instead of continue, else Oops may occur
due to memory corruption.

Also remove the unnecessary check ("rc < 0"), because
xhandle->list(...) will not return an error number.

Spotted by generic/377 in xfstests-dev.

NB: The problem had been fixed by commit 764a5c6b1fa4 ("xattr
handlers: Simplify list operation") in v4.5-rc1, but the
modification in that commit may be too much because it modifies
all file-systems which implement xattr, so I create a single
patch for jffs2 to fix the problem.

Signed-off-by: Hou Tao <houtao1@huawei.com>
---
 fs/jffs2/xattr.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
index 4c2c03663533..8e1427762eeb 100644
--- a/fs/jffs2/xattr.c
+++ b/fs/jffs2/xattr.c
@@ -1004,12 +1004,14 @@ ssize_t jffs2_listxattr(struct dentry *dentry, char *buffer, size_t size)
 			rc = xhandle->list(xhandle, dentry, buffer + len,
 					   size - len, xd->xname,
 					   xd->name_len);
+			if (rc > size - len) {
+				rc = -ERANGE;
+				goto out;
+			}
 		} else {
 			rc = xhandle->list(xhandle, dentry, NULL, 0,
 					   xd->xname, xd->name_len);
 		}
-		if (rc < 0)
-			goto out;
 		len += rc;
 	}
 	rc = len;
-- 
2.16.2.dirty
