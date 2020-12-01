Return-Path: <SRS0=jbuo=FF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B694C64E7A
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Dec 2020 19:45:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4F68206F9
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Dec 2020 19:45:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QGmW1Op1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oHAUvQIv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4F68206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r5QLjb6gbxfclrFrqj6RAH6hVwsZR5CYinnpUMnMOTI=; b=QGmW1Op1rlCOEYS6bYtuT9+2/
	k1YXia3nlzA0Ma1nd9BJfEZM5ECltTOYc2RY/d6wUmIAD7gdW2H7ICMICDOWubjqGhQkPSyHv/kS9
	yJ+yZ89IBZN0AYDQPLVei/ExI5fZ2DiSxc8//wpxHmhExhe98apsxRu4ezXkSGtajrT4ijposWF5I
	BEx/i5oQKIYS3qgWI+xeFIf3IA0OjlSM2vKAjS0Et3r9KnEorVqX8Zmt5VJn4G2EGBqFSWsMdcA0p
	5ovg+v5VP+eobeYo1GrFLlBDUnnFqQtcdPFyWKx72q3FQKoJfLclqi9NHCs2NT4mLXWFoJt9VHyfi
	E0SioVFUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkBZq-00009M-EN; Tue, 01 Dec 2020 19:44:42 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkBZn-00008L-OD
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2020 19:44:40 +0000
Received: by mail-pl1-x642.google.com with SMTP id b23so1725942pls.11
 for <linux-mtd@lists.infradead.org>; Tue, 01 Dec 2020 11:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dqwysqi+9L95tpvuywV7A+6LVGaFVl3uZg4PTg8+oII=;
 b=oHAUvQIvp66wQnurdoykxpwJlhjofxb6D1B+JyNpjYUbE+MluAL9E6e8wiKG7ozKPj
 xaGmhP6RSCFXb/7XG7/tZv9gKEOU22c/xk9mBs0/wrFrJk9pU5bSuxR0gutAdT6WLeGF
 uHaTOcPvsT3Nc7mgD7szTcMhbQJRjQkE0dD0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dqwysqi+9L95tpvuywV7A+6LVGaFVl3uZg4PTg8+oII=;
 b=B8+Z5UbBxosDggk/addsUlLcBuM5dzlcri+8gSC4nDDGPlb6DOwMEZd85PCjHjmjph
 N9yRinHKdtTvI/iXI8deMQvQ3SUbacmfly0tzURUJYLbAOBfL9juJXAQBF8u3p7UyzY1
 6QfxM+HvQevyuyET9udvbWxJNqzd8KoNrMQAf8pvLDKKu0J8nqef9vuyJA0JQpf7qspo
 Pqxuidkf3VKh2zD5iTE0zU/sqO6DT0ia0y2Uw3TmNBsltqGM52MIAH2mTnrQck1ZBuuL
 qayr3rA3kNUgvDsyuZPknI1dgNMPNnmBH6jFDTftasBmuALD9grV+V3sdXr3mVM0Q9uQ
 ZCQQ==
X-Gm-Message-State: AOAM530Hy7U1KxADx0D+hxb40ad68MHJJPcI9owgAWHc8M8ubAfa8VNQ
 QC4yhi8Nry5/gADiZBBqZV6wLc1+42g+MKrb
X-Google-Smtp-Source: ABdhPJwmvPw0ngX0Er6V5eSIAMUGRQPVjLGQUyVDnXjlc4QzqWCPK9gB1yrpMuqGrJzlgG7vwHGMrA==
X-Received: by 2002:a17:90b:14d3:: with SMTP id
 jz19mr4427386pjb.196.1606851877744; 
 Tue, 01 Dec 2020 11:44:37 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id b83sm509273pfb.220.2020.12.01.11.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 11:44:36 -0800 (PST)
Date: Tue, 1 Dec 2020 11:44:35 -0800
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 7/9] pstore/blk: remove struct pstore_device_info
Message-ID: <202012011143.43273D716@keescook>
References: <20201016132047.3068029-1-hch@lst.de>
 <20201016132047.3068029-8-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201016132047.3068029-8-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_144439_803648_A58556F3 
X-CRM114-Status: GOOD (  31.57  )
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
Cc: Tony Luck <tony.luck@intel.com>, Anton Vorontsov <anton@enomsg.org>,
 linux-kernel@vger.kernel.org, WeiXiong Liao <liaoweixiong@allwinnertech.com>,
 linux-mtd@lists.infradead.org, Colin Cross <ccross@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Oct 16, 2020 at 03:20:45PM +0200, Christoph Hellwig wrote:
> The total_size and flags are only needed at registrations time, so just
> pass them to register_pstore_device directly.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Full NAK on this -- pstore was mess of function argument passing, and I
vowed to pass everything in structures after I finally cleaned all of
that up. I don't want anything that looks like this getting back into
the pstore code.

-Kees

> ---
>  drivers/mtd/mtdpstore.c    | 10 ++--
>  fs/pstore/blk.c            | 98 ++++++++++++++++----------------------
>  include/linux/pstore_blk.h | 21 ++------
>  3 files changed, 47 insertions(+), 82 deletions(-)
> 
> diff --git a/drivers/mtd/mtdpstore.c b/drivers/mtd/mtdpstore.c
> index 232ba5c39c2a55..88d0305ca27336 100644
> --- a/drivers/mtd/mtdpstore.c
> +++ b/drivers/mtd/mtdpstore.c
> @@ -12,7 +12,6 @@
>  static struct mtdpstore_context {
>  	int index;
>  	struct pstore_blk_config info;
> -	struct pstore_device_info dev;
>  	struct mtd_info *mtd;
>  	unsigned long *rmmap;		/* removed bit map */
>  	unsigned long *usedmap;		/* used bit map */
> @@ -431,12 +430,9 @@ static void mtdpstore_notify_add(struct mtd_info *mtd)
>  	longcnt = BITS_TO_LONGS(div_u64(mtd->size, mtd->erasesize));
>  	cxt->badmap = kcalloc(longcnt, sizeof(long), GFP_KERNEL);
>  
> -	cxt->dev.total_size = mtd->size;
>  	/* just support dmesg right now */
> -	cxt->dev.flags = PSTORE_FLAGS_DMESG;
> -	cxt->dev.ops = &mtdpstore_ops;
> -
> -	ret = register_pstore_device(&cxt->dev);
> +	ret = register_pstore_device(&mtdpstore_ops, mtd->size,
> +				     PSTORE_FLAGS_DMESG);
>  	if (ret) {
>  		dev_err(&mtd->dev, "mtd%d register to psblk failed\n",
>  				mtd->index);
> @@ -531,7 +527,7 @@ static void mtdpstore_notify_remove(struct mtd_info *mtd)
>  
>  	mtdpstore_flush_removed(cxt);
>  
> -	unregister_pstore_device(&cxt->dev);
> +	unregister_pstore_device(&mtdpstore_ops);
>  	kfree(cxt->badmap);
>  	kfree(cxt->usedmap);
>  	kfree(cxt->rmmap);
> diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
> index f7c7f325e42c71..0430b190a1df2a 100644
> --- a/fs/pstore/blk.c
> +++ b/fs/pstore/blk.c
> @@ -102,27 +102,40 @@ static struct pstore_zone_info *pstore_zone_info;
>  	_##name_;						\
>  })
>  
> -static int __register_pstore_device(struct pstore_device_info *dev)
> +/**
> + * register_pstore_device() - register device to pstore/blk
> + *
> + * @ops:	operations to access the device.
> + * @total_size: The total size in bytes pstore/blk can use. It must be greater
> + *		than 4096 and be multiple of 4096.
> + * @flags:	Refer to macro starting with PSTORE_FLAGS defined in
> + *		linux/pstore.h. It means what front-ends this device support.
> + *		Zero means all backends for compatible.
> + */
> +int register_pstore_device(const struct pstore_zone_ops *ops,
> +		unsigned long total_size, unsigned int flags)
>  {
>  	int ret;
>  
> -	lockdep_assert_held(&pstore_blk_lock);
> -
> -	if (!dev || !dev->total_size || !dev->ops ||
> -	    !dev->ops->read || !dev->ops->write)
> +	if (!ops || !ops->read || !ops->write || !total_size)
>  		return -EINVAL;
>  
>  	/* someone already registered before */
> -	if (pstore_zone_info)
> -		return -EBUSY;
> +	mutex_lock(&pstore_blk_lock);
> +	if (pstore_zone_info) {
> +		ret = -EBUSY;
> +		goto out_unlock;
> +	}
>  
>  	pstore_zone_info = kzalloc(sizeof(struct pstore_zone_info), GFP_KERNEL);
> -	if (!pstore_zone_info)
> -		return -ENOMEM;
> +	if (!pstore_zone_info) {
> +		ret = -ENOMEM;
> +		goto out_unlock;
> +	}
>  
>  	/* zero means not limit on which backends to attempt to store. */
> -	if (!dev->flags)
> -		dev->flags = UINT_MAX;
> +	if (!flags)
> +		flags = UINT_MAX;
>  
>  #define verify_size(name, alignsize, enabled) {				\
>  		long _##name_;						\
> @@ -134,63 +147,40 @@ static int __register_pstore_device(struct pstore_device_info *dev)
>  		pstore_zone_info->name = _##name_;			\
>  	}
>  
> -	verify_size(kmsg_size, 4096, dev->flags & PSTORE_FLAGS_DMESG);
> -	verify_size(pmsg_size, 4096, dev->flags & PSTORE_FLAGS_PMSG);
> -	verify_size(console_size, 4096, dev->flags & PSTORE_FLAGS_CONSOLE);
> -	verify_size(ftrace_size, 4096, dev->flags & PSTORE_FLAGS_FTRACE);
> +	verify_size(kmsg_size, 4096, flags & PSTORE_FLAGS_DMESG);
> +	verify_size(pmsg_size, 4096, flags & PSTORE_FLAGS_PMSG);
> +	verify_size(console_size, 4096, flags & PSTORE_FLAGS_CONSOLE);
> +	verify_size(ftrace_size, 4096, flags & PSTORE_FLAGS_FTRACE);
>  #undef verify_size
>  
> -	pstore_zone_info->total_size = dev->total_size;
> +	pstore_zone_info->total_size = total_size;
>  	pstore_zone_info->max_reason = max_reason;
> -	pstore_zone_info->ops = dev->ops;
> +	pstore_zone_info->ops = ops;
>  
>  	ret = register_pstore_zone(pstore_zone_info);
>  	if (ret) {
>  		kfree(pstore_zone_info);
>  		pstore_zone_info = NULL;
>  	}
> +out_unlock:
> +	mutex_unlock(&pstore_blk_lock);
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(register_pstore_device);
> +
>  /**
> - * register_pstore_device() - register non-block device to pstore/blk
> - *
> - * @dev: non-block device information
> + * unregister_pstore_device() - unregister a device from pstore/blk
>   *
> - * Return:
> - * * 0		- OK
> - * * Others	- something error.
> + * @ops: device operations
>   */
> -int register_pstore_device(struct pstore_device_info *dev)
> +void unregister_pstore_device(const struct pstore_zone_ops *ops)
>  {
> -	int ret;
> -
>  	mutex_lock(&pstore_blk_lock);
> -	ret = __register_pstore_device(dev);
> -	mutex_unlock(&pstore_blk_lock);
> -
> -	return ret;
> -}
> -EXPORT_SYMBOL_GPL(register_pstore_device);
> -
> -static void __unregister_pstore_device(struct pstore_device_info *dev)
> -{
> -	lockdep_assert_held(&pstore_blk_lock);
> -	if (pstore_zone_info && pstore_zone_info->ops == dev->ops) {
> +	if (pstore_zone_info && pstore_zone_info->ops == ops) {
>  		unregister_pstore_zone(pstore_zone_info);
>  		kfree(pstore_zone_info);
>  		pstore_zone_info = NULL;
>  	}
> -}
> -
> -/**
> - * unregister_pstore_device() - unregister non-block device from pstore/blk
> - *
> - * @dev: non-block device information
> - */
> -void unregister_pstore_device(struct pstore_device_info *dev)
> -{
> -	mutex_lock(&pstore_blk_lock);
> -	__unregister_pstore_device(dev);
>  	mutex_unlock(&pstore_blk_lock);
>  }
>  EXPORT_SYMBOL_GPL(unregister_pstore_device);
> @@ -271,7 +261,6 @@ static int __init pstore_blk_init(void)
>  {
>  	char bdev_name[BDEVNAME_SIZE];
>  	struct block_device *bdev;
> -	struct pstore_device_info dev;
>  	int ret = -ENODEV;
>  	fmode_t mode = FMODE_READ | FMODE_WRITE | FMODE_EXCL;
>  	sector_t nr_sects;
> @@ -306,11 +295,8 @@ static int __init pstore_blk_init(void)
>  	/* psblk_bdev must be assigned before register to pstore/blk */
>  	psblk_bdev = bdev;
>  
> -	memset(&dev, 0, sizeof(dev));
> -	dev.ops = &pstore_blk_zone_ops;
> -	dev.total_size = nr_sects << SECTOR_SHIFT;
> -
> -	ret = register_pstore_device(&dev);
> +	ret = register_pstore_device(&pstore_blk_zone_ops,
> +			nr_sects << SECTOR_SHIFT, 0);
>  	if (ret)
>  		goto err_put_bdev;
>  
> @@ -327,11 +313,9 @@ late_initcall(pstore_blk_init);
>  
>  static void __exit pstore_blk_exit(void)
>  {
> -	struct pstore_device_info dev = { .ops = &pstore_blk_zone_ops };
> -
>  	if (!psblk_bdev)
>  		return;
> -	unregister_pstore_device(&dev);
> +	unregister_pstore_device(&pstore_blk_zone_ops);
>  	blkdev_put(psblk_bdev, FMODE_READ | FMODE_WRITE | FMODE_EXCL);
>  }
>  module_exit(pstore_blk_exit);
> diff --git a/include/linux/pstore_blk.h b/include/linux/pstore_blk.h
> index 095a44ce5e122c..0abd412a6cb3e3 100644
> --- a/include/linux/pstore_blk.h
> +++ b/include/linux/pstore_blk.h
> @@ -7,24 +7,9 @@
>  #include <linux/pstore.h>
>  #include <linux/pstore_zone.h>
>  
> -/**
> - * struct pstore_device_info - back-end pstore/blk driver structure.
> - *
> - * @total_size: The total size in bytes pstore/blk can use. It must be greater
> - *		than 4096 and be multiple of 4096.
> - * @flags:	Refer to macro starting with PSTORE_FLAGS defined in
> - *		linux/pstore.h. It means what front-ends this device support.
> - *		Zero means all backends for compatible.
> - * @ops:	operations to access the device.
> - */
> -struct pstore_device_info {
> -	unsigned long total_size;
> -	unsigned int flags;
> -	const struct pstore_zone_ops *ops;
> -};
> -
> -int  register_pstore_device(struct pstore_device_info *dev);
> -void unregister_pstore_device(struct pstore_device_info *dev);
> +int register_pstore_device(const struct pstore_zone_ops *ops,
> +		unsigned long total_size, unsigned int flags);
> +void unregister_pstore_device(const struct pstore_zone_ops *ops);
>  
>  /**
>   * struct pstore_blk_config - the pstore_blk backend configuration
> -- 
> 2.28.0
> 

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
