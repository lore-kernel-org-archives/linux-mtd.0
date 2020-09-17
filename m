Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2436DC433E2
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 09:37:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C20822076D
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 09:37:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UVK6HfQl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C20822076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=McDNXc4qc0yCsgCnPqKppmb3bozv0KnYm1SWqbCXN3s=; b=UVK6HfQlyvjewv0iYIFMrQty+
	8uRWxqkgMBHi9YJXmIfUDMsAr1ilHkNoNQP4CNFVP/9JbGjc+rEz8ZPvASWtdkxD9PCaz3C03Bq04
	sp+HIhOz1OnG1/Da3WW917XF7d7XpscLS28rZdhR0ArwwONHMAl4rOTeX2wIjg1D32SdyPhY1a2rp
	bEtDaSN0M+U6E9OC3vttHRJH24xx3AJYlU6TNSAQtSE3NF+O9hTq9VGAqnvW06iKU7Eh7u9TkPmZH
	HP18WlLeXS6WNAstFinL0Ck5kkBnL+k6DDj56oAPuF9Ggn5GbEOqc8y2Iq48y5v7dJ0P1FDrJviye
	MuWHT33zw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIqLc-0002mQ-3b; Thu, 17 Sep 2020 09:37:00 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIqLY-0002kc-Pz
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 09:36:58 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 87C08AC61;
 Thu, 17 Sep 2020 09:37:29 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 554E71E12E1; Thu, 17 Sep 2020 11:36:55 +0200 (CEST)
Date: Thu, 17 Sep 2020 11:36:55 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 07/12] bdi: remove BDI_CAP_CGROUP_WRITEBACK
Message-ID: <20200917093655.GG7347@quack2.suse.cz>
References: <20200910144833.742260-1-hch@lst.de>
 <20200910144833.742260-8-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910144833.742260-8-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_053657_117342_3F9189D5 
X-CRM114-Status: GOOD (  24.86  )
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
 linux-mtd@lists.infradead.org, Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org, linux-mm@kvack.org,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu 10-09-20 16:48:27, Christoph Hellwig wrote:
> Just checking SB_I_CGROUPWB for cgroup writeback support is enough.
> Either the file system allocates its own bdi (e.g. btrfs), in which case
> it is known to support cgroup writeback, or the bdi comes from the block
> layer, which always supports cgroup writeback.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Makes sense. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  block/blk-core.c            | 1 -
>  fs/btrfs/disk-io.c          | 1 -
>  include/linux/backing-dev.h | 8 +++-----
>  3 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/block/blk-core.c b/block/blk-core.c
> index 18c092f8d69175..d81ee511ec8b01 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -538,7 +538,6 @@ struct request_queue *blk_alloc_queue(int node_id)
>  	if (!q->stats)
>  		goto fail_stats;
>  
> -	q->backing_dev_info->capabilities = BDI_CAP_CGROUP_WRITEBACK;
>  	q->node = node_id;
>  
>  	atomic_set(&q->nr_active_requests_shared_sbitmap, 0);
> diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
> index 047934cea25efa..e24927bddd5829 100644
> --- a/fs/btrfs/disk-io.c
> +++ b/fs/btrfs/disk-io.c
> @@ -3091,7 +3091,6 @@ int __cold open_ctree(struct super_block *sb, struct btrfs_fs_devices *fs_device
>  		goto fail_sb_buffer;
>  	}
>  
> -	sb->s_bdi->capabilities |= BDI_CAP_CGROUP_WRITEBACK;
>  	sb->s_bdi->ra_pages *= btrfs_super_num_devices(disk_super);
>  	sb->s_bdi->ra_pages = max(sb->s_bdi->ra_pages, SZ_4M / PAGE_SIZE);
>  
> diff --git a/include/linux/backing-dev.h b/include/linux/backing-dev.h
> index 0b06b2d26c9aa3..52583b6f2ea05d 100644
> --- a/include/linux/backing-dev.h
> +++ b/include/linux/backing-dev.h
> @@ -123,7 +123,6 @@ int bdi_set_max_ratio(struct backing_dev_info *bdi, unsigned int max_ratio);
>   * BDI_CAP_NO_ACCT_WB:     Don't automatically account writeback pages
>   * BDI_CAP_STRICTLIMIT:    Keep number of dirty pages below bdi threshold.
>   *
> - * BDI_CAP_CGROUP_WRITEBACK: Supports cgroup-aware writeback.
>   * BDI_CAP_SYNCHRONOUS_IO: Device is so fast that asynchronous IO would be
>   *			   inefficient.
>   */
> @@ -233,9 +232,9 @@ int inode_congested(struct inode *inode, int cong_bits);
>   * inode_cgwb_enabled - test whether cgroup writeback is enabled on an inode
>   * @inode: inode of interest
>   *
> - * cgroup writeback requires support from both the bdi and filesystem.
> - * Also, both memcg and iocg have to be on the default hierarchy.  Test
> - * whether all conditions are met.
> + * Cgroup writeback requires support from the filesystem.  Also, both memcg and
> + * iocg have to be on the default hierarchy.  Test whether all conditions are
> + * met.
>   *
>   * Note that the test result may change dynamically on the same inode
>   * depending on how memcg and iocg are configured.
> @@ -247,7 +246,6 @@ static inline bool inode_cgwb_enabled(struct inode *inode)
>  	return cgroup_subsys_on_dfl(memory_cgrp_subsys) &&
>  		cgroup_subsys_on_dfl(io_cgrp_subsys) &&
>  		bdi_cap_account_dirty(bdi) &&
> -		(bdi->capabilities & BDI_CAP_CGROUP_WRITEBACK) &&
>  		(inode->i_sb->s_iflags & SB_I_CGROUPWB);
>  }
>  
> -- 
> 2.28.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
