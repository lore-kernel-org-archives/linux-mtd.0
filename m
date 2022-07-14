Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C622C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Jul 2022 19:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+CDwkjEcJjL3hKs2PTHW4fMgUZc4WC70fWaqmKeNLE=; b=OV9xRojVn5T8NSCcCmx/bDc3NO
	0fdsBvLo+dcSpadDXgkNTL1dqKOSM2wqKYJQe6aWmnnNbw3jedpH9RHluSR4jkwLY/bBddOsoGkcN
	y1m7r3jGz3qw5+bzlDgrdnhNyFx1LZFR9Sru5OmO8z6Pz+kV92lcmVS82XKrSKtC8M6hXjGhyyYRK
	PLUkiLWitk7/aB3vEqC3uDVChKZNyl4zgq4tO8V7t8TctTtOhSfOsyf3iyi3XfsdPUvj+sW2ZG8+H
	WeaT859IM+1z1PBHhgExQBtq0GO6RY3bLhODYJQq+0NpwUyxZBu+ZIwx5Ub7kCykvvGLwjxJtT6Wp
	SpbIW0+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC4j3-001G7C-Rb; Thu, 14 Jul 2022 19:42:17 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC4is-001Ez0-2i; Thu, 14 Jul 2022 19:42:07 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 8758B22238;
	Thu, 14 Jul 2022 21:41:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1657827716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ro6DsiZOyVl0p4EfjbReVqk2JZ+ojOAHyeH+zjJsEw=;
	b=iBPQLNv4oS0P3UsioZAiEjIeQk76v1WKPCD5H0BzEwm00wXbLr8bX/Ya43aeQ5023QJq2k
	4q5ldJ7b56ZzTlNLFYfJBNS0SE3Cpk9/hYEctK+IcAQ8s1yWUCUeHXT5KFE5rSHhco2K8k
	KjI4b29t+HcLCCg6PXHnUv2ihhDi6d4=
MIME-Version: 1.0
Date: Thu, 14 Jul 2022 21:41:48 +0200
From: Michael Walle <michael@walle.cc>
To: Michal Suchanek <msuchanek@suse.de>
Cc: linux-sunxi@lists.linux.dev, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: When a flash memory is missing do not
 report an error
In-Reply-To: <701967b0c418db333c66b48d225df60aa9d03ead.1657826188.git.msuchanek@suse.de>
References: <701967b0c418db333c66b48d225df60aa9d03ead.1657826188.git.msuchanek@suse.de>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <d8de86aa0331be697fbef33d5ab2c57a@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_124206_364250_908924A3 
X-CRM114-Status: GOOD (  27.35  )
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

Am 2022-07-14 21:19, schrieb Michal Suchanek:
> It is normal that devices are designed with multiple types of storage,
> and only some types of storage are present.
> 
> The kernel can handle this situation gracefully for many types of
> storage devices such as mmc or ata but it reports and error when spi
> flash is not present.
> 
> Only print a notice that the storage device is missing when no response
> to the identify command is received.
> 
> Consider reply buffers with all bits set to the same value no response.

I'm not sure you can compare SPI with ATA and MMC. I'm just speaking of
DT now, but there, for ATA and MMC you just describe the controller and
it will auto-detect the connected storage. Whereas with SPI you describe
both the controller and the flash. So I'd argue that your hardware
description is wrong if it describes a flash which is not present.

> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
>  drivers/mtd/spi-nor/core.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 502967c76c5f..6bab540171a4 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1652,6 +1652,24 @@ static const struct flash_info
> *spi_nor_match_id(struct spi_nor *nor,
>  	return NULL;
>  }
> 
> +static const bool buffer_uniform(const u8 *buffer, size_t length)
> +{
> +	bool all0;
> +	size_t i;
> +
> +	for (all0 = true, i = 0; i < length; i++)
> +		if (buffer[i] != 0) {
> +			all0 = false;
> +			break;
> +		}
> +	if (all0)
> +		return true;
> +	for (i = 0; i < length; i++)
> +		if (buffer[i] != 0xff)
> +			return false;
> +	return true;
> +}

That seems unnecessarily complex.
if (!memchr_inv(id, '\x00', SPI_NOR_MAX_ID_LEN) ||
     !memchr_inv(id, '\xff', SPI_NOR_MAX_ID_LEN))

should be the same.

-michael

> +
>  static const struct flash_info *spi_nor_detect(struct spi_nor *nor)
>  {
>  	const struct flash_info *info;
> @@ -1666,8 +1684,11 @@ static const struct flash_info
> *spi_nor_detect(struct spi_nor *nor)
> 
>  	info = spi_nor_match_id(nor, id);
>  	if (!info) {
> -		dev_err(nor->dev, "unrecognized JEDEC id bytes: %*ph\n",
> -			SPI_NOR_MAX_ID_LEN, id);
> +		if (buffer_uniform(id, SPI_NOR_MAX_ID_LEN))
> +			dev_info(nor->dev, "No flash memory detected.\n");
> +		else
> +			dev_err(nor->dev, "unrecognized JEDEC id bytes: %*ph\n",
> +				SPI_NOR_MAX_ID_LEN, id);
>  		return ERR_PTR(-ENODEV);
>  	}
>  	return info;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
