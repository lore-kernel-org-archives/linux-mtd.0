Return-Path: <SRS0=jbuo=FF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54936C64E7B
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Dec 2020 19:21:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4DAA20639
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Dec 2020 19:21:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="caxNNBDr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KIVEomxV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4DAA20639
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gpaoVXcWNeA4PeNu2C8sm7M+Q9LBpX7LG19i5uHs3pY=; b=caxNNBDr/SF/knYZ8//EKkGag
	phTCmmed50XhobB4Lh+zbAa5n8PXR5JS4KfFxIHbpQs6KX2gWIHFsZj0/ZVcE9kDXVFKHTX/aZXWB
	tRitm1ZbXYmd3o6ipFnPdOO6MEqidD0w07VPPfG6u/ZHe9QzVM09qe911gYSljz9EaQkhK+xaUBvn
	yCkJd/lVVFpG0DQAZACi4x11+KPyAUpz+QBKZD9C8jSRQhEsZLDMkHvr2ajTSP0xEmUgRfzWsK5Xs
	9FE5JUGejSOE1akw7+jnf9DIYNDGB3DkReUVmPj4e6avzHtz+GVdtKLmdTJUKsFTF1x40O6te1cMa
	LzcjNTInA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkBCI-0003cT-QC; Tue, 01 Dec 2020 19:20:22 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkBCF-0003bd-Ij
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2020 19:20:20 +0000
Received: by mail-pf1-x442.google.com with SMTP id w6so1773915pfu.1
 for <linux-mtd@lists.infradead.org>; Tue, 01 Dec 2020 11:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UNtFxOQ4O2xPBFWrY/r+XwQcNVVjoO3zZJHkFA0yk+E=;
 b=KIVEomxVAADgG+V3vucWYExkCHk7pkgg652UAixA4Q3FRU8XTmPH3XX5dK5BCzfR2l
 ebbvWYq4vvxBYFyUa0fMS+4zN0kjEtBEzbG/0IDsu1WJoN1ayoSPcLvveTmvwZLOEZWA
 1931MXK+C3YJMyK9b2KJHge4rVxoa2aMsfe9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UNtFxOQ4O2xPBFWrY/r+XwQcNVVjoO3zZJHkFA0yk+E=;
 b=HFYd1MP4nShCDXdXTepRGh2t+S5W+GkDHkYm7gtfC7/Od5VniM8hO+WPmn4imjCNnE
 UZ+StlfISbH52v6BVYssVYfKhdMXVC57zeLMuF+cG6as/FTNS7aA8NVs/K52ludJLkcB
 TNUlDkGjlitQFTgZXTxvdCCQMmU0S/jHEPgnyV+AEMmi7pnAo9LjT00MXbR6ti43DYab
 yR8j0t44//eUQxMc4QyCocM9zvoTw+sQWKQnuSsafzYnSf9A6QW+HkUgNNOcJZa7HJmz
 WPSjAs4MhY+2uFO91kGmZ053Xk2Isaf7aOKSr0IeK2a9k47C5upkIGwSPZ8O5Z5xXb77
 uHkw==
X-Gm-Message-State: AOAM531YzRjDRKJEutY09IDU4/03dhfhV5sHg1PN6boEUR98SXGSp9tH
 y56e45Mu8lbOtQ8rhZY0sTxWRg==
X-Google-Smtp-Source: ABdhPJxzRPXUo3h35t+Wv6xoj7vNs214gALSlt5JxU9Scdc9UW3uX5K0pMMc0ffAavMIlm60tp8uGQ==
X-Received: by 2002:a05:6a00:882:b029:19c:5287:4a1e with SMTP id
 q2-20020a056a000882b029019c52874a1emr2345984pfj.44.1606850417451; 
 Tue, 01 Dec 2020 11:20:17 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id s21sm344612pgk.52.2020.12.01.11.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 11:20:16 -0800 (PST)
Date: Tue, 1 Dec 2020 11:20:15 -0800
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 4/9] pstore/blk: remove __unregister_pstore_blk
Message-ID: <202012011119.A3816E1B0@keescook>
References: <20201016132047.3068029-1-hch@lst.de>
 <20201016132047.3068029-5-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201016132047.3068029-5-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_142019_674458_AF3C55E1 
X-CRM114-Status: GOOD (  23.56  )
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

On Fri, Oct 16, 2020 at 03:20:42PM +0200, Christoph Hellwig wrote:
> Fold __unregister_pstore_blk into its only caller, and merge the
> two identical calls to __unregister_pstore_device that exist in the
> caller now.

Meh, I'm not a fan of this. I like it in a separate function. Pushing it
into the _exit() routine feels weird to me.

> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/pstore/blk.c | 27 ++++++---------------------
>  1 file changed, 6 insertions(+), 21 deletions(-)
> 
> diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
> index 7f8368e94b3604..3a2214ecf942ae 100644
> --- a/fs/pstore/blk.c
> +++ b/fs/pstore/blk.c
> @@ -388,19 +388,6 @@ static int __register_pstore_blk(void)
>  	return ret;
>  }
>  
> -static void __unregister_pstore_blk(unsigned int major)
> -{
> -	struct pstore_device_info dev = { .read = psblk_generic_blk_read };
> -	void *holder = blkdev;
> -
> -	lockdep_assert_held(&pstore_blk_lock);
> -	if (psblk_bdev && MAJOR(psblk_bdev->bd_dev) == major) {
> -		__unregister_pstore_device(&dev);
> -		psblk_put_bdev(psblk_bdev, holder);
> -		psblk_bdev = NULL;
> -	}
> -}
> -
>  /* get information of pstore/blk */
>  int pstore_blk_get_config(struct pstore_blk_config *info)
>  {
> @@ -430,16 +417,14 @@ late_initcall(pstore_blk_init);
>  
>  static void __exit pstore_blk_exit(void)
>  {
> +	struct pstore_device_info dev = { };
> +
>  	mutex_lock(&pstore_blk_lock);
> +	if (pstore_zone_info)
> +		dev.read = pstore_zone_info->read;
> +	__unregister_pstore_device(&dev);
>  	if (psblk_bdev)
> -		__unregister_pstore_blk(MAJOR(psblk_bdev->bd_dev));
> -	else {
> -		struct pstore_device_info dev = { };
> -
> -		if (pstore_zone_info)
> -			dev.read = pstore_zone_info->read;
> -		__unregister_pstore_device(&dev);
> -	}
> +		psblk_put_bdev(psblk_bdev, blkdev);
>  	mutex_unlock(&pstore_blk_lock);
>  }
>  module_exit(pstore_blk_exit);
> -- 
> 2.28.0
> 

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
