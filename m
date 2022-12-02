Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988B6C4321E
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Dec 2022 15:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Egx9xZdrjmN/PzS9PICg5ZYWki/UIOdQwUP1CAhcB+8=; b=t0WEYrFgFK3hMzftoZgjf2emko
	I3uivsFj7F3jQYUiO367KWJ+Z6MmpAoZHQQNUoE3hspKNxVPMXriPK1GvGIFE8JAAXHIMRmLsPA1j
	pSCn+fkOwBMLzUYT9l9H2hakHkgSH1PYILQPQVA3NiSEz9sL6JfBgsFBN6wafkQR4MtF2Mck4YN4A
	i2fmJ6DozrhrB95agzl9WrX1XaRt5/VE1O7J60D7HZtuEWVtf9LUN2ul/LSrjpNpR0d8ugnmstx2+
	0FVxwF9UHzSkv3PNw73FXXCgRaIZkoGv8MsdxGkSB7BaOECibujLCQe3GlXK5+zSsfWp+Ghf6fP1c
	pLeEzspQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p17qQ-00H3Bg-VK; Fri, 02 Dec 2022 15:20:55 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p17qN-00H39o-VI
	for linux-mtd@lists.infradead.org; Fri, 02 Dec 2022 15:20:53 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id B14B388;
	Fri,  2 Dec 2022 16:20:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1669994447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qwzgqDrqryim/NXtkdBjmmP6OU79ug3+PLqn4ekooRM=;
	b=sV4anxgk90bSg8dMdOUUaUopcb9+aNEeAq/Fpw5HR1ui7sUGqHoZwDC3QzsxEtFw5Op+G3
	1+UBIMsw53W2vx5VmXVv41STRsQQoG+YEFzeOmOcgWdfN2dCOR2j62hhO62rzkuPbh5jyE
	KfzPrsAS5vdSPJkohJxkK3x+54mEMdTSWN+1tQrUEZUaOGJm6XWio1hLhtK6cwEgEQA15A
	uP9MRtI3NM75QB1jrSDYQ8ZolqTbbVShGCsIA5ui+TVsRK1Neqm3C3t3p5j4hxcd32lAdn
	xOoYeL/wuKCKwapeEr8q2YHtslb90UmL3bokofYEY//Q0qp/wN+w82L+IfUxWw==
MIME-Version: 1.0
Date: Fri, 02 Dec 2022 16:20:47 +0100
From: Michael Walle <michael@walle.cc>
To: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Cc: greg.malysa@timesys.com, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] mtd: spi-nor: Add support for IS25LX256 operating
 in 1S-8S-8S octal read mode
In-Reply-To: <20221202135539.271936-4-nathan.morrison@timesys.com>
References: <20221202135539.271936-1-nathan.morrison@timesys.com>
 <20221202135539.271936-4-nathan.morrison@timesys.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <fa6f089e529b649603db4cf7024ae59b@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_072052_188538_A312C707 
X-CRM114-Status: GOOD (  19.13  )
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

Am 2022-12-02 14:55, schrieb Nathan Barrett-Morrison:
> This adds the IS25LX256 chip into the ISSI flash_info parts table
> 
> Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> ---
>  drivers/mtd/spi-nor/issi.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
> index 89a66a19d754..362bc3603d8f 100644
> --- a/drivers/mtd/spi-nor/issi.c
> +++ b/drivers/mtd/spi-nor/issi.c
> @@ -29,6 +29,35 @@ static const struct spi_nor_fixups is25lp256_fixups 
> = {
>  	.post_bfpt = is25lp256_post_bfpt_fixups,
>  };
> 
> +static int
> +is25lx256_post_bfpt_fixups(struct spi_nor *nor,
> +			   const struct sfdp_parameter_header *bfpt_header,
> +			   const struct sfdp_bfpt *bfpt)
> +{
> +	/*
> +	 * IS25LX256 supports both 1S-1S-8S and 1S-8S-8S.
> +	 * However, the BFPT does not contain any information denoting this
> +	 * functionality, so the proper fast read opcodes are never setup.
> +	 * We're correcting this issue via the fixup below.  Page program
> +	 * commands are detected and setup properly via the 4BAIT lookup.
> +	 */
> +	params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_8;
> +	spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_8],
> +				  0, 8, SPINOR_OP_READ_1_1_8,
> +				  SNOR_PROTO_1_1_8);
> +
> +	params->hwcaps.mask |= SNOR_HWCAPS_READ_1_8_8;
> +	spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_8_8],
> +				  0, 16, SPINOR_OP_READ_1_8_8,
> +				  SNOR_PROTO_1_8_8);
> +
> +	return 0;
> +}
> +
> +static const struct spi_nor_fixups is25lx256_fixups = {
> +	.post_bfpt = is25lx256_post_bfpt_fixups,
> +};
> +
>  static void pm25lv_nor_late_init(struct spi_nor *nor)
>  {
>  	struct spi_nor_erase_map *map = &nor->params->erase_map;
> @@ -74,6 +103,9 @@ static const struct flash_info issi_nor_parts[] = {
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
>  		.fixups = &is25lp256_fixups },
> +	{ "is25lx256", INFO(0x9d5a19, 0, 0, 0)
> +		PARSE_SFDP
> +		.fixups = &is25lx256_fixups },

Very nice!

Subject is slightly wrong because you fix up the BFPT to get
correct 1-1-8 and 1-8-8 read modes.

With that fixed:
Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
