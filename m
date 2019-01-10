Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghQvq-0007ld-1G
 for linux-mtd@lists.infradead.org; Thu, 10 Jan 2019 03:22:59 +0000
From: Hou Tao <houtao1@huawei.com>
To: <linux-mtd@lists.infradead.org>
CC: <richard.weinberger@gmail.com>, <boris.brezillon@bootlin.com>,
 <dwmw2@infradead.org>
Subject: [PATCH] jffs2: compare xattr name length first during xattr
 de-duplication
Date: Thu, 10 Jan 2019 11:26:20 +0800
Message-ID: <20190110032620.14366-1-houtao1@huawei.com>
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

So unnecessary strcmp can be voided.

Signed-off-by: Hou Tao <houtao1@huawei.com>
---
 fs/jffs2/xattr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
index da3e18503c65..52aa73afbe10 100644
--- a/fs/jffs2/xattr.c
+++ b/fs/jffs2/xattr.c
@@ -668,6 +668,7 @@ static int check_xattr_ref_inode(struct jffs2_sb_info *c, struct jffs2_inode_cac
 					goto out;
 			}
 			if (ref->xd->xprefix == cmp->xd->xprefix
+			    && ref->xd->name_len == cmp->xd->name_len
 			    && !strcmp(ref->xd->xname, cmp->xd->xname)) {
 				if (ref->xseqno > cmp->xseqno) {
 					*pcmp = cmp->next;
-- 
2.16.2.dirty
