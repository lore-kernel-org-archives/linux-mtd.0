Return-Path: <SRS0=ctmN=LY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C889C11F65
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jun 2021 08:05:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F072A61D06
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jun 2021 08:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F072A61D06
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPjctQF4WoRWGuE0OblKEb4EUq1UbDc2k35flKNw154=; b=2nQ5ORSj0cgFydky5mmtIzdLNQ
	Ev6mqFovMFdfUvQWvof4v7lc/NRw7V88kbstBJP3JDHJMc+Rrd70TbTMED4W+20lEML7lMmBA4s+h
	5tg6kcFUrmmRGnpXmbkjsj4MOln7O56pBzKuDi/8qE02XbjrwDbMejTiNuxBznWqlrFLM8/u0YnKj
	sw2eAtfJNbb/l6Ty/RhuiCFb4y6qCdgo9d32qoQGZh3mhBQ3TI/oBXoJADPBCDCV+L38ZV/rdz5hN
	UotbzzFIUCC7fPKFlL6m8tKUSne+CWvXQSvcp1PE/+Ublak9lm/z85NJh3Z6S4VF5QvvuSSUUUtER
	vW9uqgSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyVCt-00DDaa-8C; Wed, 30 Jun 2021 08:04:27 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyVCq-00DDa9-8l
 for linux-mtd@lists.infradead.org; Wed, 30 Jun 2021 08:04:25 +0000
Received: by mail-pf1-x436.google.com with SMTP id a127so1657941pfa.10
 for <linux-mtd@lists.infradead.org>; Wed, 30 Jun 2021 01:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hbH/z7OhdU+iVEdzRBnCUZFHkiZm6uSMAwD77kW53EQ=;
 b=BU3Qv47LJ81s3KJ3CZ5YBfYg/zGxqG3yu7jvAU1zg+c4dyh4CHtk9+15weOuX+ekvR
 s5IR6Lc7yD9ogLG+sT0ClErracxfeatoIlo7LixKA+shMhWJ37eweKAx6IeZqmbem4E5
 y0/zaKpJ8qYYp08lmdIJ/wyT7RkHksR1W5PA2DPZul9i5EhhrAe0cJuhKfICraRe/FFl
 5eZp2XvnEy3z9zDnTZYWAFYWPMuhIANMlm7joFeZnNVruXlnxzWrS8W7hI7OiuWl6nMQ
 8+4ACl127VruEaP/flWaidFrolQ412tebQW6LDHQOJjqGmhS2FEPcqholPo/2jllLZR/
 E7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hbH/z7OhdU+iVEdzRBnCUZFHkiZm6uSMAwD77kW53EQ=;
 b=KBeoU2BkUzZnUHXb5sQqGVxzVAO2JSRW5IKDYvUCswk35cKKzybGYHTl4KHDU0/EIz
 gaFaCoRQbFB3egR9I09AeoT7qOVj1W3nNS2jSm91Hhju9uVuP0UV2VidT3KIIlzKXYOV
 KRdRKwHwoiIrgU5mDK8DjJe3DB+PQiB3EsXfVBkL/4l/rNN5mHqgrJD3ozyR0NPOIdvu
 VagtjGga3WhbeTr3SCUpt1BFkAvrw7zg17fp61AkUas9xxWVsf71Aq3VqEBEbEvcsjsX
 xLZ8yOOBmt9dNoMGBo6AHemZBCQGwHsA6a5YI3J6z4iMN27WB7w59pf/dtv7HVoRoZ4G
 ysNQ==
X-Gm-Message-State: AOAM533ChkGEmiN8K7qELYhn/diNGcVliyPoGanl/KkFskWoyjU7Fou1
 Vfo8OdKtkoLah6CgreLSVTs=
X-Google-Smtp-Source: ABdhPJwU7Js4B1W8/rGXy4VQ9j/bnj9+1GWTfaVi89y5ddU0/qI7UeO4aI37dst1hKTJofIDx5tAHg==
X-Received: by 2002:aa7:9e0d:0:b029:30f:fb8b:2584 with SMTP id
 y13-20020aa79e0d0000b029030ffb8b2584mr1816966pfq.24.1625040262354; 
 Wed, 30 Jun 2021 01:04:22 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id z5sm20296398pfb.114.2021.06.30.01.04.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 01:04:21 -0700 (PDT)
Subject: Re: [PATCH v2] mtd: break circular locks in register_mtd_blktrans
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+6a8a0d93c91e8fbf2e80@syzkaller.appspotmail.com,
 Christoph Hellwig <hch@lst.de>
References: <20210617160904.570111-1-desmondcheongzx@gmail.com>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <03e19ec8-7479-9be2-3563-a2fcf9d0ec0c@gmail.com>
Date: Wed, 30 Jun 2021 16:04:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210617160904.570111-1-desmondcheongzx@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_010424_366905_9784DA62 
X-CRM114-Status: GOOD (  23.59  )
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

On 18/6/21 12:09 am, Desmond Cheong Zhi Xi wrote:
> Syzbot reported a circular locking dependency:
> https://syzkaller.appspot.com/bug?id=7bd106c28e846d1023d4ca915718b1a0905444cb
> 
> This happens because of the following lock dependencies:
> 
> 1. loop_ctl_mutex -> bdev->bd_mutex (when loop_control_ioctl calls
> loop_remove, which then calls del_gendisk; this also happens in
> loop_exit which eventually calls loop_remove)
> 
> 2. bdev->bd_mutex -> mtd_table_mutex (when blkdev_get_by_dev calls
> __blkdev_get, which then calls blktrans_open)
> 
> 3. mtd_table_mutex -> major_names_lock (when register_mtd_blktrans
> calls __register_blkdev)
> 
> 4. major_names_lock -> loop_ctl_mutex (when blk_request_module calls
> loop_probe)
> 
> Hence there's an overall dependency of:
> 
> loop_ctl_mutex   ----------> bdev->bd_mutex
>        ^                            |
>        |                            |
>        |                            v
> major_names_lock <---------  mtd_table_mutex
> 
> We can break this circular dependency by holding mtd_table_mutex only
> for the required critical section in register_mtd_blktrans. This
> avoids the mtd_table_mutex -> major_names_lock dependency.
> 
> Reported-and-tested-by: syzbot+6a8a0d93c91e8fbf2e80@syzkaller.appspotmail.com
> Co-developed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> ---
> 
> Changes in v1 -> v2:
> 
> Break the circular dependency in register_mtd_blktrans instead of blk_request_module, as suggested by Christoph Hellwig.
> 
>   drivers/mtd/mtd_blkdevs.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
> index fb8e12d590a1..7d26cfe24d05 100644
> --- a/drivers/mtd/mtd_blkdevs.c
> +++ b/drivers/mtd/mtd_blkdevs.c
> @@ -528,14 +528,10 @@ int register_mtd_blktrans(struct mtd_blktrans_ops *tr)
>   	if (!blktrans_notifier.list.next)
>   		register_mtd_user(&blktrans_notifier);
>   
> -
> -	mutex_lock(&mtd_table_mutex);
> -
>   	ret = register_blkdev(tr->major, tr->name);
>   	if (ret < 0) {
>   		printk(KERN_WARNING "Unable to register %s block device on major %d: %d\n",
>   		       tr->name, tr->major, ret);
> -		mutex_unlock(&mtd_table_mutex);
>   		return ret;
>   	}
>   
> @@ -545,12 +541,12 @@ int register_mtd_blktrans(struct mtd_blktrans_ops *tr)
>   	tr->blkshift = ffs(tr->blksize) - 1;
>   
>   	INIT_LIST_HEAD(&tr->devs);
> -	list_add(&tr->list, &blktrans_majors);
>   
> +	mutex_lock(&mtd_table_mutex);
> +	list_add(&tr->list, &blktrans_majors);
>   	mtd_for_each_device(mtd)
>   		if (mtd->type != MTD_ABSENT)
>   			tr->add_mtd(tr, mtd);
> -
>   	mutex_unlock(&mtd_table_mutex);
>   	return 0;
>   }
> 

Hi maintainers,

Any chance to review this patch?

For additional reference, the mtd_table_mutex --> major_names_lock 
hierarchy that can be removed by this patch also appears in a different 
lock chain:
https://syzkaller.appspot.com/bug?id=cbf5fe846f14a90f05e10df200b08c57941dc750

Best wishes,
Desmond

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
