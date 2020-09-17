Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A3EC433E2
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 09:28:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9589F206E6
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 09:28:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g5yrRYrw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9589F206E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R0qtlso2ssum7Wev7qSLNGlqXgOchyhY6cj1pM8V92Y=; b=g5yrRYrwMKyvKMuahizzcoNu+
	EidhV+zT1Z0lvckkB6tNZ76S1jLwbgwp19kUO77ydjEl1U18qegn/QtNZLCGc80FDoyc0A0wxZm+y
	HvctZc05YiIXP6yNfndCtlDd/Gv296JbyQQuMk15J7SEFy5C1RVR/Dkwa4QURGvbwT11cQHMy4hfA
	pI55Rmq9Dju+DId9wxPGrTSdRdGbPPqpDva7s8lnM8doPxOQdEO51HHmdyBUZ7Xn7uQb5hzd4JLBe
	+cqnxIWx97O+nqBcqZP2+cV0+7U/lSaaIYOZ99oBh1heZmZ2iVc53tI4H+3XPiZs6vwMZ05iMWX2J
	V7kbIlgUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIqCg-00013Z-D3; Thu, 17 Sep 2020 09:27:46 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIqCd-00012m-MQ
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 09:27:44 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5C817AFEC;
 Thu, 17 Sep 2020 09:28:16 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 50F3D1E12E1; Thu, 17 Sep 2020 11:27:42 +0200 (CEST)
Date: Thu, 17 Sep 2020 11:27:42 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 11/12] bdi: invert BDI_CAP_NO_ACCT_WB
Message-ID: <20200917092742.GD7347@quack2.suse.cz>
References: <20200910144833.742260-1-hch@lst.de>
 <20200910144833.742260-12-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910144833.742260-12-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_052744_061674_55BB4DA9 
X-CRM114-Status: GOOD (  23.66  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, Song Liu <song@kernel.org>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org, drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu 10-09-20 16:48:31, Christoph Hellwig wrote:
> Replace BDI_CAP_NO_ACCT_WB with a positive BDI_CAP_WRITEBACK_ACCT to
> make the checks more obvious.  Also remove the pointless
> bdi_cap_account_writeback wrapper that just obsfucates the check.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

The patch looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/fuse/inode.c             |  3 ++-
>  include/linux/backing-dev.h | 13 +++----------
>  mm/backing-dev.c            |  1 +
>  mm/page-writeback.c         |  4 ++--
>  4 files changed, 8 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
> index 17b00670fb539e..581329203d6860 100644
> --- a/fs/fuse/inode.c
> +++ b/fs/fuse/inode.c
> @@ -1050,7 +1050,8 @@ static int fuse_bdi_init(struct fuse_conn *fc, struct super_block *sb)
>  		return err;
>  
>  	/* fuse does it's own writeback accounting */
> -	sb->s_bdi->capabilities = BDI_CAP_NO_ACCT_WB | BDI_CAP_STRICTLIMIT;
> +	sb->s_bdi->capabilities &= ~BDI_CAP_WRITEBACK_ACCT;
> +	sb->s_bdi->capabilities |= BDI_CAP_STRICTLIMIT;
>  
>  	/*
>  	 * For a single fuse filesystem use max 1% of dirty +
> diff --git a/include/linux/backing-dev.h b/include/linux/backing-dev.h
> index 5da4ea3dd0cc5c..b217344a2c63be 100644
> --- a/include/linux/backing-dev.h
> +++ b/include/linux/backing-dev.h
> @@ -120,17 +120,17 @@ int bdi_set_max_ratio(struct backing_dev_info *bdi, unsigned int max_ratio);
>   *
>   * BDI_CAP_NO_ACCT_DIRTY:  Dirty pages shouldn't contribute to accounting
>   * BDI_CAP_NO_WRITEBACK:   Don't write pages back
> - * BDI_CAP_NO_ACCT_WB:     Don't automatically account writeback pages
> + * BDI_CAP_WRITEBACK_ACCT: Automatically account writeback pages
>   * BDI_CAP_STRICTLIMIT:    Keep number of dirty pages below bdi threshold.
>   */
>  #define BDI_CAP_NO_ACCT_DIRTY	0x00000001
>  #define BDI_CAP_NO_WRITEBACK	0x00000002
> -#define BDI_CAP_NO_ACCT_WB	0x00000004
> +#define BDI_CAP_WRITEBACK_ACCT	0x00000004
>  #define BDI_CAP_STRICTLIMIT	0x00000010
>  #define BDI_CAP_CGROUP_WRITEBACK 0x00000020
>  
>  #define BDI_CAP_NO_ACCT_AND_WRITEBACK \
> -	(BDI_CAP_NO_WRITEBACK | BDI_CAP_NO_ACCT_DIRTY | BDI_CAP_NO_ACCT_WB)
> +	(BDI_CAP_NO_WRITEBACK | BDI_CAP_NO_ACCT_DIRTY)
>  
>  extern struct backing_dev_info noop_backing_dev_info;
>  
> @@ -179,13 +179,6 @@ static inline bool bdi_cap_account_dirty(struct backing_dev_info *bdi)
>  	return !(bdi->capabilities & BDI_CAP_NO_ACCT_DIRTY);
>  }
>  
> -static inline bool bdi_cap_account_writeback(struct backing_dev_info *bdi)
> -{
> -	/* Paranoia: BDI_CAP_NO_WRITEBACK implies BDI_CAP_NO_ACCT_WB */
> -	return !(bdi->capabilities & (BDI_CAP_NO_ACCT_WB |
> -				      BDI_CAP_NO_WRITEBACK));
> -}
> -
>  static inline bool mapping_cap_writeback_dirty(struct address_space *mapping)
>  {
>  	return bdi_cap_writeback_dirty(inode_to_bdi(mapping->host));
> diff --git a/mm/backing-dev.c b/mm/backing-dev.c
> index f9a2842bd81c3d..ab0415dde5c66c 100644
> --- a/mm/backing-dev.c
> +++ b/mm/backing-dev.c
> @@ -744,6 +744,7 @@ struct backing_dev_info *bdi_alloc(int node_id)
>  		kfree(bdi);
>  		return NULL;
>  	}
> +	bdi->capabilities = BDI_CAP_WRITEBACK_ACCT;
>  	bdi->ra_pages = VM_READAHEAD_PAGES;
>  	bdi->io_pages = VM_READAHEAD_PAGES;
>  	return bdi;
> diff --git a/mm/page-writeback.c b/mm/page-writeback.c
> index e9c36521461aaa..0139f9622a92da 100644
> --- a/mm/page-writeback.c
> +++ b/mm/page-writeback.c
> @@ -2738,7 +2738,7 @@ int test_clear_page_writeback(struct page *page)
>  		if (ret) {
>  			__xa_clear_mark(&mapping->i_pages, page_index(page),
>  						PAGECACHE_TAG_WRITEBACK);
> -			if (bdi_cap_account_writeback(bdi)) {
> +			if (bdi->capabilities & BDI_CAP_WRITEBACK_ACCT) {
>  				struct bdi_writeback *wb = inode_to_wb(inode);
>  
>  				dec_wb_stat(wb, WB_WRITEBACK);
> @@ -2791,7 +2791,7 @@ int __test_set_page_writeback(struct page *page, bool keep_write)
>  						   PAGECACHE_TAG_WRITEBACK);
>  
>  			xas_set_mark(&xas, PAGECACHE_TAG_WRITEBACK);
> -			if (bdi_cap_account_writeback(bdi))
> +			if (bdi->capabilities & BDI_CAP_WRITEBACK_ACCT)
>  				inc_wb_stat(inode_to_wb(inode), WB_WRITEBACK);
>  
>  			/*
> -- 
> 2.28.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
