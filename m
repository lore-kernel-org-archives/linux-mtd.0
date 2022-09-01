Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E6BECAAD1
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Sep 2022 07:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvGeime94AcCwP/J+Gyll7Bwr0AeCi2i9+Ul0CgrR+s=; b=0ls2oPuWcY6vn9U2nfmbZiQbaa
	r37/rLr1pWs5Zp9qXsNHGa3lxK6U86FQXGu3g9MT3P8Nj9AvWFN9iV51277yPZVAWCoKTI/ZfHpXZ
	yRY8czd1YWRy17PyQSpQu30OtF3XK1uRemx3/yhfgWTg9aAYDBRIFUtHno0M70FtMQ1UZs5Ij86e5
	dyoz9yNSaMCAgVYe1FLdwetPV3yu+HRvCHKLq+weF9Bc2w7rVCU+cR5jwhuSxcfMO7+GkpYbP9SKP
	ypzpvrCSppR0Ew8eLJY7UVsPOeqXWn/vPt/wp8JYddYaaGWwi0N10nxdWy3/ez/igvfQ5NfngCFQP
	p9Yo/i9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTenM-00AMvA-Ek; Thu, 01 Sep 2022 07:39:24 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTenH-00AMuU-SI
	for linux-mtd@lists.infradead.org; Thu, 01 Sep 2022 07:39:21 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 88D582164;
	Thu,  1 Sep 2022 09:39:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1662017957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wMEtvcM6R7qWErDv+zpeNYOr9cq3oBFA1JIMh558M60=;
	b=q/4wttpnf+Y01ithL9dlOUO6BYasi28m48j1xCoNp07VlkSa97v73f10YMFoHq7xzFswcr
	qkm+MbJzo2pDtQggEl3g5Z9LH1vpDMs6WJjB2RR+B0ZY/Xn/mzw64tR+2xsuuCDAS30k0n
	FOuyS/+YJmLPPaQv/ABYPJhBZzH6mcwp95F3bNiZzZKIKjHZdN1K/SdsJPQ6Uk9MAbNoGx
	qk0jPJvGtv8ZwBUuaxy8cIyZa5RBhfv8Vxo8W0d+Tir5G+YrB49sULfv7bJQ79fV45CVR6
	06ePGrJKsXZIrl8LUQhfflZc5Vvo3ux7tlDbYgdJ4tWOYY2TvquD8tIkXkUdUg==
MIME-Version: 1.0
Date: Thu, 01 Sep 2022 09:39:17 +0200
From: Michael Walle <michael@walle.cc>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 saikrishna12468@gmail.com, git@amd.com
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: Add support for flash reset
In-Reply-To: <20220901072914.30205-3-sai.krishna.potthuri@amd.com>
References: <20220901072914.30205-1-sai.krishna.potthuri@amd.com>
 <20220901072914.30205-3-sai.krishna.potthuri@amd.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <f4c6e60a22a4252bcecdfb3a2c957b2a@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_003920_121434_6AB54184 
X-CRM114-Status: GOOD (  19.54  )
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

Am 2022-09-01 09:29, schrieb Sai Krishna Potthuri:
> Add support for spi-nor flash reset via GPIO controller by reading the
> reset-gpio property. If there is a valid GPIO specifier then reset will
> be performed by asserting and deasserting the GPIO using gpiod APIs
> otherwise it will not perform any operation.
> 
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>

Reviewed-by: Michael Walle <michael@walle.cc>

Just one comment, see below

> ---
>  drivers/mtd/spi-nor/core.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index f2c64006f8d7..a78ab9bae2be 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2933,6 +2933,27 @@ static void spi_nor_set_mtd_info(struct spi_nor 
> *nor)
>  	mtd->_put_device = spi_nor_put_device;
>  }
> 
> +static int spi_nor_hw_reset(struct spi_nor *nor)
> +{
> +	struct gpio_desc *reset;
> +
> +	reset = devm_gpiod_get_optional(nor->dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR_OR_NULL(reset))
> +		return PTR_ERR_OR_ZERO(reset);
> +
> +	/*
> +	 * Experimental delay values by looking at different flash device
> +	 * vendors datasheets.
> +	 */
> +	usleep_range(1, 5);

I think this is superfluous, because parts of the kernel
will boot which should take longer than 1us. But I'm
fine with leaving it here.

-michael

> +	gpiod_set_value_cansleep(reset, 1);
> +	usleep_range(100, 150);
> +	gpiod_set_value_cansleep(reset, 0);
> +	usleep_range(1000, 1200);
> +
> +	return 0;
> +}
> +
>  int spi_nor_scan(struct spi_nor *nor, const char *name,
>  		 const struct spi_nor_hwcaps *hwcaps)
>  {
> @@ -2965,6 +2986,10 @@ int spi_nor_scan(struct spi_nor *nor, const char 
> *name,
>  	if (!nor->bouncebuf)
>  		return -ENOMEM;
> 
> +	ret = spi_nor_hw_reset(nor);
> +	if (ret)
> +		return ret;
> +
>  	info = spi_nor_get_flash_info(nor, name);
>  	if (IS_ERR(info))
>  		return PTR_ERR(info);

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
