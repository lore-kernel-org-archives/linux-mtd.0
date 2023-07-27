Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BDAC0015E
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 09:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WGI8M5QDxvPRpSJIA79qP4rW4F8J64tMzaqprEofr/Y=; b=q+vfdiN7N7Kv1u
	Jc4tJAx8pznB8gLh3E4MiFePPDCaOadNCq1uzn7SzpxN8dcqxsvDfXjpbf2ouxVF5M6P9FEHohpAd
	qrp2nGk6F2zPt1jpcRcpDoTlXz5+/KP+r0u8aTLeA1Ym2FYlDIrbQz+1ClJTk045wl9ZD8Cnx5qV5
	7teaMbW/V5zR2SxGz1AtwHSvM/vRADWSaTdcCMdSDyMpnIXQHTUt5n8Mq47UNMKQ4OkaoCiP8z/RV
	BVoqsZ3bBhQzQS7NMFWjNeHhyCSTJoU9g+NCihVEvYy7QJSAujd4TiNWv7kPF9oPF0TA0TPlqB/KJ
	iCkztjwkznRcfBNXuxLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOwze-00CmqP-0U;
	Thu, 27 Jul 2023 09:09:10 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOwza-00CmpC-23
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 09:09:08 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-66d6a9851f3so176813b3a.0
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 02:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690448946; x=1691053746;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4HPzHhawuqBHwf73jZH4M+rJ1h4rzhX4x1A5fzulUtE=;
        b=XVbZZB1bCuIddvCOd7ZdoZjiMRRT7dPd70cLEHChe028013CtZN4CJhyjaofMQGOCp
         aGQjkAdZJwrw0kO7FWCF+3wJu4Bs3hfpCHjXHte7v9cy4EJx3v2HSegV5fKDUggsvKcE
         rfw3ctmBIqNX3YVyLliz70Ow03c79YTqviRSUBhyV37ISoYoH05fZe12pteMem3zIYaK
         h5yTEuui+F8UDLetCnDn4Wd0BNAlUwOjTRf0Uzpr8uRBgvycDrHuoECz5/KoSjtrxNcd
         VFQA9eIykS0N+Aj/4rgCWZN2Q01gf7n56+E22JNqNX6qv8VxHS7PwBWWAHU3NZ4I85Kn
         Kvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690448946; x=1691053746;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4HPzHhawuqBHwf73jZH4M+rJ1h4rzhX4x1A5fzulUtE=;
        b=bJZMYO6NwurPoMQ4xLEmD6lXRdgr54CkxEkT2YN9KZJWHj2/ZU53em2Au1He0wbpwk
         fUVXIZpSzepBojuf+f5Q+H+tPB4ZcpPBw61sg0rYChBzqXwYFwseof+bFKPmf2hysZoo
         FFI2fNegfkCxAzueDbnQSe2BgfnCCh7CPBGJ4/Q8u7KdSP9e+tNOo1ncv1oxLjAh2tE/
         35vxaxVL0i/p1cxe0jAl/dj1MxCL924O0av1Et6gn/xf78JeF70j0onHeD34qH5f9Psn
         W+0H+akvnT3hynkXUM/qBpls9ykr96/rn+BjPcBwX/sZcr0HWqITDSaqJaGxwTj4qBg/
         yP0w==
X-Gm-Message-State: ABy/qLZcwXC0EbyNM7ppbqiv+qxfYSICSAjX/2DI+Xp6XEzVPQXpC3nu
	5hBLyiQ2vzBX9as1M83J2YI8Hg==
X-Google-Smtp-Source: APBJJlGcM2GBnp4i4GpCfKYembVJdmGwthtzp39QltAoTiMbksVAbVCn2LuGL8UI/2xPGfcHp3vTrQ==
X-Received: by 2002:a05:6a20:1595:b0:137:30db:bc1e with SMTP id h21-20020a056a20159500b0013730dbbc1emr5836590pzj.3.1690448945731;
        Thu, 27 Jul 2023 02:09:05 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id f17-20020a635551000000b00563ea47c948sm930669pgm.53.2023.07.27.02.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 02:09:05 -0700 (PDT)
Message-ID: <8951e9da-15ae-f05e-a9a4-a9354249cee2@bytedance.com>
Date: Thu, 27 Jul 2023 17:08:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 16/49] nfsd: dynamically allocate the nfsd-filecache
 shrinker
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
 <20230727080502.77895-17-zhengqi.arch@bytedance.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20230727080502.77895-17-zhengqi.arch@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_020906_671647_A9DDAC55 
X-CRM114-Status: GOOD (  15.78  )
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
> Use new APIs to dynamically allocate the nfsd-filecache shrinker.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   fs/nfsd/filecache.c | 22 ++++++++++++----------
>   1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/nfsd/filecache.c b/fs/nfsd/filecache.c
> index ee9c923192e0..872eb9501965 100644
> --- a/fs/nfsd/filecache.c
> +++ b/fs/nfsd/filecache.c
> @@ -521,11 +521,7 @@ nfsd_file_lru_scan(struct shrinker *s, struct shrink_control *sc)
>   	return ret;
>   }
>   
> -static struct shrinker	nfsd_file_shrinker = {
> -	.scan_objects = nfsd_file_lru_scan,
> -	.count_objects = nfsd_file_lru_count,
> -	.seeks = 1,
> -};
> +static struct shrinker *nfsd_file_shrinker;
>   
>   /**
>    * nfsd_file_cond_queue - conditionally unhash and queue a nfsd_file
> @@ -746,12 +742,18 @@ nfsd_file_cache_init(void)
>   		goto out_err;
>   	}
>   
> -	ret = register_shrinker(&nfsd_file_shrinker, "nfsd-filecache");
> -	if (ret) {
> -		pr_err("nfsd: failed to register nfsd_file_shrinker: %d\n", ret);
> +	nfsd_file_shrinker = shrinker_alloc(0, "nfsd-filecache");
> +	if (!nfsd_file_shrinker) {

Here should set ret to -ENOMEM, will fix.

> +		pr_err("nfsd: failed to allocate nfsd_file_shrinker\n");
>   		goto out_lru;
>   	}
>   
> +	nfsd_file_shrinker->count_objects = nfsd_file_lru_count;
> +	nfsd_file_shrinker->scan_objects = nfsd_file_lru_scan;
> +	nfsd_file_shrinker->seeks = 1;
> +
> +	shrinker_register(nfsd_file_shrinker);
> +
>   	ret = lease_register_notifier(&nfsd_file_lease_notifier);
>   	if (ret) {
>   		pr_err("nfsd: unable to register lease notifier: %d\n", ret);
> @@ -774,7 +776,7 @@ nfsd_file_cache_init(void)
>   out_notifier:
>   	lease_unregister_notifier(&nfsd_file_lease_notifier);
>   out_shrinker:
> -	unregister_shrinker(&nfsd_file_shrinker);
> +	shrinker_free(nfsd_file_shrinker);
>   out_lru:
>   	list_lru_destroy(&nfsd_file_lru);
>   out_err:
> @@ -891,7 +893,7 @@ nfsd_file_cache_shutdown(void)
>   		return;
>   
>   	lease_unregister_notifier(&nfsd_file_lease_notifier);
> -	unregister_shrinker(&nfsd_file_shrinker);
> +	shrinker_free(nfsd_file_shrinker);
>   	/*
>   	 * make sure all callers of nfsd_file_lru_cb are done before
>   	 * calling nfsd_file_cache_purge

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
