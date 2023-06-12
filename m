Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8503FC8300C
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jun 2023 10:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ass/JPoopcxoCr/Um6iJ2ByCYypirP4F7yb+5vmRjbc=; b=HORBwA72iXZhvZ
	mcSgVSvgASBkorA1bIbLytv9Ay2m6ynLPABWeb7T9TgR418EHkHMuZ5KPzM+lx8YgrAIlmgZ0eVs0
	gBrsZu6YfGiJjM2egDhTv3zPPhAEQYLUEHsNs3RuHUT8mJIewr4zQhzRH/tCuGNV3lxIvKQtMpb3P
	yp7oRsUuv+x+BWloLUkdxO8SK2fPx9WWzFtFwB6GF0OjKgIiT3Nv7B27B4WMcx1DZiQg20VOMi7Yn
	aF+gVG/5xA5phUrJg37nkg3+oAgJp7KZ607nAFu0QOKbWLfrsZmbzrNLV6vh2I39TnwVzyNIKO8w0
	kMGkm6/Q3v7wqXBVeNvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8f9f-003eQX-0a;
	Mon, 12 Jun 2023 10:52:11 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8f9b-003eLf-1d
	for linux-mtd@lists.infradead.org;
	Mon, 12 Jun 2023 10:52:09 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-30adc51b65cso3805466f8f.0
        for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2023 03:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686567117; x=1689159117;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ycCU1WFirww0GTp9dYLaO0PoUvSleR8ila3gnMax00=;
        b=eAqKzQ8ktefVTbS9DWZ0oTAIrceaxz3tqoIV/g8BVsWxXnrZXzGsCRO7r0Jq2d1VQm
         GLNvGrp/6fEFlchniYMSgUVg5EsUVw6oXjauQmIZa2A+tfTER94NpfhHB7hCDuew7RoU
         uauRz25jTVIqCd/jpNm/+Q56oPkiGpr+5xZ/XSJMDpbRmjnaje2Kbtp6Z3DQFsRi4GcP
         AxSa07zzYiM45pqWn0E1JbwXmtYjCH+V1QnEAvTfomctKBsLkLj5TNZmsekZnrJAYJLn
         gUCIdo1LiRER/4qoMlfuhcE4cxheUnGEifHYOuS7mSFS7N32Io8Fuu51LE4D9mMF2nFh
         pwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686567117; x=1689159117;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ycCU1WFirww0GTp9dYLaO0PoUvSleR8ila3gnMax00=;
        b=DHG0TWsKaL64deqRa7KQZ05G252e0yBw1mh3oFh+ouqmjdcLMVMjx0lEOOu3GkljWJ
         mG5udJkJMpEAbzN42FkB0aXwzS0L6MABDMJ1Z5Az/KrizJpAql2N2OiWMSc5ZAKPeKZL
         sgnlyG/4Jr+LyrxyWuStbc6v/d6f3yXjqVKiC/JLQTOdDeuQ7V7PDuIfy29sXWCTITM/
         obZrvfLa580+qfkVom7V2zA9pyziDMjlsGfWjXzi063dF6FXeJ8ff4PK23bMXNzs7ElT
         FfPFwfkbwgzT/3R1hvRSlu9Fvkl7rRFTK+NkGgM80fisX/u6eDYXdHMZbJwk9LDFhvTd
         hOQQ==
X-Gm-Message-State: AC+VfDzy3f7s0UZkqqmI0Ima0wF3yDg6IAhW4qS3HYiyssUse3QoxGEz
	lUPe/wCeoCwzSQv3P5MbusKqQKcsaHDyCNIWqDmdeA==
X-Google-Smtp-Source: ACHHUZ7bIyj2QviICABh0wFHPxLxoXHDE1CaZr5LiKxYYn+FIFOIJfIdpNzvxOvdDcSMQ9YqXbHQZQ==
X-Received: by 2002:a5d:66c1:0:b0:307:8b3e:285a with SMTP id k1-20020a5d66c1000000b003078b3e285amr4618158wrw.67.1686567117352;
        Mon, 12 Jun 2023 03:51:57 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.153])
        by smtp.gmail.com with ESMTPSA id d17-20020a5d6dd1000000b003095bd71159sm12226779wrz.7.2023.06.12.03.51.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 03:51:56 -0700 (PDT)
Message-ID: <2a33ff36-d8f6-bd23-b7e3-4c1f1c00330a@linaro.org>
Date: Mon, 12 Jun 2023 11:51:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/5] mtd: spi-nor: spansion: Preserve CFR2V[7] when
 writing MEMLAT
Content-Language: en-US
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, d-gole@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, stable@vger.kernel.org
References: <cover.1686557139.git.Takahiro.Kuwano@infineon.com>
 <15d87d29e53945739e7c2b3f58e2f623e2a77f08.1686557139.git.Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <15d87d29e53945739e7c2b3f58e2f623e2a77f08.1686557139.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_035207_550276_41825EAA 
X-CRM114-Status: GOOD (  21.48  )
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



On 6/12/23 11:04, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> CFR2V[7] is assigned to Flash's address mode (3- or 4-ybte) and must not
> be changed when writing MEMLAT (CFR2V[3:0]). CFR2V must be read first,
> modified only CFR2V[3:0], then written back.

Last sentence could be reworded to "CFR2V shall be used in a read,
update, write back fashion."

Please specify in the commit message if this fixes a present bug or it's
just a prerequisite for the support that comes. The change is good but
we should be aware if you hit bugs or not.
> 
> Fixes: c3266af101f2 ("mtd: spi-nor: spansion: add support for Cypress Semper flash")
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/mtd/spi-nor/spansion.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index f2f4bc060f5e..7804be3a9f2a 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -27,6 +27,7 @@
>  #define SPINOR_REG_CYPRESS_CFR2			0x3
>  #define SPINOR_REG_CYPRESS_CFR2V					\
>  	(SPINOR_REG_CYPRESS_VREG + SPINOR_REG_CYPRESS_CFR2)
> +#define SPINOR_REG_CYPRESS_CFR2_MEMLAT_MASK	GENMASK(3, 0)
>  #define SPINOR_REG_CYPRESS_CFR2_MEMLAT_11_24	0xb
>  #define SPINOR_REG_CYPRESS_CFR2_ADRBYT		BIT(7)
>  #define SPINOR_REG_CYPRESS_CFR3			0x4
> @@ -162,8 +163,17 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
>  	int ret;
>  	u8 addr_mode_nbytes = nor->params->addr_mode_nbytes;
>  
> +	op = (struct spi_mem_op)
> +		CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes,
> +					  SPINOR_REG_CYPRESS_CFR2V, 0, buf);
> +
> +	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
> +	if (ret)
> +		return ret;
> +
>  	/* Use 24 dummy cycles for memory array reads. */
> -	*buf = SPINOR_REG_CYPRESS_CFR2_MEMLAT_11_24;
> +	*buf &= ~SPINOR_REG_CYPRESS_CFR2_MEMLAT_MASK;
> +	*buf |= SPINOR_REG_CYPRESS_CFR2_MEMLAT_11_24;

Use FIELD_PREP please.

>  	op = (struct spi_mem_op)
>  		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
>  					  SPINOR_REG_CYPRESS_CFR2V, 1, buf);

Shall you zeroize the struct before using it again?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
