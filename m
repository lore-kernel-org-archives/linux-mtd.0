Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A31D6DDED
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Nov 2024 11:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hgwmHNhoGjJ7V7gKEPaT6Qjaym0VXZzfVJJOjmUG4GQ=; b=EjO+egT28YXT/F
	phhVX/nl5MRWRzNAUewoMfRjxD4zc3tYTIEoKIXKZbzQNVVtabBbVDLM4J5q2MSJywRGmYsFXMDfX
	UusB1W5aWJZG9DKvVjI0Ml6dwhdf9LQl7r4WygYpSnF+SpuzHfVZt8U7G3GGQ6PC7bVPrBim+8l0I
	KZAszDoQAgyK+8tx4wHbmOKHplUXSYEpTJhfq71OS0+BxOO0TApJLecd0eb7fu2hosrOTYOP8yKny
	OfbxPrvpvlZBju4ujzCbwBVi/weJbCJNfr1RL2afjvz9yT+1vxnEs2rU05L8xz24c1jUto6+hWyUH
	oehrKwV3k1TRLNP1mORQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBuaZ-00000002XkP-438j;
	Fri, 15 Nov 2024 11:34:11 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBuZd-00000002XYU-1Uxq;
	Fri, 15 Nov 2024 11:33:14 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 300383B8;
	Fri, 15 Nov 2024 12:33:02 +0100 (CET)
Mime-Version: 1.0
Date: Fri, 15 Nov 2024 12:32:53 +0100
Message-Id: <D5MPWZF8NUW9.1VVRAD59LVVV2@kernel.org>
Subject: Re: [PATCH v3] mtd: spi-nor: atmel: add at25sf321 entry
Cc: <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Marcus Folkesson" <marcus.folkesson@gmail.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Nicolas Ferre"
 <nicolas.ferre@microchip.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>
X-Mailer: aerc 0.16.0
References: <20241115-spi-nor-v3-1-93ec584177cb@gmail.com>
In-Reply-To: <20241115-spi-nor-v3-1-93ec584177cb@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_033313_534378_86C45DB3 
X-CRM114-Status: GOOD (  11.81  )
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

Hi Marcus,

On Fri Nov 15, 2024 at 12:21 PM CET, Marcus Folkesson wrote:
> Add entry for the at25sf321 32Mbit SPI flash.
>
> This flash is populated on a custom board and was tested at
> 10MHz frequency using the "ti,da830-spi" SPI controller.
>
> Link:
> https://www.renesas.com/en/document/dst/at25sf321-datasheet?r=1608801
>

Please put the URL into the same line as the link and no empty line
between your SoB and the link.

> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

..

> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
> index 45d1153a04a07b7c61f46b117311b24ab695038f..ff9462d9b8ed83f44ee99a7f3b70b99b4d455e9b 100644
> --- a/drivers/mtd/spi-nor/atmel.c
> +++ b/drivers/mtd/spi-nor/atmel.c
> @@ -238,6 +238,11 @@ static const struct flash_info atmel_nor_parts[] = {
>  		.flags = SPI_NOR_HAS_LOCK,
>  		.no_sfdp_flags = SECT_4K,
>  		.fixups = &at25fs_nor_fixups
> +	}, {
> +		.id = SNOR_ID(0x1f, 0x87, 0x01),
> +		.name = "at25sf321",

No name please. As you've already found out the ID will be reused
and the name is just misleading.

> +		.size = SZ_4M,
> +		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  	},
>  };

Otherwise looks good and with that above fixed:

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
