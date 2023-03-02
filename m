Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2391C6FA8E
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Mar 2023 06:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I1PGxF1aWg4zPMsMNnUUTixq3bV2iY6XfjvycGewwFg=; b=0NG/sryCW6c2Fk
	y5bspMNdHb3CQMQFruR5vOQaS+k3/URCs1wFCBsbqM+GacGmMem3ARNlRN8JpBAaTpjjq1sfR8Sy+
	o1nNBOzmS4F7GIiJ6xPcdIO+Cga+++/Lc0PW8Ittwpf0iUeNFR7hVEGIorckgZ8ZIQxncoZ2Vv4pe
	wTr9CtX0TlnBExsHAY61WMWNMJWuUo6gZB3A7RZP1E3PLaNs/ggq021oD79l3OdzldpM2PnE6NsqL
	KRq5yOunQWNEvfvz3ZiAhmztwaVL7Avb8TFn4tt+ChVgpBd9VLGylICbt5xpU8V+JCSLcsgBVnSET
	VhtQ8wv9pFJAzn6PYotA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXc8E-000z8m-9w; Thu, 02 Mar 2023 06:09:34 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXc8B-000z85-8M
	for linux-mtd@lists.infradead.org; Thu, 02 Mar 2023 06:09:32 +0000
Received: by mail-ed1-x52f.google.com with SMTP id g3so7841974eda.1
        for <linux-mtd@lists.infradead.org>; Wed, 01 Mar 2023 22:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677737367;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S3ITF3pSvtpmw4hz0vyDFGg0p1dkMqgdpv8hA+dYiF0=;
        b=K56A1+Cf9bXeOePpz1eIU+BjiURiReUBrHOSlcZt0ZotJ5rzOBnWi2wdUXMZEZ1Kq9
         QgbN8U9g9/eU4Y8/umbz94DGSmIFc73Dyd1yYuXPRqBlIC6yyQOrnvSHyAbpJYXsYki+
         ndO4BvUTYXN1kIJdcoxH0apYqkJMhM3M+8SCBmzza6tyZ1D6Rh708/psNbb+4535LILz
         qiGUqyJGzt1Vdwy0+PrOxNLwbQptVOz1NoiFK4Dg7MJV2X6m0IM4yyvb0atu0P3R0ddp
         LgOsGG+6F4rC3EA8ypl6WMaWSe2X2MfxtTbUuFxUXUDT3WpFynW7h7vt/vGFDRIgevM4
         DH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677737367;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S3ITF3pSvtpmw4hz0vyDFGg0p1dkMqgdpv8hA+dYiF0=;
        b=yc2lDtp5dNS8bBrVe0YQBcnCG6p2s/HRr6N50aYCrciUnnoDSB4Ft4X+L9Spoevs7C
         tILTvVNkrM7rE2dzM85YSWBgCTntO/Rm0XgV53iow6xIWXxB9i09cW8IRJl0CU0+ii+t
         N2xKKmULlmYbrQjH1SLUOb3FIAYdpeA3fmfmoYpNb17LMIy7stvittU22VtSMgfJR33l
         N4JfRqSDRXi96G7zvWe+2IPYJqDbQBk4n63x8opdfbYxnLDB7dDYB8IzUnW9eRYY48BJ
         m2vqP3LY6bOFrbQ930O/KhvgHatNSEjE85RvLJOg9cPaI2CniH2c9M/t9auspGydJbZu
         lDqw==
X-Gm-Message-State: AO0yUKVabzhukOO9RL9W+PGZ9Ip5WkHQD6IJ5x5nIvTUBfB+HzAcbGS8
	nLOVEFtz+0GX7hWVFyyneFGpqA==
X-Google-Smtp-Source: AK7set8OR3xG71PfYOtdtcrah9iPuC9qLlOMgIsz+4gKucw5DZXHVN674EmQl7H7ZjqELF1vlf+rDA==
X-Received: by 2002:a05:6402:120d:b0:4ae:eab6:9fac with SMTP id c13-20020a056402120d00b004aeeab69facmr9889804edw.32.1677737367576;
        Wed, 01 Mar 2023 22:09:27 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id a92-20020a509ee5000000b004a23558f01fsm6489787edf.43.2023.03.01.22.09.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 22:09:27 -0800 (PST)
Message-ID: <5f72a5a0-b23e-3ffd-5690-958e85dc66db@linaro.org>
Date: Thu, 2 Mar 2023 08:09:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 4/8] mtd: spi-nor: spansion: Rework
 cypress_nor_set_page_size() for multi-chip device support
Content-Language: en-US
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1675835253.git.Takahiro.Kuwano@infineon.com>
 <08b8d366534e6f9ac3f1dcf08560451293e0b4b1.1675835253.git.Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <08b8d366534e6f9ac3f1dcf08560451293e0b4b1.1675835253.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_220931_352535_CBB96880 
X-CRM114-Status: GOOD (  33.00  )
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
> For multi-chip devices, we can use 512B page only when the all dice are
> configured as 512B page size. Simple for-loop with params->num_of_dice can
> check the CFR3V in each die. The volatile register address is calculated
> inside the loop by using die number and volatile register offset.
> 
> The location of cypress_nor_set_page_size() call is moved from
> post_bfpt_fixup() to post_sfdp_fixup(), because the number of dice and
> volatile register offset are parsed after BFPT. The post_sfdp_fixup()

No, this looks wrong.

BFPT is the only mandatory table and should be sufficient to make any
flash work (in the multi die case, just for the first die). All the
other tables are considered optional. If we get an error when parsing
BFPT we return an error, if we get an error in any optional table, we
just print a warning and continue. So you should make sure that the
flash works fine even if sccr_map_mc fails.

> does not return error code so cypress_nor_set_page_size() prints error
> message instead of returning error code.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>   drivers/mtd/spi-nor/spansion.c | 47 ++++++++++++++++++----------------
>   1 file changed, 25 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 12a256c0ef4c..7c533737d7c3 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -18,7 +18,7 @@
>   #define SPINOR_REG_CYPRESS_CFR1_QUAD_EN		BIT(1)	/* Quad Enable */
>   #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
>   #define SPINOR_REG_CYPRESS_CFR2_MEMLAT_11_24	0xb
> -#define SPINOR_REG_CYPRESS_CFR3V		0x00800004
> +#define SPINOR_REG_CYPRESS_CFR3			0x4
>   #define SPINOR_REG_CYPRESS_CFR3_PGSZ		BIT(4) /* Page size. */
>   #define SPINOR_REG_CYPRESS_CFR5V		0x00800006
>   #define SPINOR_REG_CYPRESS_CFR5_BIT6		BIT(6)
> @@ -195,27 +195,34 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
>    * The BFPT table advertises a 512B or 256B page size depending on part but the
>    * page size is actually configurable (with the default being 256B). Read from
>    * CFR3V[4] and set the correct size.
> - *
> - * Return: 0 on success, -errno otherwise.
>    */
> -static int cypress_nor_set_page_size(struct spi_nor *nor)
> +static void cypress_nor_set_page_size(struct spi_nor *nor)
>   {
> +	struct spi_nor_flash_parameter *params = nor->params;
>   	struct spi_mem_op op =
> -		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes,
> -					  SPINOR_REG_CYPRESS_CFR3V,
> +		CYPRESS_NOR_RD_ANY_REG_OP(params->addr_mode_nbytes, 0,
>   					  nor->bouncebuf);
>   	int ret;
> +	u8 i;
>   
> -	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
> -	if (ret)
> -		return ret;
> +	/* Set to default page size */
> +	params->page_size = 256;
>   
> -	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3_PGSZ)
> -		nor->params->page_size = 512;
> -	else
> -		nor->params->page_size = 256;
> +	for (i = 0; i < params->num_of_dice; i++) {
> +		op.addr.val = params->vreg_offset[i] + SPINOR_REG_CYPRESS_CFR3;

in case sccr_map fails vreg_offset is zero here, you'll read garbage
>   
> -	return 0;
> +		ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
> +		if (ret) {
> +			dev_err(nor->dev, "Failed to read page size configuration. Use default 256B.\n");
> +			return;

why did we consider a no-go error and exited in the past and now we just
use a default config?

> +		}
> +
> +		if (!(nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3_PGSZ))
> +			return;
> +	}
> +
> +	/* We reach here only when all dice are configured to 512B */
> +	params->page_size = 512;
>   }
>   
>   static int
> @@ -226,7 +233,7 @@ s25hx_t_post_bfpt_fixup(struct spi_nor *nor,
>   	/* Replace Quad Enable with volatile version */
>   	nor->params->quad_enable = cypress_nor_quad_enable_volatile;
>   
> -	return cypress_nor_set_page_size(nor);
> +	return 0;
>   }
>   
>   static void s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
> @@ -251,6 +258,8 @@ static void s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
>   			break;
>   		}
>   	}
> +
> +	cypress_nor_set_page_size(nor);
>   }
>   
>   static void s25hx_t_late_init(struct spi_nor *nor)
> @@ -312,13 +321,8 @@ static void s28hx_t_post_sfdp_fixup(struct spi_nor *nor)
>   	 * actual value for that is 4.
>   	 */
>   	nor->params->rdsr_addr_nbytes = 4;
> -}
>   
> -static int s28hx_t_post_bfpt_fixup(struct spi_nor *nor,
> -				   const struct sfdp_parameter_header *bfpt_header,
> -				   const struct sfdp_bfpt *bfpt)
> -{
> -	return cypress_nor_set_page_size(nor);
> +	cypress_nor_set_page_size(nor);
>   }
>   
>   static void s28hx_t_late_init(struct spi_nor *nor)
> @@ -329,7 +333,6 @@ static void s28hx_t_late_init(struct spi_nor *nor)
>   
>   static const struct spi_nor_fixups s28hx_t_fixups = {
>   	.post_sfdp = s28hx_t_post_sfdp_fixup,
> -	.post_bfpt = s28hx_t_post_bfpt_fixup,
>   	.late_init = s28hx_t_late_init,
>   };
>   

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
