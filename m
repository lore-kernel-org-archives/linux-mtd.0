Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F59CC678D4
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Mar 2023 05:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=erHURIyrRQ+WbJgbcp0TTZIIvpFULT2JHuRdMhr4CkI=; b=l7fyvZbahcuZak
	AeHXxuQsrAxJW7ObTViaw3IP2rCVAjkVVy6/zRvQPPR7gaTn3DI9VnEF1xquaab19X6uq6pg7eadn
	8EjHRdde0d4CUeRDmtIN47Cn09BlQmVkP3yLlEvwAujcfHLu9osgDfn721Dfv0wKeKhyyZ+TW4dd6
	mFAQAYMRWHQLdK9Agz/rtxCY4tSE8rn5fXgDIYUgpYy2kCfhDxESoKYlu/3fxv/BQBAy/g/SQCJ/b
	BgfHSFQSMLLT+iuFny64A8Z/SPbQtiNtAPTzequ9LDwi3oJ16gOyu3UbJf/w/cSfmNc4KB1KoH9gL
	oiACy0IhTgpMDoZR6QUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXbgy-000udZ-1M; Thu, 02 Mar 2023 05:41:24 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXbgv-000ud1-5o
	for linux-mtd@lists.infradead.org; Thu, 02 Mar 2023 05:41:22 +0000
Received: by mail-ed1-x529.google.com with SMTP id a25so626336edb.0
        for <linux-mtd@lists.infradead.org>; Wed, 01 Mar 2023 21:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677735679;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eQ+hUnzjwETluE3RoIq8aLJXebNsZSPPtj0XSwl02lU=;
        b=w5edYk2tOFNfB7Z5rXgZxG8+KNcxw5IbKza4aOrrLrgXWereFQ8lebaj13fPgBAbEt
         ANG/FtWPBMc6wvs/DOVMadc1n+ld/FuBV603G+MkujuUAt9BnTTSJdG1pKdcCul6+Y0R
         Kijpm8eGBFWAstoOk5ANTeWdikoY/MyDud+f1XbbcWfMlM5z/JwIffFxS0swQBZyURPp
         NPYdrVTdvhjOYEzXuH3cwIyuF/m7CeEaQkNJI75ga/EMCdPI5gVGyfm6IyQo4b77KXnZ
         jIr/t9sI1QC9cMduKgjVnnuZL5fLVPhRPuGkMiqX1JxPgrv9n1FST7zNQGldDKJ8hHeN
         ht1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677735679;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eQ+hUnzjwETluE3RoIq8aLJXebNsZSPPtj0XSwl02lU=;
        b=FT8TcqHHxZB1Fx/v2+kKPgC12XN/xMYdgxYgn+/D9YSh866SGLdirHOIMqhz+jOKCh
         E68YSiWy11XqSzKRISuTc+Q5D/Lipdh1cRe0iXPYiMEy0Kt4MrZ9tIPB41Kx8fIiGoas
         x1V6Zptj8dVRtIpS/DSxk2g2oO/BB9A50xsbqzRjyif5exaZoOy1CYXHIb6gfGryCaEF
         YZoaRG9cZ93+5AJ0x7UmUnhIYAtLA98bgM4crN/m7wwQfTCvL+BJUbtz6jfJtiZ6ztM5
         xjsVqFNf5iKNSrung/OnOgTD8BYqz/JgFU++7X1MSoyLO25rULWZ/PU4EM3UZIsA5CPD
         V/YQ==
X-Gm-Message-State: AO0yUKWTY6Po1TFgJkSfr1ajHYJijTtez3hh191vOxOYHS2XA0xWEHnZ
	gjEyql4HBWXxX1cy+UW73fUEKg==
X-Google-Smtp-Source: AK7set/5DNexfCDnVa0vUI0Jkw0K16NlzI9tseoWqb1X+VxTCmbexORudqvJGTkml7ODnXp/00HxDg==
X-Received: by 2002:a17:906:b4f:b0:860:c12c:14f9 with SMTP id v15-20020a1709060b4f00b00860c12c14f9mr8936716ejg.40.1677735679134;
        Wed, 01 Mar 2023 21:41:19 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id cw18-20020a170906c79200b008e22978b98bsm6739919ejb.61.2023.03.01.21.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 21:41:18 -0800 (PST)
Message-ID: <1bac4c22-03af-3455-21b0-2b23a39a7c12@linaro.org>
Date: Thu, 2 Mar 2023 07:41:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/8] mtd: spi-nor: sfdp: Add support for SCCR map for
 multi-chip device
Content-Language: en-US
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1675835253.git.Takahiro.Kuwano@infineon.com>
 <5ffa62bf55f2e6e3fee5104e4c53e2b1caa8c8cc.1675835253.git.Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <5ffa62bf55f2e6e3fee5104e4c53e2b1caa8c8cc.1675835253.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_214121_323056_DCE2246B 
X-CRM114-Status: GOOD (  27.74  )
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
> SCCR map for multi-chip devices contains the number of additional dice in
> the device and register offset values for each additional dice.
> 
> spi_nor_parse_sccr_mc() is added to determine the number of dice and
> volatile register offset for each die. The volatile register offset table
> may already be allocated and contains offset value for die-0 via SCCR map
> parse. So, we should use devm_krealloc() to expand the table with
> preserving die-0 offset.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>   drivers/mtd/spi-nor/sfdp.c | 64 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 64 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index e5b5776d8172..b7c08fe86239 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -26,6 +26,11 @@
>   					 * Status, Control and Configuration
>   					 * Register Map.
>   					 */
> +#define SFDP_SCCR_MAP_MC_ID	0xff88	/*
> +					 * Status, Control and Configuration
> +					 * Register Map Offsets for Multi-Chip
> +					 * SPI Memory Devices.
> +					 */
>   
>   #define SFDP_SIGNATURE		0x50444653U
>   
> @@ -1252,6 +1257,61 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
>   	return ret;
>   }
>   
> +/**
> + * spi_nor_parse_sccr_mc() - Parse the Status, Control and Configuration
> + *                           Register Map Offsets for Multi-Chip SPI Memory
> + *                           Devices.
> + * @nor:		pointer to a 'struct spi_nor'
> + * @sccr_mc_header:	pointer to the 'struct sfdp_parameter_header' describing
> + *			the SCCR Map offsets table length and version.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_parse_sccr_mc(struct spi_nor *nor,
> +				 const struct sfdp_parameter_header *sccr_mc_header)
> +{
> +	struct spi_nor_flash_parameter *params = nor->params;
> +	u32 *dwords, addr;
> +	size_t len;
> +	int ret;
> +	u8 i;
> +
> +	len = sccr_mc_header->length * sizeof(*dwords);
> +	dwords = kmalloc(len, GFP_KERNEL);
> +	if (!dwords)
> +		return -ENOMEM;
> +
> +	addr = SFDP_PARAM_HEADER_PTP(sccr_mc_header);
> +	ret = spi_nor_read_sfdp(nor, addr, len, dwords);
> +	if (ret)
> +		goto out;
> +
> +	le32_to_cpu_array(dwords, sccr_mc_header->length);
> +
> +	/*
> +	 * Pair of DOWRDs (volatile and non-volatile register offsets) per
> +	 * additional die. Hence, length = 2 * (number of additional dice).
> +	 */
> +	params->num_of_dice += sccr_mc_header->length / 2;
> +
> +	/* Address offset for volatile registers of additional dice */
> +	params->vreg_offset =
> +			devm_krealloc(nor->dev, params->vreg_offset,
> +				      params->num_of_dice * sizeof(*dwords),
> +				      GFP_KERNEL);
> +	if (!params->vreg_offset) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	for (i = 1; i < params->num_of_dice; i++)

here you limit the number of dices to 256, while the jesd216 says "any
number from 2 and up may be used". While I agree that having 256 dices
is improbable we'll have to decide whether:
1/ keep using u8 for the number of dices, thus limiting them to 256,
assuming that the table length is wrong. In this case you'll have to
check sccr_mc_header->length and return an error for no-of-dices > 256
2/ use unsigned int for the number of dices and hope you'll get an
ENOMEM sooner or later

> +		params->vreg_offset[i] = dwords[(i - 1) * 2];

use SFDP_DWORD() please
> +
> +out:
> +	kfree(dwords);
> +	return ret;
> +}
> +
>   /**
>    * spi_nor_post_sfdp_fixups() - Updates the flash's parameters and settings
>    * after SFDP has been parsed. Called only for flashes that define JESD216 SFDP
> @@ -1461,6 +1521,10 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
>   			err = spi_nor_parse_sccr(nor, param_header);
>   			break;
>   
> +		case SFDP_SCCR_MAP_MC_ID:
> +			err = spi_nor_parse_sccr_mc(nor, param_header);
> +			break;
> +
>   		default:
>   			break;
>   		}

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
