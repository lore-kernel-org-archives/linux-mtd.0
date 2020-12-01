Return-Path: <SRS0=jbuo=FF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C72C64E7B
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Dec 2020 19:30:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA7BA2151B
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Dec 2020 19:30:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mS2TtzRF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GOKIK33t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA7BA2151B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9giHfJsXYyMgVDvfQhhql8EkgzqGBQO+kS0B0NyBI6g=; b=mS2TtzRFxAcasWYvqOVQrIE+J
	+8Jh0f+zqngnwcx+ctaQIH5nZghdd+5WqerpdUqqA1tUPE1YYVXainYZH9cJhYAkYtNZZJBNsYoU2
	b43sXQJm/AaMfLUcGjj8IqqYlBXSIWG719VMhD+w5Ywjo5ntTkJGiV8wE+mRjnKRYIrRQCjZu0uqr
	tEQAtzysYDmcdAQkHpfwFRIFQFi6yuTYH1/AOx6F1HqsdzaB7e/DI8hHET309OQ9FmOzlMck/pC24
	fC48Ye6jUrCw74AYXFQznjIQeWTSygor55+ywyZ9I/b5wKtMhulbrVCQ5E5F2chBgY8LGB30CX1Ee
	LGi9gVMmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkBL6-0005Hr-Gv; Tue, 01 Dec 2020 19:29:28 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkBL3-0005GF-42
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2020 19:29:26 +0000
Received: by mail-pg1-x541.google.com with SMTP id t3so1777330pgi.11
 for <linux-mtd@lists.infradead.org>; Tue, 01 Dec 2020 11:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uHc3+DnHK9PLE5XljsP938ZieTXyfac5v2OAwUm2/s4=;
 b=GOKIK33tiPHZO4211DGLpG7EwNj3KWK2pSnCu8JCq2zGxwOKPqup9Bbqf0L9TlH5/0
 5xuHv1A/RewFOkJvUQVCT4ev/69Bupx58syQ1yQ3xC3bCqmh0vs+x/1CBio8AYkiqACs
 3RBy+RUKhdaf/siED4BpuJA8o0bGWbEcQlsFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uHc3+DnHK9PLE5XljsP938ZieTXyfac5v2OAwUm2/s4=;
 b=JTmW+rPKewXlig5jnEKMqEVnBc3c3NyjE+UktJPfb8sIMVqq2w0d4HhRgyWj6P9RZw
 SpJkWXJ9HD423iV+uzChMfhTbpR3Q/6AImpWYbpvAR3M25MLB7eujsNP2kRPjBQSHqz0
 wa8avAWyGuJt5dLDQ1k6zquTwq9/bVr0XTBpkYadlXIoQAr+QomLVjUwynzoyPzKd22F
 stdSN7gQtwSYVI/xm62hBuTj/kwHZBJLuddxqKOhtm33Dyt032RJl4xauUEwZrGGPfWa
 p0zEmvQUHEJIPeZsCwetVGm5JY0B57MdrmROGhDYyQQ6xs2V6ol/KG5yvfGGlGOtGOQi
 tngQ==
X-Gm-Message-State: AOAM531hg96dBWk9g6sE9XzMFxibQQej1Ry5lKM73mIAuzHvfOamJWN6
 gBL1wfxBNk0zti0313bcrYXUNA==
X-Google-Smtp-Source: ABdhPJyr3YDxom7QSOfa+4VJ7zHhrXDxDhzEDzSN8T2kindZuUisgerVVrYnD4ja1rkt1ALtBGIo2A==
X-Received: by 2002:a63:2155:: with SMTP id s21mr3557222pgm.3.1606850962370;
 Tue, 01 Dec 2020 11:29:22 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id v23sm537501pfn.141.2020.12.01.11.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 11:29:21 -0800 (PST)
Date: Tue, 1 Dec 2020 11:29:20 -0800
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/9] pstore/blk: remove {un,}register_pstore_blk
Message-ID: <202012011128.CF6461B88@keescook>
References: <20201016132047.3068029-1-hch@lst.de>
 <20201016132047.3068029-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201016132047.3068029-4-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_142925_241492_8156D38A 
X-CRM114-Status: GOOD (  34.07  )
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

On Fri, Oct 16, 2020 at 03:20:41PM +0200, Christoph Hellwig wrote:
> This interface is entirely unused, so remove them and various bits of
> unreachable code.

Yeah, this is fair to remove -- there are no users. I'm not a fan of
dropping it, but it can come back if anyone wants to provide a full
generic block device implementation.

Reviewed-by: Kees Cook <keescook@chromium.org>


> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  Documentation/admin-guide/pstore-blk.rst |  8 +--
>  fs/pstore/blk.c                          | 79 ++----------------------
>  include/linux/pstore_blk.h               | 42 -------------
>  3 files changed, 7 insertions(+), 122 deletions(-)
> 
> diff --git a/Documentation/admin-guide/pstore-blk.rst b/Documentation/admin-guide/pstore-blk.rst
> index d9ec8b0572d3b2..84477621384d85 100644
> --- a/Documentation/admin-guide/pstore-blk.rst
> +++ b/Documentation/admin-guide/pstore-blk.rst
> @@ -151,13 +151,7 @@ otherwise KMSG_DUMP_MAX.
>  Configurations for driver
>  -------------------------
>  
> -Only a block device driver cares about these configurations. A block device
> -driver uses ``register_pstore_blk`` to register to pstore/blk.
> -
> -.. kernel-doc:: fs/pstore/blk.c
> -   :identifiers: register_pstore_blk
> -
> -A non-block device driver uses ``register_pstore_device`` with
> +A device driver uses ``register_pstore_device`` with
>  ``struct pstore_device_info`` to register to pstore/blk.
>  
>  .. kernel-doc:: fs/pstore/blk.c
> diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
> index fcd5563dde063c..7f8368e94b3604 100644
> --- a/fs/pstore/blk.c
> +++ b/fs/pstore/blk.c
> @@ -90,7 +90,6 @@ MODULE_PARM_DESC(blkdev, "block device for pstore storage");
>  static DEFINE_MUTEX(pstore_blk_lock);
>  static struct block_device *psblk_bdev;
>  static struct pstore_zone_info *pstore_zone_info;
> -static pstore_blk_panic_write_op blkdev_panic_write;
>  
>  struct bdev_info {
>  	dev_t devt;
> @@ -341,24 +340,7 @@ static ssize_t psblk_generic_blk_write(const char *buf, size_t bytes,
>  	return ret;
>  }
>  
> -static ssize_t psblk_blk_panic_write(const char *buf, size_t size,
> -		loff_t off)
> -{
> -	int ret;
> -
> -	if (!blkdev_panic_write)
> -		return -EOPNOTSUPP;
> -
> -	/* size and off must align to SECTOR_SIZE for block device */
> -	ret = blkdev_panic_write(buf, off >> SECTOR_SHIFT,
> -			size >> SECTOR_SHIFT);
> -	/* try next zone */
> -	if (ret == -ENOMSG)
> -		return ret;
> -	return ret ? -EIO : size;
> -}
> -
> -static int __register_pstore_blk(struct pstore_blk_info *info)
> +static int __register_pstore_blk(void)
>  {
>  	char bdev_name[BDEVNAME_SIZE];
>  	struct block_device *bdev;
> @@ -378,68 +360,34 @@ static int __register_pstore_blk(struct pstore_blk_info *info)
>  	}
>  
>  	/* only allow driver matching the @blkdev */
> -	if (!binfo.devt || (!best_effort &&
> -			    MAJOR(binfo.devt) != info->major)) {
> -		pr_debug("invalid major %u (expect %u)\n",
> -				info->major, MAJOR(binfo.devt));
> +	if (!binfo.devt) {
> +		pr_debug("no major\n");
>  		ret = -ENODEV;
>  		goto err_put_bdev;
>  	}
>  
>  	/* psblk_bdev must be assigned before register to pstore/blk */
>  	psblk_bdev = bdev;
> -	blkdev_panic_write = info->panic_write;
> -
> -	/* Copy back block device details. */
> -	info->devt = binfo.devt;
> -	info->nr_sects = binfo.nr_sects;
> -	info->start_sect = binfo.start_sect;
>  
>  	memset(&dev, 0, sizeof(dev));
> -	dev.total_size = info->nr_sects << SECTOR_SHIFT;
> -	dev.flags = info->flags;
> +	dev.total_size = binfo.nr_sects << SECTOR_SHIFT;
>  	dev.read = psblk_generic_blk_read;
>  	dev.write = psblk_generic_blk_write;
> -	dev.erase = NULL;
> -	dev.panic_write = info->panic_write ? psblk_blk_panic_write : NULL;
>  
>  	ret = __register_pstore_device(&dev);
>  	if (ret)
>  		goto err_put_bdev;
>  
>  	bdevname(bdev, bdev_name);
> -	pr_info("attached %s%s\n", bdev_name,
> -		info->panic_write ? "" : " (no dedicated panic_write!)");
> +	pr_info("attached %s (no dedicated panic_write!)\n", bdev_name);
>  	return 0;
>  
>  err_put_bdev:
>  	psblk_bdev = NULL;
> -	blkdev_panic_write = NULL;
>  	psblk_put_bdev(bdev, holder);
>  	return ret;
>  }
>  
> -/**
> - * register_pstore_blk() - register block device to pstore/blk
> - *
> - * @info: details on the desired block device interface
> - *
> - * Return:
> - * * 0		- OK
> - * * Others	- something error.
> - */
> -int register_pstore_blk(struct pstore_blk_info *info)
> -{
> -	int ret;
> -
> -	mutex_lock(&pstore_blk_lock);
> -	ret = __register_pstore_blk(info);
> -	mutex_unlock(&pstore_blk_lock);
> -
> -	return ret;
> -}
> -EXPORT_SYMBOL_GPL(register_pstore_blk);
> -
>  static void __unregister_pstore_blk(unsigned int major)
>  {
>  	struct pstore_device_info dev = { .read = psblk_generic_blk_read };
> @@ -449,24 +397,10 @@ static void __unregister_pstore_blk(unsigned int major)
>  	if (psblk_bdev && MAJOR(psblk_bdev->bd_dev) == major) {
>  		__unregister_pstore_device(&dev);
>  		psblk_put_bdev(psblk_bdev, holder);
> -		blkdev_panic_write = NULL;
>  		psblk_bdev = NULL;
>  	}
>  }
>  
> -/**
> - * unregister_pstore_blk() - unregister block device from pstore/blk
> - *
> - * @major: the major device number of device
> - */
> -void unregister_pstore_blk(unsigned int major)
> -{
> -	mutex_lock(&pstore_blk_lock);
> -	__unregister_pstore_blk(major);
> -	mutex_unlock(&pstore_blk_lock);
> -}
> -EXPORT_SYMBOL_GPL(unregister_pstore_blk);
> -
>  /* get information of pstore/blk */
>  int pstore_blk_get_config(struct pstore_blk_config *info)
>  {
> @@ -483,12 +417,11 @@ EXPORT_SYMBOL_GPL(pstore_blk_get_config);
>  
>  static int __init pstore_blk_init(void)
>  {
> -	struct pstore_blk_info info = { };
>  	int ret = 0;
>  
>  	mutex_lock(&pstore_blk_lock);
>  	if (!pstore_zone_info && best_effort && blkdev[0])
> -		ret = __register_pstore_blk(&info);
> +		ret = __register_pstore_blk();
>  	mutex_unlock(&pstore_blk_lock);
>  
>  	return ret;
> diff --git a/include/linux/pstore_blk.h b/include/linux/pstore_blk.h
> index 61e914522b0193..99564f93d77488 100644
> --- a/include/linux/pstore_blk.h
> +++ b/include/linux/pstore_blk.h
> @@ -7,48 +7,6 @@
>  #include <linux/pstore.h>
>  #include <linux/pstore_zone.h>
>  
> -/**
> - * typedef pstore_blk_panic_write_op - panic write operation to block device
> - *
> - * @buf: the data to write
> - * @start_sect: start sector to block device
> - * @sects: sectors count on buf
> - *
> - * Return: On success, zero should be returned. Others excluding -ENOMSG
> - * mean error. -ENOMSG means to try next zone.
> - *
> - * Panic write to block device must be aligned to SECTOR_SIZE.
> - */
> -typedef int (*pstore_blk_panic_write_op)(const char *buf, sector_t start_sect,
> -		sector_t sects);
> -
> -/**
> - * struct pstore_blk_info - pstore/blk registration details
> - *
> - * @major:	Which major device number to support with pstore/blk
> - * @flags:	The supported PSTORE_FLAGS_* from linux/pstore.h.
> - * @panic_write:The write operation only used for the panic case.
> - *		This can be NULL, but is recommended to avoid losing
> - *		crash data if the kernel's IO path or work queues are
> - *		broken during a panic.
> - * @devt:	The dev_t that pstore/blk has attached to.
> - * @nr_sects:	Number of sectors on @devt.
> - * @start_sect:	Starting sector on @devt.
> - */
> -struct pstore_blk_info {
> -	unsigned int major;
> -	unsigned int flags;
> -	pstore_blk_panic_write_op panic_write;
> -
> -	/* Filled in by pstore/blk after registration. */
> -	dev_t devt;
> -	sector_t nr_sects;
> -	sector_t start_sect;
> -};
> -
> -int  register_pstore_blk(struct pstore_blk_info *info);
> -void unregister_pstore_blk(unsigned int major);
> -
>  /**
>   * struct pstore_device_info - back-end pstore/blk driver structure.
>   *
> -- 
> 2.28.0
> 

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
