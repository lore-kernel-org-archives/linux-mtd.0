Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1AEC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  3 May 2022 22:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p4isq43oVQGNBisN3iOiXo1HNMICVnHmOLOWd8FC3UA=; b=J8bDpSUcnm+bG4
	E7A3GMcCqeQ/PnhuGHd3OlF5REOaCrLN3FZmbAmROPYUmgeDbD8RZYrR53wtK+wyHL36OR0+5IUEL
	l8pOmWLmqwanmUa/bffIFIJA4vXC3mPcqoWdRlAjCGPwoSaeo+2mpywLICrRis/FzqbvNx8crAYhR
	YfXDg6WvcW29OBO0r+736yt9sbWztl95vH/+rSAb7lzCXGBI2rhmpveXvrzb+WXRb0aSy5+l39tva
	SXA/JktwTWbnrr35pu5q9C7oYtw3gJgCp4Qp9wfn4zILszP52j1iOebbFgAL6F2D44V53Ou+ophtF
	V9miA7OKC8S/0OxDg43Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm0jJ-007vZG-Rc; Tue, 03 May 2022 22:10:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm0jG-007vYU-Dv
 for linux-mtd@lists.infradead.org; Tue, 03 May 2022 22:10:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651615845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LMmiWWb29UGba9md0hMHjtayU6y/sK+/Qq01tn2LWcA=;
 b=Fyba6hbAcITNlbvFW21TWkQy5LypDMZsOouPkaAot/RIMntavntiADL0YVpo5uBmQozy+p
 FQJEBaadOuGZkl9J9dffe0LhhcdEm2MdPshYyw9sRUpsMYOwzgqMLG9ObCP5g2fNW/dhaB
 z+BxJnehIRt6kRqawtzis5H+hHJq8pc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-AECAh_psNGOOcwEJNuHR_A-1; Tue, 03 May 2022 18:08:06 -0400
X-MC-Unique: AECAh_psNGOOcwEJNuHR_A-1
Received: by mail-wm1-f71.google.com with SMTP id
 r186-20020a1c44c3000000b00393f52ed5ceso1984990wma.7
 for <linux-mtd@lists.infradead.org>; Tue, 03 May 2022 15:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LMmiWWb29UGba9md0hMHjtayU6y/sK+/Qq01tn2LWcA=;
 b=z4B+lRdPJBLCfvE21VbxI9WgvhB+wQCrQd2aoQDM3vS7ymAxAFBOkay0Qu1vdhY+13
 qf5iiYaSxOGmfIO0eCAAIaToKLqW+NRvx+I4E3035BEh/wtZLYHOCHNG7Rnl75qwz1F9
 r/Vwd6ukXhy9IMNHeEKSvbhDHycL4xx/nX/LKtJn5ZLqtbw/ur1S9cA8uP4dKb1g5mBI
 nqWzCImch7DNT1JLJPJ1RYqY+uwPu96SL3bTWzxJSBta0ChjRiTp4Jojuho9aZzuqoI3
 XbYM6HwMNOaqsubefio6AncGYBYZKQ7RttmLGMoAvVBcA+QQY909sz7QaTQlYheM0JI/
 2Yqw==
X-Gm-Message-State: AOAM531a1t8CPKnDNM18kiUuy3/dgG7VjAfB5Sbt2zudZl8RzTrZgrd2
 qhcHvXVgEdtWLJDljz8Uye1NPK2NuiXKIWeopeUaCspoI1P1jldPeaH8frRVvYHDRp4O60jwxT8
 jDRZFjBXknn31xcbOy/Ao09eHRwC0KBadGf9Ec1h6bA==
X-Received: by 2002:a05:6000:1848:b0:20c:713b:8e1e with SMTP id
 c8-20020a056000184800b0020c713b8e1emr5560728wri.640.1651615679260; 
 Tue, 03 May 2022 15:07:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJza/1YW4p03hLZOOEyMY2mHvXsflrL3zsJyZE7a1xvQQLAfbBGJrDpMJ+TYh2LW8q5iyzNOzDqoxAwKJZzNi54=
X-Received: by 2002:a05:6000:1848:b0:20c:713b:8e1e with SMTP id
 c8-20020a056000184800b0020c713b8e1emr5560709wri.640.1651615678936; Tue, 03
 May 2022 15:07:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220502054159.3471078-1-willy@infradead.org>
 <20220502054159.3471078-4-willy@infradead.org>
In-Reply-To: <20220502054159.3471078-4-willy@infradead.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 4 May 2022 00:07:47 +0200
Message-ID: <CAHc6FU6CTQ5mNNJs5+16mbnmyKoQq5-TAPm8xdzwGA4q218Riw@mail.gmail.com>
Subject: Re: [Cluster-devel] [PATCH 3/3] fs: Change the type of filler_t
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 cluster-devel <cluster-devel@redhat.com>, 
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 linux-mtd@lists.infradead.org
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=agruenba@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_151046_655193_F7AC1128 
X-CRM114-Status: GOOD (  37.98  )
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

On Mon, May 2, 2022 at 7:58 AM Matthew Wilcox (Oracle)
<willy@infradead.org> wrote:
> By making filler_t the same as read_folio, we can use the same function
> for both in gfs2.  We can push the use of folios down one more level
> in jffs2 and nfs.  We also increase type safety for future users of the
> various read_cache_page() family of functions by forcing the parameter
> to be a pointer to struct file (or NULL).
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  fs/gfs2/aops.c          | 29 +++++++++++------------------
>  fs/jffs2/file.c         |  9 ++++-----
>  fs/jffs2/gc.c           |  2 +-
>  fs/jffs2/os-linux.h     |  2 +-
>  fs/nfs/symlink.c        | 14 +++++++-------
>  include/linux/pagemap.h |  6 +++---
>  mm/filemap.c            | 40 ++++++++++++++++++++--------------------
>  7 files changed, 47 insertions(+), 55 deletions(-)
>
> diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
> index 340bf5d0e835..1016631bcbdc 100644
> --- a/fs/gfs2/aops.c
> +++ b/fs/gfs2/aops.c
> @@ -464,21 +464,24 @@ static int stuffed_readpage(struct gfs2_inode *ip, struct page *page)
>         return 0;
>  }
>
> -
> -static int __gfs2_readpage(void *file, struct page *page)
> +/**
> + * gfs2_read_folio - read a folio from a file
> + * @file: The file to read
> + * @folio: The folio in the file
> + */
> +static int gfs2_read_folio(struct file *file, struct folio *folio)
>  {
> -       struct folio *folio = page_folio(page);
> -       struct inode *inode = page->mapping->host;
> +       struct inode *inode = folio->mapping->host;
>         struct gfs2_inode *ip = GFS2_I(inode);
>         struct gfs2_sbd *sdp = GFS2_SB(inode);
>         int error;
>
>         if (!gfs2_is_jdata(ip) ||
> -           (i_blocksize(inode) == PAGE_SIZE && !page_has_buffers(page))) {
> +           (i_blocksize(inode) == PAGE_SIZE && !folio_buffers(folio))) {
>                 error = iomap_read_folio(folio, &gfs2_iomap_ops);
>         } else if (gfs2_is_stuffed(ip)) {
> -               error = stuffed_readpage(ip, page);
> -               unlock_page(page);
> +               error = stuffed_readpage(ip, &folio->page);
> +               folio_unlock(folio);
>         } else {
>                 error = mpage_read_folio(folio, gfs2_block_map);
>         }
> @@ -489,16 +492,6 @@ static int __gfs2_readpage(void *file, struct page *page)
>         return error;
>  }
>
> -/**
> - * gfs2_read_folio - read a folio from a file
> - * @file: The file to read
> - * @folio: The folio in the file
> - */
> -static int gfs2_read_folio(struct file *file, struct folio *folio)
> -{
> -       return __gfs2_readpage(file, &folio->page);
> -}
> -
>  /**
>   * gfs2_internal_read - read an internal file
>   * @ip: The gfs2 inode
> @@ -523,7 +516,7 @@ int gfs2_internal_read(struct gfs2_inode *ip, char *buf, loff_t *pos,
>                 amt = size - copied;
>                 if (offset + size > PAGE_SIZE)
>                         amt = PAGE_SIZE - offset;
> -               page = read_cache_page(mapping, index, __gfs2_readpage, NULL);
> +               page = read_cache_page(mapping, index, gfs2_read_folio, NULL);
>                 if (IS_ERR(page))
>                         return PTR_ERR(page);
>                 p = kmap_atomic(page);

Nice. For the gfs2 part:

Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>

Thanks,
Andreas

> diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
> index 492fb2da0403..ba86acbe12d3 100644
> --- a/fs/jffs2/file.c
> +++ b/fs/jffs2/file.c
> @@ -110,21 +110,20 @@ static int jffs2_do_readpage_nolock (struct inode *inode, struct page *pg)
>         return ret;
>  }
>
> -int jffs2_do_readpage_unlock(void *data, struct page *pg)
> +int __jffs2_read_folio(struct file *file, struct folio *folio)
>  {
> -       int ret = jffs2_do_readpage_nolock(pg->mapping->host, pg);
> -       unlock_page(pg);
> +       int ret = jffs2_do_readpage_nolock(folio->mapping->host, &folio->page);
> +       folio_unlock(folio);
>         return ret;
>  }
>
> -
>  static int jffs2_read_folio(struct file *file, struct folio *folio)
>  {
>         struct jffs2_inode_info *f = JFFS2_INODE_INFO(folio->mapping->host);
>         int ret;
>
>         mutex_lock(&f->sem);
> -       ret = jffs2_do_readpage_unlock(file, &folio->page);
> +       ret = __jffs2_read_folio(file, folio);
>         mutex_unlock(&f->sem);
>         return ret;
>  }
> diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
> index a53bac7569b6..5c6602f3c189 100644
> --- a/fs/jffs2/gc.c
> +++ b/fs/jffs2/gc.c
> @@ -1327,7 +1327,7 @@ static int jffs2_garbage_collect_dnode(struct jffs2_sb_info *c, struct jffs2_era
>          * trying to write out, read_cache_page() will not deadlock. */
>         mutex_unlock(&f->sem);
>         page = read_cache_page(inode->i_mapping, start >> PAGE_SHIFT,
> -                              jffs2_do_readpage_unlock, NULL);
> +                              __jffs2_read_folio, NULL);
>         if (IS_ERR(page)) {
>                 pr_warn("read_cache_page() returned error: %ld\n",
>                         PTR_ERR(page));
> diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
> index 173eccac691d..921d782583d6 100644
> --- a/fs/jffs2/os-linux.h
> +++ b/fs/jffs2/os-linux.h
> @@ -155,7 +155,7 @@ extern const struct file_operations jffs2_file_operations;
>  extern const struct inode_operations jffs2_file_inode_operations;
>  extern const struct address_space_operations jffs2_file_address_operations;
>  int jffs2_fsync(struct file *, loff_t, loff_t, int);
> -int jffs2_do_readpage_unlock(void *data, struct page *pg);
> +int __jffs2_read_folio(struct file *file, struct folio *folio);
>
>  /* ioctl.c */
>  long jffs2_ioctl(struct file *, unsigned int, unsigned long);
> diff --git a/fs/nfs/symlink.c b/fs/nfs/symlink.c
> index 8b53538bcc75..0e27a2e4e68b 100644
> --- a/fs/nfs/symlink.c
> +++ b/fs/nfs/symlink.c
> @@ -26,21 +26,21 @@
>   * and straight-forward than readdir caching.
>   */
>
> -static int nfs_symlink_filler(void *data, struct page *page)
> +static int nfs_symlink_filler(struct file *file, struct folio *folio)
>  {
> -       struct inode *inode = page->mapping->host;
> +       struct inode *inode = folio->mapping->host;
>         int error;
>
> -       error = NFS_PROTO(inode)->readlink(inode, page, 0, PAGE_SIZE);
> +       error = NFS_PROTO(inode)->readlink(inode, &folio->page, 0, PAGE_SIZE);
>         if (error < 0)
>                 goto error;
> -       SetPageUptodate(page);
> -       unlock_page(page);
> +       folio_mark_uptodate(folio);
> +       folio_unlock(folio);
>         return 0;
>
>  error:
> -       SetPageError(page);
> -       unlock_page(page);
> +       folio_set_error(folio);
> +       folio_unlock(folio);
>         return -EIO;
>  }
>
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index b70192f56454..831b28dab01a 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -492,7 +492,7 @@ static inline gfp_t readahead_gfp_mask(struct address_space *x)
>         return mapping_gfp_mask(x) | __GFP_NORETRY | __GFP_NOWARN;
>  }
>
> -typedef int filler_t(void *, struct page *);
> +typedef int filler_t(struct file *, struct folio *);
>
>  pgoff_t page_cache_next_miss(struct address_space *mapping,
>                              pgoff_t index, unsigned long max_scan);
> @@ -747,9 +747,9 @@ static inline struct page *grab_cache_page(struct address_space *mapping,
>  }
>
>  struct folio *read_cache_folio(struct address_space *, pgoff_t index,
> -               filler_t *filler, void *data);
> +               filler_t *filler, struct file *file);
>  struct page *read_cache_page(struct address_space *, pgoff_t index,
> -               filler_t *filler, void *data);
> +               filler_t *filler, struct file *file);
>  extern struct page * read_cache_page_gfp(struct address_space *mapping,
>                                 pgoff_t index, gfp_t gfp_mask);
>
> diff --git a/mm/filemap.c b/mm/filemap.c
> index 079f8cca7959..81a0ed08a82c 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -3483,7 +3483,7 @@ EXPORT_SYMBOL(generic_file_mmap);
>  EXPORT_SYMBOL(generic_file_readonly_mmap);
>
>  static struct folio *do_read_cache_folio(struct address_space *mapping,
> -               pgoff_t index, filler_t filler, void *data, gfp_t gfp)
> +               pgoff_t index, filler_t filler, struct file *file, gfp_t gfp)
>  {
>         struct folio *folio;
>         int err;
> @@ -3504,9 +3504,9 @@ static struct folio *do_read_cache_folio(struct address_space *mapping,
>
>  filler:
>                 if (filler)
> -                       err = filler(data, &folio->page);
> +                       err = filler(file, folio);
>                 else
> -                       err = mapping->a_ops->read_folio(data, folio);
> +                       err = mapping->a_ops->read_folio(file, folio);
>
>                 if (err < 0) {
>                         folio_put(folio);
> @@ -3557,44 +3557,44 @@ static struct folio *do_read_cache_folio(struct address_space *mapping,
>  }
>
>  /**
> - * read_cache_folio - read into page cache, fill it if needed
> - * @mapping:   the page's address_space
> - * @index:     the page index
> - * @filler:    function to perform the read
> - * @data:      first arg to filler(data, page) function, often left as NULL
> - *
> - * Read into the page cache. If a page already exists, and PageUptodate() is
> - * not set, try to fill the page and wait for it to become unlocked.
> + * read_cache_folio - Read into page cache, fill it if needed.
> + * @mapping: The address_space to read from.
> + * @index: The index to read.
> + * @filler: Function to perform the read, or NULL to use aops->read_folio().
> + * @file: Passed to filler function, may be NULL if not required.
>   *
> - * If the page does not get brought uptodate, return -EIO.
> + * Read one page into the page cache.  If it succeeds, the folio returned
> + * will contain @index, but it may not be the first page of the folio.
>   *
> - * The function expects mapping->invalidate_lock to be already held.
> + * If the filler function returns an error, it will be returned to the
> + * caller.
>   *
> - * Return: up to date page on success, ERR_PTR() on failure.
> + * Context: May sleep.  Expects mapping->invalidate_lock to be held.
> + * Return: An uptodate folio on success, ERR_PTR() on failure.
>   */
>  struct folio *read_cache_folio(struct address_space *mapping, pgoff_t index,
> -               filler_t filler, void *data)
> +               filler_t filler, struct file *file)
>  {
> -       return do_read_cache_folio(mapping, index, filler, data,
> +       return do_read_cache_folio(mapping, index, filler, file,
>                         mapping_gfp_mask(mapping));
>  }
>  EXPORT_SYMBOL(read_cache_folio);
>
>  static struct page *do_read_cache_page(struct address_space *mapping,
> -               pgoff_t index, filler_t *filler, void *data, gfp_t gfp)
> +               pgoff_t index, filler_t *filler, struct file *file, gfp_t gfp)
>  {
>         struct folio *folio;
>
> -       folio = do_read_cache_folio(mapping, index, filler, data, gfp);
> +       folio = do_read_cache_folio(mapping, index, filler, file, gfp);
>         if (IS_ERR(folio))
>                 return &folio->page;
>         return folio_file_page(folio, index);
>  }
>
>  struct page *read_cache_page(struct address_space *mapping,
> -                               pgoff_t index, filler_t *filler, void *data)
> +                       pgoff_t index, filler_t *filler, struct file *file)
>  {
> -       return do_read_cache_page(mapping, index, filler, data,
> +       return do_read_cache_page(mapping, index, filler, file,
>                         mapping_gfp_mask(mapping));
>  }
>  EXPORT_SYMBOL(read_cache_page);
> --
> 2.34.1
>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
