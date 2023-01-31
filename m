Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F14AC636D3
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Jan 2023 05:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gki7swMxfKTHHOuKKTHdceJ4Sqtsm3BPiNJqCMR44VE=; b=OFkdwcI/m8PjBQ
	2lVTxubld8wXO6DWJAqBfZ2svObsBIUABilQ7d7BWubYdvEDavldJLRUambwOGbFJrhvuPBlwkDIq
	/H/iSk38TDkamzR8u6KapwpdJ/kYw5xwYDgjJd1HvoWQIOMiN1BKS0/hnE6zqJcPML9wJhLdXpmY5
	HxaOW7qUGdw6O7uLMhksxufuQLUdvShGIvWZyH5K+Fs87B+OVmWUXvnn2J7HIhUeqRVHTxPB/kkUu
	rAzb28JpzVCHG/AMmfUJZ1sxzUb5OagauMmGALHwe1DnAh+cpjZ9cmRsTl+kXxaX3Xfw/Was1Lgkt
	PPqoJkugzI0AqZF10Cmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMivo-006JXI-0s; Tue, 31 Jan 2023 05:11:44 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMivj-006JWH-Pd
	for linux-mtd@lists.infradead.org; Tue, 31 Jan 2023 05:11:41 +0000
Received: by mail-ej1-x631.google.com with SMTP id qw12so22383986ejc.2
        for <linux-mtd@lists.infradead.org>; Mon, 30 Jan 2023 21:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8yN6JDIHRFYqmgH85mkduV4msHBx/Je2FjLzQMUTzC8=;
        b=MbV7LGuBPHEJETgjKdBC8og+iKnV6M73SlF2lPIfANCOsadpIlTk1EorA1H9IZGCq8
         q+t+2hGkjEQvjpLoiEXuKs0TpnEGc8kZb9ERU8mzuEsSISSkOj0jAliTY5xGlZ3PjoIx
         zPy/dAli6Fhe9MEvuwpqzma4lRP+LPGdKQFTsSljqqHXsjf1BwGYC1Jj18a6cF8sFb8T
         HtuFHh0ABm3hMnVcLusvMhV9hgMUjz4yjvPvPDhGQ+7AUsgPgEe2SnflCCjvj4rDFWy0
         QoZvLbx6ytv026kwpPm5eIw2nSX9qjR7TOuCgcT/3iv5Dw/24Rqh0kHHX0lQel3WJnNM
         mGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8yN6JDIHRFYqmgH85mkduV4msHBx/Je2FjLzQMUTzC8=;
        b=rKgCIzm8NUxNOwiLDFHH4UY1JNqSyJNQRPR2uMGq5lEgeGik758i6AzRz2b1Y3F/qn
         7Wsah+P1XQb/LwHqozaP3Uj9VtemyiJSpZaCPLtMf4ZPaLL7JNLo+f3pTLbgzAW7NeyJ
         gmKIOqQN5GI/aB2M1rTdm1F4G2oPzqhWt46x5zZPjB0VzR5Yg4BhPtSfKgazPpDXVQxR
         xSmdgNA9t60T2pDrCSNLFkG+CmsWCUZXCl9OAB+anwEHgX0MbeNVVUyKMnNxZA4hOK8Q
         5hoH2eAitYDa+GWJRr3YhHa1awLh9oH/saInf5JKAUeodnV2gOt7Lb+UUjGzh14SJmyX
         lS7w==
X-Gm-Message-State: AO0yUKXUuawL+OT1JvTVj72kuWPXuTdxM1o66znqGb+m6yDEPrAN+nHe
	CL8dAX94c7ka7yzFnk4boAoa3w==
X-Google-Smtp-Source: AK7set/AtcAivfLd4J7FxA/usB1cuUxBlA7MDTBjBLL1jGWt6yqeMYER3cU6liAo5Sq21RblLDbxVQ==
X-Received: by 2002:a17:906:6d2:b0:88a:8e57:f05b with SMTP id v18-20020a17090606d200b0088a8e57f05bmr4193197ejb.22.1675141895518;
        Mon, 30 Jan 2023 21:11:35 -0800 (PST)
Received: from [192.168.2.104] ([79.115.63.122])
        by smtp.gmail.com with ESMTPSA id ss2-20020a170907c00200b0084d381d0528sm7759858ejc.180.2023.01.30.21.11.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 21:11:35 -0800 (PST)
Message-ID: <b1841011-ba05-e290-d9b1-336a2346b1e3@linaro.org>
Date: Tue, 31 Jan 2023 05:11:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 4/9] mtd: spi-nor: Reorder the preparation vs locking
 steps
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Alvin Zhou <alvinzhou@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20221215081241.407098-1-miquel.raynal@bootlin.com>
 <20221215081241.407098-5-miquel.raynal@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20221215081241.407098-5-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_211139_895705_FCA7FBAC 
X-CRM114-Status: GOOD (  22.58  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Miquel,

On 12/15/22 08:12, Miquel Raynal wrote:
> The ->prepare()/->unprepare() hooks are now legacy, and there are only
> two controllers left supporting them. In both cases, the implementation

now there's only one, hisi-sfc.c.

> acquires a mutex, which is somehow redundant with the spi-nor main lock

I see a HIFMC_MAX_CHIP_NUM with value 2, the controller seems to be able
to operate 2 flashes in parallel and that's why the internal mutex.

> that we acquire as well in the spi_nor_[un]lock_and_[un]prep() helpers.
> 
> While the mutex taken in the core is necessary, the helper can be
> reorganized to first do the preparation, then acquire the core
> lock. This is necessary in order to be able to improve the locking
> mechanism in the core and should have no side effect.
> 

the change seems fine for hisi, and since we're no longer adding drivers
under spi-nor/controllers we should be good.

> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>   drivers/mtd/spi-nor/core.c | 15 ++++++---------
>   1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 38a57aac6754..de77ca55f74d 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1074,23 +1074,20 @@ int spi_nor_lock_and_prep(struct spi_nor *nor)

you'll have to rename it to spi_nor_prep_and_lock to reflect the order
of ops.

>   {
>   	int ret = 0;
>   
> -	mutex_lock(&nor->lock);
> -
> -	if (nor->controller_ops &&  nor->controller_ops->prepare) {
> +	if (nor->controller_ops && nor->controller_ops->prepare)
>   		ret = nor->controller_ops->prepare(nor);
> -		if (ret) {
> -			mutex_unlock(&nor->lock);
> -			return ret;
> -		}
> -	}
> +
> +	mutex_lock(&nor->lock);
> +
>   	return ret;
>   }
> 

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
