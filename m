Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EBCC001DE
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jul 2023 12:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y3fjVQZVjO/n8ZrS10XeRKNs3J05iHks1ERdIKg+ed0=; b=clYavec3EohXhM
	1YNDJBnb8/1JKhCagwZla4Nw6iRcYWxSBRkeCB+yRBkSrfyhBg+5QZJ/EtJrgse627c4fwGsVRZUN
	ot2bysnispgiL2V6JCeR5yMXS3hAnkAeKUSsaOnozOSC+ZFmUCBORdO2rWxBoUt3/cT58Teo4FAuP
	Zf/7gAVKCgozKCKadw7YGyCWkpBqgRbg7rOxyc8dn4eR7yNJWehdwIHia05OahOP2AP093KE3F6cu
	XvP2xVp5SBOIf31jN9zp2HynEesbhek9brEsbxMw6u5EACMBsy4uWt5dGxN11mSCJXooJ9lv2YYrg
	S3vl69m1dVM8BFbadRqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNuVl-004Cb0-1J;
	Mon, 24 Jul 2023 12:18:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNuVh-004CZC-2s
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jul 2023 12:17:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 397746113E;
	Mon, 24 Jul 2023 12:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7639DC433C7;
	Mon, 24 Jul 2023 12:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690201076;
	bh=SgqvEHTSsoLx88OM4JQmZh6whPE6BGZ/uEOL9QxuZhc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=HeauOjdE48WDStWMcmbZe0QJCu1PZbrw2jnOfPPp5Y0n0Q1TK60SYgINluh0tVUHu
	 HMa9pGy9YrA2Xid5ZQCkD41aahatrfHq9vVHLjbuzLzQBP/bIUW5s/kQBvStLkPbEr
	 52wVvvm4TuW1EIIyQppWxFYEv7SoUq895jOWh1zWA+5Bhuu0CwPKUfnKQ6aPaR+FNu
	 w4bgci3LfqcgT2vztkyr4DzF2/4Hyf1LGlp6Z0shJe1d8GJLzPQbDhc3dh09sCIq3l
	 N9zzfqaN5HsWy8Vmt4P1E7EQFqQrkFrxcJ7/1W6yEYc3GiEERam+zZN0XSQm/ELIIc
	 3urjqaifuO8iw==
Message-ID: <d79d3ef43b3a61be99e53a77fa9eb19af7fc550f.camel@kernel.org>
Subject: Re: [PATCH v2 35/47] nfsd: dynamically allocate the nfsd-reply
 shrinker
From: Jeff Layton <jlayton@kernel.org>
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
 linux-bcache@vger.kernel.org,  virtualization@lists.linux-foundation.org,
 linux-fsdevel@vger.kernel.org,  linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org,  linux-btrfs@vger.kernel.org, Chuck Lever
 <chuck.lever@oracle.com>
Date: Mon, 24 Jul 2023 08:17:52 -0400
In-Reply-To: <20230724094354.90817-36-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
	 <20230724094354.90817-36-zhengqi.arch@bytedance.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_051758_016348_A5A5D827 
X-CRM114-Status: GOOD (  19.69  )
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

On Mon, 2023-07-24 at 17:43 +0800, Qi Zheng wrote:
> In preparation for implementing lockless slab shrink, use new APIs to
> dynamically allocate the nfsd-reply shrinker, so that it can be freed
> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
> read-side critical section when releasing the struct nfsd_net.
> 
> Acked-by: Chuck Lever <chuck.lever@oracle.com>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>  fs/nfsd/netns.h    |  2 +-
>  fs/nfsd/nfscache.c | 31 ++++++++++++++++---------------
>  2 files changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/fs/nfsd/netns.h b/fs/nfsd/netns.h
> index f669444d5336..ab303a8b77d5 100644
> --- a/fs/nfsd/netns.h
> +++ b/fs/nfsd/netns.h
> @@ -177,7 +177,7 @@ struct nfsd_net {
>  	/* size of cache when we saw the longest hash chain */
>  	unsigned int             longest_chain_cachesize;
>  
> -	struct shrinker		nfsd_reply_cache_shrinker;
> +	struct shrinker		*nfsd_reply_cache_shrinker;
>  
>  	/* tracking server-to-server copy mounts */
>  	spinlock_t              nfsd_ssc_lock;
> diff --git a/fs/nfsd/nfscache.c b/fs/nfsd/nfscache.c
> index 6eb3d7bdfaf3..9f0ab65e4125 100644
> --- a/fs/nfsd/nfscache.c
> +++ b/fs/nfsd/nfscache.c
> @@ -200,26 +200,29 @@ int nfsd_reply_cache_init(struct nfsd_net *nn)
>  {
>  	unsigned int hashsize;
>  	unsigned int i;
> -	int status = 0;
>  
>  	nn->max_drc_entries = nfsd_cache_size_limit();
>  	atomic_set(&nn->num_drc_entries, 0);
>  	hashsize = nfsd_hashsize(nn->max_drc_entries);
>  	nn->maskbits = ilog2(hashsize);
>  
> -	nn->nfsd_reply_cache_shrinker.scan_objects = nfsd_reply_cache_scan;
> -	nn->nfsd_reply_cache_shrinker.count_objects = nfsd_reply_cache_count;
> -	nn->nfsd_reply_cache_shrinker.seeks = 1;
> -	status = register_shrinker(&nn->nfsd_reply_cache_shrinker,
> -				   "nfsd-reply:%s", nn->nfsd_name);
> -	if (status)
> -		return status;
> -
>  	nn->drc_hashtbl = kvzalloc(array_size(hashsize,
>  				sizeof(*nn->drc_hashtbl)), GFP_KERNEL);
>  	if (!nn->drc_hashtbl)
> +		return -ENOMEM;
> +
> +	nn->nfsd_reply_cache_shrinker = shrinker_alloc(0, "nfsd-reply:%s",
> +						       nn->nfsd_name);
> +	if (!nn->nfsd_reply_cache_shrinker)
>  		goto out_shrinker;
>  
> +	nn->nfsd_reply_cache_shrinker->scan_objects = nfsd_reply_cache_scan;
> +	nn->nfsd_reply_cache_shrinker->count_objects = nfsd_reply_cache_count;
> +	nn->nfsd_reply_cache_shrinker->seeks = 1;
> +	nn->nfsd_reply_cache_shrinker->private_data = nn;
> +
> +	shrinker_register(nn->nfsd_reply_cache_shrinker);
> +
>  	for (i = 0; i < hashsize; i++) {
>  		INIT_LIST_HEAD(&nn->drc_hashtbl[i].lru_head);
>  		spin_lock_init(&nn->drc_hashtbl[i].cache_lock);
> @@ -228,7 +231,7 @@ int nfsd_reply_cache_init(struct nfsd_net *nn)
>  
>  	return 0;
>  out_shrinker:
> -	unregister_shrinker(&nn->nfsd_reply_cache_shrinker);
> +	kvfree(nn->drc_hashtbl);
>  	printk(KERN_ERR "nfsd: failed to allocate reply cache\n");
>  	return -ENOMEM;
>  }
> @@ -238,7 +241,7 @@ void nfsd_reply_cache_shutdown(struct nfsd_net *nn)
>  	struct nfsd_cacherep *rp;
>  	unsigned int i;
>  
> -	unregister_shrinker(&nn->nfsd_reply_cache_shrinker);
> +	shrinker_unregister(nn->nfsd_reply_cache_shrinker);
>  
>  	for (i = 0; i < nn->drc_hashsize; i++) {
>  		struct list_head *head = &nn->drc_hashtbl[i].lru_head;
> @@ -322,8 +325,7 @@ nfsd_prune_bucket_locked(struct nfsd_net *nn, struct nfsd_drc_bucket *b,
>  static unsigned long
>  nfsd_reply_cache_count(struct shrinker *shrink, struct shrink_control *sc)
>  {
> -	struct nfsd_net *nn = container_of(shrink,
> -				struct nfsd_net, nfsd_reply_cache_shrinker);
> +	struct nfsd_net *nn = shrink->private_data;
>  
>  	return atomic_read(&nn->num_drc_entries);
>  }
> @@ -342,8 +344,7 @@ nfsd_reply_cache_count(struct shrinker *shrink, struct shrink_control *sc)
>  static unsigned long
>  nfsd_reply_cache_scan(struct shrinker *shrink, struct shrink_control *sc)
>  {
> -	struct nfsd_net *nn = container_of(shrink,
> -				struct nfsd_net, nfsd_reply_cache_shrinker);
> +	struct nfsd_net *nn = shrink->private_data;
>  	unsigned long freed = 0;
>  	LIST_HEAD(dispose);
>  	unsigned int i;

Acked-by: Jeff Layton <jlayton@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
