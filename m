Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE55EB64D7
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jun 2023 14:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IBO/PRUgRZyQWKQCoAK0eQAC8PZtprSBwuj08i0giEk=; b=CR5rmaZTLGedwXM8ylzEPVjmLZ
	7x9vjVEL1Ges+yjFfD5jwhI/IVnLNtylOvEBPmZfLC/3DMjRdK3li2iN4uv5sNMZID6wOlpiL8bJp
	kmwZIaS+ny3dxbvuoW66q0CoJyLh7UlTPX0qk1ypgEXUYw5G02QGMRnfYVpZC8vIDQsU6AtE/RL1A
	Xetvh+gP21UHdXLCXu1rYNyHYJYiK08mtDTdNO+GuT7LJTE/u1rJ9CITdv9Rb01VUNAZWBxzZvhE/
	S0KEEmlg6i8sGwzhtPyVC4TUwuAHd4T9AJ6+H4eTVuOcwy6Gcycf+6IuDa059ASvI7MDWb+/EboMe
	uNljnfiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFFGj-003rZR-22;
	Fri, 30 Jun 2023 14:38:41 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFFGg-003rYb-22
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jun 2023 14:38:40 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 6CBA161A;
	Fri, 30 Jun 2023 16:38:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1688135912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z3dNqsYdomU8JDWZFc7ypuImUApBhTKuCgR+jHSwU44=;
	b=yVOQmT7E68fq2NuJt5AXkzK1y6OIwQbSIWa5NtHXnjsc1ITm571s0nfTDQqoBeXgkESZhC
	LWzAhHKUTh2C1weBLzmM86uK0uv9WXB4nvd8gDjEOPIAWT0NrtzzXa7quCZKWH3m2t9UFh
	FZmlDuQ/JQu5sdymIH0KBTEpjjHL/iQcgYuwqSWOduM6cOOwgLhFn4eWpTEd/+jVLT7w6p
	4YlWe7Za7iKwtVPaF5ptAMHr0qhEaF45iYwIM1qc4LZ0fG25ub1YqlQwJ7UweY5SW05p9W
	vbA4TgHvWUnfauT05g+g+Jg8PncW46Pi3uQi9BUN9ijNyazEobrri/LkvrI1bA==
MIME-Version: 1.0
Date: Fri, 30 Jun 2023 16:38:32 +0200
From: Michael Walle <michael@walle.cc>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 git@amd.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, amitrkcian2002@gmail.com, Amit Kumar Mahapatra
 <amit.kumar-mahapatra@amd.com>
Subject: Re: [PATCH v4 2/2] mtd: spi-nor: Avoid setting SRWD bit in SR if WP#
 signal not connected
In-Reply-To: <20230630142233.63585-3-amit.kumar-mahapatra@amd.com>
References: <20230630142233.63585-1-amit.kumar-mahapatra@amd.com>
 <20230630142233.63585-3-amit.kumar-mahapatra@amd.com>
Message-ID: <10ae0cdbaf4b080d337ab4945d335f25@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_073838_821058_3EABB577 
X-CRM114-Status: GOOD (  18.01  )
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

Am 2023-06-30 16:22, schrieb Amit Kumar Mahapatra:
> Setting the status register write disable (SRWD) bit in the status
> register (SR) with WP# signal of the flash left floating or wrongly 
> tied to
> GND (that includes internal pull-downs), will configure the SR 
> permanently
> as read-only. If WP# signal is left floating or wrongly tied to GND, 
> avoid
> setting SRWD bit while writing the SR during flash protection.
> 
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---
>  drivers/mtd/spi-nor/core.c    | 3 +++
>  drivers/mtd/spi-nor/core.h    | 1 +
>  drivers/mtd/spi-nor/debugfs.c | 1 +
>  drivers/mtd/spi-nor/swp.c     | 9 +++++++--
>  4 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 0bb0ad14a2fc..520f5ab86d2b 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2864,6 +2864,9 @@ static void spi_nor_init_flags(struct spi_nor 
> *nor)
>  	if (flags & NO_CHIP_ERASE)
>  		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
> 
> +	if (of_property_read_bool(np, "no-wp"))
> +		nor->flags |= SNOR_F_NO_WP;
> +

Not moved below the first of_property_read_bool() in that function
(as pointed out before). It's just a minor nit.

But with or without that fixed:

Reviewed-by: Michael Walle <michael@walle.cc>

>  	if (flags & SPI_NOR_RWW && nor->info->n_banks > 1 &&
>  	    !nor->controller_ops)
>  		nor->flags |= SNOR_F_RWW;
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 4fb5ff09c63a..55b5e7abce6e 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -132,6 +132,7 @@ enum spi_nor_option_flags {
>  	SNOR_F_SWP_IS_VOLATILE	= BIT(13),
>  	SNOR_F_RWW		= BIT(14),
>  	SNOR_F_ECC		= BIT(15),
> +	SNOR_F_NO_WP		= BIT(16),
>  };
> 
>  struct spi_nor_read_command {
> diff --git a/drivers/mtd/spi-nor/debugfs.c 
> b/drivers/mtd/spi-nor/debugfs.c
> index e11536fffe0f..6e163cb5b478 100644
> --- a/drivers/mtd/spi-nor/debugfs.c
> +++ b/drivers/mtd/spi-nor/debugfs.c
> @@ -27,6 +27,7 @@ static const char *const snor_f_names[] = {
>  	SNOR_F_NAME(SWP_IS_VOLATILE),
>  	SNOR_F_NAME(RWW),
>  	SNOR_F_NAME(ECC),
> +	SNOR_F_NAME(NO_WP),
>  };
>  #undef SNOR_F_NAME
> 
> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
> index 0ba716e84377..5ab9d5324860 100644
> --- a/drivers/mtd/spi-nor/swp.c
> +++ b/drivers/mtd/spi-nor/swp.c
> @@ -214,8 +214,13 @@ static int spi_nor_sr_lock(struct spi_nor *nor, 
> loff_t ofs, uint64_t len)
> 
>  	status_new = (status_old & ~mask & ~tb_mask) | val;
> 
> -	/* Disallow further writes if WP pin is asserted */
> -	status_new |= SR_SRWD;
> +	/*
> +	 * Disallow further writes if WP# pin is neither left floating nor
> +	 * wrongly tied to GND (that includes internal pull-downs).
> +	 * WP# pin hard strapped to GND can be a valid use case.
> +	 */
> +	if (!(nor->flags & SNOR_F_NO_WP))
> +		status_new |= SR_SRWD;
> 
>  	if (!use_top)
>  		status_new |= tb_mask;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
