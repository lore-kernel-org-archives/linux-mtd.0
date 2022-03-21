Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45187C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Mar 2022 22:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zS14ThfZczKZb0bKjsRAtdeDR0GoP40O755IGLLzFIg=; b=TJt0pd8OM8lbjr7nXB9RsC0b4/
	1g0sICPxD3u8khzaQtk+cfXcQq7STYS2U29DQLjn9a0XmMXny9TgvOMoblOFUqNtwa7qU209Dctxx
	2/7UyrLZGNVDha5OUH8iF84y9ReOJfCdiQR3N/1h7cZqoUxssWKWX7rRZwWSUXSF4YilPPxuJuqnz
	cQX1htQLYThv3tnBKPCcbavtPl9lf2q39W8Z/m+Cs684vrRbdV0yJYPMmu07fTstblLNVDrq/C4i8
	O0ikeNsHWfEGBLtXOiw6lRMQvPki+u3S1KHBJcJBVdApryG6hy4IhDmBf4Aoki5i/H0hpxYQVFuY+
	zjTU/jLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWQJS-009D1e-F6; Mon, 21 Mar 2022 22:15:42 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWQJP-009D18-D1
 for linux-mtd@lists.infradead.org; Mon, 21 Mar 2022 22:15:40 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id EBC282241C;
 Mon, 21 Mar 2022 23:15:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1647900937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YPKtBjHCqpwtx6hbO9m1IkCg2G97LUXk9EM0OXoh+hs=;
 b=jLjDnyDn/XYNYoeBmc8aExMX6fzSO8emLH/aPbmYIizEfaNlCYy4v+WCz99VmPWvfWinHd
 Q2BeCqzKGJ2qElfe+aBXJxJW4f8wXh1SQGu01EkS592849PqPY5iUS3lDt/+Je1/ebMfCU
 ejQGPeMK6kn/j/W+GchYPe2rtFmzwpc=
MIME-Version: 1.0
Date: Mon, 21 Mar 2022 23:15:36 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com
Subject: Re: [PATCH v2 2/8] mtd: spi-nor: Introduce spi_nor_match_id()
In-Reply-To: <20220228111712.111737-3-tudor.ambarus@microchip.com>
References: <20220228111712.111737-1-tudor.ambarus@microchip.com>
 <20220228111712.111737-3-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <f270ae65e7bf42b6aa8521c6a0db4784@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_151539_631980_DA03A3FA 
X-CRM114-Status: GOOD (  20.58  )
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

Am 2022-02-28 12:17, schrieb Tudor Ambarus:
> Similar to spi_nor_match_name() extend the search of flash_info through
> all the manufacturers, this time doing the match by ID. There's no 
> reason
> to limit the search per manufacturer yet, do it globally, search the 
> flash
> in all the parts of all manufacturers in a single method.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Michael Walle <michael@walle.cc>

> ---
>  drivers/mtd/spi-nor/core.c | 40 ++++++++++++++++++--------------------
>  1 file changed, 19 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index f3c359d03163..f87cb7d3daab 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1629,16 +1629,21 @@ static const struct spi_nor_manufacturer
> *manufacturers[] = {
>  	&spi_nor_xmc,
>  };
> 
> -static const struct flash_info *
> -spi_nor_search_part_by_id(const struct flash_info *parts, unsigned int 
> nparts,
> -			  const u8 *id)
> +static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
> +						 const u8 *id)
>  {
> -	unsigned int i;
> +	const struct flash_info *part;
> +	unsigned int i, j;
> 
> -	for (i = 0; i < nparts; i++) {
> -		if (parts[i].id_len &&
> -		    !memcmp(parts[i].id, id, parts[i].id_len))
> -			return &parts[i];
> +	for (i = 0; i < ARRAY_SIZE(manufacturers); i++) {
> +		for (j = 0; j < manufacturers[i]->nparts; j++) {
> +			part = &manufacturers[i]->parts[j];
> +			if (part->id_len &&
> +			    !memcmp(part->id, id, part->id_len)) {
> +				nor->manufacturer = manufacturers[i];
> +				return part;
> +			}
> +		}
>  	}
> 
>  	return NULL;
> @@ -1648,7 +1653,6 @@ static const struct flash_info
> *spi_nor_read_id(struct spi_nor *nor)
>  {
>  	const struct flash_info *info;
>  	u8 *id = nor->bouncebuf;
> -	unsigned int i;
>  	int ret;
> 
>  	if (nor->spimem) {
> @@ -1668,19 +1672,13 @@ static const struct flash_info
> *spi_nor_read_id(struct spi_nor *nor)
>  		return ERR_PTR(ret);
>  	}
> 
> -	for (i = 0; i < ARRAY_SIZE(manufacturers); i++) {
> -		info = spi_nor_search_part_by_id(manufacturers[i]->parts,
> -						 manufacturers[i]->nparts,
> -						 id);
> -		if (info) {
> -			nor->manufacturer = manufacturers[i];
> -			return info;
> -		}
> +	info = spi_nor_match_id(nor, id);
> +	if (!info) {
> +		dev_err(nor->dev, "unrecognized JEDEC id bytes: %*ph\n",
> +			SPI_NOR_MAX_ID_LEN, id);
> +		return ERR_PTR(-ENODEV);
>  	}
> -
> -	dev_err(nor->dev, "unrecognized JEDEC id bytes: %*ph\n",
> -		SPI_NOR_MAX_ID_LEN, id);
> -	return ERR_PTR(-ENODEV);
> +	return info;
>  }
> 
>  static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,

-- 
-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
