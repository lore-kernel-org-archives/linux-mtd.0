Return-Path: <SRS0=w4g4=5D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26DABC5ACD6
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2020 18:36:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E23AA20785
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2020 18:35:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uZFJkZgH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lYD74A1Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E23AA20785
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ADZHhCyPDQZpK/mHhezuS31KoDjGodhN0/hRQ6RzTI=; b=uZFJkZgHPd8KXk
	IPmdePbbSpUH/qZiAKceW7hp8A66wQRPraREhcx2aJJJ2ZrIvB+DP69oAW6wh64QisQyZ0rmiMbwN
	zXYXmNK+cPFIp3MOO8gBdkvyjbE03EYcPbo2RM3/MekOQeEvmMKpsu+7zhSsLtl2b86JoXhHJcktm
	SSN0QemY8Hk+8NIfd1oCnPsNkhoNn/GiTFexpnK4TIitQ1YU4TEqSm8qZGjWQgwolW44bCZsBo+Ji
	7YpDqZ85Don5o042tGkHvHrW/M338LaEvpfeSulp0GNNNXlsjX+2+/5VQOvgtYsc2zAc4LPcxo96A
	wqjW2PZ4U92dEEDihI1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEdXi-0004Ab-JA; Wed, 18 Mar 2020 18:35:50 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEdXe-0004AC-LT
 for linux-mtd@lists.infradead.org; Wed, 18 Mar 2020 18:35:48 +0000
Received: by mail-pj1-x1044.google.com with SMTP id m15so1565174pje.3
 for <linux-mtd@lists.infradead.org>; Wed, 18 Mar 2020 11:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=v55B2a/Zwvx3CXP9CMik1IV/79dcJ/3V1375/GTUm0Y=;
 b=lYD74A1YEKqfQWcC0viSFqQGwnB5cSq1cXqUxYr3DRclIOEclTe4uE4xnKn+c/TFEI
 TgFMYTuBldFoGEpSwn518h1PhSB4dXuG1kDJwYT2qChOUHkeTkAc1KpM52NgW6tz9dNw
 AQYpcDgNXsnZiPBoWJOsT4uyTHysJkmTwtsLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=v55B2a/Zwvx3CXP9CMik1IV/79dcJ/3V1375/GTUm0Y=;
 b=fse+vJxw3vKl1QMJZZHvlrDq6hY+t7RwDmjMDcfDmqIDIp05h0/RMMLR9b825aajJ0
 TO9wXpIqn4SiRYXBB2TGOGpA/yv+/F8TnY2aWuqp5lehpS+9eROrArZdbPAI5UJv1nJ3
 pWg6CihU6HjdXA3z7z75OektoWgfQLhrLdUsc2gUZcLYNxbo9XmcP4WNsggPnLzeDHw7
 GtGBjX+/Eo2oFYCiZr4ikmX0XXO8PWMAlSVvm/cRDzKJS7HyyKYpoNYFOu4Zp1wM8C3r
 oP/VzWhpx7x+kqdx5UT8iDaQ5eKDtUD5MyhNDDy923LJudftwA3X9NKrhw2og4D10MLu
 dQTQ==
X-Gm-Message-State: ANhLgQ3y0uE1kPHu5TBk2uBWods6ihwID8ricw38Ol/RVm82Us3rz0b5
 XmkDrnECAI4POlMo0mO5kM08EA==
X-Google-Smtp-Source: ADFU+vuyzSHt8QatiGLYf6IYtJjZw1cG3ovV9vuH8DlYYljpVAflAybcftSCvIkQOgrM3h9WTPyyOg==
X-Received: by 2002:a17:902:710c:: with SMTP id
 a12mr5020050pll.283.1584556545656; 
 Wed, 18 Mar 2020 11:35:45 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id o33sm3249796pje.19.2020.03.18.11.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 11:35:44 -0700 (PDT)
Date: Wed, 18 Mar 2020 11:35:43 -0700
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: Re: [PATCH v2 07/11] pstore/blk: skip broken zone for mtd device
Message-ID: <202003181131.3A8F861F@keescook>
References: <1581078355-19647-1-git-send-email-liaoweixiong@allwinnertech.com>
 <1581078355-19647-8-git-send-email-liaoweixiong@allwinnertech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1581078355-19647-8-git-send-email-liaoweixiong@allwinnertech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_113546_705932_D47A15E0 
X-CRM114-Status: GOOD (  27.47  )
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

On Fri, Feb 07, 2020 at 08:25:51PM +0800, WeiXiong Liao wrote:
> It's one of a series of patches for adaptive to MTD device.
> 
> MTD device is not block device. As the block of flash (MTD device) will
> be broken, it's necessary for pstore/blk to skip the broken block
> (bad block).
> 
> If device drivers return -ENEXT, pstore/blk will try next zone of dmesg.
> 
> Signed-off-by: WeiXiong Liao <liaoweixiong@allwinnertech.com>
> ---
>  Documentation/admin-guide/pstore-block.rst |  3 +-
>  fs/pstore/blkzone.c                        | 74 +++++++++++++++++++++++-------
>  include/linux/blkoops.h                    |  4 +-
>  include/linux/pstore_blk.h                 |  4 ++
>  4 files changed, 66 insertions(+), 19 deletions(-)
> 
> diff --git a/Documentation/admin-guide/pstore-block.rst b/Documentation/admin-guide/pstore-block.rst
> index c8a5f68960c3..be865dfc1a28 100644
> --- a/Documentation/admin-guide/pstore-block.rst
> +++ b/Documentation/admin-guide/pstore-block.rst
> @@ -188,7 +188,8 @@ The parameter @offset of these interface is the relative position of the device.
>  Normally the number of bytes read/written should be returned, while for error,
>  negative number will be returned. The following return numbers mean more:
>  
> --EBUSY: pstore/blk should try again later.
> +1. -EBUSY: pstore/blk should try again later.
> +#. -ENEXT: this zone is used or broken, pstore/blk should try next one.
>  
>  panic_write (for non-block device)
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> diff --git a/fs/pstore/blkzone.c b/fs/pstore/blkzone.c
> index 442e5a5bbfda..205aeff28992 100644
> --- a/fs/pstore/blkzone.c
> +++ b/fs/pstore/blkzone.c
> @@ -207,6 +207,9 @@ static int blkz_zone_write(struct blkz_zone *zone,
>  
>  	return 0;
>  set_dirty:
> +	/* no need to mark dirty if going to try next zone */
> +	if (wcnt == -ENEXT)
> +		return -ENEXT;
>  	atomic_set(&zone->dirty, true);
>  	/* flush dirty zones nicely */
>  	if (wcnt == -EBUSY && !is_on_panic())
> @@ -360,7 +363,11 @@ static int blkz_recover_dmesg_meta(struct blkz_context *cxt)
>  			return -EINVAL;
>  
>  		rcnt = info->read((char *)buf, len, zone->off);
> -		if (rcnt != len) {
> +		if (rcnt == -ENEXT) {
> +			pr_debug("%s with id %lu may be broken, skip\n",
> +					zone->name, i);
> +			continue;
> +		} else if (rcnt != len) {
>  			pr_err("read %s with id %lu failed\n", zone->name, i);
>  			return (int)rcnt < 0 ? (int)rcnt : -EIO;
>  		}
> @@ -650,24 +657,58 @@ static void blkz_write_kmsg_hdr(struct blkz_zone *zone,
>  		hdr->counter = 0;
>  }
>  
> +/*
> + * In case zone is broken, which may occur to MTD device, we try each zones,
> + * start at cxt->dmesg_write_cnt.
> + */
>  static inline int notrace blkz_dmesg_write_do(struct blkz_context *cxt,
>  		struct pstore_record *record)
>  {
> +	int ret = -EBUSY;
>  	size_t size, hlen;
>  	struct blkz_zone *zone;
> -	unsigned int zonenum;
> +	unsigned int i;
>  
> -	zonenum = cxt->dmesg_write_cnt;
> -	zone = cxt->dbzs[zonenum];
> -	if (unlikely(!zone))
> -		return -ENOSPC;
> -	cxt->dmesg_write_cnt = (zonenum + 1) % cxt->dmesg_max_cnt;
> +	for (i = 0; i < cxt->dmesg_max_cnt; i++) {
> +		unsigned int zonenum, len;
> +
> +		zonenum = (cxt->dmesg_write_cnt + i) % cxt->dmesg_max_cnt;
> +		zone = cxt->dbzs[zonenum];
> +		if (unlikely(!zone))
> +			return -ENOSPC;
>  
> -	pr_debug("write %s to zone id %d\n", zone->name, zonenum);
> -	blkz_write_kmsg_hdr(zone, record);
> -	hlen = sizeof(struct blkz_dmesg_header);
> -	size = min_t(size_t, record->size, zone->buffer_size - hlen);
> -	return blkz_zone_write(zone, FLUSH_ALL, record->buf, size, hlen);
> +		/* avoid destorying old data, allocate a new one */
> +		len = zone->buffer_size + sizeof(*zone->buffer);
> +		zone->oldbuf = zone->buffer;
> +		zone->buffer = kzalloc(len, GFP_KERNEL);
> +		if (!zone->buffer) {
> +			zone->buffer = zone->oldbuf;
> +			return -ENOMEM;
> +		}
> +		zone->buffer->sig = zone->oldbuf->sig;
> +
> +		pr_debug("write %s to zone id %d\n", zone->name, zonenum);
> +		blkz_write_kmsg_hdr(zone, record);
> +		hlen = sizeof(struct blkz_dmesg_header);
> +		size = min_t(size_t, record->size, zone->buffer_size - hlen);
> +		ret = blkz_zone_write(zone, FLUSH_ALL, record->buf, size, hlen);
> +		if (likely(!ret || ret != -ENEXT)) {
> +			cxt->dmesg_write_cnt = zonenum + 1;
> +			cxt->dmesg_write_cnt %= cxt->dmesg_max_cnt;
> +			/* no need to try next zone, free last zone buffer */
> +			kfree(zone->oldbuf);
> +			zone->oldbuf = NULL;
> +			return ret;
> +		}
> +
> +		pr_debug("zone %u may be broken, try next dmesg zone\n",
> +				zonenum);
> +		kfree(zone->buffer);
> +		zone->buffer = zone->oldbuf;
> +		zone->oldbuf = NULL;
> +	}
> +
> +	return -EBUSY;
>  }
>  
>  static int notrace blkz_dmesg_write(struct blkz_context *cxt,
> @@ -791,7 +832,6 @@ static int notrace blkz_pstore_write(struct pstore_record *record)
>  	}
>  }
>  
> -#define READ_NEXT_ZONE ((ssize_t)(-1024))
>  static struct blkz_zone *blkz_read_next_zone(struct blkz_context *cxt)
>  {
>  	struct blkz_zone *zone = NULL;
> @@ -852,7 +892,7 @@ static ssize_t blkz_dmesg_read(struct blkz_zone *zone,
>  	if (blkz_read_dmesg_hdr(zone, record)) {
>  		atomic_set(&zone->buffer->datalen, 0);
>  		atomic_set(&zone->dirty, 0);
> -		return READ_NEXT_ZONE;
> +		return -ENEXT;
>  	}
>  	size -= sizeof(struct blkz_dmesg_header);
>  
> @@ -877,7 +917,7 @@ static ssize_t blkz_dmesg_read(struct blkz_zone *zone,
>  	if (unlikely(blkz_zone_read(zone, record->buf + hlen, size,
>  				sizeof(struct blkz_dmesg_header)) < 0)) {
>  		kfree(record->buf);
> -		return READ_NEXT_ZONE;
> +		return -ENEXT;
>  	}
>  
>  	return size + hlen;
> @@ -891,7 +931,7 @@ static ssize_t blkz_record_read(struct blkz_zone *zone,
>  
>  	buf = (struct blkz_buffer *)zone->oldbuf;
>  	if (!buf)
> -		return READ_NEXT_ZONE;
> +		return -ENEXT;
>  
>  	size = atomic_read(&buf->datalen);
>  	start = atomic_read(&buf->start);
> @@ -943,7 +983,7 @@ static ssize_t blkz_pstore_read(struct pstore_record *record)
>  	}
>  
>  	ret = readop(zone, record);
> -	if (ret == READ_NEXT_ZONE)
> +	if (ret == -ENEXT)
>  		goto next_zone;
>  	return ret;
>  }
> diff --git a/include/linux/blkoops.h b/include/linux/blkoops.h
> index 8f40f225545d..71c596fd4cc8 100644
> --- a/include/linux/blkoops.h
> +++ b/include/linux/blkoops.h
> @@ -27,6 +27,7 @@
>   *	On error, negative number should be returned. The following returning
>   *	number means more:
>   *	  -EBUSY: pstore/blk should try again later.
> + *	  -ENEXT: this zone is used or broken, pstore/blk should try next one.
>   * @panic_write:
>   *	The write operation only used for panic.
>   *
> @@ -45,7 +46,8 @@ struct blkoops_device {
>  
>  /*
>   * Panic write for block device who should write alignmemt to SECTOR_SIZE.
> - * On success, zero should be returned. Others mean error.
> + * On success, zero should be returned. Others mean error except that -ENEXT
> + * means the zone is used or broken, pstore/blk should try next one.
>   */
>  typedef int (*blkoops_blk_panic_write_op)(const char *buf, sector_t start_sect,
>  		sector_t sects);
> diff --git a/include/linux/pstore_blk.h b/include/linux/pstore_blk.h
> index 77704c1b404a..bbbe4fe37f7c 100644
> --- a/include/linux/pstore_blk.h
> +++ b/include/linux/pstore_blk.h
> @@ -6,6 +6,9 @@
>  #include <linux/types.h>
>  #include <linux/blkdev.h>
>  
> +/* read/write function return -ENEXT means try next zone */
> +#define ENEXT ((ssize_t)(1024))

I really don't like inventing errno numbers. Can you just reuse an
existing (but non-block) errno like ESRCH or ENOMSG or something?

> +
>  /**
>   * struct blkz_info - backend blkzone driver structure
>   *
> @@ -42,6 +45,7 @@
>   *	On error, negative number should be returned. The following returning
>   *	number means more:
>   *	  -EBUSY: pstore/blk should try again later.
> + *	  -ENEXT: this zone is used or broken, pstore/blk should try next one.
>   * @panic_write:
>   *	The write operation only used for panic. It's optional if you do not
>   *	care panic record. If panic occur but blkzone do not recover yet, the
> -- 
> 1.9.1
> 

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
