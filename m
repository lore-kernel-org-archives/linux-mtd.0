Return-Path: <SRS0=gOwn=WX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C52B0C3A5A3
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 05:59:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91B122070B
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 05:59:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d03Z/UXc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YMsm+o6g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91B122070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6xu355bTLGRBIJXmL+b/ocW/YU5CzrB6HWguW7q+yYA=; b=d03Z/UXcNBudUkG1fcrmSI/8bJ
	sq3yApd4MsWsOq1aKFdixnUOz8xgthgRQNTchVhj16/e+nORkUgmYXFRa4erQ3JQJrfZoGxXVR7xe
	1BkfI+aIHRlYvI/Ndx7OkeHAXYZUc+x+/r1aLqctgWs+FyYNvb1UZOS/7iHmDVvwwQGNw/ENKUmJR
	3dO0WcY83fBZAYnEXkFzCSauyimZhJzELHPPP4q0ZgDu3Np7hgQtYKHAcXg5AwOMS1ODIYNVjx6Dd
	GspBMPU7UqejNThX2dRYB1m/+LBL8hDA3w+Wxz2cKcp+/jp/S4GR38d+RvxnNLIYe0sg8cOMAyMSz
	klgB94Mg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2UW2-00088b-GL; Tue, 27 Aug 2019 05:59:38 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2UVy-000885-P9
 for linux-mtd@lists.infradead.org; Tue, 27 Aug 2019 05:59:36 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7R5xSHV087937;
 Tue, 27 Aug 2019 00:59:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1566885568;
 bh=P4oNuerC0LXCGxytQnNK5ZvXLlbp4WG7fggGH4SexHA=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=YMsm+o6gEfozuhAyKFfpLA022t7HmAkv9JTcolEqnneQAcGDrhKOP7FnJYrQno+du
 NjA4/eg6wD6XcPALz+OPuziyjJXp5kqbtr34zGOiRRHUiGer0hQ8TI0Gu3uIVCLimF
 vHNIgKjNTzvAtF7x6CSzqxHgF7q2HkN3F09bLIcY=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7R5xSZU100761
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 27 Aug 2019 00:59:28 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 27
 Aug 2019 00:59:27 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 27 Aug 2019 00:59:27 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7R5xO7I057803;
 Tue, 27 Aug 2019 00:59:25 -0500
Subject: Re: [RESEND PATCH v3 08/20] mtd: spi-nor: Split spi_nor_init_params()
To: <Tudor.Ambarus@microchip.com>, <boris.brezillon@collabora.com>,
 <marek.vasut@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20190826120821.16351-1-tudor.ambarus@microchip.com>
 <20190826120821.16351-9-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <db529e35-801c-efb2-1f05-922fbcb98aef@ti.com>
Date: Tue, 27 Aug 2019 11:30:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190826120821.16351-9-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_225934_903169_5B3466DB 
X-CRM114-Status: GOOD (  19.04  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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



On 26/08/19 5:38 PM, Tudor.Ambarus@microchip.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Add functions to delimit what the chunks of code do:
> 
> static void spi_nor_init_params()
> {
> 	spi_nor_info_init_params()
> 	spi_nor_manufacturer_init_params()
> 	spi_nor_sfdp_init_params()
> }
> 
> Add descriptions to all methods.
> 
> spi_nor_init_params() becomes of type void, as all its children
> return void.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> v3: rename spi_nor_legacy_init_params() to spi_nor_info_init_params()


Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

Minor nits below...

[...]
>  
> +/**
> + * spi_nor_init_params() - Initialize the flash's parameters and settings.
> + * @nor:	pointer to a 'struct spi-nor'.
> + *
> + * The flash parameters and settings are initialized based on a sequence of
> + * calls that are ordered by priority:
> + *
> + * 1/ Default flash parameters initialization. The initializations are done
> + *    based on nor->info data:
> + *		spi_nor_info_init_params()
> + *
> + * which can be overwritten by:
> + * 2/ Manufacturer flash parameters initialization. The initializations are
> + *    done based on MFR register, or when the decisions can not be done solely
> + *    based on MFR, by using specific flash_info tweeks, ->default_init():
> + *		spi_nor_manufacturer_init_params()
> + *
> + * which can be overwritten by:
> + * 3/ SFDP flash parameters initialization. JESD216 SFDP is a standard and
> + *    should be more accurate that the above.
> + *		spi_nor_sfdp_init_params()
> + *
> + *    Please not that there is a ->post_bfpt() fixup hook that can overwrite the

s/not/note

> + *    flash parameters and settings imediately after parsing the Basic Flash

s/imediately/immediately

> + *    Parameter Table.
> + */
> +static void spi_nor_init_params(struct spi_nor *nor)
> +{
> +	spi_nor_info_init_params(nor);
>  
>  	spi_nor_manufacturer_init_params(nor);
>  
> -	if ((info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)) &&
> -	    !(info->flags & SPI_NOR_SKIP_SFDP)) {
> -		struct spi_nor_flash_parameter sfdp_params;
> -
> -		memcpy(&sfdp_params, params, sizeof(sfdp_params));
> -
> -		if (spi_nor_parse_sfdp(nor, &sfdp_params)) {
> -			nor->addr_width = 0;
> -			nor->flags &= ~SNOR_F_4B_OPCODES;
> -		} else {
> -			memcpy(params, &sfdp_params, sizeof(*params));
> -		}
> -	}
> -
> -	return 0;
> +	if ((nor->info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)) &&
> +	    !(nor->info->flags & SPI_NOR_SKIP_SFDP))
> +		spi_nor_sfdp_init_params(nor);
>  }
>  
>  static int spi_nor_select_read(struct spi_nor *nor,
> @@ -4670,10 +4715,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	    nor->info->flags & SPI_NOR_HAS_LOCK)
>  		nor->clear_sr_bp = spi_nor_clear_sr_bp;
>  
> -	/* Parse the Serial Flash Discoverable Parameters table. */
> -	ret = spi_nor_init_params(nor);
> -	if (ret)
> -		return ret;
> +	/* Init flash parameters based on flash_info struct and SFDP */
> +	spi_nor_init_params(nor);
>  
>  	if (!mtd->name)
>  		mtd->name = dev_name(dev);
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
