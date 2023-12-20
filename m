Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4156AC46CCD
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Dec 2023 08:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=//kr5QSBZcoKadbOeE6oGKfitBaA2dUiKchD6ghJ9L8=; b=LH5hsX2iiAcOZM
	gw5TtsGedZPEDDmuK9IUrW+P5uTINExC2DoNSRofOlSNyYqsoY1D1c7VRAyod5PlLrjUUCO8ZSEU0
	V+2AiIJaMODM4eoNM6kRmYePX5TJxpqvnhCHwxHkONzO/6LrZRFJ2m16VbBYRE/9kFvOHzDcYLYIP
	fGm9btDYOeil2bS4RBeBYrNNGBhI2JoF4/i+kogQfvGLnmIGWC6rUeoZ7MHZMPXGOwcJj12FYnuB5
	I5qSOa/8fu/SnWRwkjEE6TwndDgQ0e2bmIym1/zFEWy9pMfEfz7fyz1U+66iV7n7oTo0fwhyr6lmz
	M7TI5uaBOsPNMbbBdGzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFrcA-00GWqB-0p;
	Wed, 20 Dec 2023 08:07:38 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFrc4-00GWpK-2T
	for linux-mtd@lists.infradead.org;
	Wed, 20 Dec 2023 08:07:34 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-33666fb9318so3323656f8f.2
        for <linux-mtd@lists.infradead.org>; Wed, 20 Dec 2023 00:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703059649; x=1703664449; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iR+XOeazmgiTdSz6NTrOHxL0FhTioIMQ8tWikHkmpUY=;
        b=X75YEhRg1uFS3wSN2K1H4crfdEvLsLhhjeBUq2DctJHtieu4vMDFWL9S8kkVVMvoRq
         nluZ8ZKiV30q5HRO4ROxdyQsqCiny+kz7CJuq0Z9BnhwrhgnrfygsacZkIiKJYJLjm2R
         gYvodgrI43A1CNhDmcL8v/UiL9KgLvdFD/Wpiwonk5gZIKztq1IwuhNFRn1pXi+KWCky
         2G8jXDPg7V/hOXqXUEz6L3L82LLVi7fSRx0MwEdjHLVXhAYYCTzb4g/ZGPkT3yM7AsVT
         WuWVveZYfuEF8WB5KZ4vu7/+k1Yx0S1YI7i0q4Cm/wpJWwhBUhnelgwmqi4YaFYta0NR
         Lczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703059649; x=1703664449;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iR+XOeazmgiTdSz6NTrOHxL0FhTioIMQ8tWikHkmpUY=;
        b=P2j9t7sYnAp19T/jxaBBaFf08IxMlRqw2s1gWXK0KoqAwsu+3QF0OL+orxWVyUQT94
         9at5OcqZZmJ1AupUE58ico0ztDJS60L/FsKPyFvEeV0Wynno0sW3DO9LElWTPj31Vguh
         9QycrRo8ico7S4C/FEIYJOXrAkkoNA07o2bfI3UxsXnTI2V1nmpY8WpqyXUt4yW8bPpn
         t6N2jD1+JoedP197Ei7yodtXVrZb1kG13xZ2TQmB1NDOkMS5kAZp5nSrsYf5u8d88fPf
         xgbYNabsObYO6FjoOsolF3Nc5zr2PcqNk11qBZ7s4RqlfKWoZaH1S3Zyxdu5vjxjGWLI
         0r7g==
X-Gm-Message-State: AOJu0YzH6jNJEOqIQ0UKZvKpaCMknvZTMwREUF0fLwVD4QuQ8vEFE4/j
	LyNXf1Zq6dxAyqKHV5lmb9amrA==
X-Google-Smtp-Source: AGHT+IHil2kVwLxzzgO7ytKn20Fv+rStg4rhTmOPev5HlDCgy4AVU/3x68puh2qnJBSG30K7L40ycA==
X-Received: by 2002:a05:600c:511a:b0:405:37bb:d942 with SMTP id o26-20020a05600c511a00b0040537bbd942mr9365924wms.4.1703059648962;
        Wed, 20 Dec 2023 00:07:28 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id s20-20020a05600c45d400b0040b36ad5413sm6152338wmo.46.2023.12.20.00.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Dec 2023 00:07:28 -0800 (PST)
Message-ID: <b33b7841-d68e-4576-b8e5-72eab04fce2d@linaro.org>
Date: Wed, 20 Dec 2023 10:07:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: spi-nor: core: Discard HW capabilities if no
 enable function
To: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
References: <20231219102103.92738-1-jaimeliao.tw@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <20231219102103.92738-1-jaimeliao.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_000732_872287_5894C5AD 
X-CRM114-Status: GOOD (  16.01  )
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

quad enable applies for 1-1-4 and 1-4-4 as well. How about changing this to:

#define SNOR_HWCAPS_QUAD	(SNOR_HWCAPS_READ_QUAD |	\
				 SNOR_HWCAPS_PP_QUAD)
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
