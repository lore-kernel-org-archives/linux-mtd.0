Return-Path: <SRS0=PqFb=NH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358EBC4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 19:10:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8A1E60F41
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 19:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8A1E60F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gcICTUaOxJCecEZNFiAr5x84bHoYEen+SDbZ1PiMAeY=; b=BPV93YBoYQwycx
	P2pyatyr9t7GWr04tnz5VDl2g7Q4NVd4m6f+L2NBbbUglFGnyrU+FKow/MByR0pOm07r9cBna+i0h
	NX0MUhDBy963EaLm8NBl/84mrhpffj0ed3MJzpYqFFflFOS7yBT603qwRiUoPTDMXCZ5HxDQlZ7IT
	dKucKvGPdzlVP5oYeJzUXU9xc+oHWTzWr0tdRxRh1qdN+oEcfzWJAePtlDp9mxiIIKmknyOv+Ds3C
	nO51ZnMTN9fTJ9B0PG0cp0j/J0JajAoTDtJGgCYqBwyjhirgbujecckZyo3LqLHhl6ZsKgaTaj2MG
	fYXEaTb3g1Eu04T5SdaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFhzj-00052r-Vc; Mon, 16 Aug 2021 19:10:00 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFhze-000520-R4; Mon, 16 Aug 2021 19:09:58 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17GJ9WeC045137;
 Mon, 16 Aug 2021 14:09:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629140972;
 bh=9o6DJmB6xJXjiWFOTjohbZBesBxGpMacwKFu+bqYuTM=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Ubb70zWkceJT6zpgLMlZlHq3gkZ8SueaHu9hYo/8v5CmiV5/64Owm9RApxJDHmF3l
 k2N5V92HoljYRXPhIAcd1bPE4Q2PpdnfA2uhrqi2QQA4r9ZUniheqZkDYxJbHBHO23
 /3fTzcOlR3jhfEd61ggHXu7AwO+nzcxQctHqaVLc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17GJ9WbT085118
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 16 Aug 2021 14:09:32 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 16
 Aug 2021 14:09:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 16 Aug 2021 14:09:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17GJ9VQb064769;
 Mon, 16 Aug 2021 14:09:31 -0500
Date: Tue, 17 Aug 2021 00:39:30 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v2 10/35] mtd: spi-nor: sst: Use flash late_init() for
 locking
Message-ID: <20210816190928.kvzex5r6ml77uigs@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-11-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210727045222.905056-11-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_120955_006112_A242EB2B 
X-CRM114-Status: GOOD (  19.22  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 27/07/21 07:51AM, Tudor Ambarus wrote:
> Locking ops are not discoverable via SFDP, use late_init() call.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

One question though. Have you tested these flashes (this one and the 
ones in the previous patch) to make sure you are not causing any 
regressions? While I don't see anything wrong with the patches, it would 
be good to have some test reports.

> ---
>  drivers/mtd/spi-nor/sst.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
> index 980f4c09c91d..29d100febdbf 100644
> --- a/drivers/mtd/spi-nor/sst.c
> +++ b/drivers/mtd/spi-nor/sst.c
> @@ -46,15 +46,11 @@ static const struct spi_nor_locking_ops sst26vf_locking_ops = {
>  	.is_locked = sst26vf_is_locked,
>  };
>  
> -static void sst26vf_default_init(struct spi_nor *nor)
> +static void sst26vf_late_init(struct spi_nor *nor)
>  {
>  	nor->params->locking_ops = &sst26vf_locking_ops;
>  }
>  
> -static const struct spi_nor_fixups sst26vf_fixups = {
> -	.default_init = sst26vf_default_init,
> -};
> -
>  static const struct flash_info sst_parts[] = {
>  	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
>  	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8,
> @@ -88,7 +84,7 @@ static const struct flash_info sst_parts[] = {
>  	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128,
>  			      SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>  			      SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> -		.fixups = &sst26vf_fixups },
> +		.late_init = sst26vf_late_init},
>  };
>  
>  static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
> -- 
> 2.25.1
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
