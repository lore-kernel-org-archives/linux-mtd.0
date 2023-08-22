Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2664EE4993
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Aug 2023 13:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UgT3MayvJYlNL4Gx2unUbvN9pD1MH5TQPujakfTFLgA=; b=hemkv9dYFkhSl7
	yGrTdRWrnWVl6i3HDts5ml5qvaoK8IoGzeCtz5x/muXDUMjoOr5QRJ1nIeNrEhAu5gv/FHLTj+o6k
	jUfjpsSvXrwB9oY+UbWOQYh9bM/jEuyPUZQp4s8hurmEjW65Z+dAQmwJKER8lHIc5A4JKHtnFRzQ2
	hxPXI05itX5So6feuAGtgPTy504VBVqJY9cV+Be7LRtTggV260b7zcgS8AmJX68h33RskL1qp5YkX
	it69p/p7tRu6Ct1yEVzSvSYcb6RbTKHOA0FUSO82YqaWGeJqUvG8HjFsfg/ibhoXuublZEKd+0EVB
	8oET4DCoJzJK4CIxESYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRrw-00G5X5-2w;
	Tue, 22 Aug 2023 13:56:28 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRrt-00G5Vd-2z
	for linux-mtd@lists.infradead.org;
	Tue, 22 Aug 2023 13:56:27 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-31c5ee810e3so184735f8f.0
        for <linux-mtd@lists.infradead.org>; Tue, 22 Aug 2023 06:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1692712583; x=1693317383;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXzMnEM8moHL5KfliVx5cD1lb3aAd5NGNjk14fqFYLY=;
        b=OvQvaauBf9P71X6OM3iV6zJjVstVKwDXVeR2TcNPjDcJz2f399JP5BZxFUiXHkTWc/
         r5lP7XQ7vkvpSMptW40PFm8KnzYip/IftCKI/V7U1LWv+OZcsOEZqcqKXDKRf7oBDJOP
         RNOespNYAQNJ9FavrWx3YuWYiBeKAeIF+XsTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692712583; x=1693317383;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LXzMnEM8moHL5KfliVx5cD1lb3aAd5NGNjk14fqFYLY=;
        b=BSWA0tlzfEFy985qZDEXOa4MT+4nh9YbeQOhxx+WFGOjjImc4w75OB4tUuDVSpUJjY
         aIjAvUb5Ba6oYt1TZjSNfTaJ8H2zuX7aA4pl+NVF7bPZaL7LsrgBuLKoJvte5ITUdmGc
         2UvL417wxEK7kybkfhFrFWrZHc2Fgdnf0iM5b6HhshqzRVLAKE1Vn16aAsYiahG4tSc5
         usbkLdip8iYtN6dfPkH0gYXzv4HLMa6uqtTmAHotj73C8iKPiWbhRbVeyspvzy78XQ+o
         NDAVe25NuNn5yQu4piyNcf1/FB0a2OyfLTZa87s4C+/E2xqdzngZjVAd71Tg40dd5T2Y
         BsZQ==
X-Gm-Message-State: AOJu0YwlTAsQZbCVLHzTRWpp5PtqZSuvt7VuudKf72RGlvVng2NKYAty
	IAwgQc1+txrOFaJgWYgUyaxwlQ==
X-Google-Smtp-Source: AGHT+IHJQrlSrCu8WgUX5s8XkdDm6/hR/jwfxds8mVBdQgFEL5tBYnuf/oIT+VMpj8Z6S8wRiH/+Kw==
X-Received: by 2002:a5d:65c5:0:b0:319:8dcf:5c10 with SMTP id e5-20020a5d65c5000000b003198dcf5c10mr6979657wrw.6.1692712582669;
        Tue, 22 Aug 2023 06:56:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id u5-20020a05600c210500b003fc02e8ea68sm19456835wml.13.2023.08.22.06.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 06:56:22 -0700 (PDT)
Date: Tue, 22 Aug 2023 15:56:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
	vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
	brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
	steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
	yujie.liu@intel.com, gregkh@linuxfoundation.org,
	muchun.song@linux.dev, simon.horman@corigine.com,
	dlemoal@kernel.org, kvm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	dm-devel@redhat.com, linux-mtd@lists.infradead.org, x86@kernel.org,
	cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
	linux-ext4@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	rcu@vger.kernel.org, linux-bcache@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>, linux-raid@vger.kernel.org,
	linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [PATCH v4 43/48] drm/ttm: introduce pool_shrink_rwsem
Message-ID: <ZOS+g51Yx9PsYkGU@phenom.ffwll.local>
Mail-Followup-To: Qi Zheng <zhengqi.arch@bytedance.com>,
	akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
	vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
	brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
	steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
	yujie.liu@intel.com, gregkh@linuxfoundation.org,
	muchun.song@linux.dev, simon.horman@corigine.com,
	dlemoal@kernel.org, kvm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	dm-devel@redhat.com, linux-mtd@lists.infradead.org, x86@kernel.org,
	cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
	linux-ext4@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	rcu@vger.kernel.org, linux-bcache@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>, linux-raid@vger.kernel.org,
	linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
 <20230807110936.21819-44-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230807110936.21819-44-zhengqi.arch@bytedance.com>
X-Operating-System: Linux phenom 6.3.0-2-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_065625_970636_B4DB8907 
X-CRM114-Status: GOOD (  27.99  )
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

On Mon, Aug 07, 2023 at 07:09:31PM +0800, Qi Zheng wrote:
> Currently, the synchronize_shrinkers() is only used by TTM pool. It only
> requires that no shrinkers run in parallel.
> 
> After we use RCU+refcount method to implement the lockless slab shrink,
> we can not use shrinker_rwsem or synchronize_rcu() to guarantee that all
> shrinker invocations have seen an update before freeing memory.
> 
> So we introduce a new pool_shrink_rwsem to implement a private
> synchronize_shrinkers(), so as to achieve the same purpose.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>

On the 5 drm patches (I counted 2 ttm and 3 drivers) for merging through
some other tree (since I'm assuming that's how this will land):

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 15 +++++++++++++++
>  include/linux/shrinker.h       |  2 --
>  mm/shrinker.c                  | 15 ---------------
>  3 files changed, 15 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index c9c9618c0dce..38b4c280725c 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -74,6 +74,7 @@ static struct ttm_pool_type global_dma32_uncached[MAX_ORDER + 1];
>  static spinlock_t shrinker_lock;
>  static struct list_head shrinker_list;
>  static struct shrinker *mm_shrinker;
> +static DECLARE_RWSEM(pool_shrink_rwsem);
>  
>  /* Allocate pages of size 1 << order with the given gfp_flags */
>  static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
> @@ -317,6 +318,7 @@ static unsigned int ttm_pool_shrink(void)
>  	unsigned int num_pages;
>  	struct page *p;
>  
> +	down_read(&pool_shrink_rwsem);
>  	spin_lock(&shrinker_lock);
>  	pt = list_first_entry(&shrinker_list, typeof(*pt), shrinker_list);
>  	list_move_tail(&pt->shrinker_list, &shrinker_list);
> @@ -329,6 +331,7 @@ static unsigned int ttm_pool_shrink(void)
>  	} else {
>  		num_pages = 0;
>  	}
> +	up_read(&pool_shrink_rwsem);
>  
>  	return num_pages;
>  }
> @@ -572,6 +575,18 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>  }
>  EXPORT_SYMBOL(ttm_pool_init);
>  
> +/**
> + * synchronize_shrinkers - Wait for all running shrinkers to complete.
> + *
> + * This is useful to guarantee that all shrinker invocations have seen an
> + * update, before freeing memory, similar to rcu.
> + */
> +static void synchronize_shrinkers(void)
> +{
> +	down_write(&pool_shrink_rwsem);
> +	up_write(&pool_shrink_rwsem);
> +}
> +
>  /**
>   * ttm_pool_fini - Cleanup a pool
>   *
> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
> index c55c07c3f0cb..025c8070dd86 100644
> --- a/include/linux/shrinker.h
> +++ b/include/linux/shrinker.h
> @@ -103,8 +103,6 @@ struct shrinker *shrinker_alloc(unsigned int flags, const char *fmt, ...);
>  void shrinker_register(struct shrinker *shrinker);
>  void shrinker_free(struct shrinker *shrinker);
>  
> -extern void synchronize_shrinkers(void);
> -
>  #ifdef CONFIG_SHRINKER_DEBUG
>  extern int __printf(2, 3) shrinker_debugfs_rename(struct shrinker *shrinker,
>  						  const char *fmt, ...);
> diff --git a/mm/shrinker.c b/mm/shrinker.c
> index 3ab301ff122d..a27779ed3798 100644
> --- a/mm/shrinker.c
> +++ b/mm/shrinker.c
> @@ -650,18 +650,3 @@ void shrinker_free(struct shrinker *shrinker)
>  	kfree(shrinker);
>  }
>  EXPORT_SYMBOL_GPL(shrinker_free);
> -
> -/**
> - * synchronize_shrinkers - Wait for all running shrinkers to complete.
> - *
> - * This is equivalent to calling unregister_shrink() and register_shrinker(),
> - * but atomically and with less overhead. This is useful to guarantee that all
> - * shrinker invocations have seen an update, before freeing memory, similar to
> - * rcu.
> - */
> -void synchronize_shrinkers(void)
> -{
> -	down_write(&shrinker_rwsem);
> -	up_write(&shrinker_rwsem);
> -}
> -EXPORT_SYMBOL(synchronize_shrinkers);
> -- 
> 2.30.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
