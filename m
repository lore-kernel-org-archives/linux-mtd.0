Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB3EC19F2A
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Jul 2022 01:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VIufqqLUl1BWvO1pe+ISHdPGZEytYqe40Jj1g7UgghM=; b=uaD/RFYiKUREdn
	AHJuACsIpfFWvn5Ox8vguFgMTHXM8j5yqZxsfHU5yF36jESrO0teKba/86zt1Q/MJXI0AtC9EKtE0
	hfyXJi8QOV9kPXyMSAKTDMp5Pe/PYu5UFJdP9VygoqT755u4VLUdEG7Xvij6MwcpCoExlaKSlEcZY
	79xhKAF9AAmGUGEELuX/7iop9Ng+vYyvEVPxO5QK01J4l7502oCwtIdt98gXusbCvgrFSRkQFfy49
	ZmFJmH7uTX/QAKnNqmAvycV2ArTx4yaFUFppspE0jeebzhFzjuD0VFmPhr1MscbC44nNjjtbKSx14
	0sPW8RGUzmv25WLguENQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHEzR-00Gl0q-A3; Fri, 29 Jul 2022 01:40:33 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHEzO-00Gl09-Q9
	for linux-mtd@lists.infradead.org; Fri, 29 Jul 2022 01:40:32 +0000
Received: by mail-pl1-x632.google.com with SMTP id w10so3343373plq.0
        for <linux-mtd@lists.infradead.org>; Thu, 28 Jul 2022 18:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Eo5jg5ayRXB4TdtAm0z0aMnd75D86Seh8rqM2BVtt0g=;
        b=P3M3foQMfiWgTL/sHFJ7271NI6TvT4WVkvA+FGQWv7+tZqNkeTX2bWtnKB1RQrPUZa
         4TRoSXuttiWVO4mEMG3u5QAJScRUvftwxqXptpBWLZHFA2rEKLRFt9BnURVKIfw4yRj9
         9BujrM0AsW6sL2OaawPi/ywCTWl2ofk1t8uVgppjAJeKG75G9scTlXb8EhtTMfAIUFBx
         K4lj3F4GQZV9t1U1/HYKP8ziWM0MT+93fgRPcycJgl/XFOkQFU8PCbpFGoG5E22H/5+T
         E2grnHHVvgUyMCTyWxyq8x2UU5O9EV8TH3XxQ0g1qFSmdrE+9Up3ow//3xmcmMpQs/Ns
         PCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Eo5jg5ayRXB4TdtAm0z0aMnd75D86Seh8rqM2BVtt0g=;
        b=fne+6qSzUw5P5BsWVGVbBQX2F/g4ussYwanmf/fmsL7XC/R9nMdfgy/o8DCaXvwqpz
         l826FOmKZYKBX+mluFOJ1by9uOwLtz3NbGZVygVRX4CBgdOS6lFrWtfxbyv/fKrxw4aL
         B7sPQKUcDKK21I1MwOU6EkFlL27qxqSHXG8gp1yB5i03LsBk/v3ZwnpSYRYUbxlxxLTe
         EGYAus6H9/HCs5wSP0vIgnwPKsDzrQL9w5KPna6xPQUuE5Zp7NeDk+8qhneN0UfXf3Vd
         5dklaD2MxiUpeaoQYazq0ilxAFt54rBKVANBefaU3IjSvymb5L3l/EDRsrO6B2ay6d6r
         pNBg==
X-Gm-Message-State: ACgBeo3p7LclVjrd+tkcse7c5vIQdqkr3Gy4iqpasejmKgkjXi+Gl0aP
	aFd+w13g9g0GfHTdpEQKja0=
X-Google-Smtp-Source: AA6agR4B1pqzCZhfkZmQ8SaJ8TZYx/l++yWdW3ONhv+xiQdW7xTKP9QU5dBiVN8oO9xGdyWFKBjNrg==
X-Received: by 2002:a17:90b:388f:b0:1f2:c9fb:e58a with SMTP id mu15-20020a17090b388f00b001f2c9fbe58amr1504569pjb.162.1659058827729;
        Thu, 28 Jul 2022 18:40:27 -0700 (PDT)
Received: from [192.168.0.10] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id t1-20020a1709027fc100b0016db1b67fb9sm1965003plb.224.2022.07.28.18.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 18:40:27 -0700 (PDT)
Message-ID: <67f1741d-343c-f704-b5a8-3bc84e1c0e7e@gmail.com>
Date: Fri, 29 Jul 2022 10:40:24 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 5/6] mtd: spi-nor: add generic flash driver
Content-Language: en-US
To: Michael Walle <michael@walle.cc>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20220513133520.3945820-1-michael@walle.cc>
 <20220513133520.3945820-6-michael@walle.cc>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <20220513133520.3945820-6-michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_184030_881492_EB57DFB3 
X-CRM114-Status: GOOD (  27.04  )
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

On 5/13/2022 10:35 PM, Michael Walle wrote:
> Our SFDP is parsing is everything we need to support all basic
redundant "is"?

> operations of a flash device. If the flash isn't found in our in-kernel
> flash database, gracefully fall back to a driver described solely by its
> SFDP tables.
> 
> It is still recommended to add the flash to the in-kernel database.
> First, we get a proper partname and secondly, for all features not
> described by the SFDP like OTP we need the entry anyway.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/core.c | 13 +++++++++++++
>  drivers/mtd/spi-nor/core.h |  1 +
>  drivers/mtd/spi-nor/sfdp.c | 27 +++++++++++++++++++++++++++
>  3 files changed, 41 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 65cd8e668579..ee193a61310a 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1632,6 +1632,11 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
>  	&spi_nor_xmc,
>  };
>  
> +static const struct flash_info spi_nor_generic_flash = {
> +	.name = "spi-nor-generic",
> +	.parse_sfdp = true,
> +};
> +
>  static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
>  						 const u8 *id)
>  {
> @@ -1670,6 +1675,14 @@ static const struct flash_info *spi_nor_detect(struct spi_nor *nor)
>  		return ERR_PTR(-ENOMEM);
>  
>  	info = spi_nor_match_id(nor, id);
> +
> +	/* Fallback to a generic flash described only by its SFDP data. */
> +	if (!info) {
> +		ret = spi_nor_check_sfdp_signature(nor);
> +		if (!ret)
> +			info = &spi_nor_generic_flash;
> +	}
> +
>  	if (!info) {
>  		dev_err(nor->dev, "unrecognized JEDEC id bytes: %*ph\n",
>  			SPI_NOR_MAX_ID_LEN, id);
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 3a19b8092ab8..aa9f218245a5 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -694,6 +694,7 @@ int spi_nor_controller_ops_read_reg(struct spi_nor *nor, u8 opcode,
>  int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
>  				     const u8 *buf, size_t len);
>  
> +int spi_nor_check_sfdp_signature(struct spi_nor *nor);
>  int spi_nor_parse_sfdp(struct spi_nor *nor);
>  
>  static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index a5211543d30d..9bdb3d5dc7e8 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -1247,6 +1247,33 @@ static void spi_nor_post_sfdp_fixups(struct spi_nor *nor)
>  		nor->info->fixups->post_sfdp(nor);
>  }
>  
> +/**
> + * spi_nor_check_sfdp_header() - check for a valid SFDP header
> + * @nor:		pointer to a 'struct spi_nor'
> + *
> + * Used to detect if the flash supports the RDSFDP command as well as the
> + * presence of a valid SFDP table.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +int spi_nor_check_sfdp_signature(struct spi_nor *nor)
> +{
> +	u32 signature;
> +	int err;
> +
> +	/* Get the SFDP header. */
> +	err = spi_nor_read_sfdp_dma_unsafe(nor, 0, sizeof(signature),
> +					   &signature);
> +	if (err < 0)
> +		return err;
> +
> +	/* Check the SFDP signature. */
> +	if (le32_to_cpu(signature) != SFDP_SIGNATURE)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +

Nice to use this function from spi_nor_parse_sfdp() as well, but I found it's
not straightforward...

Reviewed-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Thanks,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
