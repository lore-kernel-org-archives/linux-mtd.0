Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5892C46CD3
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Dec 2023 08:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FeOlmXxiQosWV7hqnPjnGuIEQEUszvIkK3o3hAMWeso=; b=BAzeZP2EpQt4ut
	ueTunK/Fz+FA38SFkuMT5gf7b9ydfxMYsZJBCCRyS6woqNsBrFXrO0IE5xLSPP1ZnwjyPNlT/XmTl
	NnZ3wxtqepq4QntMry0yazsULcPVB6LOwMCM3CjxXa4ditoMAbS2t3C33o33+bjyMzc56JeVKBNNV
	iyZx8GfptUHJLzEvJfo1pGyVRoqI5PGJurSNvFWPikSzt2iboahbxtIoysgjY0BuMw1+1YYqmPuiM
	oHuK6hxx/9BLrvNownaTWW/s6kdRUs4OXY4mJIGDCVxJVFz/XJrc4YBUVBJ+CQAtPpqScB++mxm0d
	TDJjg2wIkRF2litA4KFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFroM-00GYkT-1l;
	Wed, 20 Dec 2023 08:20:14 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFroK-00GYjb-02
	for linux-mtd@lists.infradead.org;
	Wed, 20 Dec 2023 08:20:13 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40c38de1ee4so54385085e9.0
        for <linux-mtd@lists.infradead.org>; Wed, 20 Dec 2023 00:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703060409; x=1703665209; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EGJnr28q5pVWPQ25KNnaY/E1fm/GhPUqTRzqeDud9sY=;
        b=JoMOSdkdZalAHi1G2zH07HW8Fz27X7cwBCtQZj/+TzSvqSuvOB6AzO6C7tHbkrLDt3
         0V/6TdjPszSAHQUc0FrA60981nhjJ94nX26PJvvIJNNM2QOyDOXeZiwdvjLB1sHdFAD4
         LO2s/2Va3ExP3cKkumzRmgYEMfsCCOzwHLq0WvVK/eZ+yGP+35PpUCrw6oeiajN8f5gR
         2J714aRu9rz49lITqBmwynjg/WtWUU8Zf1sFQ9aPpzqgFMYxQNMDh4wwtPBkZIW/eG6V
         bN/n2DpwggJzGRqF6Ff7YqDgoo64N2IxAjP9A/+j+yAkBpamol93ZMXE2GUHgcVPSoPf
         PvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703060409; x=1703665209;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EGJnr28q5pVWPQ25KNnaY/E1fm/GhPUqTRzqeDud9sY=;
        b=WxK4jmhWw3Be8N8E19fg0On3JcyprgR0joUmFG901nYyhB5HXN3V+d8U3FdfljL2k6
         aLNt2XLt2hMM/4RoV5nj9rpMiekIpZoxgLGmqAe3YaN8yyPzNH6xV8uXENeFGKfEY2xv
         KY2ur4MVUXKAtovHXrlnArel/pV035CUWW00ghWYgl/2BGunp9fle7v4VvGnoeG0Yqi+
         9QejhZxHwgWkKsZyQ0j2hIdt3pohG3PRFiunFxkUMppN7ydvZWu5YwhWVUCQO1c3NZDq
         JBDykOgkWucQxh0yjD/X8y1/nVUQLHhk1yO472sFc6G7kNEEsZbfB1OewYJxfCIVmxcP
         tyXA==
X-Gm-Message-State: AOJu0YxcdDDe6ZstgZEzgzGetPFyP0PuGe3QHTMNrfoKc4ARkCu4wg3r
	0Ee06prxdUVo85Oj4nau1JGLBg==
X-Google-Smtp-Source: AGHT+IFLromluPpGcPydFzyeICx6K7Tbn8p1voSHijG71ST4/qXGQ1Qp/rP2UoUOvJGkqJoTCZFJoQ==
X-Received: by 2002:a7b:ce88:0:b0:40c:343b:fead with SMTP id q8-20020a7bce88000000b0040c343bfeadmr9881175wmj.79.1703060409494;
        Wed, 20 Dec 2023 00:20:09 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id m1-20020a05600c4f4100b0040c03c3289bsm6203733wmq.37.2023.12.20.00.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Dec 2023 00:20:09 -0800 (PST)
Message-ID: <43eac7ba-1648-4e99-80b8-3132523189c7@linaro.org>
Date: Wed, 20 Dec 2023 10:20:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: spi-nor: core: Discard HW capabilities if no
 enable function
Content-Language: en-US
To: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
References: <20231219102103.92738-1-jaimeliao.tw@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231219102103.92738-1-jaimeliao.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_002012_056641_3A394906 
X-CRM114-Status: GOOD (  18.64  )
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



On 19.12.2023 12:21, Jaime Liao wrote:
> From: JaimeLiao <jaimeliao@mxic.com.tw>
> 
> Discard corresponding HW capabilities to prevent carrying the
> wrong protocol if no QUAD/Octal DTR enable function hooked.
> 
> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> ---
> changes in v2
>  - Add SNOR_HWCAPS_8_8_8_DTR
>  - Restore the enable function judgement in spi_nor_set_octal_dtr()
>  - Restore the enable function judgement in spi_nor_quad_enable()
> ---
>  drivers/mtd/spi-nor/core.c  | 7 +++++++
>  include/linux/mtd/spi-nor.h | 6 ++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 1c443fe568cf..14359101c6cf 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2621,6 +2621,13 @@ static int spi_nor_default_setup(struct spi_nor *nor,
>  	 */
>  	shared_mask = hwcaps->mask & params->hwcaps.mask;
>  
> +	/* Mask out Octal DTR if no enable function */
> +	if (!params->set_octal_dtr)
> +		shared_mask &= ~SNOR_HWCAPS_8_8_8_DTR;
> +
> +	if (!params->quad_enable)
> +		shared_mask &= ~SNOR_HWCAPS_4_4_4;

and these should have been in the late init hook, and instead discard
them from the params->hwcaps.mask.

And why is this extra check needed in the first place? For octal I
assume it's needed by macronix, where the flash is octal capable, but
there's no octal enable method defined yet. What about the quad mode? Is
there any flash that has no quad enable method defined but still caries
quad mode in its hwcaps?


> +
>  	if (nor->spimem) {
>  		/*
>  		 * When called from spi_nor_probe(), all caps are set and we
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index cdcfe0fd2e7d..78a119192ee0 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -266,6 +266,12 @@ struct spi_nor_hwcaps {
>  #define SNOR_HWCAPS_PP_8_8_8		BIT(22)
>  #define SNOR_HWCAPS_PP_8_8_8_DTR	BIT(23)
>  
> +#define SNOR_HWCAPS_4_4_4	(SNOR_HWCAPS_READ_4_4_4 |	\
> +				 SNOR_HWCAPS_PP_4_4_4)
> +
> +#define SNOR_HWCAPS_8_8_8_DTR	(SNOR_HWCAPS_READ_8_8_8_DTR |	\
> +				 SNOR_HWCAPS_PP_8_8_8_DTR)
> +
>  #define SNOR_HWCAPS_X_X_X	(SNOR_HWCAPS_READ_2_2_2 |	\
>  				 SNOR_HWCAPS_READ_4_4_4 |	\
>  				 SNOR_HWCAPS_READ_8_8_8 |	\

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
