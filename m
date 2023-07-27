Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40520C001E0
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 08:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o3tm1jXuaCLpDmwfZ1ieyJQ/+EwfhrZbntu4mG1AgTY=; b=Toplqh8Ya5ew2u
	k0JQAOM+n1IBNFPdmxFE9lvNY5qwoMdHmZCtFvdn7Ptrl3U3ue9WXBBpJ+8Ed9xiFmBWQbwmBN161
	ugg5ni0qIIUsMV9pl3iUVh2jS7FgLw5esk5oUXG7pV2CHEnrrzyphuHkihJW4cUmFE21lu+9CmenI
	2ELpM1vPYx7WrAc7Icvsn+s71gRk6NE3kV2ozOjF5PL/7QWDFs9Nur3mWAqgQ0Q9qpnqFBQtsI7Ou
	cYfbPCX/PyADqILWRSifAbenhTUv3Qhrhc/hswqlGBh7rbw0gCqCEle8ql9WNr7UlS5VfOz9whxIM
	hHR8IyVw8LeHGcz0pp7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOwNx-00CgoC-35;
	Thu, 27 Jul 2023 08:30:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOwNu-00CgnF-0b
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 08:30:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6549661D96;
	Thu, 27 Jul 2023 08:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06711C433C7;
	Thu, 27 Jul 2023 08:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690446606;
	bh=lgMwb11ItIJ27YCsuj2akQ0e0AMgpISaoiuOUrGiITY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Tr4M7HQ3pxhso0Q/eg4xKtwD0lUURtq4zUL2WnDxbX7YJArr/oNtVx0HKmYWbVJCj
	 uZ3CjjOq76HigUmfxsBIfU5BJp2UCC8gXysiCMyY4oUiNa0NyuYtXgOb+GgYI2e2UD
	 q/DMid3QMY2nJGias56vfjnyYrQ2kAGyvOg7az/lKKcQPYsllW1cAnQl1FfA/ktsaA
	 ypQoOxGNqaMUpP2GFbXa8+1QKt5gSsrAShH7O9rxadTFuFxweU5IvbZDayprJj2afQ
	 IGlbjA9TtQP0FcoHyTXu4yjcQ81VS0g2mOFp+HrXHsn6/kAwTiNlXyj4HVftm6tXbg
	 kxbv5Cd7EwHzQ==
Message-ID: <baaf7de4-9a0e-b953-2b6a-46e60c415614@kernel.org>
Date: Thu, 27 Jul 2023 17:30:01 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 28/49] dm zoned: dynamically allocate the dm-zoned-meta
 shrinker
Content-Language: en-US
To: Qi Zheng <zhengqi.arch@bytedance.com>, akpm@linux-foundation.org,
 david@fromorbit.com, tkhai@ya.ru, vbabka@suse.cz, roman.gushchin@linux.dev,
 djwong@kernel.org, brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-nfs@vger.kernel.org,
 linux-mtd@lists.infradead.org, rcu@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dm-devel@redhat.com, linux-raid@vger.kernel.org,
 linux-bcache@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 Muchun Song <songmuchun@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-29-zhengqi.arch@bytedance.com>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20230727080502.77895-29-zhengqi.arch@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_013010_315879_79C65FB7 
X-CRM114-Status: GOOD (  22.59  )
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

On 7/27/23 17:04, Qi Zheng wrote:
> In preparation for implementing lockless slab shrink, use new APIs to
> dynamically allocate the dm-zoned-meta shrinker, so that it can be freed
> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
> read-side critical section when releasing the struct dmz_metadata.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> ---
>  drivers/md/dm-zoned-metadata.c | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 9d3cca8e3dc9..0bcb26a43578 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -187,7 +187,7 @@ struct dmz_metadata {
>  	struct rb_root		mblk_rbtree;
>  	struct list_head	mblk_lru_list;
>  	struct list_head	mblk_dirty_list;
> -	struct shrinker		mblk_shrinker;
> +	struct shrinker		*mblk_shrinker;
>  
>  	/* Zone allocation management */
>  	struct mutex		map_lock;
> @@ -615,7 +615,7 @@ static unsigned long dmz_shrink_mblock_cache(struct dmz_metadata *zmd,
>  static unsigned long dmz_mblock_shrinker_count(struct shrinker *shrink,
>  					       struct shrink_control *sc)
>  {
> -	struct dmz_metadata *zmd = container_of(shrink, struct dmz_metadata, mblk_shrinker);
> +	struct dmz_metadata *zmd = shrink->private_data;
>  
>  	return atomic_read(&zmd->nr_mblks);
>  }
> @@ -626,7 +626,7 @@ static unsigned long dmz_mblock_shrinker_count(struct shrinker *shrink,
>  static unsigned long dmz_mblock_shrinker_scan(struct shrinker *shrink,
>  					      struct shrink_control *sc)
>  {
> -	struct dmz_metadata *zmd = container_of(shrink, struct dmz_metadata, mblk_shrinker);
> +	struct dmz_metadata *zmd = shrink->private_data;
>  	unsigned long count;
>  
>  	spin_lock(&zmd->mblk_lock);
> @@ -2936,19 +2936,23 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
>  	 */
>  	zmd->min_nr_mblks = 2 + zmd->nr_map_blocks + zmd->zone_nr_bitmap_blocks * 16;
>  	zmd->max_nr_mblks = zmd->min_nr_mblks + 512;
> -	zmd->mblk_shrinker.count_objects = dmz_mblock_shrinker_count;
> -	zmd->mblk_shrinker.scan_objects = dmz_mblock_shrinker_scan;
> -	zmd->mblk_shrinker.seeks = DEFAULT_SEEKS;
>  
>  	/* Metadata cache shrinker */
> -	ret = register_shrinker(&zmd->mblk_shrinker, "dm-zoned-meta:(%u:%u)",
> -				MAJOR(dev->bdev->bd_dev),
> -				MINOR(dev->bdev->bd_dev));
> -	if (ret) {
> -		dmz_zmd_err(zmd, "Register metadata cache shrinker failed");
> +	zmd->mblk_shrinker = shrinker_alloc(0,  "dm-zoned-meta:(%u:%u)",
> +					    MAJOR(dev->bdev->bd_dev),
> +					    MINOR(dev->bdev->bd_dev));
> +	if (!zmd->mblk_shrinker) {
> +		dmz_zmd_err(zmd, "Allocate metadata cache shrinker failed");

ret is not set here, so dmz_ctr_metadata() will return success. You need to add:
		ret = -ENOMEM;
or something.
>  		goto err;
>  	}
>  
> +	zmd->mblk_shrinker->count_objects = dmz_mblock_shrinker_count;
> +	zmd->mblk_shrinker->scan_objects = dmz_mblock_shrinker_scan;
> +	zmd->mblk_shrinker->seeks = DEFAULT_SEEKS;
> +	zmd->mblk_shrinker->private_data = zmd;
> +
> +	shrinker_register(zmd->mblk_shrinker);

I fail to see how this new shrinker API is better... Why isn't there a
shrinker_alloc_and_register() function ? That would avoid adding all this code
all over the place as the new API call would be very similar to the current
shrinker_register() call with static allocation.

> +
>  	dmz_zmd_info(zmd, "DM-Zoned metadata version %d", zmd->sb_version);
>  	for (i = 0; i < zmd->nr_devs; i++)
>  		dmz_print_dev(zmd, i);
> @@ -2995,7 +2999,7 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
>   */
>  void dmz_dtr_metadata(struct dmz_metadata *zmd)
>  {
> -	unregister_shrinker(&zmd->mblk_shrinker);
> +	shrinker_free(zmd->mblk_shrinker);
>  	dmz_cleanup_metadata(zmd);
>  	kfree(zmd);
>  }

-- 
Damien Le Moal
Western Digital Research


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
