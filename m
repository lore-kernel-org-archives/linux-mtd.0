Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXYfE-0005Mv-9m
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2018 21:37:01 +0000
From: Richard Weinberger <richard@nod.at>
To: zhangjun <openzhangj@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kirill.shutemov@linux.intel.com, hch@lst.de,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2] ubifs: fix page_count in ->ubifs_migrate_page()
Date: Thu, 13 Dec 2018 22:36:47 +0100
Message-ID: <8239265.3QN2sXB6kY@blindfold>
In-Reply-To: <1544728817-2870-1-git-send-email-openzhangj@gmail.com>
References: <1544728817-2870-1-git-send-email-openzhangj@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Donnerstag, 13. Dezember 2018, 20:20:17 CET schrieb zhangjun:
> Because the PagePrivate() in UBIFS is different meanings,

...has different meanings...

I'll fix up that myself after applying your patch. No need to send a v3.

> alloc_cma() will fail when one dirty page cache located in
> the type of MIGRATE_CMA
> 
> If not adjust the 'extra_count' for dirty page,
> ubifs_migrate_page() -> migrate_page_move_mapping() will
> always return -EAGAIN for:
> 	expected_count += page_has_private(page)
> This causes the migration to fail until the page cache is cleaned
> 
> In general, PagePrivate() indicates that buff_head is already bound
> to this page, and at the same time page_count() will also increase.
> But UBIFS set private flag when the cache is dirty, and page_count()
> not increase.
> Therefore, the expected_count of UBIFS is different from the general
> case.
> 
> Signed-off-by: zhangjun <openzhangj@gmail.com>

Fixes: 4ac1c17b2044 ("UBIFS: Implement ->migratepage()")

> ---
>  fs/ubifs/file.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> index 1b78f2e..890dfce 100644
> --- a/fs/ubifs/file.c
> +++ b/fs/ubifs/file.c
> @@ -1480,8 +1480,17 @@ static int ubifs_migrate_page(struct address_space *mapping,
>  		struct page *newpage, struct page *page, enum migrate_mode mode)
>  {
>  	int rc;
> +	int extra_count = 0;
>  
> -	rc = migrate_page_move_mapping(mapping, newpage, page, NULL, mode, 0);
> +	/*
> +	 * UBIFS uses PG_private as marker and does not raise the page counter.
> +	 * migrate_page_move_mapping() expects a incremented counter if
> +	 * PG_private is set. Therefore pass -1 as extra_count for this case.
> +	 */
> +	if (page_has_private(page))
> +		extra_count = -1;
> +	rc = migrate_page_move_mapping(mapping, newpage, page,
> +			NULL, mode, extra_count);
>  	if (rc != MIGRATEPAGE_SUCCESS)
>  		return rc;
>  

Let's wait a few days to give Kirill a chance to review, then I'll apply the patch.

Thanks,
//richard 
