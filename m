Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYGiB-0005le-RU
 for linux-mtd@lists.infradead.org; Sat, 15 Dec 2018 20:39:01 +0000
Received: by mail-pf1-x441.google.com with SMTP id h3so4478089pfg.1
 for <linux-mtd@lists.infradead.org>; Sat, 15 Dec 2018 12:38:47 -0800 (PST)
Subject: Re: [PATCH] ubifs: Get/put page when changing PG_private
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 hsiangkao@mail.ru, kirill.shutemov@linux.intel.com, stable@vger.kernel.org
References: <20181215150130.19381-1-richard@nod.at>
From: zhangjun <openzhangj@gmail.com>
Message-ID: <9d539def-2042-9a2e-1251-c3f03d3d616c@gmail.com>
Date: Sun, 16 Dec 2018 04:38:42 +0800
MIME-Version: 1.0
In-Reply-To: <20181215150130.19381-1-richard@nod.at>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2018/12/15 下午11:01, Richard Weinberger wrote:
> The page migration code assumes that a page with PG_private
> set has its page count elevated by 1.
> UBIFS never did this and therefore the migration code was unable
> to migrate some pages owned by UBIFS.
> The lead to situations where the CMA memory allocator failed to
> allocate memory.
>
> Fix this by using get/put_page when changing PG_private.
>
> Cc: <stable@vger.kernel.org>
> Cc: zhangjun <openzhangj@gmail.com>
> Fixes: 4ac1c17b2044 ("UBIFS: Implement ->migratepage()")
> Reported-by: zhangjun <openzhangj@gmail.com>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
> zhangjun,
>
> Please give this patch a try!
>
> Thanks,
> //richard
> ---
>   fs/ubifs/file.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> index 1b78f2e09218..abe940d0767c 100644
> --- a/fs/ubifs/file.c
> +++ b/fs/ubifs/file.c
> @@ -582,6 +582,7 @@ static int ubifs_write_end(struct file *file, struct address_space *mapping,
>   	}
>   
>   	if (!PagePrivate(page)) {
> +		get_page(page);
>   		SetPagePrivate(page);
>   		atomic_long_inc(&c->dirty_pg_cnt);
>   		__set_page_dirty_nobuffers(page);
> @@ -959,6 +960,7 @@ static int do_writepage(struct page *page, int len)
>   	atomic_long_dec(&c->dirty_pg_cnt);
>   	ClearPagePrivate(page);
>   	ClearPageChecked(page);
> +	put_page(page);
>   
>   	kunmap(page);
>   	unlock_page(page);
> @@ -1318,6 +1320,7 @@ static void ubifs_invalidatepage(struct page *page, unsigned int offset,
>   	atomic_long_dec(&c->dirty_pg_cnt);
>   	ClearPagePrivate(page);
>   	ClearPageChecked(page);
> +	put_page(page);
>   }
>   
>   int ubifs_fsync(struct file *file, loff_t start, loff_t end, int datasync)
> @@ -1487,6 +1490,8 @@ static int ubifs_migrate_page(struct address_space *mapping,
>   
>   	if (PagePrivate(page)) {
>   		ClearPagePrivate(page);
> +		put_page(page);
> +		get_page(newpage);
>   		SetPagePrivate(newpage);
>   	}
>   
> @@ -1513,6 +1518,7 @@ static int ubifs_releasepage(struct page *page, gfp_t unused_gfp_flags)
>   	ubifs_assert(c, 0);
>   	ClearPagePrivate(page);
>   	ClearPageChecked(page);
> +	put_page(page);
>   	return 1;
>   }
>   
> @@ -1582,6 +1588,7 @@ static vm_fault_t ubifs_vm_page_mkwrite(struct vm_fault *vmf)
>   	else {
>   		if (!PageChecked(page))
>   			ubifs_convert_page_budget(c);
> +		get_page(page);
>   		SetPagePrivate(page);
>   		atomic_long_inc(&c->dirty_pg_cnt);
>   		__set_page_dirty_nobuffers(page);

Hello Richard

After adding your patch,my test did not go wrong.
I think it is ok now.

thanks
//zhangjun
