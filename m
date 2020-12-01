Return-Path: <SRS0=jbuo=FF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29ADAC64E7B
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Dec 2020 19:54:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABC6320870
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Dec 2020 19:54:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OuefqHXB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mKrS92qa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABC6320870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lU5m6slLU2OkN+UFoTppCG3M9PmotXd9BqlcUcW/NCo=; b=OuefqHXBvU5eZ254x3MDmXgAy
	z5tZP5GUixoP2y32iruPquKrPESlrJVftUSkPgA9/ljScz/2advLkVOWCgwTyvHlT0re0536R1TP/
	Gj+S5ZUbFr/2oaDGwM7+S/YFrLlOWDfhZbbrZ5R+ZgE+zvhGrA8p3utiephnwXAQJhWAMSr7mLV/z
	z9R5iMiNkKWxTg3ziFOdb+PZ1KBHIPKmuhjuHHZEp/a37n2W/zwrXnTLuMp3g4xclFiNev9lqCLcA
	yx+3JqDbUS6zPFnMgo+NmMFDaIowFXS4lQNCBV+imgAbBXSMBRlchb+EK49+SUgmHqHkrLhMXa0Kw
	Cj+gprjBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkBiM-00024K-Az; Tue, 01 Dec 2020 19:53:30 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkBiJ-00022I-T6
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2020 19:53:29 +0000
Received: by mail-pf1-x443.google.com with SMTP id b6so1818908pfp.7
 for <linux-mtd@lists.infradead.org>; Tue, 01 Dec 2020 11:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XC3Qhe317OJ0hZzdeId3fLznx80xlH5FZ74wj6e7ssA=;
 b=mKrS92qaZHAPG+6fvVKnHS4z2ywO/AedRO7DikxnJsnCwQUUZ9VIPrjmsX3GOTwOq8
 cwSJBbW2PVv3AGhwjQWcliOmqMfQZkVFdiLVS1vPvdo+ruu0Bcxwh/yOYVKBOQNiVU69
 NCg0SwCiPY/HKTIABgzTwbRBJ/V7hqx7w/ZRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XC3Qhe317OJ0hZzdeId3fLznx80xlH5FZ74wj6e7ssA=;
 b=TIGIvfM0zR+MyteeukNEgGOrdN2mVRjLOW/6FfDNgJLYs2TAt2wO81BeyT2OW5wJph
 KtFxVzrxafcjsubGZHSAlxov8N31k6xzfMsaHPKwPhRZ89hf5tIQQbI63OTK3ELgYsnN
 W1L3JabSeHQICSrtAWLh5TawRDh1Y8bzt07NAdedg3dnfItSLpJA3QlpyRL4hnkKj5o0
 lMi/0HPFWARZkNdyshNMo3yXL/kfQ0rVMRAyH+2ncP6rAx+QBSxdpMPtdQUoOPUFHKzs
 6W5tDedPZD71QZ2xIJeBfyMzJFp5C/X0BHF4c8/7YT752I29EuCkKWokuXTzdsR/gj/s
 e4Lg==
X-Gm-Message-State: AOAM532h/kd4U2aYNQsGKCou+OpeeUqGQKPWoGwEqv/SCLnXKdmazEHQ
 WcY30PHbL0IAPXBwfjFccg9uxg==
X-Google-Smtp-Source: ABdhPJyAWvD2svwlawu1o2Yy2ggsvDEA8gd5wyehMUTF0CiGBrXYbn1xwXvZNHPD9xkh4karGRmvug==
X-Received: by 2002:a62:158:0:b029:197:c89d:33a5 with SMTP id
 85-20020a6201580000b0290197c89d33a5mr4083334pfb.42.1606852405436; 
 Tue, 01 Dec 2020 11:53:25 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id s18sm598200pfc.5.2020.12.01.11.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 11:53:24 -0800 (PST)
Date: Tue, 1 Dec 2020 11:53:23 -0800
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 9/9] pstore/blk: don't depend on CONFIG_BLOCK
Message-ID: <202012011152.5CD7EAD@keescook>
References: <20201016132047.3068029-1-hch@lst.de>
 <20201016132047.3068029-10-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201016132047.3068029-10-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_145328_049229_CAFD9655 
X-CRM114-Status: GOOD (  24.70  )
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

On Fri, Oct 16, 2020 at 03:20:47PM +0200, Christoph Hellwig wrote:
> pstore-blk contains of two different layers:
> 
>  a) a tiny layer of sugar coating ontop of pstore-zone.  This part has
>     no dependencies on the block layer, and can be used e.g. by mtd
>  b) an implementation of a default fallback pstore zone backend for
>     block devices
> 
> Add an ifdef for the latter so that pstore-blk itself does not have to
> depend on CONFIG_BLOCK.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

AFAIU, this can't be done until the read/write changes from patch 8 are
adopted, so, for now, I'm not taking this either.

-Kees

> ---
>  fs/pstore/Kconfig | 2 +-
>  fs/pstore/blk.c   | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/pstore/Kconfig b/fs/pstore/Kconfig
> index e16a49ebfe546d..6eadb538316e52 100644
> --- a/fs/pstore/Kconfig
> +++ b/fs/pstore/Kconfig
> @@ -164,7 +164,7 @@ config PSTORE_ZONE
>  config PSTORE_BLK
>  	tristate "Log panic/oops to a block device"
>  	depends on PSTORE
> -	depends on BLOCK
> +	depends on BLOCK || !BLOCK
>  	select PSTORE_ZONE
>  	default n
>  	help
> diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
> index bd4eadfc9bd795..d3d25edb943cdd 100644
> --- a/fs/pstore/blk.c
> +++ b/fs/pstore/blk.c
> @@ -182,6 +182,7 @@ void unregister_pstore_device(const struct pstore_zone_ops *ops)
>  }
>  EXPORT_SYMBOL_GPL(unregister_pstore_device);
>  
> +#ifdef CONFIG_BLOCK
>  static struct file *psblk_file;
>  
>  static ssize_t psblk_generic_blk_read(char *buf, size_t bytes, loff_t pos)
> @@ -269,6 +270,7 @@ void __init pstore_blk_early_init(void)
>  	__pstore_blk_init(devname);
>  }
>  #endif /* MODULE */
> +#endif /* CONFIG_BLOCK */
>  
>  /* get information of pstore/blk */
>  int pstore_blk_get_config(struct pstore_blk_config *info)
> -- 
> 2.28.0
> 

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
