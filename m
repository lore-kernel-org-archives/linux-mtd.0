Return-Path: <SRS0=w4g4=5D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1293BC10DCE
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2020 18:47:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD2E32076D
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2020 18:47:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GfNEcwyy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M2MIpHhM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD2E32076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVvrKXXXgm+/mCNy/4O1MBXybSWVtakKFMkezUdf4Mw=; b=GfNEcwyy1y0jfS
	IwsKdeo29DzvJhXQzsNZ2rfqrCxoA+HJhBkIkE9LinDnLp2/nVEUQBj0rLL0yJt4a6VBi5hkZhM3W
	t2AIsij2aOfqDw+zu3p0mjUyOObRzUs+CO0WPnKfjgAR7lCaQNF4ZIgUQpotkfcE/vYVcNoKenh1G
	eJfMrZMHCv1lGTc/DQCLviO7+tLwr4mcoX7N/+WR0iUoMrqY1mqTLOqA5sJI8mazONylBx659fedP
	R5yeRTuSbVdCAAuwEM+laLAjImqjQvIaQcQmVQEX/Uq053anQ4wm5K9IQ+YoP32eXDhA2WqOkzfas
	cG35H2c0qO9C89iTCNqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEdiw-0008SC-Vd; Wed, 18 Mar 2020 18:47:26 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEdit-0008Rq-GA
 for linux-mtd@lists.infradead.org; Wed, 18 Mar 2020 18:47:25 +0000
Received: by mail-pf1-x442.google.com with SMTP id 2so14341984pfg.12
 for <linux-mtd@lists.infradead.org>; Wed, 18 Mar 2020 11:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4RNKFU+ZJi4L4AqhMrPyVKFF7dv4MRhXQ9q4lfcuDPE=;
 b=M2MIpHhMNCv0YOyKf5uJ7FEzjprOaQOsNk/6IK5iPyXjCKSuJ9aYuKLoLjUPfrxk3q
 RwbQ8x7F3wPLuJj49VDd2qZiOeY0Wh7I6/eEWUSkfk3LziWjvIUddD9Me829bjOvLlQK
 lemzRtBvgwLkYWRrFifXEtc/T98ddw/OQnOog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4RNKFU+ZJi4L4AqhMrPyVKFF7dv4MRhXQ9q4lfcuDPE=;
 b=ijB9XkQP+3H0H6gzyTN2rkf5gXofIoTTHroX/lIwm0IP6yYZxayW7Z0zpk4eE3jF6y
 caaMDr+tfgoRtzSK+CFgw8g9c6uQY0Cm0r0p87YD77hGRyZwfolxYL1OvBMuv/jcj+PL
 c7bb0ya2dVRiQSFYZ+x3TGeH0LSVekRmJZbyB6vaxCsT1BrNZZeL9CCkeyn7EoTZGE5h
 9nygxkBd6VSQcJWrwTuyMSkVk9Ic4fow49npUpQmo7D47lthcPKs7IKCiMTFeKvKI6nU
 2S0TLcAwJV++uy9l2OaYRSEb3MTy92eILhjVjil3BqgrjJaUuqe8t9elgZNaL5CUazee
 VxBA==
X-Gm-Message-State: ANhLgQ2QkGUie61B75bafh0fscGsZn5rZ1kVnbS+Mc1rNChgqT1pARW1
 4hNhIg8zasstmrgWjodqq8zVsQ==
X-Google-Smtp-Source: ADFU+vsmPgtkbZ7sbpQemn+32frJFMeX0HI90UxTYTcUumetCAWKNki7U7meshbQoWPNvDxJsMGO/Q==
X-Received: by 2002:a63:3753:: with SMTP id g19mr6338589pgn.262.1584557242793; 
 Wed, 18 Mar 2020 11:47:22 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id d7sm7520039pfa.106.2020.03.18.11.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 11:47:21 -0700 (PDT)
Date: Wed, 18 Mar 2020 11:47:20 -0700
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: Re: [PATCH v2 09/11] pstore/blk: blkoops: support special removing
 jobs for dmesg.
Message-ID: <202003181144.BD1DE93@keescook>
References: <1581078355-19647-1-git-send-email-liaoweixiong@allwinnertech.com>
 <1581078355-19647-10-git-send-email-liaoweixiong@allwinnertech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1581078355-19647-10-git-send-email-liaoweixiong@allwinnertech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_114723_541203_AAF52B9C 
X-CRM114-Status: GOOD (  27.82  )
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

On Fri, Feb 07, 2020 at 08:25:53PM +0800, WeiXiong Liao wrote:
> It's one of a series of patches for adaptive to MTD device.
> 
> MTD device is not block device. To write to flash device on MTD, erase
> must to be done before. However, pstore/blk just set datalen as 0 when
> remove, which is not enough for mtd device. That's why this patch here,
> to support special jobs when removing pstore/blk record.
> 
> Signed-off-by: WeiXiong Liao <liaoweixiong@allwinnertech.com>
> ---
>  Documentation/admin-guide/pstore-block.rst |  9 +++++++++
>  fs/pstore/blkoops.c                        |  4 +++-
>  fs/pstore/blkzone.c                        |  9 ++++++++-
>  include/linux/blkoops.h                    | 10 ++++++++++
>  include/linux/pstore_blk.h                 | 11 +++++++++++
>  5 files changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/pstore-block.rst b/Documentation/admin-guide/pstore-block.rst
> index 299142b3d8e6..1735476621df 100644
> --- a/Documentation/admin-guide/pstore-block.rst
> +++ b/Documentation/admin-guide/pstore-block.rst
> @@ -200,6 +200,15 @@ negative number will be returned. The following return numbers mean more:
>  1. -EBUSY: pstore/blk should try again later.
>  #. -ENEXT: this zone is used or broken, pstore/blk should try next one.
>  
> +erase
> +~~~~~
> +
> +It's generic erase API for pstore/blk, which is requested by non-block device.
> +It will be called while pstore record is removing. It's required only when the
> +device has special removing jobs. For example, MTD device tries to erase block.
> +
> +Normally zero should be returned, otherwise it indicates an error.
> +
>  panic_write (for non-block device)
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  
> diff --git a/fs/pstore/blkoops.c b/fs/pstore/blkoops.c
> index 01170b344f00..7cf4731e52f7 100644
> --- a/fs/pstore/blkoops.c
> +++ b/fs/pstore/blkoops.c
> @@ -164,6 +164,7 @@ int blkoops_register_device(struct blkoops_device *bo_dev)
>  	bzinfo->dump_oops = dump_oops;
>  	bzinfo->read = bo_dev->read;
>  	bzinfo->write = bo_dev->write;
> +	bzinfo->erase = bo_dev->erase;
>  	bzinfo->panic_write = bo_dev->panic_write;
>  	bzinfo->name = "blkoops";
>  	bzinfo->owner = THIS_MODULE;
> @@ -383,10 +384,11 @@ int blkoops_register_blkdev(unsigned int major, unsigned int flags,
>  	bo_dev.total_size = blkoops_bdev_size(bdev);
>  	if (bo_dev.total_size == 0)
>  		goto err_put_bdev;
> -	bo_dev.panic_write = panic_write ? blkoops_blk_panic_write : NULL;
>  	bo_dev.flags = flags;
>  	bo_dev.read = blkoops_generic_blk_read;
>  	bo_dev.write = blkoops_generic_blk_write;
> +	bo_dev.erase = NULL;
> +	bo_dev.panic_write = panic_write ? blkoops_blk_panic_write : NULL;
>  
>  	ret = blkoops_register_device(&bo_dev);
>  	if (ret)

I think this patch, like the prior, needs to be reordered in the series.
How about adding

blkoops_register_device()

as a single patch, which is what provides support for the "non-block"
block devices? Then the blkoops_register_blkdev() can stand alone in the
first patch?

It just might be easier to review, since nothing uses
blkoops_register_device() until the mtd driver is added. So that
function and this patch would go together as a single "support non-block
devices" change.

> diff --git a/fs/pstore/blkzone.c b/fs/pstore/blkzone.c
> index 205aeff28992..a17fff77b875 100644
> --- a/fs/pstore/blkzone.c
> +++ b/fs/pstore/blkzone.c
> @@ -593,11 +593,18 @@ static inline bool blkz_ok(struct blkz_zone *zone)
>  static inline int blkz_dmesg_erase(struct blkz_context *cxt,
>  		struct blkz_zone *zone)
>  {
> +	size_t size;
> +
>  	if (unlikely(!blkz_ok(zone)))
>  		return 0;
>  
>  	atomic_set(&zone->buffer->datalen, 0);
> -	return blkz_zone_write(zone, FLUSH_META, NULL, 0, 0);
> +
> +	size = buffer_datalen(zone) + sizeof(*zone->buffer);
> +	if (cxt->bzinfo->erase)
> +		return cxt->bzinfo->erase(size, zone->off);
> +	else
> +		return blkz_zone_write(zone, FLUSH_META, NULL, 0, 0);
>  }
>  
>  static inline int blkz_record_erase(struct blkz_context *cxt,
> diff --git a/include/linux/blkoops.h b/include/linux/blkoops.h
> index bc7665d14a98..11cb3036ad5f 100644
> --- a/include/linux/blkoops.h
> +++ b/include/linux/blkoops.h
> @@ -33,6 +33,15 @@
>   *	number means more:
>   *	  -EBUSY: pstore/blk should try again later.
>   *	  -ENEXT: this zone is used or broken, pstore/blk should try next one.
> + * @erase:
> + *	The general (not panic) erase operation. It will be call while pstore
> + *	record is removing. It's required only when device have special
> + *	removing jobs, for example, MTD device try to erase block.
> + *
> + *	Both of the @size and @offset parameters on this interface are
> + *	the relative size of the space provided, not the whole disk/flash.
> + *
> + *	On success, 0 should be returned. Others mean error.
>   * @panic_write:
>   *	The write operation only used for panic.
>   *
> @@ -53,6 +62,7 @@ struct blkoops_device {
>  	unsigned long total_size;
>  	blkz_read_op read;
>  	blkz_write_op write;
> +	blkz_erase_op erase;
>  	blkz_write_op panic_write;
>  };
>  
> diff --git a/include/linux/pstore_blk.h b/include/linux/pstore_blk.h
> index bbbe4fe37f7c..9641969f888f 100644
> --- a/include/linux/pstore_blk.h
> +++ b/include/linux/pstore_blk.h
> @@ -46,6 +46,15 @@
>   *	number means more:
>   *	  -EBUSY: pstore/blk should try again later.
>   *	  -ENEXT: this zone is used or broken, pstore/blk should try next one.
> + * @erase:
> + *	The general (not panic) erase operation. It will be call while pstore
> + *	record is removing. It's required only when device have special
> + *	removing jobs, for example, MTD device try to erase block.
> + *
> + *	Both of the @size and @offset parameters on this interface are
> + *	the relative size of the space provided, not the whole disk/flash.
> + *
> + *	On success, 0 should be returned. Others mean error.
>   * @panic_write:
>   *	The write operation only used for panic. It's optional if you do not
>   *	care panic record. If panic occur but blkzone do not recover yet, the
> @@ -59,6 +68,7 @@
>   */
>  typedef ssize_t (*blkz_read_op)(char *, size_t, loff_t);
>  typedef ssize_t (*blkz_write_op)(const char *, size_t, loff_t);
> +typedef ssize_t (*blkz_erase_op)(size_t, loff_t);
>  struct blkz_info {
>  	struct module *owner;
>  	const char *name;
> @@ -71,6 +81,7 @@ struct blkz_info {
>  	int dump_oops;
>  	blkz_read_op read;
>  	blkz_write_op write;
> +	blkz_erase_op erase;
>  	blkz_write_op panic_write;
>  };
>  
> -- 
> 1.9.1
> 

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
