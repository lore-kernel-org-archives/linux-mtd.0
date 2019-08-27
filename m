Return-Path: <SRS0=gOwn=WX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1291C3A5A3
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 07:37:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3ECF2070B
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 07:37:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OP+xhkgx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jxwL9ao5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3ECF2070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zQGNg00JF16/7zPJ8IEiF+3ZQzDCmvtZWxSaQDctghc=; b=OP+xhkgxGYYWFLClRAdrEYi4t+
	Rdj96EuJqXyHzJRgVv7pks0KsZ3xjx9Dcux8hk2gVTb6NL9oMuMzdfz8x9ddhrfZ/nI+ZUE3kqh0D
	bOzSsw10rnPyGb1O/gd6RqkkmiY4/D7u4zOqf2jT9aS1Lsh7u6RGxm8AGUxDLchxiAE1VftVFNrZo
	YSXJvGV62wh60DQwlScBj4nGlZHdlfcjFn4omr+xLRo5cT873LricnUWKRHNGNa5f5oSPSVeHnmPv
	LcakqhqGALRhjuXY+9tG7kjccTCuWFg1DUFlxiLSqdSDXoI9eX8OTYvZRaqkfVh6GokXN8FUjZwPa
	i/INdVfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2W2V-0003eb-Mg; Tue, 27 Aug 2019 07:37:15 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2W2S-0003dj-4o
 for linux-mtd@lists.infradead.org; Tue, 27 Aug 2019 07:37:13 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7R7b8nG008201;
 Tue, 27 Aug 2019 02:37:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1566891428;
 bh=+On+Kzei5T8FLnVMz3GVbo60HJWmYrS5AsenYCDqT/4=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=jxwL9ao5UeYW2k/Dm8gtBcsueN3SFuSQMFyvQwDh0gh5cek7X7/+YWufYPklqnBDm
 4sujXmlPq+rVxj4k15X7CLNR705Up/gwt9zTv1s7egNV4BkxFLgzVwhoeR5KW1B7Ep
 YQBxtrzhTcvWFGWrIYB0s+kY4l1otU+JuwaDjU0A=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7R7b8Bv129011
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 27 Aug 2019 02:37:08 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 27
 Aug 2019 02:37:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 27 Aug 2019 02:37:07 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7R7b3H8099128;
 Tue, 27 Aug 2019 02:37:04 -0500
Subject: Re: [RESEND PATCH v3 19/20] mtd: spi-nor: Introduce
 spi_nor_get_flash_info()
To: <Tudor.Ambarus@microchip.com>, <boris.brezillon@collabora.com>,
 <marek.vasut@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20190826120821.16351-1-tudor.ambarus@microchip.com>
 <20190826120821.16351-20-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <5c3a96a8-228a-3659-d59e-fb3e3d603bb2@ti.com>
Date: Tue, 27 Aug 2019 13:07:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190826120821.16351-20-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_003712_357359_5A18CED5 
X-CRM114-Status: GOOD (  20.01  )
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



On 26/08/19 5:39 PM, Tudor.Ambarus@microchip.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Dedicate a function for getting the pointer to the flash_info
> const struct. Trim a bit the spi_nor_scan() huge function.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

Regards
Vignesh

> v3: no changes
> 
>  drivers/mtd/spi-nor/spi-nor.c | 76 +++++++++++++++++++++++++------------------
>  1 file changed, 44 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index d13317d1f372..ec70b58294ec 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -4766,10 +4766,50 @@ static int spi_nor_set_addr_width(struct spi_nor *nor)
>  	return 0;
>  }
>  
> +static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
> +						       const char *name)
> +{
> +	const struct flash_info *info = NULL;
> +
> +	if (name)
> +		info = spi_nor_match_id(name);
> +	/* Try to auto-detect if chip name wasn't specified or not found */
> +	if (!info)
> +		info = spi_nor_read_id(nor);
> +	if (IS_ERR_OR_NULL(info))
> +		return ERR_PTR(-ENOENT);
> +
> +	/*
> +	 * If caller has specified name of flash model that can normally be
> +	 * detected using JEDEC, let's verify it.
> +	 */
> +	if (name && info->id_len) {
> +		const struct flash_info *jinfo;
> +
> +		jinfo = spi_nor_read_id(nor);
> +		if (IS_ERR(jinfo)) {
> +			return jinfo;
> +		} else if (jinfo != info) {
> +			/*
> +			 * JEDEC knows better, so overwrite platform ID. We
> +			 * can't trust partitions any longer, but we'll let
> +			 * mtd apply them anyway, since some partitions may be
> +			 * marked read-only, and we don't want to lose that
> +			 * information, even if it's not 100% accurate.
> +			 */
> +			dev_warn(nor->dev, "found %s, expected %s\n",
> +				 jinfo->name, info->name);
> +			info = jinfo;
> +		}
> +	}
> +
> +	return info;
> +}
> +
>  int spi_nor_scan(struct spi_nor *nor, const char *name,
>  		 const struct spi_nor_hwcaps *hwcaps)
>  {
> -	const struct flash_info *info = NULL;
> +	const struct flash_info *info;
>  	struct device *dev = nor->dev;
>  	struct mtd_info *mtd = &nor->mtd;
>  	struct device_node *np = spi_nor_get_flash_node(nor);
> @@ -4800,37 +4840,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	if (!nor->bouncebuf)
>  		return -ENOMEM;
>  
> -	if (name)
> -		info = spi_nor_match_id(name);
> -	/* Try to auto-detect if chip name wasn't specified or not found */
> -	if (!info)
> -		info = spi_nor_read_id(nor);
> -	if (IS_ERR_OR_NULL(info))
> -		return -ENOENT;
> -
> -	/*
> -	 * If caller has specified name of flash model that can normally be
> -	 * detected using JEDEC, let's verify it.
> -	 */
> -	if (name && info->id_len) {
> -		const struct flash_info *jinfo;
> -
> -		jinfo = spi_nor_read_id(nor);
> -		if (IS_ERR(jinfo)) {
> -			return PTR_ERR(jinfo);
> -		} else if (jinfo != info) {
> -			/*
> -			 * JEDEC knows better, so overwrite platform ID. We
> -			 * can't trust partitions any longer, but we'll let
> -			 * mtd apply them anyway, since some partitions may be
> -			 * marked read-only, and we don't want to lose that
> -			 * information, even if it's not 100% accurate.
> -			 */
> -			dev_warn(dev, "found %s, expected %s\n",
> -				 jinfo->name, info->name);
> -			info = jinfo;
> -		}
> -	}
> +	info = spi_nor_get_flash_info(nor, name);
> +	if (IS_ERR(info))
> +		return PTR_ERR(info);
>  
>  	nor->info = info;
>  
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
