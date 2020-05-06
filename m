Return-Path: <SRS0=eoWp=6U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C01C47247
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 02:38:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A65F420752
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 02:38:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NG4JLohv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="seY8O0PO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A65F420752
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJzI3zBXI+frYVkD15SLmk+lOrcCZkBV/rDJqJuraF0=; b=NG4JLohvSDawOA
	WZyqle/OQPB3qeGjQodmfTdosMwMw1FUAChrikIH5wk7ZNN1GKH75mLYohqH+SBfMlieu3+VuZGj0
	EQQ6YKh5RyBvTvUQ6KhS6uTAaD2d98+XUtvaOe9vh/cgjSrg7bcMEfwaZVcqIKiD9M9fv3/jD9VWL
	fGpV9+tRmED+/XcT6HU7K+uvMwpif/7nTDeJAgmldHFHa084PwdMAtiIfOGq3TGhO92utn1+DgoYO
	oM9xxGGAYgJvUZDPcjMK2ZdYHhzEnj6NxNjGVAXBcoFHj1887esPXLqAage350VS8JCofoGlw6dA4
	XUGmlwfTgI6iVGi5oHDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jW9xC-0002Oy-Lf; Wed, 06 May 2020 02:38:34 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jW9x9-0002OQ-Os
 for linux-mtd@lists.infradead.org; Wed, 06 May 2020 02:38:33 +0000
Received: by mail-oi1-x244.google.com with SMTP id i13so403511oie.9
 for <linux-mtd@lists.infradead.org>; Tue, 05 May 2020 19:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=j7wFQAej6fSwbScLFcHGQ/mYv2AH2O4tGHNnw9sXpTw=;
 b=seY8O0POHGfuH4/v0E+MvvBGOlBNe3TSs+pon6lutFfFTJyH7NM7SGGAHRo3CNqEYM
 DT+oKAAQE447xpE4KJqfqKJkxcrh/EOf5wOV6/1ZQ6UEo7EvRQ31W3kSOtrjjrlZEL49
 TPC4IKEg4p8N6gGtNM5mSle6xWvPSe1VNs8TKbzvVT1+31a5Rt1ec5fcP67q4CTYswGW
 c1oi/ZvdUAcCPzN1j+9zEDbLohRx7huSWGToqfzeaIIVL8fQAocwxipKjcO/u+6nu129
 2UedapB8pyftgR07ghml+KAAtFL7KdBwOQOebhezkmdxxE8xr3FWYVZSQzp72NPDPEUy
 ReIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=j7wFQAej6fSwbScLFcHGQ/mYv2AH2O4tGHNnw9sXpTw=;
 b=n152dKiQ2+YEdSqcmSjkQ86FOkpFUSoQdFSim//iX64ptlClMM2F0X2btwcU7vTTau
 MSeKZqmESXRNuRmmBzU70fl7dx2b5W3Vvu1Bjq2sSkwMxw5ueDmdfBNz3EjmMfvbduqN
 d4iROhUEOX47ehr/FEN3q0vvMmNuW5U+X8FfCtUEH0lcRVC0YRW+Aez6728IDAnJYfKi
 xbXVMtAk+M6sXbVK9RVTB875WD6Q31H0y+nXpCfjA+7brmWAkkNrIO0RdKUcB5iJf0aD
 3E1INCUPhUx6QiEmDIMUwVgyFg3pzAIEgtPNWkV0JKBWmNksRDsR+znvWqo88+CMMjlb
 SbhA==
X-Gm-Message-State: AGi0PubFB1zseB9NIb4fB7Yu65cB0/jYV4NbhWQAfRSJfuHZaT6PUlyN
 1gVY2cgPJovamy0C5xRcTOo=
X-Google-Smtp-Source: APiQypJp6sM5iMmhiBeRcyJVDAiCKIul5pMj/MADX52YdCUZiyUcj98ydKDZM6L9vV663CnjHO1XVQ==
X-Received: by 2002:a05:6808:a93:: with SMTP id
 q19mr1284179oij.6.1588732710003; 
 Tue, 05 May 2020 19:38:30 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id i10sm263302oos.28.2020.05.05.19.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 19:38:29 -0700 (PDT)
Date: Tue, 5 May 2020 19:38:28 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] mtd: lpddr: fix excessive stack usage with clang
Message-ID: <20200506023828.GA415100@ubuntu-s3-xlarge-x86>
References: <20200505140136.263461-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200505140136.263461-1-arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_193831_831628_4C90C8BF 
X-CRM114-Status: GOOD (  21.26  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, clang-built-linux@googlegroups.com,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Richard Fontana <rfontana@redhat.com>, linux-mtd@lists.infradead.org,
 Vincenzo Aliberti <vincenzo.aliberti@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, May 05, 2020 at 04:01:16PM +0200, Arnd Bergmann wrote:
> Building lpddr2_nvm with clang can result in a giant stack usage
> in one function:
> 
> drivers/mtd/lpddr/lpddr2_nvm.c:399:12: error: stack frame size of 1144 bytes in function 'lpddr2_nvm_probe' [-Werror,-Wframe-larger-than=]
> 
> The problem is that clang decides to build a copy of the mtd_info
> structure on the stack and then do a memcpy() into the actual version. It
> shouldn't really do it that way, but it's not strictly a bug either.
> 
> As a workaround, use a static const version of the structure to assign
> most of the members upfront and then only set the few members that
> require runtime knowledge at probe time.
> 
> Fixes: 96ba9dd65788 ("mtd: lpddr: add driver for LPDDR2-NVM PCM memories")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
>  drivers/mtd/lpddr/lpddr2_nvm.c | 35 ++++++++++++++++++----------------
>  1 file changed, 19 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/mtd/lpddr/lpddr2_nvm.c b/drivers/mtd/lpddr/lpddr2_nvm.c
> index 0f1547f09d08..72f5c7b30079 100644
> --- a/drivers/mtd/lpddr/lpddr2_nvm.c
> +++ b/drivers/mtd/lpddr/lpddr2_nvm.c
> @@ -393,6 +393,17 @@ static int lpddr2_nvm_lock(struct mtd_info *mtd, loff_t start_add,
>  	return lpddr2_nvm_do_block_op(mtd, start_add, len, LPDDR2_NVM_LOCK);
>  }
>  
> +static const struct mtd_info lpddr2_nvm_mtd_info = {
> +	.type		= MTD_RAM,
> +	.writesize	= 1,
> +	.flags		= (MTD_CAP_NVRAM | MTD_POWERUP_LOCK),
> +	._read		= lpddr2_nvm_read,
> +	._write		= lpddr2_nvm_write,
> +	._erase		= lpddr2_nvm_erase,
> +	._unlock	= lpddr2_nvm_unlock,
> +	._lock		= lpddr2_nvm_lock,
> +};
> +
>  /*
>   * lpddr2_nvm driver probe method
>   */
> @@ -433,6 +444,7 @@ static int lpddr2_nvm_probe(struct platform_device *pdev)
>  		.pfow_base	= OW_BASE_ADDRESS,
>  		.fldrv_priv	= pcm_data,
>  	};
> +
>  	if (IS_ERR(map->virt))
>  		return PTR_ERR(map->virt);
>  
> @@ -444,22 +456,13 @@ static int lpddr2_nvm_probe(struct platform_device *pdev)
>  		return PTR_ERR(pcm_data->ctl_regs);
>  
>  	/* Populate mtd_info data structure */
> -	*mtd = (struct mtd_info) {
> -		.dev		= { .parent = &pdev->dev },
> -		.name		= pdev->dev.init_name,
> -		.type		= MTD_RAM,
> -		.priv		= map,
> -		.size		= resource_size(add_range),
> -		.erasesize	= ERASE_BLOCKSIZE * pcm_data->bus_width,
> -		.writesize	= 1,
> -		.writebufsize	= WRITE_BUFFSIZE * pcm_data->bus_width,
> -		.flags		= (MTD_CAP_NVRAM | MTD_POWERUP_LOCK),
> -		._read		= lpddr2_nvm_read,
> -		._write		= lpddr2_nvm_write,
> -		._erase		= lpddr2_nvm_erase,
> -		._unlock	= lpddr2_nvm_unlock,
> -		._lock		= lpddr2_nvm_lock,
> -	};
> +	*mtd = lpddr2_nvm_mtd_info;
> +	mtd->dev.parent		= &pdev->dev;
> +	mtd->name		= pdev->dev.init_name;
> +	mtd->priv		= map;
> +	mtd->size		= resource_size(add_range);
> +	mtd->erasesize		= ERASE_BLOCKSIZE * pcm_data->bus_width;
> +	mtd->writebufsize	= WRITE_BUFFSIZE * pcm_data->bus_width;
>  
>  	/* Verify the presence of the device looking for PFOW string */
>  	if (!lpddr2_nvm_pfow_present(map)) {
> -- 
> 2.26.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
