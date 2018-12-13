Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXZ1l-0004SE-GK
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2018 22:00:18 +0000
Received: by mail-pf1-x441.google.com with SMTP id b85so1763968pfc.3
 for <linux-mtd@lists.infradead.org>; Thu, 13 Dec 2018 14:00:06 -0800 (PST)
Date: Fri, 14 Dec 2018 01:00:00 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Richard Weinberger <richard@nod.at>
Cc: zhangjun <openzhangj@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kirill.shutemov@linux.intel.com, hch@lst.de, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2] ubifs: fix page_count in ->ubifs_migrate_page()
Message-ID: <20181213220000.7b56wysed67y5iv6@kshutemo-mobl1>
References: <1544728817-2870-1-git-send-email-openzhangj@gmail.com>
 <8239265.3QN2sXB6kY@blindfold>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8239265.3QN2sXB6kY@blindfold>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 13, 2018 at 10:36:47PM +0100, Richard Weinberger wrote:
> Am Donnerstag, 13. Dezember 2018, 20:20:17 CET schrieb zhangjun:
> > Because the PagePrivate() in UBIFS is different meanings,
> 
> ...has different meanings...
> 
> I'll fix up that myself after applying your patch. No need to send a v3.
> 
> > alloc_cma() will fail when one dirty page cache located in
> > the type of MIGRATE_CMA
> > 
> > If not adjust the 'extra_count' for dirty page,
> > ubifs_migrate_page() -> migrate_page_move_mapping() will
> > always return -EAGAIN for:
> > 	expected_count += page_has_private(page)
> > This causes the migration to fail until the page cache is cleaned
> > 
> > In general, PagePrivate() indicates that buff_head is already bound
> > to this page, and at the same time page_count() will also increase.
> > But UBIFS set private flag when the cache is dirty, and page_count()
> > not increase.
> > Therefore, the expected_count of UBIFS is different from the general
> > case.
> > 
> > Signed-off-by: zhangjun <openzhangj@gmail.com>
> 
> Fixes: 4ac1c17b2044 ("UBIFS: Implement ->migratepage()")
> 
> > ---
> >  fs/ubifs/file.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> > index 1b78f2e..890dfce 100644
> > --- a/fs/ubifs/file.c
> > +++ b/fs/ubifs/file.c
> > @@ -1480,8 +1480,17 @@ static int ubifs_migrate_page(struct address_space *mapping,
> >  		struct page *newpage, struct page *page, enum migrate_mode mode)
> >  {
> >  	int rc;
> > +	int extra_count = 0;
> >  
> > -	rc = migrate_page_move_mapping(mapping, newpage, page, NULL, mode, 0);
> > +	/*
> > +	 * UBIFS uses PG_private as marker and does not raise the page counter.
> > +	 * migrate_page_move_mapping() expects a incremented counter if
> > +	 * PG_private is set. Therefore pass -1 as extra_count for this case.
> > +	 */
> > +	if (page_has_private(page))
> > +		extra_count = -1;
> > +	rc = migrate_page_move_mapping(mapping, newpage, page,
> > +			NULL, mode, extra_count);
> >  	if (rc != MIGRATEPAGE_SUCCESS)
> >  		return rc;
> >  
> 
> Let's wait a few days to give Kirill a chance to review, then I'll apply the patch.

I don't remmeber much context now...

Could you remind me why ubifs doesn't take additional pin when sets
PG_private?

Migration is not the only place where the additional pin is implied.
See all users of page_has_private() helper. Notably reclaim path.

-- 
 Kirill A. Shutemov
