Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1agCL6-00043K-IR
 for linux-mtd@lists.infradead.org; Wed, 16 Mar 2016 14:22:21 +0000
Received: by mail-wm0-x231.google.com with SMTP id l68so74908558wml.1
 for <linux-mtd@lists.infradead.org>; Wed, 16 Mar 2016 07:22:00 -0700 (PDT)
Date: Wed, 16 Mar 2016 17:21:56 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Richard Weinberger <richard@nod.at>
Cc: Christoph Hellwig <hch@infradead.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 David Gstir <david@sigma-star.at>, Dave Chinner <david@fromorbit.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Alexander Kaplan <alex@nextthing.co>
Subject: Re: Page migration issue with UBIFS
Message-ID: <20160316142156.GA23595@node.shutemov.name>
References: <56E8192B.5030008@nod.at>
 <20160315151727.GA16462@node.shutemov.name>
 <56E82B18.9040807@nod.at> <20160315153744.GB28522@infradead.org>
 <56E8985A.1020509@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56E8985A.1020509@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 16, 2016 at 12:18:50AM +0100, Richard Weinberger wrote:
> Am 15.03.2016 um 16:37 schrieb Christoph Hellwig:
> > On Tue, Mar 15, 2016 at 04:32:40PM +0100, Richard Weinberger wrote:
> >>> Or if ->page_mkwrite() was called, why the page is not dirty?
> >>
> >> BTW: UBIFS does not implement ->migratepage(), could this be a problem?
> > 
> > This might be the reason.  I can't reall make sense of
> > buffer_migrate_page, but it seems to migrate buffer_head state to
> > the new page.
> > 
> > I'd love to know why CMA even tries to migrate pages that don't have a
> > ->migratepage method, this seems incredibly dangerous to me.
> 
> FYI, with a dummy ->migratepage() which returns only -EINVAL UBIFS does no
> longer explode upon page migration.
> Tomorrow I'll do more tests to make sure.

Could you check if something like this would fix the issue.
Completely untested.

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 065c88f8e4b8..9da34120dc5e 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -52,6 +52,7 @@
 #include "ubifs.h"
 #include <linux/mount.h>
 #include <linux/slab.h>
+#include <linux/migrate.h>
 
 static int read_block(struct inode *inode, void *addr, unsigned int block,
 		      struct ubifs_data_node *dn)
@@ -1452,6 +1453,20 @@ static int ubifs_set_page_dirty(struct page *page)
 	return ret;
 }
 
+static int ubifs_migrate_page(struct address_space *mapping,
+		struct page *newpage, struct page *page, enum migrate_mode mode)
+{
+	if (PagePrivate(page)) {
+		SetPagePrivate(newpage);
+		__set_page_dirty_nobuffers(newpage);
+	}
+
+	if (PageChecked(page))
+		SetPageChecked(newpage);
+
+	return migrate_page(mapping, newpage, page, mode);
+}
+
 static int ubifs_releasepage(struct page *page, gfp_t unused_gfp_flags)
 {
 	/*
@@ -1591,6 +1606,7 @@ const struct address_space_operations ubifs_file_address_operations = {
 	.write_end      = ubifs_write_end,
 	.invalidatepage = ubifs_invalidatepage,
 	.set_page_dirty = ubifs_set_page_dirty,
+	.migratepage	= ubifs_migrate_page,
 	.releasepage    = ubifs_releasepage,
 };
 
-- 
 Kirill A. Shutemov
