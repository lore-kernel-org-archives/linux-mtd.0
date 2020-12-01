Return-Path: <SRS0=jbuo=FF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D47C64E7A
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Dec 2020 19:41:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3BB2206F9
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Dec 2020 19:41:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="no8GLa/z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mRkRJ6Q6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3BB2206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cUkybUEDKaSjIW57ZRfpndKgOg8NsplPhESIxAL+538=; b=no8GLa/zuJjkWYEcZUJGbfE+z
	FvWrBXIJvuHS4pvyL9JAH0YefWVyu1rN51Wra2I5ngWUGVkkf2ZCngoSCbS34Bdqs/9sOK/5+2lmy
	elQRL88oqmRhhruUoDjqUscS7m28UTguvPLrL+3yrhYXUeOFRrYdVXMVcXBuxLmyaXPAM9YnHkSCd
	tskF8GoNxdYBTTyW18bc7PJcgojkfy9IkGAkOGw8kVjfWLICIsVJro8ctFBi0GpVQyEICQFKwQpxS
	uphIJ+eLM0nrel7EBSgxOmTkl7V+lhMUQPOFKvCVnpjev3Zeq96o2SAFfgpkotPRzOpJKtPKuRx3e
	3SbRaOmBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkBVr-0007Vp-73; Tue, 01 Dec 2020 19:40:35 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkBVo-0007Ud-Qc
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2020 19:40:33 +0000
Received: by mail-pj1-x1041.google.com with SMTP id ms7so1885326pjb.4
 for <linux-mtd@lists.infradead.org>; Tue, 01 Dec 2020 11:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2BDD6CsjIvFrZbWANWLZeGCBU13Uq75odWBuX37T8kI=;
 b=mRkRJ6Q6HwpjyKxMoRiMtZ3pS1uUIT/G5xuUFez4in34vsXCSysO+PdErJrlP8z1+j
 rc5b8IAhbMC47zb1/v1a3L58migC78Yyjgc6TcuRnNA87TYGqSrDL37o8HDEGbROp0Jv
 RfABQEm1ynHSXwGgA7egTZEn4UR3Uwsi1ty28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2BDD6CsjIvFrZbWANWLZeGCBU13Uq75odWBuX37T8kI=;
 b=Swz9EZPlUgFxYZu+4buNHYm3jEIJsIl/e25yMYkb1Ul70KWQXm8SU9kXsFQbWkdxkm
 jWNnLAC698mqnSty1UcOKmoxVhHgjIOSFBN9BCfaYCMBL5uGEZA+OgRub+mrwFN50ywR
 KE1Iu/bbaMPNcSTfiWxGX5oZvdxepgPh3pJPrXODAVipF7qCCIUehhBe8B5/DsPlixfv
 I3DEeh3AM1PpqD/ZRN99GJ+SSvu4dGX6OeUHMWM/leay8HqiHMNVl27ALf/aeTA1K+tF
 Rwp2dhVADNFz8/TCYF5GNkO72o9+iHdxDCG1hMW6Zsk9r9wx5TrBxP5VPELsujUm+X8E
 qvvg==
X-Gm-Message-State: AOAM5324EKte6vMvq+YI9q6bi/1pXhiEaQKBANHq17l7oAirFX/uD9Kr
 WhrtoRgw1mmrrc80GGq2GTNblA==
X-Google-Smtp-Source: ABdhPJxFQ+7SgypoxZ0m2CK5lpx5CBEA02jrkBDab7sOkAx2BY39vgwXHvfYN+IY2m6uUQIbUcXppQ==
X-Received: by 2002:a17:902:eb54:b029:da:29d7:cffd with SMTP id
 i20-20020a170902eb54b02900da29d7cffdmr4400902pli.28.1606851630463; 
 Tue, 01 Dec 2020 11:40:30 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id m4sm517209pfd.203.2020.12.01.11.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 11:40:29 -0800 (PST)
Date: Tue, 1 Dec 2020 11:40:28 -0800
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 5/9] pstore/blk: simplify the block device open / close
 path
Message-ID: <202012011138.5766F520D9@keescook>
References: <20201016132047.3068029-1-hch@lst.de>
 <20201016132047.3068029-6-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201016132047.3068029-6-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_144032_919530_53BA17AF 
X-CRM114-Status: GOOD (  31.64  )
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

On Fri, Oct 16, 2020 at 03:20:43PM +0200, Christoph Hellwig wrote:
> Remove the pointless psblk_get_bdev and psblk_put_bdev helper,
> and don't bother holding pstore_blk_lock over the block device
> open / close interactions given that they only happen first thing
> during module init and last thing during module exit.  Also don't
> bother with unregistering a zone info that did not come from the
> actually block backed code, as users like mtd have to unregister
> it themselves already.

I don't like this because it's changing too many things at once. Of the
stuff I don't want is:

- removal of checking for already-active zoneinfo (there can be only one)
- collapsing register_blk into _init (it seems clearer to me to keep
  them separate)

-Kees

> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/pstore/blk.c | 156 ++++++++++++------------------------------------
>  1 file changed, 38 insertions(+), 118 deletions(-)
> 
> diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
> index 3a2214ecf942ae..a8aa56cba96d59 100644
> --- a/fs/pstore/blk.c
> +++ b/fs/pstore/blk.c
> @@ -91,12 +91,6 @@ static DEFINE_MUTEX(pstore_blk_lock);
>  static struct block_device *psblk_bdev;
>  static struct pstore_zone_info *pstore_zone_info;
>  
> -struct bdev_info {
> -	dev_t devt;
> -	sector_t nr_sects;
> -	sector_t start_sect;
> -};
> -
>  #define check_size(name, alignsize) ({				\
>  	long _##name_ = (name);					\
>  	_##name_ = _##name_ <= 0 ? 0 : (_##name_ * 1024);	\
> @@ -205,75 +199,6 @@ void unregister_pstore_device(struct pstore_device_info *dev)
>  }
>  EXPORT_SYMBOL_GPL(unregister_pstore_device);
>  
> -/**
> - * psblk_get_bdev() - open block device
> - *
> - * @holder:	Exclusive holder identifier
> - * @info:	Information about bdev to fill in
> - *
> - * Return: pointer to block device on success and others on error.
> - *
> - * On success, the returned block_device has reference count of one.
> - */
> -static struct block_device *psblk_get_bdev(void *holder,
> -					   struct bdev_info *info)
> -{
> -	struct block_device *bdev = ERR_PTR(-ENODEV);
> -	fmode_t mode = FMODE_READ | FMODE_WRITE;
> -	sector_t nr_sects;
> -
> -	lockdep_assert_held(&pstore_blk_lock);
> -
> -	if (pstore_zone_info)
> -		return ERR_PTR(-EBUSY);
> -
> -	if (!blkdev[0])
> -		return ERR_PTR(-ENODEV);
> -
> -	if (holder)
> -		mode |= FMODE_EXCL;
> -	bdev = blkdev_get_by_path(blkdev, mode, holder);
> -	if (IS_ERR(bdev)) {
> -		dev_t devt;
> -
> -		devt = name_to_dev_t(blkdev);
> -		if (devt == 0)
> -			return ERR_PTR(-ENODEV);
> -		bdev = blkdev_get_by_dev(devt, mode, holder);
> -		if (IS_ERR(bdev))
> -			return bdev;
> -	}
> -
> -	nr_sects = part_nr_sects_read(bdev->bd_part);
> -	if (!nr_sects) {
> -		pr_err("not enough space for '%s'\n", blkdev);
> -		blkdev_put(bdev, mode);
> -		return ERR_PTR(-ENOSPC);
> -	}
> -
> -	if (info) {
> -		info->devt = bdev->bd_dev;
> -		info->nr_sects = nr_sects;
> -		info->start_sect = get_start_sect(bdev);
> -	}
> -
> -	return bdev;
> -}
> -
> -static void psblk_put_bdev(struct block_device *bdev, void *holder)
> -{
> -	fmode_t mode = FMODE_READ | FMODE_WRITE;
> -
> -	lockdep_assert_held(&pstore_blk_lock);
> -
> -	if (!bdev)
> -		return;
> -
> -	if (holder)
> -		mode |= FMODE_EXCL;
> -	blkdev_put(bdev, mode);
> -}
> -
>  static ssize_t psblk_generic_blk_read(char *buf, size_t bytes, loff_t pos)
>  {
>  	struct block_device *bdev = psblk_bdev;
> @@ -340,29 +265,39 @@ static ssize_t psblk_generic_blk_write(const char *buf, size_t bytes,
>  	return ret;
>  }
>  
> -static int __register_pstore_blk(void)
> +static int __init pstore_blk_init(void)
>  {
>  	char bdev_name[BDEVNAME_SIZE];
>  	struct block_device *bdev;
>  	struct pstore_device_info dev;
> -	struct bdev_info binfo;
> -	void *holder = blkdev;
>  	int ret = -ENODEV;
> -
> -	lockdep_assert_held(&pstore_blk_lock);
> +	fmode_t mode = FMODE_READ | FMODE_WRITE | FMODE_EXCL;
> +	sector_t nr_sects;
> +	
> +	if (!best_effort || !blkdev[0])
> +		return 0;
>  
>  	/* hold bdev exclusively */
> -	memset(&binfo, 0, sizeof(binfo));
> -	bdev = psblk_get_bdev(holder, &binfo);
> +	bdev = blkdev_get_by_path(blkdev, mode, blkdev);
>  	if (IS_ERR(bdev)) {
> -		pr_err("failed to open '%s'!\n", blkdev);
> -		return PTR_ERR(bdev);
> +		dev_t devt;
> +
> +		devt = name_to_dev_t(blkdev);
> +		if (devt == 0) {
> +			pr_err("failed to open '%s'!\n", blkdev);
> +			return -ENODEV;
> +		}
> +		bdev = blkdev_get_by_dev(devt, mode, blkdev);
> +		if (IS_ERR(bdev)) {
> +			pr_err("failed to open '%s'!\n", blkdev);
> +			return PTR_ERR(bdev);
> +		}
>  	}
>  
> -	/* only allow driver matching the @blkdev */
> -	if (!binfo.devt) {
> -		pr_debug("no major\n");
> -		ret = -ENODEV;
> +	nr_sects = part_nr_sects_read(bdev->bd_part);
> +	if (!nr_sects) {
> +		pr_err("not enough space for '%s'\n", blkdev);
> +		ret = -ENOSPC;
>  		goto err_put_bdev;
>  	}
>  
> @@ -370,11 +305,11 @@ static int __register_pstore_blk(void)
>  	psblk_bdev = bdev;
>  
>  	memset(&dev, 0, sizeof(dev));
> -	dev.total_size = binfo.nr_sects << SECTOR_SHIFT;
> +	dev.total_size = nr_sects << SECTOR_SHIFT;
>  	dev.read = psblk_generic_blk_read;
>  	dev.write = psblk_generic_blk_write;
>  
> -	ret = __register_pstore_device(&dev);
> +	ret = register_pstore_device(&dev);
>  	if (ret)
>  		goto err_put_bdev;
>  
> @@ -383,10 +318,22 @@ static int __register_pstore_blk(void)
>  	return 0;
>  
>  err_put_bdev:
> +	blkdev_put(bdev, FMODE_READ | FMODE_WRITE | FMODE_EXCL);
>  	psblk_bdev = NULL;
> -	psblk_put_bdev(bdev, holder);
>  	return ret;
>  }
> +late_initcall(pstore_blk_init);
> +
> +static void __exit pstore_blk_exit(void)
> +{
> +	struct pstore_device_info dev = { .read = psblk_generic_blk_read };
> +
> +	if (!psblk_bdev)
> +		return;
> +	unregister_pstore_device(&dev);
> +	blkdev_put(psblk_bdev, FMODE_READ | FMODE_WRITE | FMODE_EXCL);
> +}
> +module_exit(pstore_blk_exit);
>  
>  /* get information of pstore/blk */
>  int pstore_blk_get_config(struct pstore_blk_config *info)
> @@ -402,33 +349,6 @@ int pstore_blk_get_config(struct pstore_blk_config *info)
>  }
>  EXPORT_SYMBOL_GPL(pstore_blk_get_config);
>  
> -static int __init pstore_blk_init(void)
> -{
> -	int ret = 0;
> -
> -	mutex_lock(&pstore_blk_lock);
> -	if (!pstore_zone_info && best_effort && blkdev[0])
> -		ret = __register_pstore_blk();
> -	mutex_unlock(&pstore_blk_lock);
> -
> -	return ret;
> -}
> -late_initcall(pstore_blk_init);
> -
> -static void __exit pstore_blk_exit(void)
> -{
> -	struct pstore_device_info dev = { };
> -
> -	mutex_lock(&pstore_blk_lock);
> -	if (pstore_zone_info)
> -		dev.read = pstore_zone_info->read;
> -	__unregister_pstore_device(&dev);
> -	if (psblk_bdev)
> -		psblk_put_bdev(psblk_bdev, blkdev);
> -	mutex_unlock(&pstore_blk_lock);
> -}
> -module_exit(pstore_blk_exit);
> -
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("WeiXiong Liao <liaoweixiong@allwinnertech.com>");
>  MODULE_AUTHOR("Kees Cook <keescook@chromium.org>");
> -- 
> 2.28.0
> 

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
