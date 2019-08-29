Return-Path: <SRS0=8wrd=WZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE3DC3A59F
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Aug 2019 07:48:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F65522CF5
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Aug 2019 07:48:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XAkaHA9E";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QyLERRmy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F65522CF5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1qF+qxFr1PyXjOJq1Gbo/QT90fjqS9/aoA/QPWZ1Dxs=; b=XAkaHA9EHeRNn+HP9gNf1DR1gM
	5wP61/LUfQBV1qkrJK/+iT0Q4nhlleyhXQFH+PaI2Qwqr8aYf7JAjkOZELWY6wC3GV2nft48AZYms
	4Kk44rHMgwpNjmoXzyBFwXi/uhfBFBbeOLARx1t/vtKHSiiaqQsPnGOHcayfjvwyaXF1ubwVZMXJ3
	UBsK/VWyZMyq1PgNqAZY+0wRyPyADcEo6qNT7QZuJTliasC5VkwnjXlSsKFXmnabBhSwSRM5NWHyx
	r5Fag7hi0nUdqS0eSh5ep0HWqvRCvri2w2FDg7mLDamKq9glIo/LTUf/9W27rNqYxcDye2FqNLSzq
	fUze4Jbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3FA2-00012G-Im; Thu, 29 Aug 2019 07:48:02 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3F9q-0000tQ-VY
 for linux-mtd@lists.infradead.org; Thu, 29 Aug 2019 07:47:52 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7T7ljtP121389;
 Thu, 29 Aug 2019 02:47:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1567064865;
 bh=X+Fj4hIsR5gYR6FlIPa0m9Wu/dW1+GCcIhAdJVX2QZQ=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=QyLERRmyS4eQPIIkKg8MbpQZIbNUSHXbOTIHOzBWD0Av8QxbQqnIPnMU+Ld/tpneN
 rCwm2TAtC5Dug9nTTT/ZJDQ+YSsKPOgWDRoj2T025KXf/TZ2JBofU3tGz9Dizb1Rc/
 z0Th/zk/fgh2RNpDYwlZI3rwoE+jsDLoU/y2BGqU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7T7ljgS057052
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 29 Aug 2019 02:47:45 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 29
 Aug 2019 02:47:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 29 Aug 2019 02:47:45 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7T7lg7h121088;
 Thu, 29 Aug 2019 02:47:43 -0500
Subject: Re: [PATCH] mtd: spi-nor: remove superfluous pass of
 nor->info->sector_size
To: <Tudor.Ambarus@microchip.com>, <marek.vasut@gmail.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20190828103423.8232-1-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <804122ef-683e-3ff8-0912-2b380444f92e@ti.com>
Date: Thu, 29 Aug 2019 13:18:20 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190828103423.8232-1-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_004751_164736_EEF4577F 
X-CRM114-Status: GOOD (  15.49  )
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



On 28/08/19 4:05 PM, Tudor.Ambarus@microchip.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> We already pass a pointer to nor, we can obtain the sector_size
> by dereferencing it.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

Regards
Vignesh

>  drivers/mtd/spi-nor/spi-nor.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 79c8f1dd8c6b..69532573dba9 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -4257,11 +4257,12 @@ spi_nor_select_uniform_erase(struct spi_nor_erase_map *map,
>  	return erase;
>  }
>  
> -static int spi_nor_select_erase(struct spi_nor *nor, u32 wanted_size)
> +static int spi_nor_select_erase(struct spi_nor *nor)
>  {
>  	struct spi_nor_erase_map *map = &nor->params.erase_map;
>  	const struct spi_nor_erase_type *erase = NULL;
>  	struct mtd_info *mtd = &nor->mtd;
> +	u32 wanted_size = nor->info->sector_size;
>  	int i;
>  
>  	/*
> @@ -4355,7 +4356,7 @@ static int spi_nor_default_setup(struct spi_nor *nor,
>  	}
>  
>  	/* Select the Sector Erase command. */
> -	err = spi_nor_select_erase(nor, nor->info->sector_size);
> +	err = spi_nor_select_erase(nor);
>  	if (err) {
>  		dev_err(nor->dev,
>  			"can't select erase settings supported by both the SPI controller and memory.\n");
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
