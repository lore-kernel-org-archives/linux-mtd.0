Return-Path: <SRS0=jbuo=FF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E97AC64E7A
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Dec 2020 19:53:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8D3C20870
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Dec 2020 19:53:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PxTpeLE4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lQ28NspZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8D3C20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jfDuwmpowtidx374UEGoJlxGuS1e+291GmwB+5J0JvA=; b=PxTpeLE4v6FnHkw3TWm8qsYtj
	T7C41e2mm7JVM4uotE+m2eooPX6NW77CRd3DxKff3a9QhRqdJFA3S+2li3KrA9kEyOkF5mPEhUlIY
	Mtg0s8wVWG7YMViF+5N5n78g/fcNPTc7dOwwuO6vYULaQFICCh4fs3Q78BRH7WYTHnkkggfCIDeO+
	AQ8YxxYtj3SGDbAZf7Hx9zZcazPAPK2OlaLly8A8TwNKwx3H6+5iR/VOcZKTJjITEWQhKgcEUqX7y
	a//DuwcDZZD1WmcWQayXM0Lz7e7MjsPqKKn4KWhPnrYSz4KGSkrCmay0r+a736eQQA6Xt0b0R6Krd
	jQVKX/uIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkBhA-0001kC-MI; Tue, 01 Dec 2020 19:52:16 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkBh7-0001iZ-4z
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2020 19:52:14 +0000
Received: by mail-pg1-x544.google.com with SMTP id o4so1848047pgj.0
 for <linux-mtd@lists.infradead.org>; Tue, 01 Dec 2020 11:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kzcoYsY09fyusjT5AMkIO0g0ZNMleBgaxXfiFgISUoc=;
 b=lQ28NspZkvycAtydNG7uIXTEp4U/Dwnps4lM4S5J61bTMgToT3ekHkZ4ldLrjIA+c6
 UW9jW3yc8vIEzijsZyIFGjiPHtEaWK47UltWvHnKf07dgrZEOFLyE3dqGGpbC4nreGZr
 EKw9W1WvdCGuIIclLHRSfElEoy+TtEMaYA3U8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kzcoYsY09fyusjT5AMkIO0g0ZNMleBgaxXfiFgISUoc=;
 b=ODbN+FR8DkEAc/epDRifsSn4sUACZBGvOpArvPubYhi8ezpyy1ag7SmBOatzptBFCj
 17J67DutKHd4RhjHCk4uAoGYGcD5k6QPQVQ3kSTv57eZ7lpGc6Monk9PMo8kKgtwOK5Q
 OLAz5RDz1tUJIIUJxEV8Z9+PDrnDL5eWlydqNysq/mWfHwzk+68TW/LIeLn32CQWqaSq
 x2i+jllEB2GKPExGXzqoLSL9TxbvoApEJKZvbQ5kFGwF13WOmkFLHOKrmZJ0xrJOfrTr
 kTKJuy3XmxcwX5dovHLaVqXaVHq1o3nOL9qiDjCiZGyKS3GxYlxzO8Jh4ulcKz8ITnbm
 joEA==
X-Gm-Message-State: AOAM530FYaX55diMRxYabe94XP86kb65r4j3JdhdeQ3cHRe3TFG9E7cE
 XY1450/LYgtJQOpT3bi9pplJSw==
X-Google-Smtp-Source: ABdhPJzMWU5+9mu7siiwZJfzgeD0xT8seDOZ8bDgc/ZyIz6583gkbgGZeWUfMp43r8x8wLDqfQkn+A==
X-Received: by 2002:aa7:9244:0:b029:19a:b335:754b with SMTP id
 4-20020aa792440000b029019ab335754bmr3946028pfp.29.1606852331387; 
 Tue, 01 Dec 2020 11:52:11 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id v63sm511471pfb.217.2020.12.01.11.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 11:52:10 -0800 (PST)
Date: Tue, 1 Dec 2020 11:52:09 -0800
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 8/9] pstore/blk: use the normal block device I/O path
Message-ID: <202012011149.5650B9796@keescook>
References: <20201016132047.3068029-1-hch@lst.de>
 <20201016132047.3068029-9-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201016132047.3068029-9-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_145213_428859_E6F51235 
X-CRM114-Status: GOOD (  28.87  )
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

On Fri, Oct 16, 2020 at 03:20:46PM +0200, Christoph Hellwig wrote:
> Stop poking into block layer internals and just open the block device
> file an use kernel_read and kernel_write on it.  Note that this means
> the transformation from name_to_dev_t can't be used anymore, and proper
> block device file names must be used.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> [...]
> +
> +#ifdef MODULE
> +static int __init pstore_blk_init(void)
> +{
> +	return __pstore_blk_init(blkdev);
> +}
>  late_initcall(pstore_blk_init);
>  
>  static void __exit pstore_blk_exit(void)
>  {
> -	if (!psblk_bdev)
> +	if (!psblk_file)
>  		return;
>  	unregister_pstore_device(&pstore_blk_zone_ops);
> -	blkdev_put(psblk_bdev, FMODE_READ | FMODE_WRITE | FMODE_EXCL);
> +	fput(psblk_file);
>  }
>  module_exit(pstore_blk_exit);
> +#else /* MODULE */
> +/*
> + * During early boot the real root file system hasn't been mounted yet,
> + * and not device nodes are present yet.  Use the same scheme to find
> + * the device that we use for mounting the root file system.
> + */
> +void __init pstore_blk_early_init(void)
> +{
> +	const char devname[] = "/dev/pstore-blk";
> +	dev_t dev = name_to_dev_t(blkdev);
> +
> +	if (!dev)
> +		return;
> +	init_unlink(devname);
> +	init_mknod(devname, S_IFBLK | 0600, new_encode_dev(dev));
> +	__pstore_blk_init(devname);
> +}
> +#endif /* MODULE */

That the allowed naming conventions change based on _how_ pstore is
built seems very wrong to me.

While I do like the clean up to simplify the read/write activities, this
seems like totally the wrong approach here.

>  
>  /* get information of pstore/blk */
>  int pstore_blk_get_config(struct pstore_blk_config *info)
> diff --git a/include/linux/pstore_blk.h b/include/linux/pstore_blk.h
> index 0abd412a6cb3e3..7c06b9d6740e2a 100644
> --- a/include/linux/pstore_blk.h
> +++ b/include/linux/pstore_blk.h
> @@ -39,4 +39,6 @@ struct pstore_blk_config {
>   */
>  int pstore_blk_get_config(struct pstore_blk_config *info);
>  
> +void __init pstore_blk_early_init(void);
> +
>  #endif
> diff --git a/init/main.c b/init/main.c
> index 1af84337cb18d5..058cce64f70390 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -98,6 +98,7 @@
>  #include <linux/mem_encrypt.h>
>  #include <linux/kcsan.h>
>  #include <linux/init_syscalls.h>
> +#include <linux/pstore_blk.h>
>  
>  #include <asm/io.h>
>  #include <asm/bugs.h>
> @@ -1524,6 +1525,9 @@ static noinline void __init kernel_init_freeable(void)
>  		prepare_namespace();
>  	}
>  
> +	if (IS_BUILTIN(CONFIG_PSTORE_BLK))
> +		pstore_blk_early_init();
> +

I hate this being a special-case in kernel_init. For ramoops, we use:

postcore_initcall(ramoops_init);

which is much better than open coding this here.

>  	/*
>  	 * Ok, we have completed the initial bootup, and
>  	 * we're essentially up and running. Get rid of the
> -- 
> 2.28.0
> 

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
