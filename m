Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6279C43334
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jun 2022 19:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/8Q3wsJQDZzYHZh/qXs4C1q24hAMYQQ76EwQ3O6TuZc=; b=L/sDGjLLj+N+Ll
	86wjF6oRu6KYsCVihdUz9OadE9hXNt7igFvZCqLJ8Bv3LRgFibWbf9KhFazVAwbN9i6Ef9q6J9+hb
	8kOpY59CMK2KSZ1iV6gvlwN9ZsXl7dAkfG45L6RsdX3ZKR3iYJKNuywZbW11IYyLAqc6nRW/Wvxs9
	OPWbGlGEtUbkj6gdBXm4pddrEVlX6IMY4UinISFhjPhW0FK/LdDODtnyxkntAWpFBbpHflSBeFFsM
	4IADr+Hby9zgzhIFQe9qN/3PPD4qKXjKyTGBmlT7bAXNn/jFWUU/FpGDwAabxFaQSg9Ns7LIHEQSA
	MZkuAKrBDzd20Ozc7rLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyeUF-008wdE-ER; Tue, 07 Jun 2022 19:03:31 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyeUB-008wY0-Es
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2022 19:03:28 +0000
Received: by mail-wr1-x42d.google.com with SMTP id u3so25423369wrg.3
        for <linux-mtd@lists.infradead.org>; Tue, 07 Jun 2022 12:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YvJr1HjhCxOrlCoCkGFSV+IIsFWm48YyeI3AKcRnUIQ=;
        b=Hms/G7n+Cgo9Oo8KkEEkY+zOKSfNSr0x2sJyW+zhwaVgQz3O94b2GcLqEXQ5rpNStl
         0HKAm9+ZoLlNQPtIgr4cociDPkwCkncIQHflys8+rX7ekkN9msPRJi3y7Z32ZVcY4EiS
         7BqJ/vQjOoHIBqnzmxcFtWqT7QYEfBo1Q/O2ARB7Zezb9YKydEPEtT4frki2lnbWxGbh
         +l4HGgVODycuk5l12Ov27ifMex6LzR4b2/m50DSQAyRbCNVvVRI16BLqIO5hxeYWqMZf
         1B5FmkDuafNHVx7eJh5UtqIQKDfI2oiQry9cQbb6BsPHPbHKrMcf9dIskCLmEL3K7DH1
         6oNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YvJr1HjhCxOrlCoCkGFSV+IIsFWm48YyeI3AKcRnUIQ=;
        b=yhPvwQ+2QzXJCUNGuchEz1jSIkvjmyVpye7LnjegSHni/3uyps9NWkg5VDJ+Grc3jH
         X+srHlhKKn/5ewfbqar5RHq8ymK52ZII74uUQcuxSb1YergAAoIhqg/SDhlMjMRCO+ed
         nR3rZjgxwQmT/KvKkAZK/3CnCszSYY985u0UwVyxDwJwD2f8/8HztkT5in7sj0398WW6
         TVeBY4yh0MdKhuUcFhgNwtS0dax6kMbMU9mb/D9UF1gEMnx6VgRkHcKTLxoN+rKR0poL
         hVE2UbiwPaw0ex8Ncm6m+WG+sKSvENroWSCklo4Bc7cAni2Zbqq0vcx07PWHYcQ4aoQQ
         tm7w==
X-Gm-Message-State: AOAM532jdEnEws9dQxHhG75bRQ5wSN7sH2KPhfXxmxVvCP6oOvA8iUKR
	DPAQGA1/qIWInxfbx8GQcivPq+F3ffTXC0hH5Qg=
X-Google-Smtp-Source: ABdhPJzCEhxBgnE2TvKp0j//I+yGIGt10PvMUBcSniQ/uliTPAhBtZXCX4ft7FKRwzuXla8IHTC/85U5DKgXrpVCjbg=
X-Received: by 2002:a5d:62c7:0:b0:216:fa41:2f81 with SMTP id
 o7-20020a5d62c7000000b00216fa412f81mr17337284wrv.249.1654628595478; Tue, 07
 Jun 2022 12:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220606204050.2625949-1-willy@infradead.org> <20220606204050.2625949-8-willy@infradead.org>
In-Reply-To: <20220606204050.2625949-8-willy@infradead.org>
From: Anna Schumaker <schumaker.anna@gmail.com>
Date: Tue, 7 Jun 2022 15:02:59 -0400
Message-ID: <CAFX2Jf=ugChaWF0Je=ew_-shhdSJYXy5dkjqsoL=9B37QWv3bA@mail.gmail.com>
Subject: Re: [PATCH 07/20] nfs: Convert to migrate_folio
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org, 
	linux-aio@kvack.org, linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com, 
	linux-mm@kvack.org, linux-xfs <linux-xfs@vger.kernel.org>, 
	Linux NFS Mailing List <linux-nfs@vger.kernel.org>, linux-ntfs-dev@lists.sourceforge.net, 
	ocfs2-devel@oss.oracle.com, linux-mtd@lists.infradead.org, 
	virtualization@lists.linux-foundation.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_120327_534124_8D257477 
X-CRM114-Status: GOOD (  23.63  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jun 6, 2022 at 7:37 PM Matthew Wilcox (Oracle)
<willy@infradead.org> wrote:
>
> Use a folio throughout this function.  migrate_page() will be converted
> later.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Looks fairly straightforward.

Acked-by: Anna Schumaker <Anna.Schumaker@Netapp.com>

> ---
>  fs/nfs/file.c     |  4 +---
>  fs/nfs/internal.h |  6 ++++--
>  fs/nfs/write.c    | 16 ++++++++--------
>  3 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/fs/nfs/file.c b/fs/nfs/file.c
> index 2d72b1b7ed74..549baed76351 100644
> --- a/fs/nfs/file.c
> +++ b/fs/nfs/file.c
> @@ -533,9 +533,7 @@ const struct address_space_operations nfs_file_aops = {
>         .write_end = nfs_write_end,
>         .invalidate_folio = nfs_invalidate_folio,
>         .release_folio = nfs_release_folio,
> -#ifdef CONFIG_MIGRATION
> -       .migratepage = nfs_migrate_page,
> -#endif
> +       .migrate_folio = nfs_migrate_folio,
>         .launder_folio = nfs_launder_folio,
>         .is_dirty_writeback = nfs_check_dirty_writeback,
>         .error_remove_page = generic_error_remove_page,
> diff --git a/fs/nfs/internal.h b/fs/nfs/internal.h
> index 8f8cd6e2d4db..437ebe544aaf 100644
> --- a/fs/nfs/internal.h
> +++ b/fs/nfs/internal.h
> @@ -578,8 +578,10 @@ void nfs_clear_pnfs_ds_commit_verifiers(struct pnfs_ds_commit_info *cinfo)
>  #endif
>
>  #ifdef CONFIG_MIGRATION
> -extern int nfs_migrate_page(struct address_space *,
> -               struct page *, struct page *, enum migrate_mode);
> +int nfs_migrate_folio(struct address_space *, struct folio *dst,
> +               struct folio *src, enum migrate_mode);
> +#else
> +#define nfs_migrate_folio NULL
>  #endif
>
>  static inline int
> diff --git a/fs/nfs/write.c b/fs/nfs/write.c
> index 1c706465d090..649b9e633459 100644
> --- a/fs/nfs/write.c
> +++ b/fs/nfs/write.c
> @@ -2119,27 +2119,27 @@ int nfs_wb_page(struct inode *inode, struct page *page)
>  }
>
>  #ifdef CONFIG_MIGRATION
> -int nfs_migrate_page(struct address_space *mapping, struct page *newpage,
> -               struct page *page, enum migrate_mode mode)
> +int nfs_migrate_folio(struct address_space *mapping, struct folio *dst,
> +               struct folio *src, enum migrate_mode mode)
>  {
>         /*
> -        * If PagePrivate is set, then the page is currently associated with
> +        * If the private flag is set, the folio is currently associated with
>          * an in-progress read or write request. Don't try to migrate it.
>          *
>          * FIXME: we could do this in principle, but we'll need a way to ensure
>          *        that we can safely release the inode reference while holding
> -        *        the page lock.
> +        *        the folio lock.
>          */
> -       if (PagePrivate(page))
> +       if (folio_test_private(src))
>                 return -EBUSY;
>
> -       if (PageFsCache(page)) {
> +       if (folio_test_fscache(src)) {
>                 if (mode == MIGRATE_ASYNC)
>                         return -EBUSY;
> -               wait_on_page_fscache(page);
> +               folio_wait_fscache(src);
>         }
>
> -       return migrate_page(mapping, newpage, page, mode);
> +       return migrate_page(mapping, &dst->page, &src->page, mode);
>  }
>  #endif
>
> --
> 2.35.1
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
