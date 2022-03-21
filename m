Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBE6C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Mar 2022 12:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q3zVC5WTGho1bAg9KJ6lk8bwg/hWPsimSAQ3jkb6NPM=; b=M9+GksaFympLRL
	vb/IRAs0cn7AWsaCCOr3X6x197APrkJ2QxUnW7akA7A1nAMEvHRCpUuqrLzv5fKlJi2lCSD+0PukR
	I0UgkHyGdI8oif5hEYe9Da122SMm/HQxz7f7Q7l9+ZM0E5RBMevm8QHkddAKR6WlE0M2bgS9rLRLe
	LwZKf2JWks3F0klPU2eV51irGtjc41B+GNXbWsTr4V4xLlvix0XwV/ZwCvdiagCmonXIkPsLa35Dg
	ugZjlYw/GMphO6e4DufI9c2ja1pFl/rIr4kWHFPPoCLJHl8cDIRYWtj5FXkELJqL8P6tgWMN5YdKy
	m8vmTVGDcDFopLY0P+jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWGwB-007ehW-Mi; Mon, 21 Mar 2022 12:15:03 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWGw7-007efq-Np
 for linux-mtd@lists.infradead.org; Mon, 21 Mar 2022 12:15:01 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22LCEupe043704;
 Mon, 21 Mar 2022 07:14:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1647864896;
 bh=BNk4Jc1KDk892pR+9LlcEhmjDAUnom/cqNmHxG2VCrA=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=bhQLiQ9ifonNed+S6fsAAAETZ14ItgsxW/zx2mzOcNFeGepLFEF/t3ei1UJE6GhKP
 Fg8F7Lpn3QmEiPq0fD2eSK1PFY8okikyk1xguNGSiGZywz2TYDzqL6DnkZNaTIX4Jk
 T5dghXXn+WXa/PtVs03CSvTzNfU94ZQ8Do8jts1M=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22LCEuQ6108888
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 21 Mar 2022 07:14:56 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 21
 Mar 2022 07:14:56 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 21 Mar 2022 07:14:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22LCEt9s028012;
 Mon, 21 Mar 2022 07:14:56 -0500
Date: Mon, 21 Mar 2022 17:44:55 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <nicolas.ferre@microchip.com>
Subject: Re: [PATCH v2 3/8] mtd: spi-nor: core: Use auto-detection only once
Message-ID: <20220321121455.bpql7x4ebhq7s36l@ti.com>
References: <20220228111712.111737-1-tudor.ambarus@microchip.com>
 <20220228111712.111737-4-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220228111712.111737-4-tudor.ambarus@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_051459_886179_510E10D5 
X-CRM114-Status: GOOD (  19.10  )
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

On 28/02/22 01:17PM, Tudor Ambarus wrote:
> In case spi_nor_match_name() returned NULL, the auto detection was
> issued twice. There's no reason to try to detect the same chip twice,
> do the auto detection only once.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index f87cb7d3daab..b1d6fa65417d 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2894,13 +2894,15 @@ static const struct flash_info *spi_nor_match_name(struct spi_nor *nor,
>  static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
>  						       const char *name)
>  {
> -	const struct flash_info *info = NULL;
> +	const struct flash_info *info = NULL, *detected_info = NULL;
>  
>  	if (name)
>  		info = spi_nor_match_name(nor, name);
>  	/* Try to auto-detect if chip name wasn't specified or not found */
> -	if (!info)
> -		info = spi_nor_read_id(nor);
> +	if (!info) {
> +		detected_info = spi_nor_read_id(nor);
> +		info = detected_info;
> +	}
>  	if (IS_ERR_OR_NULL(info))
>  		return ERR_PTR(-ENOENT);
>  
> @@ -2908,7 +2910,7 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
>  	 * If caller has specified name of flash model that can normally be
>  	 * detected using JEDEC, let's verify it.
>  	 */
> -	if (name && info->id_len) {
> +	if (name && !detected_info && info->id_len) {
>  		const struct flash_info *jinfo;
>  
>  		jinfo = spi_nor_read_id(nor);

I think the flow can be a little bit better. How about:

	if (name)
		info = spi_nor_match_name();
	
	if (!info) {
		info = spi_nor_read_id();
		if (IS_ERR_OR_NULL(info))
			return ERR_PTR(-ENOENT);

		return info;
	}

	if (name && info->id_len) {
		...
	}

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
