Date: Mon, 14 Apr 2008 17:55:22 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: dwmw2@infradead.org, nickpiggin@yahoo.com.au
Subject: [PATCH] JFFS2 Fix of panics caused by wrong condition for hole frag
	creation in write_begin
Message-ID: <Pine.LNX.4.64.0804141747020.15842@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: joern@logfs.org, linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
	vailiy.leonenko@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,


JFFS2 in Linux 2.6.24 fails to kernel panic on random read/write/truncate operatons. We investigated the issue it is caused by
bug in conditions for hole fragment creation in write_begin function. Offset of starting offset which is used to identify should we create hole frag or not is calculated improperly.
As result hole frags are not created when they must be - it leads to internal memory corruptions and kernel panic. 

The following patch fixes the bug in JFFS2 write_begin hole frag conditions. 
Please include the patch. 

Signed-off-by: Alexey Korolev <akorolev@infradead.org>
Signed-off-by: Vasiliy Leonenko <vasiliy.leonenko@mail.ru>
=========================================
diff -aupNr a/fs/jffs2/file.c b/fs/jffs2/file.c
--- a/fs/jffs2/file.c	2008-02-11 08:51:11.000000000 +0300
+++ b/fs/jffs2/file.c	2008-04-11 13:54:08.000000000 +0400
@@ -129,13 +129,14 @@ static int jffs2_write_begin(struct file
 	struct inode *inode = mapping->host;
 	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
 	pgoff_t index = pos >> PAGE_CACHE_SHIFT;
-	uint32_t pageofs = pos & (PAGE_CACHE_SIZE - 1);
+	uint32_t pageofs;
 	int ret = 0;
 
 	pg = __grab_cache_page(mapping, index);
 	if (!pg)
 		return -ENOMEM;
 	*pagep = pg;
+	pageofs = pg->index << PAGE_CACHE_SHIFT;
 
 	D1(printk(KERN_DEBUG "jffs2_write_begin()\n"));
=========================================

Thanks,
Alexey
