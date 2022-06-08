Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F059CCA47B
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jun 2022 15:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nj5I9qbuCZLCyFd5Qe8DY58tdNvC/SJvp3d5sA9UPog=; b=mDku4i5J7Ihffg
	BThNEgzdF8kEt3eD2kLKsMaQAQfvuRTQRq8DA82uqQSx0/p/FB47xx8xWAK9efXNYkLdtNCE+WnQG
	X4EXChI5rt47zKRitwAnIXp2apzY9mdDvYCVyJOJCXGEhk5fWpJuTKHSWo+pLJppaa1RVLdq6OAi8
	RZ0I3WkryUqa9MHriHvgEMYWK4Na5v9VKgPZA+XnaRRkgG+GBZ60yUk88hGreMlZABHPYdGIDB0Z/
	/EWiVd4AlnfdTifvsoUZYf6+/8HIrBvggM5w6GSoExXiGTVz0cd9hBHE5Sh2iiwvBuc2MddHvxzVH
	gR55Sde33m9YN3HRZiCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxWQ-00E0vn-VQ; Wed, 08 Jun 2022 15:23:03 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxWN-00E0uU-5G
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2022 15:23:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CCEBAB82615;
	Wed,  8 Jun 2022 15:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D62AC34116;
	Wed,  8 Jun 2022 15:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654701776;
	bh=SgYW51aN3OeqjU6+EIk8CHclo6M6cc2uvUEPUetN9AY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p7z+0eY7ntbEVxA2gI3ZDLWM0mQwSUHKo0XnCgV0chmlHkz2P/vCANEjmqGsAdwGb
	 EoSpjHFAP8n9bDzPCEYaP1TdvsHfTZs7ZO2YCb1PhaDgWMEewk0XhfG2S7DJV8N6Zq
	 6BFFHYmv/C0EtAhNH8ykQ23VCX1LuObfUCtnf/2zRNky8BKsi3YeFoHUI0AgtoZtnU
	 /s5ocIdJDBgJaNkjIJoR2ZyE63FMuzKBldotmlU9Pd6NrsbPX3n/4O3QNinmpI+xhS
	 eF/3KfLyFpQXF2Gi5KoPPct1DqMaQ4m32g9c7heF/cNtqM6cQYwdFJN5c8DpxFzwH1
	 PF1h9+AG7Xw/A==
Date: Wed, 8 Jun 2022 08:22:56 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-aio@kvack.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
	ocfs2-devel@oss.oracle.com, linux-mtd@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 11/19] mm/migrate: Add filemap_migrate_folio()
Message-ID: <YqC+0J9/P1siKkBk@magnolia>
References: <20220608150249.3033815-1-willy@infradead.org>
 <20220608150249.3033815-12-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220608150249.3033815-12-willy@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_082259_555081_A3627F3F 
X-CRM114-Status: GOOD (  25.45  )
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

On Wed, Jun 08, 2022 at 04:02:41PM +0100, Matthew Wilcox (Oracle) wrote:
> There is nothing iomap-specific about iomap_migratepage(), and it fits
> a pattern used by several other filesystems, so move it to mm/migrate.c,
> convert it to be filemap_migrate_folio() and convert the iomap filesystems
> to use it.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

LGTM
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/gfs2/aops.c          |  2 +-
>  fs/iomap/buffered-io.c  | 25 -------------------------
>  fs/xfs/xfs_aops.c       |  2 +-
>  fs/zonefs/super.c       |  2 +-
>  include/linux/iomap.h   |  6 ------
>  include/linux/pagemap.h |  6 ++++++
>  mm/migrate.c            | 20 ++++++++++++++++++++
>  7 files changed, 29 insertions(+), 34 deletions(-)
> 
> diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
> index 106e90a36583..57ff883d432c 100644
> --- a/fs/gfs2/aops.c
> +++ b/fs/gfs2/aops.c
> @@ -774,7 +774,7 @@ static const struct address_space_operations gfs2_aops = {
>  	.invalidate_folio = iomap_invalidate_folio,
>  	.bmap = gfs2_bmap,
>  	.direct_IO = noop_direct_IO,
> -	.migratepage = iomap_migrate_page,
> +	.migrate_folio = filemap_migrate_folio,
>  	.is_partially_uptodate = iomap_is_partially_uptodate,
>  	.error_remove_page = generic_error_remove_page,
>  };
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 66278a14bfa7..5a91aa1db945 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -489,31 +489,6 @@ void iomap_invalidate_folio(struct folio *folio, size_t offset, size_t len)
>  }
>  EXPORT_SYMBOL_GPL(iomap_invalidate_folio);
>  
> -#ifdef CONFIG_MIGRATION
> -int
> -iomap_migrate_page(struct address_space *mapping, struct page *newpage,
> -		struct page *page, enum migrate_mode mode)
> -{
> -	struct folio *folio = page_folio(page);
> -	struct folio *newfolio = page_folio(newpage);
> -	int ret;
> -
> -	ret = folio_migrate_mapping(mapping, newfolio, folio, 0);
> -	if (ret != MIGRATEPAGE_SUCCESS)
> -		return ret;
> -
> -	if (folio_test_private(folio))
> -		folio_attach_private(newfolio, folio_detach_private(folio));
> -
> -	if (mode != MIGRATE_SYNC_NO_COPY)
> -		folio_migrate_copy(newfolio, folio);
> -	else
> -		folio_migrate_flags(newfolio, folio);
> -	return MIGRATEPAGE_SUCCESS;
> -}
> -EXPORT_SYMBOL_GPL(iomap_migrate_page);
> -#endif /* CONFIG_MIGRATION */
> -
>  static void
>  iomap_write_failed(struct inode *inode, loff_t pos, unsigned len)
>  {
> diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
> index 8ec38b25187b..5d1a995b15f8 100644
> --- a/fs/xfs/xfs_aops.c
> +++ b/fs/xfs/xfs_aops.c
> @@ -570,7 +570,7 @@ const struct address_space_operations xfs_address_space_operations = {
>  	.invalidate_folio	= iomap_invalidate_folio,
>  	.bmap			= xfs_vm_bmap,
>  	.direct_IO		= noop_direct_IO,
> -	.migratepage		= iomap_migrate_page,
> +	.migrate_folio		= filemap_migrate_folio,
>  	.is_partially_uptodate  = iomap_is_partially_uptodate,
>  	.error_remove_page	= generic_error_remove_page,
>  	.swap_activate		= xfs_iomap_swapfile_activate,
> diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
> index bcb21aea990a..d4c3f28f34ee 100644
> --- a/fs/zonefs/super.c
> +++ b/fs/zonefs/super.c
> @@ -237,7 +237,7 @@ static const struct address_space_operations zonefs_file_aops = {
>  	.dirty_folio		= filemap_dirty_folio,
>  	.release_folio		= iomap_release_folio,
>  	.invalidate_folio	= iomap_invalidate_folio,
> -	.migratepage		= iomap_migrate_page,
> +	.migrate_folio		= filemap_migrate_folio,
>  	.is_partially_uptodate	= iomap_is_partially_uptodate,
>  	.error_remove_page	= generic_error_remove_page,
>  	.direct_IO		= noop_direct_IO,
> diff --git a/include/linux/iomap.h b/include/linux/iomap.h
> index e552097c67e0..758a1125e72f 100644
> --- a/include/linux/iomap.h
> +++ b/include/linux/iomap.h
> @@ -231,12 +231,6 @@ void iomap_readahead(struct readahead_control *, const struct iomap_ops *ops);
>  bool iomap_is_partially_uptodate(struct folio *, size_t from, size_t count);
>  bool iomap_release_folio(struct folio *folio, gfp_t gfp_flags);
>  void iomap_invalidate_folio(struct folio *folio, size_t offset, size_t len);
> -#ifdef CONFIG_MIGRATION
> -int iomap_migrate_page(struct address_space *mapping, struct page *newpage,
> -		struct page *page, enum migrate_mode mode);
> -#else
> -#define iomap_migrate_page NULL
> -#endif
>  int iomap_file_unshare(struct inode *inode, loff_t pos, loff_t len,
>  		const struct iomap_ops *ops);
>  int iomap_zero_range(struct inode *inode, loff_t pos, loff_t len,
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index 1caccb9f99aa..2a67c0ad7348 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -1078,6 +1078,12 @@ static inline int __must_check write_one_page(struct page *page)
>  int __set_page_dirty_nobuffers(struct page *page);
>  bool noop_dirty_folio(struct address_space *mapping, struct folio *folio);
>  
> +#ifdef CONFIG_MIGRATION
> +int filemap_migrate_folio(struct address_space *mapping, struct folio *dst,
> +		struct folio *src, enum migrate_mode mode);
> +#else
> +#define filemap_migrate_folio NULL
> +#endif
>  void page_endio(struct page *page, bool is_write, int err);
>  
>  void folio_end_private_2(struct folio *folio);
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 785e32d0cf1b..4d8115ca93bb 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -784,6 +784,26 @@ int buffer_migrate_folio_norefs(struct address_space *mapping,
>  }
>  #endif
>  
> +int filemap_migrate_folio(struct address_space *mapping,
> +		struct folio *dst, struct folio *src, enum migrate_mode mode)
> +{
> +	int ret;
> +
> +	ret = folio_migrate_mapping(mapping, dst, src, 0);
> +	if (ret != MIGRATEPAGE_SUCCESS)
> +		return ret;
> +
> +	if (folio_get_private(src))
> +		folio_attach_private(dst, folio_detach_private(src));
> +
> +	if (mode != MIGRATE_SYNC_NO_COPY)
> +		folio_migrate_copy(dst, src);
> +	else
> +		folio_migrate_flags(dst, src);
> +	return MIGRATEPAGE_SUCCESS;
> +}
> +EXPORT_SYMBOL_GPL(filemap_migrate_folio);
> +
>  /*
>   * Writeback a folio to clean the dirty state
>   */
> -- 
> 2.35.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
