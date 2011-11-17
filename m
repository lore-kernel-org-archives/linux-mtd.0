Received: from www17.your-server.de ([213.133.104.17])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RRAxb-0003te-2o
 for linux-mtd@lists.infradead.org; Thu, 17 Nov 2011 23:01:36 +0000
Message-ID: <1321570852.1624.312.camel@localhost.localdomain>
Subject: [PATCH] UBIFS: Use kmemdup rather than duplicating its implementation
From: Thomas Meyer <thomas@m3y3r.de>
To: dedekind1@gmail.com, adrian.hunter@intel.com,
 linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Date: Fri, 18 Nov 2011 00:00:52 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The semantic patch that makes this change is available
in scripts/coccinelle/api/memdup.cocci.

Signed-off-by: Thomas Meyer <thomas@m3y3r.de>
---

diff -u -p a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
--- a/fs/ubifs/lpt.c 2011-11-07 19:38:24.223836156 +0100
+++ b/fs/ubifs/lpt.c 2011-11-08 10:35:23.637000062 +0100
@@ -1986,12 +1986,11 @@ again:
 
 				if (path[h].in_tree)
 					continue;
-				nnode = kmalloc(sz, GFP_NOFS);
+				nnode = kmemdup(&path[h].nnode, sz, GFP_NOFS);
 				if (!nnode) {
 					err = -ENOMEM;
 					goto out;
 				}
-				memcpy(nnode, &path[h].nnode, sz);
 				parent = nnode->parent;
 				parent->nbranch[nnode->iip].nnode = nnode;
 				path[h].ptr.nnode = nnode;
@@ -2004,12 +2003,11 @@ again:
 				const size_t sz = sizeof(struct ubifs_pnode);
 				struct ubifs_nnode *parent;
 
-				pnode = kmalloc(sz, GFP_NOFS);
+				pnode = kmemdup(&path[h].pnode, sz, GFP_NOFS);
 				if (!pnode) {
 					err = -ENOMEM;
 					goto out;
 				}
-				memcpy(pnode, &path[h].pnode, sz);
 				parent = pnode->parent;
 				parent->nbranch[pnode->iip].pnode = pnode;
 				path[h].ptr.pnode = pnode;
diff -u -p a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
--- a/fs/ubifs/tnc.c 2011-11-07 19:38:24.250503228 +0100
+++ b/fs/ubifs/tnc.c 2011-11-08 10:35:18.593599122 +0100
@@ -344,12 +344,11 @@ static int lnc_add(struct ubifs_info *c,
 		return err;
 	}
 
-	lnc_node = kmalloc(zbr->len, GFP_NOFS);
+	lnc_node = kmemdup(node, zbr->len, GFP_NOFS);
 	if (!lnc_node)
 		/* We don't have to have the cache, so no error */
 		return 0;
 
-	memcpy(lnc_node, node, zbr->len);
 	zbr->leaf = lnc_node;
 	return 0;
 }
diff -u -p a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
--- a/fs/ubifs/xattr.c 2011-11-07 19:38:24.257169996 +0100
+++ b/fs/ubifs/xattr.c 2011-11-08 10:35:21.073632366 +0100
@@ -138,12 +138,11 @@ static int create_xattr(struct ubifs_inf
 	ui = ubifs_inode(inode);
 	ui->xattr = 1;
 	ui->flags |= UBIFS_XATTR_FL;
-	ui->data = kmalloc(size, GFP_NOFS);
+	ui->data = kmemdup(value, size, GFP_NOFS);
 	if (!ui->data) {
 		err = -ENOMEM;
 		goto out_free;
 	}
-	memcpy(ui->data, value, size);
 	inode->i_size = ui->ui_size = size;
 	ui->data_len = size;
 
@@ -204,12 +203,11 @@ static int change_xattr(struct ubifs_inf
 		return err;
 
 	kfree(ui->data);
-	ui->data = kmalloc(size, GFP_NOFS);
+	ui->data = kmemdup(value, size, GFP_NOFS);
 	if (!ui->data) {
 		err = -ENOMEM;
 		goto out_free;
 	}
-	memcpy(ui->data, value, size);
 	inode->i_size = ui->ui_size = size;
 	ui->data_len = size;
 
