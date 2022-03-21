Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D77C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Mar 2022 22:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JiBaQ+oCDYkRrzPz9wrTcrEWhpgiq4pifM/K0trzC1E=; b=tosuDpqPNmn1UyVL9IUNp5QTek
	q6h4MuwfcYcqBm13iQ1INA3oPZfQRjqEfm0T15lcfUFO5M6x6jkPwPQhCSCBNIPnZxdLmjRh/l0F9
	oBfJMM0q5WnNVRKOkECNoF8vLUzXvk3XM5vVrCozjrJgzwaDL/mfzzzrRnz+bfJS3VfbvVpGCt6OH
	+Yy4R/cZmQTO9M9x4GKJGptBVORBNXgo+NyEqlJV/VQW5hGwh5dHs6A5WLCIf7ow/zN+P4StcoOWc
	7fB65eWvoVfX8BHJ+CEFGDWVLKenuNrGCxt9d/SMK+qq5skIIRpvQGfhsO6EmH1FGArLlAyVXer8P
	OTuzTfDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWQI7-009CuS-2t; Mon, 21 Mar 2022 22:14:19 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWQI4-009Cty-9D
 for linux-mtd@lists.infradead.org; Mon, 21 Mar 2022 22:14:18 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 2FFE4223F6;
 Mon, 21 Mar 2022 23:14:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1647900848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AxBe0AcSzdEDFixOtEFUcP9GEYOEHXL7qMX0u+vesV0=;
 b=e7Z50GM3rWGlajH1EKMYYY5zGQLcICLEOif796Mgja1Xyc241LO0vYEL5mCnsxs10uORnW
 iRp4VSuN+QOI2MQT29S4ltdMgZkLBr0USHLVFG0ZYkIAaSalGdcTwn8Wds11jk8Is+cWLF
 +MZN+ZAcgUmGiwfKb2vziUpi0EYl40U=
MIME-Version: 1.0
Date: Mon, 21 Mar 2022 23:14:07 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com
Subject: Re: [PATCH v2 1/8] mtd: spi-nor: Rename method,
 s/spi_nor_match_id/spi_nor_match_name
In-Reply-To: <20220228111712.111737-2-tudor.ambarus@microchip.com>
References: <20220228111712.111737-1-tudor.ambarus@microchip.com>
 <20220228111712.111737-2-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <1836a22dbff076d4f49095c9d59cb05f@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_151416_532442_0F58B4AF 
X-CRM114-Status: GOOD (  16.14  )
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
> The method is matching a flash_info entry by searching by name. Rename
> the method for better clarity.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Michael Walle <michael@walle.cc>

> ---
>  drivers/mtd/spi-nor/core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 9014008e60b3..f3c359d03163 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2876,8 +2876,8 @@ void spi_nor_restore(struct spi_nor *nor)
>  }
>  EXPORT_SYMBOL_GPL(spi_nor_restore);
> 
> -static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
> -						 const char *name)
> +static const struct flash_info *spi_nor_match_name(struct spi_nor 
> *nor,
> +						   const char *name)
>  {
>  	unsigned int i, j;
> 
> @@ -2899,7 +2899,7 @@ static const struct flash_info
> *spi_nor_get_flash_info(struct spi_nor *nor,
>  	const struct flash_info *info = NULL;
> 
>  	if (name)
> -		info = spi_nor_match_id(nor, name);
> +		info = spi_nor_match_name(nor, name);
>  	/* Try to auto-detect if chip name wasn't specified or not found */
>  	if (!info)
>  		info = spi_nor_read_id(nor);

-- 
-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
