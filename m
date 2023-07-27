Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91617C07E8A
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 09:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2t2GBTM3QFZOqgThUFZzUSgkEeAAmSo/ZMf7GUoQ0b0=; b=Kw5gAAk1gqrACn
	NGoTfZ46XMLCCmtPVE420dxA6wOP7WR8haB3SjDxqSo4U/4KTrPGf6cvhHB/XvLB9OxzOEK1vE095
	X+AfLjts6wUGJRFXSsKk7Wp7v+4usde9KEiWKlaQFRLgvESAWygzAgG2+J3cmepB1usiieYfBmqd1
	7A0UFEGB54oeGQgLd8NZ1z8R60b+ajr/5t8cQjQ5xF0UZt9ASKWj6iKCR87bNxr1O0vROMbmI+Pb5
	2VgSZAJHW9Ym44qGQ4Iy701CTfaFSyyUYdzmat9Gvik0a57et5z+iq4JTi2C70HfbRRG6VA0Kjbru
	HHG31mghpH3XrXspJPcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOx3n-00CnaD-0L;
	Thu, 27 Jul 2023 09:13:27 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOx3j-00CnYV-3D
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 09:13:25 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6862d4a1376so201871b3a.0
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 02:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690449201; x=1691054001;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ab3i02uMNDVjAVrJgavtDQnv7B+TbSMr9u4LPtdCXIk=;
        b=DcofMrRnwJynNkdGxtjH9DqKXau2yqZGatjPtAtzn+O56nMmwXuVd7ToeAQUojKhyr
         PVIHt52Ove4HfRkW5Jz6nWPZD9BmVLc7SbBBPIeMe8wFyfKaQIk+EbU0k3nRPfOKNwBh
         oCNv2ZD1HFVJTkxvMKWyxXL9Onk9dGrGolbp1H25aJz81J4GYNUwPghcXVGUuE5zAHUa
         mP22aBPwBQ4pP/D5mY0ghxG8TnuQLNORwYORdeX0ZvQJ20+Z3LaIninEXnknTqruUQCo
         Za3jxS8cFIItCGBaY6f3hGkZx+gttPFDrR9vIxhOGVxid7Al6RP9znkmq9WOz9AcYgeV
         IdKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690449201; x=1691054001;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ab3i02uMNDVjAVrJgavtDQnv7B+TbSMr9u4LPtdCXIk=;
        b=hpwvpszmQn3P79QeCGLIwVl04AfaIcTJOZO4+gLl29un74brHuKYX8DVUfZkOjjm/8
         mSyFT004nCE1pt+RWvLERH/LGnHVn4AilXB3KC/qNv0kgp2CCzTt8vgYLnZKUbnflG9m
         EJs0h20gjs9KELTnv7dD5joMFPdAs6FLjHgl9up/n6VYEWl53UXRm71KUM38qhD9vn7d
         p2I5tkfPfgEiLnKm0QoU9CP/UMCp4Yai2nx1jUGFeijjoHj1L2xbrqPBguaiFxt7qX3p
         Q/VOmHInlMXmPNvghrgAkmtHFCTP7IN1cNV5wOvRdkBOapIAHwQbWA5WWoKZzq0IWrrF
         Z9TQ==
X-Gm-Message-State: ABy/qLb4sZqFde8iBk1tBD5f8WJkDZFav9ZsyBWrIg9wWvTKZnqgA9ea
	bCAu096ggQ2ArMZX0UdBIMom/g==
X-Google-Smtp-Source: APBJJlGBn5Xl2QFHzxgRMihSAaLd28csKz8Em946xGdOgBfe3ljiGqu5+YaMyvDFvdIkqmZPd3zpbQ==
X-Received: by 2002:a05:6a00:4792:b0:668:834d:4bd with SMTP id dh18-20020a056a00479200b00668834d04bdmr4787709pfb.0.1690449201600;
        Thu, 27 Jul 2023 02:13:21 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id m26-20020a056a00165a00b006687b41c4dasm1017146pfc.110.2023.07.27.02.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 02:13:21 -0700 (PDT)
Message-ID: <961f6055-a395-8490-4c22-765a30668460@bytedance.com>
Date: Thu, 27 Jul 2023 17:13:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 27/49] dm: dynamically allocate the dm-bufio shrinker
Content-Language: en-US
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu, steven.price@arm.com,
 cel@kernel.org, senozhatsky@chromium.org, yujie.liu@intel.com,
 gregkh@linuxfoundation.org, muchun.song@linux.dev
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
 <20230727080502.77895-28-zhengqi.arch@bytedance.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20230727080502.77895-28-zhengqi.arch@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_021324_057036_E7DDEF20 
X-CRM114-Status: GOOD (  18.03  )
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



On 2023/7/27 16:04, Qi Zheng wrote:
> In preparation for implementing lockless slab shrink, use new APIs to
> dynamically allocate the dm-bufio shrinker, so that it can be freed
> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
> read-side critical section when releasing the struct dm_bufio_client.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   drivers/md/dm-bufio.c | 26 +++++++++++++++-----------
>   1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/md/dm-bufio.c b/drivers/md/dm-bufio.c
> index bc309e41d074..5a9124b83d53 100644
> --- a/drivers/md/dm-bufio.c
> +++ b/drivers/md/dm-bufio.c
> @@ -963,7 +963,7 @@ struct dm_bufio_client {
>   
>   	sector_t start;
>   
> -	struct shrinker shrinker;
> +	struct shrinker *shrinker;
>   	struct work_struct shrink_work;
>   	atomic_long_t need_shrink;
>   
> @@ -2368,7 +2368,7 @@ static unsigned long dm_bufio_shrink_scan(struct shrinker *shrink, struct shrink
>   {
>   	struct dm_bufio_client *c;
>   
> -	c = container_of(shrink, struct dm_bufio_client, shrinker);
> +	c = shrink->private_data;
>   	atomic_long_add(sc->nr_to_scan, &c->need_shrink);
>   	queue_work(dm_bufio_wq, &c->shrink_work);
>   
> @@ -2377,7 +2377,7 @@ static unsigned long dm_bufio_shrink_scan(struct shrinker *shrink, struct shrink
>   
>   static unsigned long dm_bufio_shrink_count(struct shrinker *shrink, struct shrink_control *sc)
>   {
> -	struct dm_bufio_client *c = container_of(shrink, struct dm_bufio_client, shrinker);
> +	struct dm_bufio_client *c = shrink->private_data;
>   	unsigned long count = cache_total(&c->cache);
>   	unsigned long retain_target = get_retain_buffers(c);
>   	unsigned long queued_for_cleanup = atomic_long_read(&c->need_shrink);
> @@ -2490,15 +2490,19 @@ struct dm_bufio_client *dm_bufio_client_create(struct block_device *bdev, unsign
>   	INIT_WORK(&c->shrink_work, shrink_work);
>   	atomic_long_set(&c->need_shrink, 0);
>   
> -	c->shrinker.count_objects = dm_bufio_shrink_count;
> -	c->shrinker.scan_objects = dm_bufio_shrink_scan;
> -	c->shrinker.seeks = 1;
> -	c->shrinker.batch = 0;
> -	r = register_shrinker(&c->shrinker, "dm-bufio:(%u:%u)",
> -			      MAJOR(bdev->bd_dev), MINOR(bdev->bd_dev));
> -	if (r)
> +	c->shrinker = shrinker_alloc(0, "dm-bufio:(%u:%u)",
> +				     MAJOR(bdev->bd_dev), MINOR(bdev->bd_dev));
> +	if (!c->shrinker)

Here should set r to -ENOMEM, will fix.

>   		goto bad;
>   
> +	c->shrinker->count_objects = dm_bufio_shrink_count;
> +	c->shrinker->scan_objects = dm_bufio_shrink_scan;
> +	c->shrinker->seeks = 1;
> +	c->shrinker->batch = 0;
> +	c->shrinker->private_data = c;
> +
> +	shrinker_register(c->shrinker);
> +
>   	mutex_lock(&dm_bufio_clients_lock);
>   	dm_bufio_client_count++;
>   	list_add(&c->client_list, &dm_bufio_all_clients);
> @@ -2537,7 +2541,7 @@ void dm_bufio_client_destroy(struct dm_bufio_client *c)
>   
>   	drop_buffers(c);
>   
> -	unregister_shrinker(&c->shrinker);
> +	shrinker_free(c->shrinker);
>   	flush_work(&c->shrink_work);
>   
>   	mutex_lock(&dm_bufio_clients_lock);

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
