Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXMO9-0007yq-Ue
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2018 08:30:36 +0000
From: Richard Weinberger <richard@nod.at>
To: zhangjun <openzhangj@gmail.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Christoph Hellwig <hch@lst.de>, stable@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: Fwd: ubifs: fix page_count in ->ubifs_migrate_page()
Date: Thu, 13 Dec 2018 09:30:17 +0100
Message-ID: <3016163.RH3ZIBrMym@blindfold>
In-Reply-To: <257284e1-ae0c-1652-2edf-64cf8e35187c@gmail.com>
References: <1544624037-3436-1-git-send-email-openzhangj@gmail.com>
 <257284e1-ae0c-1652-2edf-64cf8e35187c@gmail.com>
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

Am Donnerstag, 13. Dezember 2018, 03:59:50 CET schrieb zhangjun:
> hello
>      I test several kernel version from your commit 
> 4ac1c17b2044a1b4b2fbed74451947e905fc2992,
> there is a bug when migrateing,the following fix i test ok and require 
> your confirmation.

Please keep the CC list intact and give us at least some time to review
your patch.
Also explain what kind of problem you're facing.
In other words, is this a theoretical fix or not?

Thanks,
//richard
 
> -------- Forwarded Message --------
> Subject: 	ubifs: fix page_count in ->ubifs_migrate_page()
> Date: 	Wed, 12 Dec 2018 09:13:57 -0500
> From: 	zhangjun <openzhangj@gmail.com>
> To: 	Richard Weinberger <richard@nod.at>, Artem Bityutskiy 
> <dedekind1@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>
> CC: 	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
> zhangjun <openzhangj@gmail.com>
> 
> 
> 
> Because the PagePrivate() in UBIFS is different meanings,
> alloc_cma() will fail when one dirty page cache located in
> the type of MIGRATE_CMA
> 
> If not adjust the 'extra_count' for dirty page,
> ubifs_migrate_page() -> migrate_page_move_mapping() will
> always return -EAGAIN for:
> expected_count += page_has_private(page)
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
> ---
> fs/ubifs/file.c | 9 ++++++++-
> 1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> index 1b78f2e..2136a5c 100644
> --- a/fs/ubifs/file.c
> +++ b/fs/ubifs/file.c
> @@ -1480,8 +1480,15 @@ static int ubifs_migrate_page(struct 
> address_space *mapping,
> struct page *newpage, struct page *page, enum migrate_mode mode)
> {
> int rc;
> + int extra_count;
> - rc = migrate_page_move_mapping(mapping, newpage, page, NULL, mode, 0);
> + /*
> + * UBIFS is using PagePrivate() which can have different meanings across
> + * filesystems. So here adjusting the 'extra_count' make it work.
> + */
> + extra_count = 0 - page_has_private(page);
> + rc = migrate_page_move_mapping(mapping, newpage,
> + page, NULL, mode, extra_count);
> if (rc != MIGRATEPAGE_SUCCESS)
> return rc;
> 
> 
