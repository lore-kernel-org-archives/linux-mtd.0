Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21EFC6FD1D
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Mar 2023 09:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hWLiat8gK2r9R3oIx7gywV1IDzdEsTQCgYeHWRdRVWo=; b=4KiNLi3JLIuOY/
	DZ91lEOOb1cGU9IWE18mxjVEhQyBmqEp1B4jaQIP2M8fvUHBQJcdEbEQQPn9S8A7iaOJ3VgrIzPgP
	3jLviUXexI+ozc6sPLtbsHokAHuEWzZytmFOISrATGM4nAmcTmbVzW9BjKeWjBp/iw3ntY9a4nhl4
	FCnUTjx0OsgWRZOOdNxtwpFjYT6P2B7RpfVjC1+p1yht5czbxfV0pwMKrH8CLuKohJ/Qmblx5NrGn
	kLHk6fdT2mWgMXTOa4urn7cI25M9/Sf6e0JAqr+cenADCJjxMolE/8AqBhFzJr+RoPJHWS6yfH5rt
	mrhUH/O5E1VsbN0i3WaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd6cX-001mVv-2c;
	Fri, 17 Mar 2023 09:43:33 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd6cU-001mUz-2p
	for linux-mtd@lists.infradead.org;
	Fri, 17 Mar 2023 09:43:32 +0000
Received: by mail-ed1-x529.google.com with SMTP id o12so17970007edb.9
        for <linux-mtd@lists.infradead.org>; Fri, 17 Mar 2023 02:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679046209;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eorV1MC1b+gbAq7qzx718ejkf+9aC4g27eNS1KbJVOs=;
        b=sAplzBm7HIAr/WOrNYVdHG0VrIsjA7dtx3Oup4NNEb7sFDaNPFqREnqGYvxeK4k8J6
         mOKmaXfEQKvUN2DQap7jFYKo6oHS1K3SG7MBPpD7NmrYesXf+NQkuhXVFVZ23ZXegTtZ
         jY2vn5fBa+DhQcqiNphU1QO+bjczf1GONde7ZCNDxz0aTUt5YDxBfabPUHpkVV5PCoH4
         PZ/gGWGOn2ne4kRELaNidrMJ1DXpXzf6Bot37umdnLSulEjALzAM1pcJqwxACVSyUPQP
         PrXkCaJsSNisZzcOWvvD1qY2M4cC0vl26YumTwdUW1AyKD+uVmQIviff+ztDiqwW2BER
         zV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679046209;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eorV1MC1b+gbAq7qzx718ejkf+9aC4g27eNS1KbJVOs=;
        b=FoEr2RzjeM5thrSpS1/NIyKmNel8piz1hZnLozG8+tU9HAVnnw/jzqDs/w+N3KS/3P
         3BPyx5xnffvTpUcsDtBb1sw0rIsSqDt/f1bP/zznRALR2e6kUBL7BI/9sA5v4u4XFofU
         XVGol8qwL9izCfLwqFR4u9hnjxs0EbPNJRL3nfBvUjd7QxGLND71HIO4PgECmspXqHJn
         eN+WPiw/cBimDyIvx21hyY1nDtxaWKLjwLN1bWq5thiFYXM8M+D26aQgRT/2D93mIWVV
         5iefLGHc0kI0Y7isV4hdwZYyQrFfB3UI91x0fSBawMcsFEtw8rgzAsuJqBMN0LpSEUhv
         /Mcw==
X-Gm-Message-State: AO0yUKX/VIL/2sH6jTqrxZeg2PqSM57xWUeS51rjRPbxFiQOXshwupNF
	gL7O+yrG43Rujomej8vvZ9/0aQ==
X-Google-Smtp-Source: AK7set8VWBmSKgjebe7yfqq5COivN2K24XxDFI2qGBuyaYiXohnm3Bi+qT2EhRZK7+b+3ZCqEokteA==
X-Received: by 2002:a05:6402:d7:b0:4fd:29e6:701b with SMTP id i23-20020a05640200d700b004fd29e6701bmr2078013edu.38.1679046208752;
        Fri, 17 Mar 2023 02:43:28 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id y70-20020a50bb4c000000b004fa380a14e7sm812273ede.77.2023.03.17.02.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 02:43:28 -0700 (PDT)
Message-ID: <61ee92ba-e97f-da3a-ca95-d384097b7a20@linaro.org>
Date: Fri, 17 Mar 2023 09:43:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] mtd: spi-nor: spansion: Add a helper for ECC related
 initialization
Content-Language: en-US
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, d-gole@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1678858206.git.Takahiro.Kuwano@infineon.com>
 <9e1c639a5bcd2b3f347385ff243dbb521bbe5857.1678858206.git.Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <9e1c639a5bcd2b3f347385ff243dbb521bbe5857.1678858206.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_024330_915005_2DC447C6 
X-CRM114-Status: GOOD (  24.70  )
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
> JFFS2 supports write buffer mode for ECC'd NOR flash such like SEMPER
> flash family (s26hl/s25hs/s28hl/s28hs). To activate it,
> MTD_BIT_WRITEABLE needs to be unset in mtd->flags.
> 
> In existing late_init() functions for SEMPER flash family,
> params->writesize is set to 16 to avoid multiple programs in 16-byte ECC
> data unit.
> 
> This patch adds a common cypress_nor_ecc_init() helper that takes care
> for those ECC related initialization.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>  drivers/mtd/spi-nor/spansion.c | 33 ++++++++++++++++++++-------------
>  1 file changed, 20 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 1678b7b2e9f7..9539968c4a6d 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -219,6 +219,22 @@ static int cypress_nor_set_page_size(struct spi_nor *nor)
>  	return 0;
>  }
>  
> +static void cypress_nor_ecc_init(struct spi_nor *nor)
> +{
> +	/*
> +	 * Programming is supported only in 16-byte ECC data unit granularity.
> +	 * Byte-programming, bit-walking, or multiple program operations to the
> +	 * same ECC data unit without an erase are not allowed.
> +	 */
> +	nor->params->writesize = 16;
> +
> +	/*
> +	 * Unset MTD_BIT_WRITEABLE to activate JFFS2 write buffer for ECC'd NOR
> +	 * flash.
> +	 */
> +	nor->mtd.flags = MTD_CAP_NORFLASH & ~MTD_BIT_WRITEABLE;

This should have been made available since the addition of the s28hx,
and it's actually a fix, thus it deserves a fixes tag and Cc to stable.

Introduce a SNOR_F_ECC, set it here and do the mtd.flags update in the
core please.

Looks good otherwise.
Cheers,
ta
> +}
> +
>  static int
>  s25fs256t_post_bfpt_fixup(struct spi_nor *nor,
>  			  const struct sfdp_parameter_header *bfpt_header,
> @@ -260,13 +276,7 @@ static void s25fs256t_post_sfdp_fixup(struct spi_nor *nor)
>  
>  static void s25fs256t_late_init(struct spi_nor *nor)
>  {
> -	/*
> -	 * Programming is supported only in 16-byte ECC data unit granularity.
> -	 * Byte-programming, bit-walking, or multiple program operations to the
> -	 * same ECC data unit without an erase are not allowed. See chapter
> -	 * 5.3.1 and 5.6 in the datasheet.
> -	 */
> -	nor->params->writesize = 16;
> +	cypress_nor_ecc_init(nor);
>  }
>  
>  static struct spi_nor_fixups s25fs256t_fixups = {
> @@ -312,13 +322,10 @@ static void s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
>  
>  static void s25hx_t_late_init(struct spi_nor *nor)
>  {
> -	struct spi_nor_flash_parameter *params = nor->params;
> -
>  	/* Fast Read 4B requires mode cycles */
> -	params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
> +	nor->params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
>  
> -	/* The writesize should be ECC data unit size */
> -	params->writesize = 16;
> +	cypress_nor_ecc_init(nor);
>  }
>  
>  static struct spi_nor_fixups s25hx_t_fixups = {
> @@ -381,7 +388,7 @@ static int s28hx_t_post_bfpt_fixup(struct spi_nor *nor,
>  static void s28hx_t_late_init(struct spi_nor *nor)
>  {
>  	nor->params->octal_dtr_enable = cypress_nor_octal_dtr_enable;
> -	nor->params->writesize = 16;
> +	cypress_nor_ecc_init(nor);
>  }
>  
>  static const struct spi_nor_fixups s28hx_t_fixups = {

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
