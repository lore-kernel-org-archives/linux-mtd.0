Return-Path: <SRS0=w4g4=5D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC12FC10DCE
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2020 18:43:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8429820780
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2020 18:43:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TJiohOIR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RNshLByR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8429820780
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mi8uaeP/6r/Yf5hYkyVjxs4OEW6sIM9D8Y9tSHcp0pY=; b=TJiohOIRBTBEcA
	JT02wJxbghuVvCJyRm3Rijv+F15/6jDWpIq5V/lw6+DjSj+yf6vXX+1hXyslciPTY4DZFon3bweHd
	MKydnDjI3LiDVwqokvRSk3904JRbM1p3Be6qu4rQjHgXoXEIt5Z9tZ/wWu1W9LHYCBh/QnEOhR3h0
	pUJpJ3QrGxwunYGfANmb1Se+jJ2WVj7rnVT+6Us31sKN0tIwGtUcjML0y3eudzbC6W349goGirNMJ
	xgW1FxJiG4ZyabNv/ezrQgtpgbR/4m69vgg8FkvGq6Poakx6TJA81lVGsSTflrfqg8XxNyF/c05RD
	C4GavdUTzSCFusqG2THA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEdeb-0006nQ-O4; Wed, 18 Mar 2020 18:42:57 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEdeY-0006mr-C5
 for linux-mtd@lists.infradead.org; Wed, 18 Mar 2020 18:42:56 +0000
Received: by mail-pj1-x1042.google.com with SMTP id bo3so1575904pjb.5
 for <linux-mtd@lists.infradead.org>; Wed, 18 Mar 2020 11:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FgQUeqczmCOiMLXJY/YgmlhiPodfwWFEQ6rmmnOqT2I=;
 b=RNshLByRet19hMEwb8FtxHQ4qbBwmjLc285o6H3HiHgrUaqRFtLN58W3KdnKNDFM4a
 IYWCrg7B/XijnDcoo2wLu4Gtt/R1vc/xnDhz0CeI9707c9g3g6nwxgPTVxujHeG0Vu5/
 ec96267kJA4rrGMPZ0HQHOE0rZODIqhj99ULQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FgQUeqczmCOiMLXJY/YgmlhiPodfwWFEQ6rmmnOqT2I=;
 b=TaSVdGYFYtRZVP9sJXK2PfiN9ECbpYJmoKdjgVF46cyTwfC3FbuxXOSfok5KNRFqYl
 IDqhLJKaWePfLLik7BMrFQ1qNOHu73ImJHSSRuWqHA/7J8sNeK5oq5OuVao4UwDGu2C5
 ctzHhH+5l6B6VkLyXITGcpUbFjyF5dESu70up7VK3J6PJwZo3QIWw8QEiFJ6aC/HEoQe
 +uJtz1MZuwM/m5SirAaUo+NHLekSpETEKwZaYUtGDtv0AcJ8YrXEAwT6FEP5SvjGlaVr
 yyPb/x0gi9+Ttw2fCNTUMeWYxfsUaZu93qnlUsQ/ORKQMg/3Ysag9yokxJZ5S0ptkggP
 KEvw==
X-Gm-Message-State: ANhLgQ2lCoo2TpMRLJd2qMImsMWHhKhieQ86sq7X4ggvvn/ReD6yuBFR
 LlFLOCeuYeEuJop3c6i6NFvg1Q==
X-Google-Smtp-Source: ADFU+vsRQSeuB84FI8YRbqpkqkMEhyPRSPoUqLTKWdOQ7eE+yK5gcWvfdV0oolcwy4+XxW2jmIZ3Cw==
X-Received: by 2002:a17:902:9349:: with SMTP id
 g9mr5374705plp.16.1584556973360; 
 Wed, 18 Mar 2020 11:42:53 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id l67sm3087706pjb.23.2020.03.18.11.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 11:42:52 -0700 (PDT)
Date: Wed, 18 Mar 2020 11:42:50 -0700
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: Re: [PATCH v2 08/11] blkoops: respect for device to pick recorders
Message-ID: <202003181136.5F115BFCC1@keescook>
References: <1581078355-19647-1-git-send-email-liaoweixiong@allwinnertech.com>
 <1581078355-19647-9-git-send-email-liaoweixiong@allwinnertech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1581078355-19647-9-git-send-email-liaoweixiong@allwinnertech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_114254_437936_4C48583D 
X-CRM114-Status: GOOD (  26.20  )
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
Cc: Rob Herring <robh@kernel.org>, Tony Luck <tony.luck@intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Colin Cross <ccross@android.com>,
 linux-mtd@lists.infradead.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In the subject and through-out:

s/recorders/pstore front-ends/

On Fri, Feb 07, 2020 at 08:25:52PM +0800, WeiXiong Liao wrote:
> It's one of a series of patches for adaptive to MTD device.

typo: adapting

> 
> MTD device is not block device. The sector of flash (MTD device) will be
> broken if erase over limited cycles. Avoid damaging block so fast, we
> can not write to a sector frequently. So, the recorders of pstore/blk
> like console and ftrace recorder should not be supported.
> 
> Besides, mtd device need aligned write/erase size. To avoid
> over-erasing/writing flash, we should keep a aligned cache and read old
> data to cache before write/erase, which make codes more complex. So,
> pmsg do not be supported now because it writes misaligned.
> 
> How about dmesg? Luckly, pstore/blk keeps several aligned chunks for
> dmesg and uses one by one for wear balance.
> 
> So, MTD device for pstore should pick recorders, that is why the patch
> here.
> 
> Signed-off-by: WeiXiong Liao <liaoweixiong@allwinnertech.com>
> ---
>  Documentation/admin-guide/pstore-block.rst |  9 +++++++++
>  fs/pstore/blkoops.c                        | 29 +++++++++++++++++++++--------
>  include/linux/blkoops.h                    | 14 +++++++++++++-
>  3 files changed, 43 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/admin-guide/pstore-block.rst b/Documentation/admin-guide/pstore-block.rst
> index be865dfc1a28..299142b3d8e6 100644
> --- a/Documentation/admin-guide/pstore-block.rst
> +++ b/Documentation/admin-guide/pstore-block.rst
> @@ -166,6 +166,15 @@ It is only required by block device which is registered by
>  ``blkoops_register_blkdev``.  It's the major device number of registered
>  devices, by which blkoops can get the matching driver for @blkdev.
>  
> +flags
> +~~~~~
> +
> +Refer to macro starting with *BLKOOPS_DEV_SUPPORT_* which is defined in
> +*linux/blkoops.h*. They tell us that which pstore/blk recorders this device
> +supports. Default zero means all recorders for compatible, witch is the same

typo: witch -> which

> +as BLKOOPS_DEV_SUPPORT_ALL. Recorder works only when chunk size is not zero
> +and device support.

There are already flags for this, please see "Supported frontends"
in include/linux/pstore.h

> +
>  total_size
>  ~~~~~~~~~~
>  
> diff --git a/fs/pstore/blkoops.c b/fs/pstore/blkoops.c
> index c76bab671b0b..01170b344f00 100644
> --- a/fs/pstore/blkoops.c
> +++ b/fs/pstore/blkoops.c
> @@ -128,9 +128,16 @@ int blkoops_register_device(struct blkoops_device *bo_dev)
>  		return -ENOMEM;
>  	}
>  
> -#define verify_size(name, defsize, alignsize) {				\
> -		long _##name_ = (name);					\
> -		if (_##name_ < 0)					\
> +	/* zero means all recorders for compatible */
> +	if (bo_dev->flags == BLKOOPS_DEV_SUPPORT_DEFAULT)
> +		bo_dev->flags = BLKOOPS_DEV_SUPPORT_ALL;
> +#define verify_size(name, defsize, alignsize, enable) {			\
> +		long _##name_;						\
> +		if (!(enable))						\
> +			_##name_ = 0;					\
> +		else if ((name) >= 0)					\
> +			_##name_ = (name);				\
> +		else							\
>  			_##name_ = (defsize);				\
>  		_##name_ = _##name_ <= 0 ? 0 : (_##name_ * 1024);	\
>  		if (_##name_ & ((alignsize) - 1)) {			\
> @@ -142,10 +149,14 @@ int blkoops_register_device(struct blkoops_device *bo_dev)
>  		bzinfo->name = _##name_;				\
>  	}
>  
> -	verify_size(dmesg_size, DEFAULT_DMESG_SIZE, 4096);
> -	verify_size(pmsg_size, DEFAULT_PMSG_SIZE, 4096);
> -	verify_size(console_size, DEFAULT_CONSOLE_SIZE, 4096);
> -	verify_size(ftrace_size, DEFAULT_FTRACE_SIZE, 4096);
> +	verify_size(dmesg_size, DEFAULT_DMESG_SIZE, 4096,
> +			bo_dev->flags & BLKOOPS_DEV_SUPPORT_DMESG);
> +	verify_size(pmsg_size, DEFAULT_PMSG_SIZE, 4096,
> +			bo_dev->flags & BLKOOPS_DEV_SUPPORT_PMSG);
> +	verify_size(console_size, DEFAULT_CONSOLE_SIZE, 4096,
> +			bo_dev->flags & BLKOOPS_DEV_SUPPORT_CONSOLE);
> +	verify_size(ftrace_size, DEFAULT_FTRACE_SIZE, 4096,
> +			bo_dev->flags & BLKOOPS_DEV_SUPPORT_FTRACE);

I'd kind of prefer this patch be moved much earlier in the series so
that the later additions of front-end support doesn't have to be touched
twice. i.e. when PMSG support is added, it is added as a whole here and
does the flag check in that patch, etc.

>  #undef verify_size
>  	dump_oops = !!(dump_oops < 0 ? DEFAULT_DUMP_OOPS : dump_oops);
>  
> @@ -336,6 +347,7 @@ static ssize_t blkoops_blk_panic_write(const char *buf, size_t size,
>   * register block device to blkoops
>   * @major: the major device number of registering device
>   * @panic_write: the write interface for panic case.
> + * @flags: Refer to macro starting with BLKOOPS_DEV_SUPPORT.
>   *
>   * It is ONLY used for block device to register to blkoops. In this case,
>   * the module parameter @blkdev must be valid. Generic read/write interfaces
> @@ -349,7 +361,7 @@ static ssize_t blkoops_blk_panic_write(const char *buf, size_t size,
>   * panic occurs but pstore/blk does not recover yet, the first zone of dmesg
>   * will be used.
>   */
> -int blkoops_register_blkdev(unsigned int major,
> +int blkoops_register_blkdev(unsigned int major, unsigned int flags,
>  		blkoops_blk_panic_write_op panic_write)
>  {
>  	struct block_device *bdev;
> @@ -372,6 +384,7 @@ int blkoops_register_blkdev(unsigned int major,
>  	if (bo_dev.total_size == 0)
>  		goto err_put_bdev;
>  	bo_dev.panic_write = panic_write ? blkoops_blk_panic_write : NULL;
> +	bo_dev.flags = flags;
>  	bo_dev.read = blkoops_generic_blk_read;
>  	bo_dev.write = blkoops_generic_blk_write;
>  
> diff --git a/include/linux/blkoops.h b/include/linux/blkoops.h
> index 71c596fd4cc8..bc7665d14a98 100644
> --- a/include/linux/blkoops.h
> +++ b/include/linux/blkoops.h
> @@ -6,6 +6,7 @@
>  #include <linux/types.h>
>  #include <linux/blkdev.h>
>  #include <linux/pstore_blk.h>
> +#include <linux/bitops.h>
>  
>  /**
>   * struct blkoops_device - backend blkoops driver structure.
> @@ -14,6 +15,10 @@
>   * blkoops_register_device(). If block device, you are strongly recommended
>   * to use blkoops_register_blkdev().
>   *
> + * @flags:
> + *	Refer to macro starting with BLKOOPS_DEV_SUPPORT_. These macros tell
> + *	us that which pstore/blk recorders this device supports. Zero means
> + *	all recorders for compatible.
>   * @total_size:
>   *	The total size in bytes pstore/blk can use. It must be greater than
>   *	4096 and be multiple of 4096.
> @@ -38,6 +43,13 @@
>   *	On error, negative number should be returned.
>   */
>  struct blkoops_device {
> +	unsigned int flags;
> +#define BLKOOPS_DEV_SUPPORT_ALL		UINT_MAX
> +#define BLKOOPS_DEV_SUPPORT_DEFAULT	(0)
> +#define BLKOOPS_DEV_SUPPORT_DMESG	BIT(0)
> +#define BLKOOPS_DEV_SUPPORT_PMSG	BIT(1)
> +#define BLKOOPS_DEV_SUPPORT_CONSOLE	BIT(2)
> +#define BLKOOPS_DEV_SUPPORT_FTRACE	BIT(3)
>  	unsigned long total_size;
>  	blkz_read_op read;
>  	blkz_write_op write;
> @@ -54,7 +66,7 @@ typedef int (*blkoops_blk_panic_write_op)(const char *buf, sector_t start_sect,
>  
>  int  blkoops_register_device(struct blkoops_device *bo_dev);
>  void blkoops_unregister_device(struct blkoops_device *bo_dev);
> -int  blkoops_register_blkdev(unsigned int major,
> +int  blkoops_register_blkdev(unsigned int major, unsigned int flags,
>  		blkoops_blk_panic_write_op panic_write);
>  void blkoops_unregister_blkdev(unsigned int major);
>  int  blkoops_blkdev_info(dev_t *devt, sector_t *nr_sects, sector_t *start_sect);
> -- 
> 1.9.1
> 

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
