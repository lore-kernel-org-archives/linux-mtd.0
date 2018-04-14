Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f7Rbq-000107-1i
 for linux-mtd@lists.infradead.org; Sat, 14 Apr 2018 20:17:19 +0000
Received: by mail-pl0-x242.google.com with SMTP id bj1-v6so7878578plb.8
 for <linux-mtd@lists.infradead.org>; Sat, 14 Apr 2018 13:17:07 -0700 (PDT)
Date: Sun, 15 Apr 2018 01:48:59 +0530
From: Souptick Joarder <jrdr.linux@gmail.com>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH] fs: ubifs: Adding new return type vm_fault_t
Message-ID: <20180414201859.GA20327@jordon-HP-15-Notebook-PC>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use new return type vm_fault_t for page_mkwrite handler.

Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
Reviewed-by: Matthew Wilcox <mawilcox@microsoft.com>
---
 fs/ubifs/file.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index cf348ba..094ac73 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1513,7 +1513,7 @@ static int ubifs_releasepage(struct page *page, gfp_t unused_gfp_flags)
  * mmap()d file has taken write protection fault and is being made writable.
  * UBIFS must ensure page is budgeted for.
  */
-static int ubifs_vm_page_mkwrite(struct vm_fault *vmf)
+static vm_fault_t ubifs_vm_page_mkwrite(struct vm_fault *vmf)
 {
 	struct page *page = vmf->page;
 	struct inode *inode = file_inode(vmf->vma->vm_file);
@@ -1567,8 +1567,7 @@ static int ubifs_vm_page_mkwrite(struct vm_fault *vmf)
 	if (unlikely(page->mapping != inode->i_mapping ||
 		     page_offset(page) > i_size_read(inode))) {
 		/* Page got truncated out from underneath us */
-		err = -EINVAL;
-		goto out_unlock;
+		goto sigbus;
 	}
 
 	if (PagePrivate(page))
@@ -1597,12 +1596,10 @@ static int ubifs_vm_page_mkwrite(struct vm_fault *vmf)
 	wait_for_stable_page(page);
 	return VM_FAULT_LOCKED;
 
-out_unlock:
+sigbus:
 	unlock_page(page);
 	ubifs_release_budget(c, &req);
-	if (err)
-		err = VM_FAULT_SIGBUS;
-	return err;
+	return VM_FAULT_SIGBUS;
 }
 
 static const struct vm_operations_struct ubifs_file_vm_ops = {
-- 
1.9.1
