Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1agUgx-0008Tc-Jq
 for linux-mtd@lists.infradead.org; Thu, 17 Mar 2016 09:58:09 +0000
Subject: Re: [PATCH] UBIFS: Implement ->migratepage()
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
References: <56E9C658.1020903@nod.at>
 <1458168919-11597-1-git-send-email-richard@nod.at>
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, boris.brezillon@free-electrons.com,
 maxime.ripard@free-electrons.com, david@sigma-star.at, david@fromorbit.com,
 dedekind1@gmail.com, alex@nextthing.co, akpm@linux-foundation.org,
 sasha.levin@oracle.com, iamjoonsoo.kim@lge.com, rvaswani@codeaurora.org,
 tony.luck@intel.com, shailendra.capricorn@gmail.com,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Hugh Dickins <hughd@google.com>, Mel Gorman <mgorman@techsingularity.net>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <56EA7F95.4090703@suse.cz>
Date: Thu, 17 Mar 2016 10:57:41 +0100
MIME-Version: 1.0
In-Reply-To: <1458168919-11597-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+CC Hugh, Mel

On 03/16/2016 11:55 PM, Richard Weinberger wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>
> When using CMA during page migrations UBIFS might get confused

It shouldn't be CMA specific, the same code runs from compaction, 
autonuma balancing...

> and the following assert triggers:
> UBIFS assert failed in ubifs_set_page_dirty at 1451 (pid 436)
>
> UBIFS is using PagePrivate() which can have different meanings across
> filesystems. Therefore the generic page migration code cannot handle this
> case correctly.
> We have to implement our own migration function which basically does a
> plain copy but also duplicates the page private flag.

Lack of PagePrivate() migration is surely a bug, but at a glance of how 
UBIFS uses the flag, it's more about accounting, it shouldn't prevent a 
page from being marked PageDirty()?
I suspect your initial bug (which is IIUC the fact that there's a dirty 
pte, but PageDirty(page) is false) comes from the generic 
fallback_migrate_page() which does:

         if (PageDirty(page)) {
                 /* Only writeback pages in full synchronous migration */
                 if (mode != MIGRATE_SYNC)
                         return -EBUSY;
                 return writeout(mapping, page);
         }

And writeout() seems to Clear PageDirty() through 
clear_page_dirty_for_io() but I'm not so sure about the pte (or pte's in 
all rmaps). But this comment in the latter function:

                  * Yes, Virginia, this is indeed insane.

scared me enough to not investigate further. Hopefully the people I CC'd 
understand more about page migration than me. I'm just an user :)

In any case, this patch would solve both lack of PageDirty() transfer, 
and avoid the path leading from fallback_migrate_page() to writeout(). 
But I'm not confident enough here to ack it.

> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> [rw: Massaged changelog]
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>   fs/ubifs/file.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>
> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> index 0edc128..48b2944 100644
> --- a/fs/ubifs/file.c
> +++ b/fs/ubifs/file.c
> @@ -52,6 +52,7 @@
>   #include "ubifs.h"
>   #include <linux/mount.h>
>   #include <linux/slab.h>
> +#include <linux/migrate.h>
>
>   static int read_block(struct inode *inode, void *addr, unsigned int block,
>   		      struct ubifs_data_node *dn)
> @@ -1452,6 +1453,24 @@ static int ubifs_set_page_dirty(struct page *page)
>   	return ret;
>   }
>
> +static int ubifs_migrate_page(struct address_space *mapping,
> +		struct page *newpage, struct page *page, enum migrate_mode mode)
> +{
> +	int rc;
> +
> +	rc = migrate_page_move_mapping(mapping, newpage, page, NULL, mode, 0);
> +	if (rc != MIGRATEPAGE_SUCCESS)
> +		return rc;
> +
> +	if (PagePrivate(page)) {
> +		ClearPagePrivate(page);
> +		SetPagePrivate(newpage);
> +	}
> +
> +	migrate_page_copy(newpage, page);
> +	return MIGRATEPAGE_SUCCESS;
> +}
> +
>   static int ubifs_releasepage(struct page *page, gfp_t unused_gfp_flags)
>   {
>   	/*
> @@ -1591,6 +1610,7 @@ const struct address_space_operations ubifs_file_address_operations = {
>   	.write_end      = ubifs_write_end,
>   	.invalidatepage = ubifs_invalidatepage,
>   	.set_page_dirty = ubifs_set_page_dirty,
> +	.migratepage	= ubifs_migrate_page,
>   	.releasepage    = ubifs_releasepage,
>   };
>
>
