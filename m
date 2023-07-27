Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE1DC001DC
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 08:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DPWAMC5efXjWivJmQ9tcK/ZoOS6fcXHGPhRglDk0O/c=; b=nQe++AJeIHhDA9
	d4yoCUTtdslycFbR49UefL2n9ooJRuRnV6hm1n5Ze+/AKWuJoHjsI0Bof8G5tPaWEKn8IOYqinsEe
	DvQ5GnKcuZW9pY7sEaJ1aZDJUYX0z8Ew9zeFdi85Nx4J7xgL7OI7ZFlWjmmwgnMJOaw+R2PRYcLaU
	6aRcNRT3MMteWiEmDh5O44l4mIL0YRWkX8kCUUBlrsZGJww1vT3neGrIVe0OvnbWfrmIASLtiqghe
	NAYEzEF7T9UJBAS5E8UOeiqNAD63gOTvcaHvaOckp7HYbP6gT1KMqCUQH6nCOFaaUx0unIkCu26Cp
	oujZgdIVcc0C7h6UjAag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOwmj-00Cjkw-08;
	Thu, 27 Jul 2023 08:55:49 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOwmd-00Cjhj-1d
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 08:55:46 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6862d4a1376so198472b3a.0
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 01:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690448142; x=1691052942;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WiPjRg1/kjwO6K5zl232SDHPqYtmZOtFvHbsJXMq+7g=;
        b=Umb+YV+a9lWFhAL8II9iFkMStUOOBYcco6VfVBA99lXKZrqzVwUjfYjnKm4Dm0LFjT
         qdoJauj14z5/Q/ALZNZe4hty9eUQzFUzAPUNYhh89WT1GQpVMRyZmNBBpLKeWi1ZbclH
         LZhMvQeV3S/E/ICy+9O5ITOO1Phn4D+1/k/6DGPG+fLuYZVwP+5BQnq4IpnQhN9xTXZe
         rfTcvD1n0zxeVBrWB1YcR+3kK3++SSPnDRJs7hwNhsakSHiwU6PBsTieOJN2pDWuMDWg
         xnIMDcCLv5tsUy7qwBc5TOF+eIq3rIHBy6gcXooMjKSZ0a9wuV4u6V1UPp0vjKeCWB6q
         aakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690448142; x=1691052942;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WiPjRg1/kjwO6K5zl232SDHPqYtmZOtFvHbsJXMq+7g=;
        b=J4ogsNnai4oD5t5nFtH6DxBDNQDTG9qnUMfXtpCzREqjWBNNy2HVfAYscJgAz+9l7B
         17iN9vHylY2Tc5Qs5vEmYBkT+F31V5aOfLBKkfxq3/c28KJHlTuWOXz4m/4ZtZ2ej7eQ
         JVlC19DYpbujelomAbg/uI07nLbqYB7dpsVQhLvBtMZCTLBTAbSN9tee+UOidzjlyzdd
         Qnl72pV/oNckXhzAu/hiQE1AMvTFU7ANtHM7ZxtELwC5xqjke0dcvAQR9fyfAl9sDFlN
         pQIHkxvIniLBRzfXjDEJ1ND0DXRn6MhVgAk+6MQUdMxGqeU95vmZHAppXcqYC8Awj9c0
         Lovg==
X-Gm-Message-State: ABy/qLY799iKu1AYAEl2LqGaWF8mdgtb3Clc+gfHW6vnpi/aAsGVZCfo
	ZntLRZnwILIk4eyNu4KbJPYL7w==
X-Google-Smtp-Source: APBJJlGwmdjot/rbtwF9nTotnOmqaOAtVmCVUqRrFxhkDx7eGx5gFUYRsJSjv9frk6zdjI0egP1lkA==
X-Received: by 2002:a17:902:e891:b0:1b3:d4bb:3515 with SMTP id w17-20020a170902e89100b001b3d4bb3515mr5854967plg.0.1690448141745;
        Thu, 27 Jul 2023 01:55:41 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id iy15-20020a170903130f00b001bbb1eec92esm1023927plb.281.2023.07.27.01.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 01:55:41 -0700 (PDT)
Message-ID: <56ee1d92-28ee-81cb-9c41-6ca7ea6556b0@bytedance.com>
Date: Thu, 27 Jul 2023 16:55:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 28/49] dm zoned: dynamically allocate the dm-zoned-meta
 shrinker
Content-Language: en-US
To: Damien Le Moal <dlemoal@kernel.org>
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
 Muchun Song <songmuchun@bytedance.com>, akpm@linux-foundation.org,
 david@fromorbit.com, tkhai@ya.ru, vbabka@suse.cz, roman.gushchin@linux.dev,
 djwong@kernel.org, brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-29-zhengqi.arch@bytedance.com>
 <baaf7de4-9a0e-b953-2b6a-46e60c415614@kernel.org>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <baaf7de4-9a0e-b953-2b6a-46e60c415614@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_015543_959259_1F2E549C 
X-CRM114-Status: GOOD (  22.95  )
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

Hi,

On 2023/7/27 16:30, Damien Le Moal wrote:
> On 7/27/23 17:04, Qi Zheng wrote:
>> In preparation for implementing lockless slab shrink, use new APIs to
>> dynamically allocate the dm-zoned-meta shrinker, so that it can be freed
>> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
>> read-side critical section when releasing the struct dmz_metadata.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>>   drivers/md/dm-zoned-metadata.c | 28 ++++++++++++++++------------
>>   1 file changed, 16 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
>> index 9d3cca8e3dc9..0bcb26a43578 100644
>> --- a/drivers/md/dm-zoned-metadata.c
>> +++ b/drivers/md/dm-zoned-metadata.c
>> @@ -187,7 +187,7 @@ struct dmz_metadata {
>>   	struct rb_root		mblk_rbtree;
>>   	struct list_head	mblk_lru_list;
>>   	struct list_head	mblk_dirty_list;
>> -	struct shrinker		mblk_shrinker;
>> +	struct shrinker		*mblk_shrinker;
>>   
>>   	/* Zone allocation management */
>>   	struct mutex		map_lock;
>> @@ -615,7 +615,7 @@ static unsigned long dmz_shrink_mblock_cache(struct dmz_metadata *zmd,
>>   static unsigned long dmz_mblock_shrinker_count(struct shrinker *shrink,
>>   					       struct shrink_control *sc)
>>   {
>> -	struct dmz_metadata *zmd = container_of(shrink, struct dmz_metadata, mblk_shrinker);
>> +	struct dmz_metadata *zmd = shrink->private_data;
>>   
>>   	return atomic_read(&zmd->nr_mblks);
>>   }
>> @@ -626,7 +626,7 @@ static unsigned long dmz_mblock_shrinker_count(struct shrinker *shrink,
>>   static unsigned long dmz_mblock_shrinker_scan(struct shrinker *shrink,
>>   					      struct shrink_control *sc)
>>   {
>> -	struct dmz_metadata *zmd = container_of(shrink, struct dmz_metadata, mblk_shrinker);
>> +	struct dmz_metadata *zmd = shrink->private_data;
>>   	unsigned long count;
>>   
>>   	spin_lock(&zmd->mblk_lock);
>> @@ -2936,19 +2936,23 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
>>   	 */
>>   	zmd->min_nr_mblks = 2 + zmd->nr_map_blocks + zmd->zone_nr_bitmap_blocks * 16;
>>   	zmd->max_nr_mblks = zmd->min_nr_mblks + 512;
>> -	zmd->mblk_shrinker.count_objects = dmz_mblock_shrinker_count;
>> -	zmd->mblk_shrinker.scan_objects = dmz_mblock_shrinker_scan;
>> -	zmd->mblk_shrinker.seeks = DEFAULT_SEEKS;
>>   
>>   	/* Metadata cache shrinker */
>> -	ret = register_shrinker(&zmd->mblk_shrinker, "dm-zoned-meta:(%u:%u)",
>> -				MAJOR(dev->bdev->bd_dev),
>> -				MINOR(dev->bdev->bd_dev));
>> -	if (ret) {
>> -		dmz_zmd_err(zmd, "Register metadata cache shrinker failed");
>> +	zmd->mblk_shrinker = shrinker_alloc(0,  "dm-zoned-meta:(%u:%u)",
>> +					    MAJOR(dev->bdev->bd_dev),
>> +					    MINOR(dev->bdev->bd_dev));
>> +	if (!zmd->mblk_shrinker) {
>> +		dmz_zmd_err(zmd, "Allocate metadata cache shrinker failed");
> 
> ret is not set here, so dmz_ctr_metadata() will return success. You need to add:
> 		ret = -ENOMEM;
> or something.

Indeed, will fix.

>>   		goto err;
>>   	}
>>   
>> +	zmd->mblk_shrinker->count_objects = dmz_mblock_shrinker_count;
>> +	zmd->mblk_shrinker->scan_objects = dmz_mblock_shrinker_scan;
>> +	zmd->mblk_shrinker->seeks = DEFAULT_SEEKS;
>> +	zmd->mblk_shrinker->private_data = zmd;
>> +
>> +	shrinker_register(zmd->mblk_shrinker);
> 
> I fail to see how this new shrinker API is better... Why isn't there a
> shrinker_alloc_and_register() function ? That would avoid adding all this code
> all over the place as the new API call would be very similar to the current
> shrinker_register() call with static allocation.

In some registration scenarios, memory needs to be allocated in advance.
So we continue to use the previous prealloc/register_prepared()
algorithm. The shrinker_alloc_and_register() is just a helper function
that combines the two, and this increases the number of APIs that
shrinker exposes to the outside, so I choose not to add this helper.

Thanks,
Qi

> 
>> +
>>   	dmz_zmd_info(zmd, "DM-Zoned metadata version %d", zmd->sb_version);
>>   	for (i = 0; i < zmd->nr_devs; i++)
>>   		dmz_print_dev(zmd, i);
>> @@ -2995,7 +2999,7 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
>>    */
>>   void dmz_dtr_metadata(struct dmz_metadata *zmd)
>>   {
>> -	unregister_shrinker(&zmd->mblk_shrinker);
>> +	shrinker_free(zmd->mblk_shrinker);
>>   	dmz_cleanup_metadata(zmd);
>>   	kfree(zmd);
>>   }
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
