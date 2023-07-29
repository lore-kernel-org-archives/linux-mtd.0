Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCD7C04E69
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Jul 2023 08:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DxSxkhvJ+Wpc4dzjbWFP+t43ORr+6Q1TJDzGRYUIgs8=; b=A4hziq6/Apv9JC
	ZINmASYr9kh7RE0mS+DD/wmZhIn1wj8ATY8RSYkWpKQQE5q5XfFiJrhFaeMf9oK3qChsZ92/fjiJS
	/2QBkRRZdQyKF12kYuuwsUCthXg6xKUzBEmYyWnyRAnuJr6xh0AJF44R5Wag/j46xCDiGa1JKIlNd
	zjX0wmSZwSwLBDEc3it+1xyUt0eCRwG56Pavl8SCZxiRUDGTXwTM0yfcCIUgTjhL8olvntqdWG1O8
	kKQSGiCb1ZhhjxcpO5SKKE3h6vQzbZsWs7m3irhSUbAyJEYfmgil5sdZbI00gTjYQZAWhvVLS//la
	TzbLG97bodWzsIIwZHgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPfca-006o8i-29;
	Sat, 29 Jul 2023 08:48:20 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPfcV-006o6Z-1p
	for linux-mtd@lists.infradead.org;
	Sat, 29 Jul 2023 08:48:17 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-682ae5d4184so685362b3a.1
        for <linux-mtd@lists.infradead.org>; Sat, 29 Jul 2023 01:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690620488; x=1691225288;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AbdgPGpGzwv3Ba9ss/qbC8w4dcIJ6EfJ8tT9+ztVBsQ=;
        b=DZFLwwmJndUW6zfnORbYzoucbeb9saaQKrl/QBur5VgS6P58gRgdpp8MYduMN550+T
         ThpBMQd+wqwbcBoSGmvKI7V9Ma4LCpYLWFunl5NiegFEHJNTQE3HPx1j7Fgc5gNqx8Iq
         YHUiWta6/cfbGMyg9gyEl8Eynz728/mHaw1lMQy+t/GfUp9Wqb7L9kJmHKg93SZhln4L
         nQEOOjCm3XtItdkVREm8m6+qA283u73jSwvq4ou9Fha1ZKE4dHZmspSiYw7ywEJDGstN
         q98qzRnKmdM4q9DzoCiLAmxpMakkQvrAM25zQsh718wYNXYSnABRZn4Jdwg4vno9Osq9
         PVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690620488; x=1691225288;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AbdgPGpGzwv3Ba9ss/qbC8w4dcIJ6EfJ8tT9+ztVBsQ=;
        b=bkdUw890VEvW+G0Xx2te16m+kIpHKOmMe3s4q1Jjcnw2T2ZNf2rQMXMhd0eUBzlW59
         6lNIj4BPEJwKNDMvJmcjaeBmUs/yutKUV+HVBVc4vyms8Q8kTqS4AMiastpKeAKlXyTK
         Mm4nl7iTML6sNTaEWG8FPoNrwiAffFKFLfZ9KBCOMAL7MsAssvq2Fkzib6XoTL+9TwN8
         RnZ36HGs8w5PK0F4uz1v4V4tQMfzVTdrqvOR2GeoSfNPBpip88t5JCXJXz3JvnDcsvxL
         HjCarrIczuqwptWnKBez7od/EX6fP6sn6STyXuolIFDWO6SU/laD4bl9y/BYuwZ3lM9d
         cPQw==
X-Gm-Message-State: ABy/qLY8iXpYZU7zbfxq+comKyGK3/J+1oZDxqIOCE5ULW1FISSZ4hhP
	8BzsggtUDB3rybY0csgcSLXkwQ==
X-Google-Smtp-Source: APBJJlGU4WvDtIE3roPXfr2RIP3jnPqKjXBKgd99me7vK4BYh3P3V9BBkMbm8JQkpcQK7ib8McexOg==
X-Received: by 2002:a05:6a00:32c8:b0:67f:7403:1fe8 with SMTP id cl8-20020a056a0032c800b0067f74031fe8mr1763906pfb.3.1690620488142;
        Sat, 29 Jul 2023 01:48:08 -0700 (PDT)
Received: from ?IPV6:fdbd:ff1:ce00:1c25:884:3ed:e1db:b610? ([240e:694:e21:b::2])
        by smtp.gmail.com with ESMTPSA id s1-20020a62e701000000b00687087d8bc3sm2935245pfh.141.2023.07.29.01.47.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jul 2023 01:48:07 -0700 (PDT)
Message-ID: <5e50711c-a616-f95f-d6d2-c69627ac3cf0@bytedance.com>
Date: Sat, 29 Jul 2023 16:47:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 05/49] mm: shrinker: add infrastructure for dynamically
 allocating shrinker
Content-Language: en-US
To: Simon Horman <simon.horman@corigine.com>
Cc: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu, steven.price@arm.com,
 cel@kernel.org, senozhatsky@chromium.org, yujie.liu@intel.com,
 gregkh@linuxfoundation.org, muchun.song@linux.dev,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-nfs@vger.kernel.org,
 linux-mtd@lists.infradead.org, rcu@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dm-devel@redhat.com, linux-raid@vger.kernel.org,
 linux-bcache@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-6-zhengqi.arch@bytedance.com>
 <ZMOx0y+wdHEATDho@corigine.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <ZMOx0y+wdHEATDho@corigine.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230729_014815_603087_F8CE48CA 
X-CRM114-Status: GOOD (  25.76  )
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

Hi Simon,

On 2023/7/28 20:17, Simon Horman wrote:
> On Thu, Jul 27, 2023 at 04:04:18PM +0800, Qi Zheng wrote:
>> Currently, the shrinker instances can be divided into the following three
>> types:
>>
>> a) global shrinker instance statically defined in the kernel, such as
>>     workingset_shadow_shrinker.
>>
>> b) global shrinker instance statically defined in the kernel modules, such
>>     as mmu_shrinker in x86.
>>
>> c) shrinker instance embedded in other structures.
>>
>> For case a, the memory of shrinker instance is never freed. For case b,
>> the memory of shrinker instance will be freed after synchronize_rcu() when
>> the module is unloaded. For case c, the memory of shrinker instance will
>> be freed along with the structure it is embedded in.
>>
>> In preparation for implementing lockless slab shrink, we need to
>> dynamically allocate those shrinker instances in case c, then the memory
>> can be dynamically freed alone by calling kfree_rcu().
>>
>> So this commit adds the following new APIs for dynamically allocating
>> shrinker, and add a private_data field to struct shrinker to record and
>> get the original embedded structure.
>>
>> 1. shrinker_alloc()
>>
>> Used to allocate shrinker instance itself and related memory, it will
>> return a pointer to the shrinker instance on success and NULL on failure.
>>
>> 2. shrinker_register()
>>
>> Used to register the shrinker instance, which is same as the current
>> register_shrinker_prepared().
>>
>> 3. shrinker_free()
>>
>> Used to unregister (if needed) and free the shrinker instance.
>>
>> In order to simplify shrinker-related APIs and make shrinker more
>> independent of other kernel mechanisms, subsequent submissions will use
>> the above API to convert all shrinkers (including case a and b) to
>> dynamically allocated, and then remove all existing APIs.
>>
>> This will also have another advantage mentioned by Dave Chinner:
>>
>> ```
>> The other advantage of this is that it will break all the existing
>> out of tree code and third party modules using the old API and will
>> no longer work with a kernel using lockless slab shrinkers. They
>> need to break (both at the source and binary levels) to stop bad
>> things from happening due to using uncoverted shrinkers in the new
> 
> nit: uncoverted -> unconverted

Thanks. Will fix.

> 
>> setup.
>> ```
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> ...
> 
>> diff --git a/mm/shrinker_debug.c b/mm/shrinker_debug.c
>> index f1becfd45853..506257585408 100644
>> --- a/mm/shrinker_debug.c
>> +++ b/mm/shrinker_debug.c
>> @@ -191,6 +191,20 @@ int shrinker_debugfs_add(struct shrinker *shrinker)
>>   	return 0;
>>   }
>>   
>> +int shrinker_debugfs_name_alloc(struct shrinker *shrinker, const char *fmt,
>> +				va_list ap)
>> +{
>> +	shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
>> +
>> +	return shrinker->name ? 0 : -ENOMEM;
>> +}
>> +
>> +void shrinker_debugfs_name_free(struct shrinker *shrinker)
>> +{
>> +	kfree_const(shrinker->name);
>> +	shrinker->name = NULL;
>> +}
>> +
> 
> These functions have no prototype in this file,
> perhaps internal.h should be included?

The compiler can find these implementations, so I don't think there
is a need to include internal.h here?

Thanks,
Qi

> 
>>   int shrinker_debugfs_rename(struct shrinker *shrinker, const char *fmt, ...)
>>   {
>>   	struct dentry *entry;
> 
> ...

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
