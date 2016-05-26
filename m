Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b5wIC-0000IQ-IE
 for linux-mtd@lists.infradead.org; Thu, 26 May 2016 14:29:45 +0000
Received: by mail-wm0-x244.google.com with SMTP id q62so5985501wmg.3
 for <linux-mtd@lists.infradead.org>; Thu, 26 May 2016 07:29:24 -0700 (PDT)
Sender: Salah TRIKI <salah.triki@gmail.com>
From: Salah Triki <salah.triki@acm.org>
To: richard@nod.at,
	dedekind1@gmail.com,
	adrian.hunter@intel.com
Cc: Salah Triki <salah.triki@acm.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH V2] fs: ubifs: Replace kmem_cache_alloc/memset with
 kmem_cache_zalloc
Date: Thu, 26 May 2016 15:28:57 +0100
Message-Id: <1464272937-6629-1-git-send-email-salah.triki@acm.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Code is more readable when using kmem_cache_zalloc instead of kmem_cache_alloc/memset.

Signed-off-by: Salah Triki <salah.triki@acm.org>
---
 fs/ubifs/super.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 7034995..f509200 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -262,12 +262,10 @@ static struct inode *ubifs_alloc_inode(struct super_block *sb)
 {
 	struct ubifs_inode *ui;
 
-	ui = kmem_cache_alloc(ubifs_inode_slab, GFP_NOFS);
+	ui = kmem_cache_zalloc(ubifs_inode_slab, GFP_NOFS);
 	if (!ui)
 		return NULL;
 
-	memset((void *)ui + sizeof(struct inode), 0,
-	       sizeof(struct ubifs_inode) - sizeof(struct inode));
 	mutex_init(&ui->ui_mutex);
 	spin_lock_init(&ui->ui_lock);
 	return &ui->vfs_inode;
-- 
1.9.1
