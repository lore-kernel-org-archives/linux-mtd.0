Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AD4EB64D9
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jun 2023 12:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G9SlTkuTRcxAes+NoNPyEBzfIOoa6sFpW9AInG+6yeA=; b=0XyIW97z2YrdwP3QA9VUA099v9
	dL3nSt4lVJVPa+p1t6nU+IrJsA/ldo/312lUIUdl6UqCA6JKobyDE6mv7QjqS6PO4I2JM7A33uzV1
	d+2CIMxBgF7JXeIB7P1IenWBPTTSFxK7b8n9Rf8ttl8TdIEEHopT8DHDurrx+INiNYO3QZxoqm07O
	+8GCP4SV2114wL9A//cEp7nxH3a4NlkBUqYBHT6eoEh8PsteiSGeqrJpo31edWQlnSjdqJ6u0ZlFw
	uIu2OFlYhPLHqvFndE2GZCQ/KXtYiQNHadI+bWbwGBOsf6mokdPw3aWdJwsAdO7+9Efhxz6+VU9Z0
	HVFr0k/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9lwQ-00ErQN-1E;
	Thu, 15 Jun 2023 12:19:06 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9lwN-00ErNK-1M
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jun 2023 12:19:04 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id AD4479F4;
	Thu, 15 Jun 2023 14:18:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1686831539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Caj3WcHVhXv2orGAS3eW5p0U6TifL7MgYmHT2thsXY=;
	b=zeqVvJFr2EAj1fuB6oUIj/6PEbDQDew4ofZWxW4UM3mB8WsZlzMAr4y55a3nE8GYqd9c0Y
	Lft6AlIGpRxl+Oio0ZWRV951mmWmXdzuRYz1SbnT7Ws+k1te97Bna5/TI4oBCVGPsyvfqN
	OGXn34D27nvQ1gvvQwkuwItw52UYLro8d4oEhzkrkDQK+zvHz6lKsLrglo745Xbo5fwuVO
	Kth6/H8GjAMdoltgrkr9IOXrgZVkGwNB5McisG5eATfUi5OJEsqbKyURLmobLMoJV6yZLH
	Kr1bh2UDOwElBSnvFM+hPAIIxWTUCQW5h2JTHta2T7zu5ET2JZcKvhwWSoNKhA==
MIME-Version: 1.0
Date: Thu, 15 Jun 2023 14:18:59 +0200
From: Michael Walle <michael@walle.cc>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 git@amd.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, amitrkcian2002@gmail.com
Subject: Re: [PATCH 2/2] mtd: spi-nor: Avoid setting SRWD bit in SR if WP
 signal not connected
In-Reply-To: <20230615111649.36344-3-amit.kumar-mahapatra@amd.com>
References: <20230615111649.36344-1-amit.kumar-mahapatra@amd.com>
 <20230615111649.36344-3-amit.kumar-mahapatra@amd.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <fe5ebc619350c378a14e88275e5dab3b@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_051903_612051_25F088EE 
X-CRM114-Status: GOOD (  19.59  )
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

Am 2023-06-15 13:16, schrieb Amit Kumar Mahapatra:
> Setting the status register write disable (SRWD) bit in the status
> register (SR) with WP signal of the flash not connected will configure 
> the
> SR permanently as read-only. If WP signal is not connected, avoid 
> setting
> SRWD bit while writing the SR during flash protection.
> 
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---
>  drivers/mtd/spi-nor/core.c | 3 +++
>  drivers/mtd/spi-nor/core.h | 1 +
>  drivers/mtd/spi-nor/swp.c  | 5 +++--
>  3 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 0bb0ad14a2fc..81b57c51f41c 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2864,6 +2864,9 @@ static void spi_nor_init_flags(struct spi_nor 
> *nor)
>  	if (flags & NO_CHIP_ERASE)
>  		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
> 
> +	if (of_property_read_bool(np, "broken-wp"))
> +		nor->flags |= SNOR_F_BROKEN_WP;
> +
>  	if (flags & SPI_NOR_RWW && nor->info->n_banks > 1 &&
>  	    !nor->controller_ops)
>  		nor->flags |= SNOR_F_RWW;
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 4fb5ff09c63a..6ac932eba913 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -132,6 +132,7 @@ enum spi_nor_option_flags {
>  	SNOR_F_SWP_IS_VOLATILE	= BIT(13),
>  	SNOR_F_RWW		= BIT(14),
>  	SNOR_F_ECC		= BIT(15),
> +	SNOR_F_BROKEN_WP	= BIT(16),
>  };
> 
>  struct spi_nor_read_command {
> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
> index 0ba716e84377..074f3bce2034 100644
> --- a/drivers/mtd/spi-nor/swp.c
> +++ b/drivers/mtd/spi-nor/swp.c
> @@ -214,8 +214,9 @@ static int spi_nor_sr_lock(struct spi_nor *nor,
> loff_t ofs, uint64_t len)
> 
>  	status_new = (status_old & ~mask & ~tb_mask) | val;
> 
> -	/* Disallow further writes if WP pin is asserted */
> -	status_new |= SR_SRWD;
> +	/* Disallow further writes if WP pin is connected */

"is not broken" or similar. Maybe descibe what is broken.
Like I said, this might also be a valid use case.

Thinking more about this, maybe we should make this
configurable. I.e. make it possible to set the
locking region without disabling further writes. Although
I'm not sure how. Right now, we always enable both the
software and hardware write protection. (winbond distiguish
between software and hardware write protection here; software
here means not linux/kernel but just setting the protection
bits without the locking bit). And in the case WP# is tied
to low, one should not use the hardware write protection.

Although I'm not really sure, how to do that in a backwards
compatible way.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
