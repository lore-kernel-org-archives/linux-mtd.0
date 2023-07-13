Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF69EB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 06:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bW5ZAa+dLgVimS6NHZ9bUNwyPpOH9w77PJ10PN1ISiI=; b=lwyrHV2GzDTjvf
	RGrYZTPTnMsj4IZ87Bv7mzOvkAbHRH5BjtgtOnRJoUsDtTmj87/q0TrZQfU8Krxraz0XHtVsN5TZd
	MC7u7u7Uj+bdIgo7H76Aa9yIS82RdAW2x5PSvJlS0kFXAJOUB0LcnAWyiomhZWVaXP8gH/uy6zj1Z
	n29zceOGU7pENBzyvXaEyvcfKv3jsyceieE1LpvsVBHWoXbJIf151a2f9p19vRvtnmhoVDVpHKGKE
	dqDd1dGmGXhc1fISyskF4doOvmwTIwSgGMj9GNVd2mHJNuXQdGeJjEXcHc7Za/SBwHab8KLfI1PHM
	m3MeT0hjmEfd1pTH/Xcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJq2p-0027vb-0c;
	Thu, 13 Jul 2023 06:43:19 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJq2m-0027tg-1I
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 06:43:17 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fba8e2aa52so2865215e9.1
        for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2023 23:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689230593; x=1691822593;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dzuMvTEJjuzuWafGId0EKnw8W+53lpMWlx/dx8RuUgI=;
        b=xR3Kj0dtxkOBdRtN2VV0/iptb78PGCaV9BSN5ajKZRPswSU3mo0cdY/UNLVrk/iA/L
         cyH7FkRwO00UWXVDjzdyzESubTW89nA/gxfqBWe3U5+UF4Jkcgc0/TzKeQTMp6kfucJn
         plfpnPUzVDMz+yD1XdbLtbLEBYKwhUAb3semG8CNh93LCOG19SZB/UwItBvofHVBmiUo
         F99H6gTdK9MVhcv4ZQJL5EcLKLCxeIo50ozUDyXgecFCJm5EJDlruTaUpLvodiwsYJtX
         PdQoIfgbhHvJCuaWjwKb+zS0gAdpyf28JJe1BHhYIj/DVnChTWWhO7/zV09HC5Msftwf
         LZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689230593; x=1691822593;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dzuMvTEJjuzuWafGId0EKnw8W+53lpMWlx/dx8RuUgI=;
        b=LMDhb55jN3U6AbS4OMhR2oH5+QT4cJDTBDTM2Ez9r9aEQUR1+V2Ipzh/aDs8KE1KTi
         LGgAUG6RBpuNeJS2Qe1kDUHX0W89bWyUyht98BA2OvEziCYR2Q2tbylAZGtxMWiarIu/
         /oqPDMYkr6ZHYuqrKyCOB60Jx2fdLyyf8UBCUjg5jt7KcGKX2FrUXmLyuiuxx0oVaxud
         EjNBzErk/oNqzNofxNbFXAthmqNGcz3154hgXxOks+kHaKOnDL3LmSZU9rr3dIPhkrGs
         0mzjjxBpKeG5tmTE2STmDvlAqkR4YnycN8nrBlqYXySTp6v0NheKNjWYujpQD5ggxxjw
         7LOg==
X-Gm-Message-State: ABy/qLaWPu1Qbtyf0Y9sl2n01DSCn4URxU/d9yH9ZimX+HmMR1irmkMs
	iObYWtGszrJpDExkIhS8xZ0GFig9gslXAMW/BG4=
X-Google-Smtp-Source: APBJJlH/+3S9pVGVOgtUoZsQ2EFd4E0ZaQHDzUkVZfEg7x8GSbCEoi497QcJSrUWfLg8dm1nZL0cug==
X-Received: by 2002:adf:e707:0:b0:314:9ef:838c with SMTP id c7-20020adfe707000000b0031409ef838cmr714143wrm.15.1689230593552;
        Wed, 12 Jul 2023 23:43:13 -0700 (PDT)
Received: from [192.168.0.173] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id d9-20020adff2c9000000b00313e4d02be8sm6973616wrp.55.2023.07.12.23.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 23:43:13 -0700 (PDT)
Message-ID: <b11a4288-563f-cbe6-470a-b2c33a781dfa@linaro.org>
Date: Thu, 13 Jul 2023 09:43:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] mtd: spi-nor: Make octal_dtr_enable() dedicate for
 enabling Octal DTR
Content-Language: en-US
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, d-gole@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20230616050600.8793-1-Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230616050600.8793-1-Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_234316_439416_095E9667 
X-CRM114-Status: GOOD (  24.61  )
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

Hi, Takahiro,

On 16.06.2023 08:06, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> The function should be responsible only for enabling Octal DTR. Remove
> 'enable' parameter from octal_dtr_enable() and add octal_dtr_disable()
> that takes care for disabling. This can remove 'enable' flag checks in
> core and manufacturer drivers and improve readability.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>  drivers/mtd/spi-nor/core.c      | 42 ++++++++++++++++++++++++++-------
>  drivers/mtd/spi-nor/core.h      |  4 +++-
>  drivers/mtd/spi-nor/micron-st.c | 11 +++------
>  drivers/mtd/spi-nor/spansion.c  | 36 ++++++++++++++--------------
>  4 files changed, 57 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 143ca3c9b477..d2571f309f41 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3086,11 +3086,10 @@ static int spi_nor_init_params(struct spi_nor *nor)
>  
>  /** spi_nor_octal_dtr_enable() - enable Octal DTR I/O if needed
>   * @nor:                 pointer to a 'struct spi_nor'
> - * @enable:              whether to enable or disable Octal DTR
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -static int spi_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
> +static int spi_nor_octal_dtr_enable(struct spi_nor *nor)
>  {
>  	int ret;
>  
> @@ -3104,14 +3103,39 @@ static int spi_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
>  	if (!(nor->flags & SNOR_F_IO_MODE_EN_VOLATILE))
>  		return 0;
>  
> -	ret = nor->params->octal_dtr_enable(nor, enable);
> +	ret = nor->params->octal_dtr_enable(nor);
>  	if (ret)
>  		return ret;
>  
> -	if (enable)
> -		nor->reg_proto = SNOR_PROTO_8_8_8_DTR;
> -	else
> -		nor->reg_proto = SNOR_PROTO_1_1_1;
> +	nor->reg_proto = SNOR_PROTO_8_8_8_DTR;
> +
> +	return 0;
> +}
> +
> +/** spi_nor_octal_dtr_disable() - disable Octal DTR I/O if it is enabled
> + * @nor:                 pointer to a 'struct spi_nor'
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_octal_dtr_disable(struct spi_nor *nor)
> +{
> +	int ret;
> +
> +	if (!nor->params->octal_dtr_disable)
> +		return 0;
> +
> +	if (!(nor->read_proto == SNOR_PROTO_8_8_8_DTR &&
> +	      nor->write_proto == SNOR_PROTO_8_8_8_DTR))
> +		return 0;
> +
> +	if (!(nor->flags & SNOR_F_IO_MODE_EN_VOLATILE))
> +		return 0;
> +
> +	ret = nor->params->octal_dtr_disable(nor);
> +	if (ret)
> +		return ret;
> +
> +	nor->reg_proto = SNOR_PROTO_1_1_1;
>  

I gave a little thought on this. Indeed having an
*_enable(..., bool enable) method bends the logic and we have to act on
the name, but from the core's point of view I think we should stick to a
single method, otherwise the duplication of code is obvious. On the
manufacturers drivers side however, we saw that the enable/disable
methods quite differ (see [1]), so I would recommend the have dedicated
methods for the manufacturers. Thus I would do something like this:

in the core:
int (*set_octal_dtr)(struct spi_nor *nor, bool enable);

in the manufacturer drivers:
static int manufacturer_snor_set_octal_dtr(struct spi_nor *nor, bool enable)
{
	return enable ? manufacturer_snor_octal_dtr_enable() :
			manufacturer_snor_octal_dtr_disable();
}

I'll scratch a patch later today.
Cheers,
ta

[1]
https://lore.kernel.org/linux-mtd/cover.1686557139.git.Takahiro.Kuwano@infineon.com/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
