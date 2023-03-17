Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58CAC74A5B
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Mar 2023 09:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iOTOQxV/Wq3Sg74NcoY+OOWhONEVBkcmKUDNt4jfEwI=; b=jN6mhG3gaURnbT
	8Woul2hX/brDCHiC+tShiKW1YrjXxIZeikMStw8DHX1hdGVYzqkgeuwblMQHeUgfsHqCmCJbF0tqR
	eNqCmKNTJFtdVo6/o8B/UwdYCtnRMoBlhfXZOHYj0kSxaH2HtoAnuq3Juh4LaPBDogUDX7k/6E92/
	Qrxbj52btdEk2+7u1BQ7dwz7C0RvwIpTlEx3sBOHND6IgjE7R6BH5/s0vYdxCy/O0JDPIV4N6Qj7y
	9AyzPGjASu9Vm5GkgIjAdUZO8zyzVMyoZS/HSPkc8ldKthwrfPyhYPJEk97m33FVUDfCllj0rkyqV
	TxFYS7jDY7w4UblWzhIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd6LN-001jAx-1v;
	Fri, 17 Mar 2023 09:25:49 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd6LL-001j8S-2q
	for linux-mtd@lists.infradead.org;
	Fri, 17 Mar 2023 09:25:49 +0000
Received: by mail-ed1-x52b.google.com with SMTP id z21so17893565edb.4
        for <linux-mtd@lists.infradead.org>; Fri, 17 Mar 2023 02:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679045143;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LHitDfDQevK3m+O3V5/PIRP4X94AjTRrmFQbuxwVl5M=;
        b=lLGYDb7+S+3zMPYcOdMeKqmPWZ+JxZwywCckL5/yzMe1cuZDKSSvoqfzxG1H6g/UVW
         NCQPbYCZ0lZ58EbV4nF8w8QzniMksFu/3jn2Dm3536PSmFq/a8VtpzoMazfQTpTcJ98x
         /7MXETyyPMTWA0rqqhDJtqmFEHymz67TN6V4OupjSPY0pdhwY5WB/86BNbiTtVo/msxJ
         QmDPdjhlrykIxoDHIhtt2YZzxNnjJwbEL391I7JZpNZ+1/ulc3fUsavcnQXvfm16BCAG
         oXG2yjcGbgjdbPSBbf3gmUTn3tRqGr+4imrCp9vDXzIZlKUJx67UFOw639pZXcTr8jbh
         KBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679045143;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LHitDfDQevK3m+O3V5/PIRP4X94AjTRrmFQbuxwVl5M=;
        b=DRJNtvBJPbv/OPkNmOuZZHuP+dEP/2WAGXdM6Oem6Sdid4akCtijvNfi1P7ge5wnJh
         H++mxZr4Egmn3ljxV2MUYfvr2Vpw3SJhHdl3E923R/XabvzhS4JIRNZ8gmiI0TLpNaUY
         evOu8c/38+9OLFQFdpnuQ1LoDKJHAdPt3uXUh3rY0ne6HO0ftcQ91f6BWqy6oQZ0eLZd
         mH74dwCTOqnKkMFXk7WPPwmct+EaRCAeMcMk/DoXHcOSSydZRn8vHagaK2tvZCMyoICs
         iUmGFYzPRryReST73ueuddgbMI4TrGket7WBT+efMkPQ0ohxiG+FmI9KcujV2iAeNa61
         xnyg==
X-Gm-Message-State: AO0yUKXPFIjx4CvtbaVGGwUosYtSPYwbjNKa10qnC/2wyo7yWCh1G4DM
	v8eBbjXJvNUTETk3cW9CzPBdkQ==
X-Google-Smtp-Source: AK7set+HSHd5Lt9aANe3w6dsxhZi39Bpd8aY5lcegl4WPEJEz6UdsEMVGIv8d55VileAmghTtPSJEQ==
X-Received: by 2002:a17:906:b7d8:b0:924:44b9:e485 with SMTP id fy24-20020a170906b7d800b0092444b9e485mr12795267ejb.58.1679045142934;
        Fri, 17 Mar 2023 02:25:42 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id i23-20020a0564020f1700b00500383a202csm798611eda.6.2023.03.17.02.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 02:25:42 -0700 (PDT)
Message-ID: <0a48ce86-e2dd-33ed-c95d-0b7d68efc3cd@linaro.org>
Date: Fri, 17 Mar 2023 09:25:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] mtd: spi-nor: core: Allow manufacturer fixups to set
 nor->mtd.flags
Content-Language: en-US
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, d-gole@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1678858206.git.Takahiro.Kuwano@infineon.com>
 <ad48c4d0a94a413f06900ee435df2fa50c530dd6.1678858206.git.Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <ad48c4d0a94a413f06900ee435df2fa50c530dd6.1678858206.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_022547_918432_942834C4 
X-CRM114-Status: GOOD (  19.84  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 3/15/23 06:34, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Infineon SEMPER Flash family has on-die ECC and multiple programming on
> the same 16-byte ECC data unit is not allowed to preserve ECC.
> 
> In JFFS2, ECC'd NOR Flash is supported when CONFIG_JFFS2_FS_WRITEBUFFER
> is set and MTD_BIT_WRITEABLE is not set in mtd.flag.
> 
> In spi-nor/core, the mtd.flags is set to MTD_CAP_NORFLASH that defined as
> (MTD_WRITEABLE | MTD_BIT_WRITEABLE).
> 
> The mtd.flags should be set to MTD_CAP_NORFLASH in spi-nor/core when it
> is not yet set, to allow manufacturer fixups set it.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>  drivers/mtd/spi-nor/core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 0a78045ca1d9..5be9392b65c1 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2976,7 +2976,8 @@ static void spi_nor_set_mtd_info(struct spi_nor *nor)
>  	if (!mtd->name)
>  		mtd->name = dev_name(dev);
>  	mtd->type = MTD_NORFLASH;
> -	mtd->flags = MTD_CAP_NORFLASH;
> +	if (!mtd->flags)
> +		mtd->flags = MTD_CAP_NORFLASH;

No, I don't want manufacturer drivers to update mtd fields on their own.
Instead, introduce a SNOR_F flag, set it in the manufacturer driver and
then update the mtd->flags here based on the SNOR_F flag.

>  	if (nor->info->flags & SPI_NOR_NO_ERASE)
>  		mtd->flags |= MTD_NO_ERASE;
>  	else

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
