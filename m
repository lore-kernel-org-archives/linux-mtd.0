Return-Path: <SRS0=p7/t=JC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3B1C433ED
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Apr 2021 08:33:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A40B6113E
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Apr 2021 08:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A40B6113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Mfi6r1I4uyvmjHhQYmylb97jY87byvXCEjHHCp+fpWc=; b=SBpLwFH81HE91QvBrmRduO0BY
	o5aXt59toT6BE/604hylK+5WisLobbuFpnptqAA4m+9A0s8RJrkgAl22haqCx8yCiovmRgcSbSo7z
	2Y/nKMWxrZUDBcObliWAjyVOzn6tFbATypkWqUXS1bC4wIreUq7YYZcgyMEqHFJy4W7dY8n741+Ak
	AtJu8VgTGIOigKGRz8r37ElN7TxDwgeEttvU7FpsxHDNWIELK5o8Ibe5B5Jg9x4JAPXcatFNddeMt
	Qof2R52RPiwQmmE764jfoauFn+hqzt82K65gfGRU/+GZ3rmYq+BCYiXYnGetkGp3LLOkATrUJ2nLv
	cs2fzeMbg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTKen-00GxVc-BB; Mon, 05 Apr 2021 08:32:25 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTKeh-00GxUd-U8
 for linux-mtd@lists.infradead.org; Mon, 05 Apr 2021 08:32:22 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1358WBPV088117;
 Mon, 5 Apr 2021 03:32:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1617611532;
 bh=aIM1P+J+7+MCBa4886JZPt41jVqnVkokltalE8AxDjU=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=tYybcERF6fnMaN1oa6vbJI7bdeI6hV/+Lg2fdz8Jw+2pSJ2lChkhQueB+bXY/XuXa
 xNCN5XkAMtsTE0RganrvTwxvW4j9ecoJ5WHBpJ5/r/oY/0SesHNOGmZNs/hB176EDn
 ZLU41RsHvTIHHTyg3H49QMYiZ6IBWaOhxPZJvVk8=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1358WBLS056298
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 5 Apr 2021 03:32:11 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 5 Apr
 2021 03:32:11 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 5 Apr 2021 03:32:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1358WAoB003080;
 Mon, 5 Apr 2021 03:32:11 -0500
Date: Mon, 5 Apr 2021 14:02:10 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <vigneshr@ti.com>, <masonccyang@mxic.com.tw>,
 <zhengxunli@mxic.com.tw>, <ycllin@mxic.com.tw>, <juliensu@mxic.com.tw>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH 1/2] Revert "mtd: spi-nor: macronix: Add support for
 mx25l51245g"
Message-ID: <20210405083208.qhdvpokoyr36awzf@ti.com>
References: <20210402082031.19055-1-tudor.ambarus@microchip.com>
 <20210402082031.19055-2-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210402082031.19055-2-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_093220_333751_EF17B446 
X-CRM114-Status: GOOD (  19.53  )
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

On 02/04/21 11:20AM, Tudor Ambarus wrote:
> This reverts commit 04b8edad262eec0d153005973dfbdd83423c0dcb.
> 
> mx25l51245g and mx66l51235l have the same flash ID. The flash
> detection returns the first entry in the flash_info array that
> matches the flash ID that was read, thus for the 0xc2201a ID,
> mx25l51245g was always hit, introducing a regression for
> mx66l51235l.
> 
> If one wants to differentiate the flash names, a better fix would be
> to differentiate between the two at run-time, depending on SFDP,
> and choose the correct name from a list of flash names, depending on
> the SFDP differentiator.
> 
> Fixes: 04b8edad262e ("mtd: spi-nor: macronix: Add support for mx25l51245g")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Acked-by: Pratyush Yadav <p.yadav@ti.com>

> ---
>  drivers/mtd/spi-nor/macronix.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 6c2680b4cdad..42c2cf31702e 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -72,9 +72,6 @@ static const struct flash_info macronix_parts[] = {
>  			      SECT_4K | SPI_NOR_DUAL_READ |
>  			      SPI_NOR_QUAD_READ) },
>  	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
> -	{ "mx25l51245g", INFO(0xc2201a, 0, 64 * 1024, 1024,
> -			      SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> -			      SPI_NOR_4B_OPCODES) },
>  	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024,
>  			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>  			      SPI_NOR_4B_OPCODES) },
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
