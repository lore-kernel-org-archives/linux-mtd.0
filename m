Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D3FC0015E
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 06:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QmfpF3mRsvyqB/m4nsQtgI7iG2t+g0BmD9c0EXzgH6I=; b=WFnOrtdcI0Bf45
	9Ne/wvWwcVKB65SQXTxygbFHR4A5f2jFLGf+3LIePY8aiZIvLX0RX2S2f1sIKCpRJNbd109vFv8rW
	2xy3VBDvcd4nt6MQIW9PjEkDZKcvRH4sttIGoLTWqNxOE3QCi4YLxRDArsalYMdaAx171ogLqDrYx
	agAmDJP2N4fPdNTtfwK0eMMAToHpIyfj5ET4HPot75YgIfU90fcfX7nMWHPsPPBwUTRSjFXsGljaF
	Ce6GUOvgTv2ONfVolX47b1C13HqYFvtLmpY8CBEc5shVUAG8fAZp9PFA2SAwiIEkDBw4knrWS3OwF
	UAvjL9eLNzn+AokWt9zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOYKs-009J1Z-1P;
	Wed, 26 Jul 2023 06:49:26 +0000
Received: from out-18.mta0.migadu.com ([2001:41d0:1004:224b::12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOYKo-009IzY-0S
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 06:49:24 +0000
Message-ID: <e7204276-9de5-17eb-90ae-e51657d73ef4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1690354158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=07kRInGgcVMiksfMsun8p4HGvWms170mUSINrsZDIPU=;
	b=SItOX2s1O2xRbklfqsU1E20kPvGPKi6lNjfeuPsz787gwDukUtasKQC+RRJ78xAQZyjij6
	0JlhE8ny7YCW/WIa1zfjcf/R7sJjT11NiI0YLFw4BmC6xi+4P258FcCDYig5b0NazpkEtw
	pJl7w1nj4tDpMcmLDY8eVxmHbXISOTw=
Date: Wed, 26 Jul 2023 14:49:05 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2 11/47] gfs2: dynamically allocate the gfs2-qd shrinker
To: Qi Zheng <zhengqi.arch@bytedance.com>
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
 akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru, vbabka@suse.cz,
 roman.gushchin@linux.dev, djwong@kernel.org, brauner@kernel.org,
 paulmck@kernel.org, tytso@mit.edu, steven.price@arm.com, cel@kernel.org,
 senozhatsky@chromium.org, yujie.liu@intel.com, gregkh@linuxfoundation.org
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-12-zhengqi.arch@bytedance.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-12-zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_234922_927907_0EF4555B 
X-CRM114-Status: GOOD (  15.90  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 2023/7/24 17:43, Qi Zheng wrote:
> Use new APIs to dynamically allocate the gfs2-qd shrinker.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>   fs/gfs2/main.c  |  6 +++---
>   fs/gfs2/quota.c | 26 ++++++++++++++++++++------
>   fs/gfs2/quota.h |  3 ++-
>   3 files changed, 25 insertions(+), 10 deletions(-)
>
> diff --git a/fs/gfs2/main.c b/fs/gfs2/main.c
> index afcb32854f14..e47b1cc79f59 100644
> --- a/fs/gfs2/main.c
> +++ b/fs/gfs2/main.c
> @@ -147,7 +147,7 @@ static int __init init_gfs2_fs(void)
>   	if (!gfs2_trans_cachep)
>   		goto fail_cachep8;
>   
> -	error = register_shrinker(&gfs2_qd_shrinker, "gfs2-qd");
> +	error = gfs2_qd_shrinker_init();
>   	if (error)
>   		goto fail_shrinker;
>   
> @@ -196,7 +196,7 @@ static int __init init_gfs2_fs(void)
>   fail_wq2:
>   	destroy_workqueue(gfs_recovery_wq);
>   fail_wq1:
> -	unregister_shrinker(&gfs2_qd_shrinker);
> +	gfs2_qd_shrinker_exit();
>   fail_shrinker:
>   	kmem_cache_destroy(gfs2_trans_cachep);
>   fail_cachep8:
> @@ -229,7 +229,7 @@ static int __init init_gfs2_fs(void)
>   
>   static void __exit exit_gfs2_fs(void)
>   {
> -	unregister_shrinker(&gfs2_qd_shrinker);
> +	gfs2_qd_shrinker_exit();
>   	gfs2_glock_exit();
>   	gfs2_unregister_debugfs();
>   	unregister_filesystem(&gfs2_fs_type);
> diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
> index 704192b73605..bc9883cea847 100644
> --- a/fs/gfs2/quota.c
> +++ b/fs/gfs2/quota.c
> @@ -186,13 +186,27 @@ static unsigned long gfs2_qd_shrink_count(struct shrinker *shrink,
>   	return vfs_pressure_ratio(list_lru_shrink_count(&gfs2_qd_lru, sc));
>   }
>   
> -struct shrinker gfs2_qd_shrinker = {
> -	.count_objects = gfs2_qd_shrink_count,
> -	.scan_objects = gfs2_qd_shrink_scan,
> -	.seeks = DEFAULT_SEEKS,
> -	.flags = SHRINKER_NUMA_AWARE,
> -};
> +static struct shrinker *gfs2_qd_shrinker;
> +
> +int gfs2_qd_shrinker_init(void)

It's better to declare this as __init.

> +{
> +	gfs2_qd_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE, "gfs2-qd");
> +	if (!gfs2_qd_shrinker)
> +		return -ENOMEM;
> +
> +	gfs2_qd_shrinker->count_objects = gfs2_qd_shrink_count;
> +	gfs2_qd_shrinker->scan_objects = gfs2_qd_shrink_scan;
> +	gfs2_qd_shrinker->seeks = DEFAULT_SEEKS;
> +
> +	shrinker_register(gfs2_qd_shrinker);
>   
> +	return 0;
> +}
> +
> +void gfs2_qd_shrinker_exit(void)
> +{
> +	shrinker_unregister(gfs2_qd_shrinker);
> +}
>   
>   static u64 qd2index(struct gfs2_quota_data *qd)
>   {
> diff --git a/fs/gfs2/quota.h b/fs/gfs2/quota.h
> index 21ada332d555..f9cb863373f7 100644
> --- a/fs/gfs2/quota.h
> +++ b/fs/gfs2/quota.h
> @@ -59,7 +59,8 @@ static inline int gfs2_quota_lock_check(struct gfs2_inode *ip,
>   }
>   
>   extern const struct quotactl_ops gfs2_quotactl_ops;
> -extern struct shrinker gfs2_qd_shrinker;
> +int gfs2_qd_shrinker_init(void);
> +void gfs2_qd_shrinker_exit(void);
>   extern struct list_lru gfs2_qd_lru;
>   extern void __init gfs2_quota_hash_init(void);
>   


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
