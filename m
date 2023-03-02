Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE18C678D4
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Mar 2023 05:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bP8oTX3hinppjqp7tjvgdS4rFgn5D7bsRlJymePindI=; b=wWoTqCV1Lt2Cqf
	p75/PjaPWnq5rbmrOsDFQZF/F5rUL5pFkGZn6htPEFAmF+lFjGjsqOinA3T8q9LBbe4ZvorQTIsGf
	q99B6qC3YRM6MvEQIHtzwaIaIgUOHH8lu1pFRiF9R0wxspb+xxElZWHZNh4EebsgdAPF31S6MIOa6
	f1jfya10Lqc957lX9fl9VMkfz8EoQcw4dqeGmKgdnYLhs9CxFKyeg7CCtLagL582rQH/2bH1/zpQE
	Enxgsq9PAFNH10E5nYrKDX0R385a4aLUxOsaCS65nSBd+g98qoAJJI6e7MKm3qOVICU5AebPdzayE
	KKAw951Alwko3sux5U+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXbRi-000tDE-2N; Thu, 02 Mar 2023 05:25:38 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXbRf-000tCE-Cf
	for linux-mtd@lists.infradead.org; Thu, 02 Mar 2023 05:25:36 +0000
Received: by mail-ed1-x52c.google.com with SMTP id ec43so62994446edb.8
        for <linux-mtd@lists.infradead.org>; Wed, 01 Mar 2023 21:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677734728;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sChCltNp1cvGBTGS++uO2mKe45CiYZVV99hVtF43Eyk=;
        b=JaXfLPC+N9YUshgh5bp/DyK1xiWyqEdrc/xaEAxHdZ6m5yawhute8bDQNl65KJ0zoG
         ismyZERoGYCXv9RyBJGmEPk74vxsXv0XQLx0LW/2U3tJfgiRWMEGz7Qtwah8/OepX44Z
         XFK165dyowl1x1ROO4OO9Z9Cd8GwGA90Zd+7yyXN5xNBoVsIhOK5nD+HgeKiW5GmHC94
         S7aj8EKUdfqkLE6VDAmUX2v4liadksoUVxyX53Ks6vwtBtnf3GfTpWzQUbzCIAbNIkYQ
         qPuYhvz0Ej3DR46uWotl0EREf5PqXynEkUABujQP4OWF4aI8Zq/UN85izu5sXnE6h7OF
         0ddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677734728;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sChCltNp1cvGBTGS++uO2mKe45CiYZVV99hVtF43Eyk=;
        b=TY4O/vx+Otd7h67TcTDLbk675Ufob6ij/0D+Y/eXpGi+XwOJdH2hEfGx/8Fy8qqRZA
         yXeByiTNhMC5wTZnU0VZtGCU61K5sPDBt4FV9YzrQ5qN9LTO0lPrZP4wUMK4nKgBJhWL
         e9V/0BtrRwx/0DrIp+6Qc7S0QErOnpXDY0KzRsjw+Rnla0dCA5SghBsH1vXcHAki/RsJ
         gHLi0rwi1LBaZnz/QH5KKmztYkNhrRw6vwnOtpQEnaUGHi41KsPfRN8L1fFscXbVSTOg
         Pw+yTPNhEDNMkyq6d2Hgl8U+ERD6R0rF62loitjAnYsYOppmm3GaO0yJ4DPFmGXT6sHi
         0jIA==
X-Gm-Message-State: AO0yUKUWMZEHX1kLvqy79M/9JYO/SwXYY/xi6lBt1YaGh8tu6Vr6icEQ
	LNilC6wlzxC2cTsUZWNSPXumhQ==
X-Google-Smtp-Source: AK7set92oKpgzycVGJHVijv6J2DrS4RiVCcR89R/jMp73+l91/C0cC1nKPGhJI096Vb1DQXJI8bZsQ==
X-Received: by 2002:a05:6402:18c:b0:4af:5ff1:88ef with SMTP id r12-20020a056402018c00b004af5ff188efmr9372592edv.28.1677734728628;
        Wed, 01 Mar 2023 21:25:28 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id s14-20020a508d0e000000b004bbc90e1fa3sm1674638eds.93.2023.03.01.21.25.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 21:25:28 -0800 (PST)
Message-ID: <96f1f01f-4a51-442d-9118-86863bd78891@linaro.org>
Date: Thu, 2 Mar 2023 07:25:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/8] mtd: spi-nor: sfdp: Extract volatile register
 offset from SCCR map
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1675835253.git.Takahiro.Kuwano@infineon.com>
 <413aa6cf52699fd5813b7ba8bddf7eb910b91aee.1675835253.git.Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <413aa6cf52699fd5813b7ba8bddf7eb910b91aee.1675835253.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_212535_490194_D404BD26 
X-CRM114-Status: GOOD (  19.32  )
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



On 08.02.2023 07:53, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> The volatile register offset resides in the 1st DWORD of SCCR map. Allocate
> the table and copy the offset value.
> 
> The table may be allocated when the SCCR map for multi-chip is parsed.
> Since we cannot assume SCCR parse is always in ahead of SCCR multi-chip,
> we need to check if the table is already allocated or not.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>   drivers/mtd/spi-nor/sfdp.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 3acc01c3a900..e5b5776d8172 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -1215,6 +1215,7 @@ static int spi_nor_parse_profile1(struct spi_nor *nor,
>   static int spi_nor_parse_sccr(struct spi_nor *nor,
>   			      const struct sfdp_parameter_header *sccr_header)
>   {
> +	struct spi_nor_flash_parameter *params = nor->params;
>   	u32 *dwords, addr;
>   	size_t len;
>   	int ret;
> @@ -1231,6 +1232,17 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
>   
>   	le32_to_cpu_array(dwords, sccr_header->length);
>   
> +	/* Address offset for volatile registers (die 0) */
> +	if (!params->vreg_offset) {
> +		params->vreg_offset = devm_kmalloc(nor->dev, sizeof(*dwords),
> +						   GFP_KERNEL);
> +		if (!params->vreg_offset) {
> +			ret = -ENOMEM;
> +			goto out;
> +		}
> +	}
> +	params->vreg_offset[0] = dwords[0];

params->vreg_offset[0] = dwords[SFDP_DWORD(1)];

it helps readers match the code with the standard

> +
>   	if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE,
>   		      dwords[SFDP_DWORD(22)]))
>   		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
