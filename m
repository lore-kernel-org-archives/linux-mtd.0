Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70A9C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Dec 2023 10:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CRdx9LfFlVX9rzr0OsPKjZ0gSuIzdp2BReZWMHwWs+g=; b=RdVBM2XQgidV65OzNDi8qoFq0J
	kjS0S0+Xzqt+V9jlcUKYtupQQVMQBTtNjCgKCh+Qu3ESTHcsRwox5eGH/qBWwqVq/xn6GYxGNwPqT
	/CdU4rD6IqRTXl0jWAvoyTh7jTt/dmfpT/qYlX2723cy6yXoMUrqtXBhGNkasO/YNEIixct7bl6tG
	oLTGkLxOi/ngsX+shV/HyUT4NRx/j3uoEqFnrwgFsoQ6XU1wjku+ohePg+HW2qqMQp1RP2q0lPATa
	RFCgvAagYclSdtb/WTXcEJqw4UKCtKbdUvBNRJQ28dFr8z8Swh9dd18sjOuLLJrVQU7vji3XioDfd
	fm6r1BYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDMB5-00EDLU-1U;
	Wed, 13 Dec 2023 10:09:19 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDMB1-00EDKC-0R
	for linux-mtd@lists.infradead.org;
	Wed, 13 Dec 2023 10:09:16 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id B706871;
	Wed, 13 Dec 2023 11:09:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1702462148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eeY+p4CoCzlDbqUUkswU5wPVwxBWNtm5b7/iq0AC188=;
	b=B2AP/N+mtwhkU4czMm5WKXxHl2y8Y7fzQ9IfbPP6bYEo2NYGCHzP80IhxMxPtfETX3t4gw
	m1HRULr7v2iWlfK67oZgKjfqkTxahJMSiVue6MnSqjnRjEzH1a547waf9bs6eqoORsozNA
	MTL3SSkZwY6VrUoXT2oMUpzexmwXm92SGw/VJ/1ghJ4//LDoG1BMXDU6Ftrq9twMX7DAKg
	lXfgsrVLIKNtWMU290DBbREvtKTbtxlj2eyZVsPRHl2xJN6dyqB8nJh4E1Eh7G+8t+VhpX
	88C6PBlEVD5XES9D61IIoXSSKKMKw6GhyKnuyTtHZ0G0yL3eDSh/DpEmNIt6qQ==
MIME-Version: 1.0
Date: Wed, 13 Dec 2023 11:09:08 +0100
From: Michael Walle <michael@walle.cc>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH] mtd: spi-nor: sfdp: Get the 1-1-8 protocol from BFPT
In-Reply-To: <20231213092753.58933-1-jaimeliao.tw@gmail.com>
References: <20231213092753.58933-1-jaimeliao.tw@gmail.com>
Message-ID: <1c62800576971fd52e737504925a6a60@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_020915_327733_D5F618B8 
X-CRM114-Status: GOOD (  18.41  )
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

you've missed the version tag and a changelog, so better to resend
the patch.

> BFPT 17th DWORD contains the informations about 1-1-8,
> Parse BFPT 17 DWORD instruction to determine
> whether flash support 1-1-8, and set its dummy cycle
> accordingly.
> 
> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>

Reviewed-by: Michael Walle <michael@walle.cc>

-michael

> ---
>  drivers/mtd/spi-nor/sfdp.c | 13 ++++++++++++-
>  drivers/mtd/spi-nor/sfdp.h |  3 +++
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index b3b11dfed789..c55f39978762 100644
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
> @@ -525,7 +526,6 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  	for (i = 0; i < ARRAY_SIZE(sfdp_bfpt_erases); i++) {
>  		const struct sfdp_bfpt_erase *er = &sfdp_bfpt_erases[i];
>  		u32 erasesize;
> -		u8 opcode;
> 
>  		half = bfpt.dwords[er->dword] >> er->shift;
>  		erasesize = half & 0xff;
> @@ -631,6 +631,16 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  	if (bfpt_header->length == BFPT_DWORD_MAX_JESD216B)
>  		return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
> 
> +	/* Parse 1-1-8 read instruction */
> +	opcode = FIELD_GET(BFPT_DWORD17_RD_1_1_8_CMD, 
> bfpt.dwords[SFDP_DWORD(17)]);
> +	if (opcode) {
> +		dummy = FIELD_GET(BFPT_DWORD17_RD_1_1_8_DUMMY, 
> bfpt.dwords[SFDP_DWORD(17)]);
> +		nor->params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_8;
> +		spi_nor_set_read_settings(&nor->params->reads[SNOR_CMD_READ_1_1_8],
> +					  0, dummy, opcode,
> +					  SNOR_PROTO_1_1_8);
> +	}
> +
>  	/* 8D-8D-8D command extension. */
>  	switch (bfpt.dwords[SFDP_DWORD(18)] & BFPT_DWORD18_CMD_EXT_MASK) {
>  	case BFPT_DWORD18_CMD_EXT_REP:
> @@ -968,6 +978,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
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
