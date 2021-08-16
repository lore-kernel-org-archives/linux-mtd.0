Return-Path: <SRS0=PqFb=NH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6327DC4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 19:20:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D2DB60E09
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 19:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D2DB60E09
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HqrtYicFm4fmudhSRa5cwVsiC63ZLilo/2WrA5BuV8o=; b=obs6qOsUotRK+p
	o0bDs9OxmSACCWk8NypmZkazT1RLGRKN4VujcncXi/xqp+VyYT+GzU1rKw1uxGmujL+tQqROVyrQi
	olQ3V/5hDf5XIa7LMaNSozzAbiqxIf42UoeqWps6qsOMuDIzxj4mMeKjGC4/berYrIqWoxEGzrsUf
	fAA/cCGUz3VfGPKS1yurz3O0R4I6B9zfVoEulHtKhrQF3a++Fcmv+c+XyhaMX43zbMWTFV3I2vQs1
	pSutf1/sw85ElJbGTWg9QhDeSNl/Uv/r68jpxZ8H+Biwkk2QZFBPxahJG2n6jVXZD3zzftFz4O0mI
	TrK9HnmWT+Ym6DJh75rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFi96-0006Pm-B8; Mon, 16 Aug 2021 19:19:40 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFi90-0006OL-Ru; Mon, 16 Aug 2021 19:19:38 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17GJJCnM106398;
 Mon, 16 Aug 2021 14:19:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629141552;
 bh=WMEcs7jBHpRDaZ62hlz2qGMoXVHfEB2+8AW+i7kzT4Y=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=G4l/n7GEIum8rhY9f48V6xNdst+d2/t+tOYlCD0P0CvcXtGdjoJMgpxKQ+tVg1OH2
 e2L/i/xmlA+cv1CX4HD4Y8F+hcwnXucgK06sqyNBQfylV1lUpmhmKiH45gdY3pdPk6
 0CZL8tTDlfg4L8ZhuhUziH7NCg/Hf37a/jch7QgQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17GJJCYH067381
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 16 Aug 2021 14:19:12 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 16
 Aug 2021 14:19:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 16 Aug 2021 14:19:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17GJJB2N008256;
 Mon, 16 Aug 2021 14:19:11 -0500
Date: Tue, 17 Aug 2021 00:49:10 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v2 12/35] mtd: spi-nor: xilinx: Use manufacturer
 late_init() to set setup method
Message-ID: <20210816191908.bglwztlx7xm2rmdu@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-13-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210727045222.905056-13-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_121935_038500_B44CEA19 
X-CRM114-Status: GOOD (  17.00  )
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
> post_sfdp was misleading in this case, as SFDP is not supported by
> xilinx. Plus, there's no fixup here, just setting the correct
> setup method, as required by xilinx parts.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

> ---
>  drivers/mtd/spi-nor/xilinx.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
> index 1138bdbf4199..a573c3cde414 100644
> --- a/drivers/mtd/spi-nor/xilinx.c
> +++ b/drivers/mtd/spi-nor/xilinx.c
> @@ -77,18 +77,14 @@ static int xilinx_nor_setup(struct spi_nor *nor,
>  	return 0;
>  }
>  
> -static void xilinx_post_sfdp_fixups(struct spi_nor *nor)
> +static void xilinx_late_init(struct spi_nor *nor)
>  {
>  	nor->params->setup = xilinx_nor_setup;
>  }
>  
> -static const struct spi_nor_fixups xilinx_fixups = {
> -	.post_sfdp = xilinx_post_sfdp_fixups,
> -};
> -
>  const struct spi_nor_manufacturer spi_nor_xilinx = {
>  	.name = "xilinx",
>  	.parts = xilinx_parts,
>  	.nparts = ARRAY_SIZE(xilinx_parts),
> -	.fixups = &xilinx_fixups,
> +	.late_init = xilinx_late_init,
>  };
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
