Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED33EB64DC
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jun 2023 06:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3lShIeoQrJvOgNqzD2l8JpgrFb929o9b7gL1Xs85+8=; b=zewd7dj8BAptiIAXUIVI0Ujkw7
	AuZBxqSF1eyuDYdwhY969tSr4StKsNQ7MZZvkX/CutbVz/jeX5ZuSIzj8+mszFlALbnYwBk0vbLw7
	izuTsqPXZTpS+PpoqYFiv9UuGTVPwDohmzjnJCCfYJ5FpHTFUQr2FZO4GPFMdS4+s/E6ssNSTbXT1
	5RIQIle/4EH4rg873hQEa/RScVY65GXLXOR7pDn7KVQVdxzlLIV7E1gi0b26qo9cO5Kf0HEvuUPhN
	0DZVkVz1TjwPq3CGbufhCiF4tY4M66ByCeMDjaTCd2KtX2YPZOg3pIzY9nBptXq/t9tof0IN2oOj5
	zNw/i+nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE1yh-00C5gc-2f;
	Tue, 27 Jun 2023 06:15:03 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE1ye-00C5eR-1M
	for linux-mtd@lists.infradead.org;
	Tue, 27 Jun 2023 06:15:01 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id E256850B;
	Tue, 27 Jun 2023 08:14:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1687846497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UvmboR1BMviOSQ7PsVkhSOxfTc1VG5c3nYyF5muyxD0=;
	b=EE1kURunazGQ1GVYw9yAX4tHHZaKj/eZzng78T1g3a4vD2YUolfM6OgJSTUKGvG0iV+Urw
	7YmVVweu87mPvKniop95Bec6euXwvGdTPaIwWiyPR6GMNPYVXuSobppkVnJLRfnhNUAcMB
	wLraEhPRd68gTgv+9a4jNkQqU250fgAAPuh2GLdHe4qCEMGQEKiYWk94w5/iema9p7e//w
	18HVbfKPfh2TEDtrFeqUYx6Z3S+sL3Z9EtR6J5CXc41fzytvUWCminuvAA9FFADiFMW4ET
	JK86a0tu6gx7+GynYtX3/SlLvl8Y7A5SJl7aJnoi8q2Qa6F/In/POuEHUX05uQ==
MIME-Version: 1.0
Date: Tue, 27 Jun 2023 08:14:57 +0200
From: Michael Walle <michael@walle.cc>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 git@amd.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, amitrkcian2002@gmail.com, Amit Kumar Mahapatra
 <amit.kumar-mahapatra@amd.com>
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: Avoid setting SRWD bit in SR if WP#
 signal not connected
In-Reply-To: <20230625100251.31589-3-amit.kumar-mahapatra@amd.com>
References: <20230625100251.31589-1-amit.kumar-mahapatra@amd.com>
 <20230625100251.31589-3-amit.kumar-mahapatra@amd.com>
Message-ID: <5e5fe22aebe17da4f9ad2c4eaaa8985f@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_231500_619710_BAAB8959 
X-CRM114-Status: GOOD (  18.10  )
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

Am 2023-06-25 12:02, schrieb Amit Kumar Mahapatra:
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
>  drivers/mtd/spi-nor/core.c | 3 +++
>  drivers/mtd/spi-nor/core.h | 1 +
>  drivers/mtd/spi-nor/swp.c  | 9 +++++++--
>  3 files changed, 11 insertions(+), 2 deletions(-)
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

Please put it below the of_property_read_bool() which is already
there, just to keep things sorted.

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

See the comment right above this enum :/

>  };
> 
>  struct spi_nor_read_command {
> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
> index 0ba716e84377..cfaba41d74d6 100644
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
> +	 * wrongly tied to GND(that includes internal pull-downs).

nit: space missing

Otherwise looks good.

Thanks,
-michael

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
