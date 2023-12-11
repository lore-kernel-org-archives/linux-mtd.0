Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372A2C4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Dec 2023 10:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tBhG+UKk0FaBztNKZba1xUpL26uO49hPsMiG0SCRfOQ=; b=4ZOghmY6NR+kA1y/vcDRKrB19N
	oyusyohwJO/sgzHLNHKngWqw84gkvVKuMB7y8JFIKdwBL2vdvEjeonnwsDBIixNJMJH4JVxOnhfxj
	VS6YBEq2fw8X4OPKMV+wT351K7YALH6O/WPnnvz94hxus7OQMnGH9Go23Ld7nvFyZhbL+dSBDejaD
	vlEWr4apdhDXs0o1BWYRdv77h42iSx5NPzdm55hw1eO0Lvr3SujMPNVqdO7oy00uBrOprmvbM5aWV
	j0JiT2gUJAwNsf1R1KpW+Kd9ezYUWKMGM3QFoAKp7iMrFrAE7INRgDHtM7HbKKj7ZLzk5ft/mnuSs
	BGLXg+lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCdr8-004eKe-21;
	Mon, 11 Dec 2023 10:49:46 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCdqv-004e8R-16
	for linux-mtd@lists.infradead.org;
	Mon, 11 Dec 2023 10:49:38 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 6AEDE50B;
	Mon, 11 Dec 2023 11:49:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1702291762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KU896UuES4SZhs8TwTE8zWfawLLPT1hixbFsFsP0PxE=;
	b=qsRaGg60lmx3b47LdrY1raft0ufmVGLtx3vCcE7SlDipEIi9WmKIee1ClbYXZAE6ww3TLp
	LdLO48ZOPi+HJrydGvDuLCTVTX5VrHo4pFxKhHVBYHoqU9nwfnoSJE7lciIsN+GqRRj5+s
	QaBidxew6ri2Gna2RMxbe/RQuVc8IfrvuFI+F9fw0IPB9j61buehQ6nTapQ7EeXkvnjzLZ
	bRxbDx2NCsTg8hJI/iP92n2G+XLIu4QNJyLSmYRJI+QqV1qcJiR7EeHpEgaG9YO9pm69zO
	6CFT4VowPt28BMQE6GQNaz8W7NN0cmuLs894P+muWW5iR/CMicEH5ZHAmttulw==
MIME-Version: 1.0
Date: Mon, 11 Dec 2023 11:49:22 +0100
From: Michael Walle <michael@walle.cc>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH] mtd: spi-nor: sfdp: Get the 1-1-8 protocol from BFPT
In-Reply-To: <20231207075121.21788-1-jaimeliao.tw@gmail.com>
References: <20231207075121.21788-1-jaimeliao.tw@gmail.com>
Message-ID: <82372114073788a4b62ec2de163a5b10@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_024933_705989_3E4E990D 
X-CRM114-Status: GOOD (  23.15  )
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

Hi,

> BFPT 17th DWORD contains the informations about 1-1-8,

Ok.

> The difference from Dual and Quad mode is not determined
> by a single bit indicating support but rather by using
> 1-byte instruction, which content is the opcode.

I don't get what you try to express here.

> A value of 0x00 represents not support.
> Therefore, parse BFPT 17 DWORD instruction to determine
> whether flash support 1-1-8, and set its dummy cycle
> accordingly.
> 
> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/sfdp.c | 15 ++++++++++++++-
>  drivers/mtd/spi-nor/sfdp.h |  3 +++
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index b3b11dfed789..d04dbddb70d6 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -446,6 +446,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  	u32 dword;
>  	u16 half;
>  	u8 erase_mask;
> +	u8 dummy, opcode;
> 
>  	/* JESD216 Basic Flash Parameter Table length is at least 9 DWORDs. 
> */
>  	if (bfpt_header->length < BFPT_DWORD_MAX_JESD216)
> @@ -516,6 +517,18 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  		spi_nor_set_read_settings_from_bfpt(read, half, rd->proto);
>  	}
> 
> +	/* Make sure BFPT provide dwords more than 16 and parsing 1-1-8 
> information */
> +	if (bfpt_header->length > BFPT_DWORD_MAX_JESD216B) {

Move that into the JESD216B and later parsing code and you don't
need this condition anymore. That is below

if (bfpt_header->length == BFPT_DWORD_MAX_JESD216)
	return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);

> +		opcode = FIELD_GET(BFPT_DWORD17_RD_1_1_8_CMD, 
> bfpt.dwords[SFDP_DWORD(17)]);
> +		dummy = FIELD_GET(BFPT_DWORD17_RD_1_1_8_DUMMY, 
> bfpt.dwords[SFDP_DWORD(17)]);
> +		if (opcode) {

move the dummy here and you can just declare dummy here.

everything else looks sane to me.

-michael

> +			nor->params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_8;
> +			spi_nor_set_read_settings(&nor->params->reads[SNOR_CMD_READ_1_1_8],
> +					  0, dummy, opcode,
> +					  SNOR_PROTO_1_1_8);
> +		}
> +	}
> +
>  	/*
>  	 * Sector Erase settings. Reinitialize the uniform erase map using 
> the
>  	 * Erase Types defined in the bfpt table.
> @@ -525,7 +538,6 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  	for (i = 0; i < ARRAY_SIZE(sfdp_bfpt_erases); i++) {
>  		const struct sfdp_bfpt_erase *er = &sfdp_bfpt_erases[i];
>  		u32 erasesize;
> -		u8 opcode;
> 
>  		half = bfpt.dwords[er->dword] >> er->shift;
>  		erasesize = half & 0xff;
> @@ -968,6 +980,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
>  		{ SNOR_HWCAPS_READ_1_1_1_DTR,	BIT(13) },
>  		{ SNOR_HWCAPS_READ_1_2_2_DTR,	BIT(14) },
>  		{ SNOR_HWCAPS_READ_1_4_4_DTR,	BIT(15) },
> +		{ SNOR_HWCAPS_READ_1_1_8,	BIT(20) },
>  	};
>  	static const struct sfdp_4bait programs[] = {
>  		{ SNOR_HWCAPS_PP,		BIT(6) },
> diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
> index 6eb99e1cdd61..584a05f9931d 100644
> --- a/drivers/mtd/spi-nor/sfdp.h
> +++ b/drivers/mtd/spi-nor/sfdp.h
> @@ -118,6 +118,9 @@ struct sfdp_bfpt {
>  	(BFPT_DWORD16_EN4B_EN4B | BFPT_DWORD16_EX4B_EX4B)
>  #define BFPT_DWORD16_SWRST_EN_RST		BIT(12)
> 
> +#define BFPT_DWORD17_RD_1_1_8_CMD		GENMASK(31, 24)
> +#define BFPT_DWORD17_RD_1_1_8_DUMMY		GENMASK(20, 16)
> +
>  #define BFPT_DWORD18_CMD_EXT_MASK		GENMASK(30, 29)
>  #define BFPT_DWORD18_CMD_EXT_REP		(0x0UL << 29) /* Repeat */
>  #define BFPT_DWORD18_CMD_EXT_INV		(0x1UL << 29) /* Invert */

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
