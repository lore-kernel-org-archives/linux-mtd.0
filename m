Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC25EB64DC
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jul 2023 12:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uf3Mcp+3Nb9oOI0TND3fOyH0gN74tkY7tnMj7hyaUxQ=; b=lUNuOdSDSybyt6aUAfB3uea2tX
	kLrqzinqXBZx7a/utkxkLxQyhWyZI5ipeEeU07/Ws1YqmfZ0x/BsSJEk895rr2CME8pdbbWKuootR
	MolWzgNh8LOGlLmdYAdwwXP1IzUgoSYJFCNGXSyBTdfDrzrEpYd4Y5xUurvhuA9a46k9W7G1de4jO
	jyvCZfISgo+6NRb4JXWym8aO1idSTG1B4wt7lX6Ud1gpJ/XLyHg3fn5UqaNZVSvV+8N80qSfciF/g
	kShWmxQ2SYZBaq3+8R+4BIt1rFnYqh5x5AYTgfqLZJI/EAHNy3SI5dxK29hZA8KqUmJlxg+SSLf1y
	QboI7smw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLNOV-003zgd-1O;
	Mon, 17 Jul 2023 12:32:03 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLNOB-003zbg-0Q
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jul 2023 12:32:01 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id AF02F968;
	Mon, 17 Jul 2023 14:31:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1689597099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jB2Vzy9Nk2D5WxMfnpRq96P+gZedJhoPX3lCcWj+beI=;
	b=pENPrUWOV/sZNmDeoIWjLvEQZyQH+kJxomjQ4NdK2d07gvXYNBkCVcpyHv5Nlos2GRhQH4
	gjePQQjvZmVpEbBAdh6aeu6gtfVTq/CL1H3Z2/X8rxhfhm+hkBoafK0LAL56qh2H65P2Ck
	klYnx4ZRLgTSRP6FNDVCTX13aZxePl1vTNHg0V5y5clliYCGhf3fiEb7/RdxK8dHMD9Emy
	epX1dBo5f5wC1RDbrCnxKKWbykuY3aSM/U4d+X1Xvj6De9HIjJnsDhxiDculO3jVXDnt6v
	5PiRPzoXiPkoOmc3SPP/AtemRbUZb1EK5WzTE4yKO7VVJWBwQtVLFJ5jHoXuKA==
MIME-Version: 1.0
Date: Mon, 17 Jul 2023 14:31:39 +0200
From: Michael Walle <michael@walle.cc>
To: SSunk <ssunkkan@gmail.com>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, SSunk
 <ssunkkan@gmail.com>
Subject: Re: [PATCH] Add support for XMC
 XM25QH128C/XM25QH256C/XM25QU256C/XM25QH512C/XM25QU512C
In-Reply-To: <20230717110625.8844-1-ssunkkan@gmail.com>
References: <20230717110625.8844-1-ssunkkan@gmail.com>
Message-ID: <bfc85475bdcea46ea6c3ece98cc1e9cc@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_053143_319773_D3150A85 
X-CRM114-Status: GOOD (  12.14  )
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

> Add more XMC chip support

Please elaborate.

> Signed-off-by: SSunk <ssunkkan@gmail.com>

We need a proper first and last name.

> ---
>  drivers/mtd/spi-nor/xmc.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
> index 051411e86339..b2374187ec4f 100644
> --- a/drivers/mtd/spi-nor/xmc.c
> +++ b/drivers/mtd/spi-nor/xmc.c
> @@ -16,6 +16,22 @@ static const struct flash_info xmc_nor_parts[] = {
>  	{ "XM25QH128A", INFO(0x207018, 0, 64 * 1024, 256)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>  			      SPI_NOR_QUAD_READ) },
> +	{ "XM25QH128C", INFO(0x204018, 0, 64 * 1024, 256)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> +			      SPI_NOR_QUAD_READ) },
> +	{ "XM25QH256C", INFO(0x204019, 0, 64 * 1024, 512)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> +			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> +	{ "XM25QU256C", INFO(0x204119, 0, 64 * 1024, 512)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> +			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> +	{ "XM25QH512C", INFO(0x204020, 0, 64 * 1024, 1024)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> +			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> +	{ "XM25QU512C", INFO(0x204120, 0, 64 * 1024, 1024)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> +			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> +

XMC parts seem to have SFDP tables and they should work out of the box
without any patches with the generic spi nor driver [1]. Therefore,
you don't need any entry at all.

-michael

[1] 
https://elixir.bootlin.com/linux/v6.4-rc6/source/drivers/mtd/spi-nor/core.c#L2019

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
