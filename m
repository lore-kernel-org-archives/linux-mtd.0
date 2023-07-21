Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444B1EB64DC
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jul 2023 16:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1HLBAPdq0gyibcoa5toyOgahQSBKx2V/ieVNji3IpW0=; b=fmMqobu9p2mMr1
	tIDtYzR8SfSdNUbzJd6iQYunXMfsRgOcWuvc+FUyqT2X55xCYVv2l/Ed6qx/aKpZJr8xqK13fuXEe
	Z99YuilL1iMNcYH+iaQjvaanITAJlyNVDDo0zAi2JdlxdfqJ7a4LSM8F9HNnFazQq1PeaOpgTIB2v
	ZQkpokmSFbx+m0y2DmRY4jKWDklNZgK2/HG99BIixQVTZY5ciQXz1GiXxmnumZDyezkxkxSeYriWi
	YMrv4UXKOX8CQFwyHPkwXxPZrYAqwE1qFfMePit+OjsVXElm0Rwi/rQ1r9+e/I99EVYOxb4nAVnNw
	fOhUGprHOJ/KLBnN42VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMtKz-00Ee9F-1z;
	Fri, 21 Jul 2023 16:50:41 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMtKx-00Ee7u-00
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jul 2023 16:50:40 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9923833737eso306335766b.3
        for <linux-mtd@lists.infradead.org>; Fri, 21 Jul 2023 09:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689958234; x=1690563034;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zFIK1JL7VWOXJggNlJf0qvVqc1PwKffia7dJyC1jX0I=;
        b=jXBLDfNtZfOGigySAG3fhFCzJWl6CuxwSbq4yeezhFMi+1ElBUWc2dlsYKjGUkdD1M
         choegXNenYen6TbwDiH+z+vln6NPND9uHK8KaZHaCHDwqOdxZPZIdNai7qaOA7jDWw8B
         eBVqBTZtI62eOGsj4s4FpB12VoTF3oVCy+zI1tn8WFcd1km0zofa7ZOvMoWnrhxRWDAC
         bRodO7nEOgamDAT/1DEy8FeLSfxTtbSSwCYaP+Y8yhTNnPq/UKSwbwu/jMCoiaFV/fTJ
         372ISfQV+afXo0BOLlhD/o3onRBnxEiYjzLWxmjV9mWuvwloTpxb8ypOL18bL2V0U85z
         Le0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689958234; x=1690563034;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFIK1JL7VWOXJggNlJf0qvVqc1PwKffia7dJyC1jX0I=;
        b=H3dGI/W8fH8akx8SaSHGqakda+vCOvqRGPhdycqSAmi/Kp/tEFC6m27NQ0agz7nj3C
         TmyuZ5+ZNI4Omi9nU+zysqYcM3FzVRRtCQzcvpUDkma5nds6Gc9/o/Ih3TwlhN5h1T6Q
         d04JbQQ2onNHyB/Ciie8hwuaerUdkehZcXv+8w/B/VeG5NHy+sSsvuvkRIzOlH1UiMJi
         UFhS83gIyo1HORRKwrmNUMt1q/NEpvaPB6+k7/PTrwH2s87tB2jT5C/Z1Ct3sXv1lsFx
         T3ZYsWu3hseSSc7IWJLO8AxuRjCGRH81y0X+KBcgEX15dsfasjsUe3jKVgh8yn/7r6wu
         MVyA==
X-Gm-Message-State: ABy/qLZUNSF+gHygat/R6Kawng5PalVjiHnghsu+uLxcWtlAaCJos4pe
	kl0oqTr1w9zYC4dKoX3eH4hyfw==
X-Google-Smtp-Source: APBJJlHV3IXZKdlKM9pib+LVGfbAq/YmWfNneMFUFn6++2ZAKjq0hUtxKI9NQqFja9KgOTLcJb/FIw==
X-Received: by 2002:a17:907:7850:b0:997:e385:6597 with SMTP id lb16-20020a170907785000b00997e3856597mr2053183ejc.45.1689958234291;
        Fri, 21 Jul 2023 09:50:34 -0700 (PDT)
Received: from [192.168.2.173] ([79.115.63.16])
        by smtp.gmail.com with ESMTPSA id gs18-20020a170906f19200b00993150e5325sm2409596ejb.60.2023.07.21.09.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 09:50:33 -0700 (PDT)
Message-ID: <a2b892e2-5a4a-3948-b3e0-1b7f8a6e511e@linaro.org>
Date: Fri, 21 Jul 2023 19:50:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 5/8] mtd: spi-nor: spansion: switch h28hx's ready() to
 use vreg_offset
Content-Language: en-US
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, d-gole@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1689836065.git.Takahiro.Kuwano@infineon.com>
 <9aabf8237cbe090ea982860ecda609063a2de7bf.1689836066.git.Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <9aabf8237cbe090ea982860ecda609063a2de7bf.1689836066.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_095039_045480_EB30FB41 
X-CRM114-Status: GOOD (  18.63  )
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



On 20.07.2023 10:10, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> s28hx is the sole user of cypress_nor_set_octal_dtr, which already
> uses vreg_offset to set octal DTR. Switch the ready method to use
> vreg_offset as well. This is a preparation patch. The goal is to use
> the same s28hx methods for the multi die version of the flash.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>  drivers/mtd/spi-nor/spansion.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 9150840e748a..00d8305e25f4 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -732,9 +732,15 @@ static int s28hx_t_post_bfpt_fixup(struct spi_nor *nor,
>  
>  static int s28hx_t_late_init(struct spi_nor *nor)
>  {
> -	nor->params->set_octal_dtr = cypress_nor_set_octal_dtr;
> +	struct spi_nor_flash_parameter *params = nor->params;
> +
> +	params->set_octal_dtr = cypress_nor_set_octal_dtr;
>  	cypress_nor_ecc_init(nor);
>  
> +	/* Replace ready() with multi die version. */
> +	if (params->n_dice)

same explanation:
	if (params->n_dice && params->vreg_offset)

> +		params->ready = cypress_nor_sr_ready_and_clear;
> +
>  	return 0;
>  }
>  

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
