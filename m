Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gBxUR-0005PE-VX
 for linux-mtd@lists.infradead.org; Mon, 15 Oct 2018 07:40:51 +0000
From: ZhuangShengen <zhuangshengen@huawei.com>
To: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <arnd@arndb.de>, <boris.brezillon@bootlin.com>, <viro@zeniv.linux.org.uk>,
 <houtao1@huawei.com>, <zhuangshengen@huawei.com>
Subject: [PATCH] jffs2: modify the mtime and ctime when truncate file
Date: Mon, 15 Oct 2018 15:42:01 +0800
Message-ID: <1539589321-103638-1-git-send-email-zhuangshengen@huawei.com>
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

The syscall truncate don't modify the mtime or ctime of the file.
The reason is that it only check the ATTR_MTIME or ATTR_CTIME flag
in function jffs2_do_setattr,and the syscall truncate has not set these
two flags in VFS layer.

Fix the problem by checking the ATTR_SIZE flag when modify the
mtime or ctime of the file in jffs2_do_setattr.

This fix solve the same problem with commit 3972f2603d85 ("btrfs:
update timestamps on truncate()")

Signed-off-by: ZhuangShengen <zhuangshengen@huawei.com>
---
 fs/jffs2/fs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index eab04ec..98261f6 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -113,8 +113,10 @@ int jffs2_do_setattr (struct inode *inode, struct iattr *iattr)
 
 	ri->isize = cpu_to_je32((ivalid & ATTR_SIZE)?iattr->ia_size:inode->i_size);
 	ri->atime = cpu_to_je32(I_SEC((ivalid & ATTR_ATIME)?iattr->ia_atime:inode->i_atime));
-	ri->mtime = cpu_to_je32(I_SEC((ivalid & ATTR_MTIME)?iattr->ia_mtime:inode->i_mtime));
-	ri->ctime = cpu_to_je32(I_SEC((ivalid & ATTR_CTIME)?iattr->ia_ctime:inode->i_ctime));
+	ri->mtime = cpu_to_je32(I_SEC((ivalid & (ATTR_SIZE | ATTR_MTIME)) ?
+		iattr->ia_mtime:inode->i_mtime));
+	ri->ctime = cpu_to_je32(I_SEC((ivalid & (ATTR_SIZE | ATTR_CTIME)) ?
+		iattr->ia_ctime:inode->i_ctime));
 
 	ri->offset = cpu_to_je32(0);
 	ri->csize = ri->dsize = cpu_to_je32(mdatalen);
-- 
2.7.4
