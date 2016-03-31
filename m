Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1alkcP-0006Y4-16
 for linux-mtd@lists.infradead.org; Thu, 31 Mar 2016 21:59:12 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-fsdevel@vger.kernel.org
Cc: linux-mtd@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, boris.brezillon@free-electrons.com,
 maxime.ripard@free-electrons.com, david@sigma-star.at, david@fromorbit.com,
 dedekind1@gmail.com, alex@nextthing.co, akpm@linux-foundation.org,
 sasha.levin@oracle.com, iamjoonsoo.kim@lge.com, rvaswani@codeaurora.org,
 tony.luck@intel.com, shailendra.capricorn@gmail.com,
 kirill.shutemov@linux.intel.com, hch@infradead.org, hughd@google.com,
 mgorman@techsingularity.net, vbabka@suse.cz,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 2/2] UBIFS: Implement ->migratepage()
Date: Thu, 31 Mar 2016 23:58:33 +0200
Message-Id: <1459461513-31765-3-git-send-email-richard@nod.at>
In-Reply-To: <1459461513-31765-1-git-send-email-richard@nod.at>
References: <1459461513-31765-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

During page migrations UBIFS might get confused
and the following assert triggers:
UBIFS assert failed in ubifs_set_page_dirty at 1451 (pid 436)

UBIFS is using PagePrivate() which can have different meanings across
filesystems. Therefore the generic page migration code cannot handle this
case correctly.
We have to implement our own migration function which basically does a
plain copy but also duplicates the page private flag.
UBIFS is not a block device filesystem and cannot use buffer_migrate_page().

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
[rw: Massaged changelog]
Signed-off-by: Richard Weinberger <richard@nod.at>

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/file.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 065c88f..5eea5f5 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -52,6 +52,7 @@
 #include "ubifs.h"
 #include <linux/mount.h>
 #include <linux/slab.h>
+#include <linux/migrate.h>
 
 static int read_block(struct inode *inode, void *addr, unsigned int block,
 		      struct ubifs_data_node *dn)
@@ -1452,6 +1453,24 @@ static int ubifs_set_page_dirty(struct page *page)
 	return ret;
 }
 
+static int ubifs_migrate_page(struct address_space *mapping,
+		struct page *newpage, struct page *page, enum migrate_mode mode)
+{
+	int rc;
+
+	rc = migrate_page_move_mapping(mapping, newpage, page, NULL, mode, 0);
+	if (rc != MIGRATEPAGE_SUCCESS)
+		return rc;
+
+	if (PagePrivate(page)) {
+		ClearPagePrivate(page);
+		SetPagePrivate(newpage);
+	}
+
+	migrate_page_copy(newpage, page);
+	return MIGRATEPAGE_SUCCESS;
+}
+
 static int ubifs_releasepage(struct page *page, gfp_t unused_gfp_flags)
 {
 	/*
@@ -1591,6 +1610,7 @@ const struct address_space_operations ubifs_file_address_operations = {
 	.write_end      = ubifs_write_end,
 	.invalidatepage = ubifs_invalidatepage,
 	.set_page_dirty = ubifs_set_page_dirty,
+	.migratepage	= ubifs_migrate_page,
 	.releasepage    = ubifs_releasepage,
 };
 
-- 
1.8.4.5
