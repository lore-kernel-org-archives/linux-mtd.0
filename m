Return-Path: <SRS0=PqFb=NH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19CB1C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 18:45:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD58B600CD
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 18:45:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD58B600CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w7NSfIfrE6FEwi0T5kgygcmtr5T7NeZNZ0rk7ffpazA=; b=NH4QkBLce7rV30
	JHxIKLiZxLOuxAPWPOVcjdr2FLSYwJSPkjRFOFlkdG+1fUEJRgqOyUa4ejdbA8k0K/JX9xDWmpPGE
	ZouzJwZB/fR0UCxV5Tgjllp+dtyuxyVVH59TjKu0SDYHd1W/z0+303nhNSAfY7uUV+XRsOirrXppK
	lJV/St8uBK1g9sptdd9XZzhyEy8GcsyUvTSb18fMjRnkjYr+d0M6+/qFhTvelPyhz6GFUbov0UqjV
	fH3rTIjcyBkLEKA1MPotS74xQu57TEruPItJXLHcxJXyxeH2MEGSdF8p9CVzRUZjFA/BvFjJsIpqn
	LxEu2L7uCOUpCh0AQgjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFhax-0000g4-7P; Mon, 16 Aug 2021 18:44:23 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFhas-0000ff-B3; Mon, 16 Aug 2021 18:44:22 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17GIhqsH035342;
 Mon, 16 Aug 2021 13:43:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629139432;
 bh=xbd44KlNbrRuprMoCJJnhfboD18PpKKylrNhQzUhKdY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=r5Rv9GgJIKGsOBwKYeUmhQMBnCj0dddRr/mpt/bMao8eddx0XWkaRq8m1BxQiuKxj
 rv52nKw69H82Kyx+u9M8zilF+KhyFc/lFQ+Wbe+4BHXf7TcLkY8G5vR7CIhQ+kFw0Y
 9eEBt0WMnuGpZYInzD2oJBYEHXC96y2uyGJ3OrNo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17GIhqls020875
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 16 Aug 2021 13:43:52 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 16
 Aug 2021 13:43:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 16 Aug 2021 13:43:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17GIhpAW075803;
 Mon, 16 Aug 2021 13:43:51 -0500
Date: Tue, 17 Aug 2021 00:13:50 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <vigneshr@ti.com>, <figgyc@figgyc.uk>,
 <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>, <esben@geanix.com>,
 <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>,
 <heiko.thiery@gmail.com>, <macromorgan@hotmail.com>, <sr@denx.de>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>
Subject: Re: [PATCH v2 06/35] mtd: spi-nor: manuf-id-collisions: Add support
 for xt25f128b
Message-ID: <20210816184348.sabnihh7b2sf34s4@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-7-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210727045222.905056-7-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_114418_512547_9862B026 
X-CRM114-Status: GOOD (  18.20  )
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

On 27/07/21 07:51AM, Tudor Ambarus wrote:
> Flash does not support continuation codes and may collide with a flash
> of other manufacturer, Intersil being an example .
Nitpick:                                          ^ drop the extra space

> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
> 0000000 4653 5044 0100 ff01 0000 0901 0030 ff00
> 0000010 000b 0301 0060 ff00 ffff ffff ffff ffff
> 0000020 ffff ffff ffff ffff ffff ffff ffff ffff
> 0000030 20e5 fff1 ffff 07ff eb44 6b08 3b08 bb42
> 0000040 ffee ffff ffff ff00 ffff ff00 200c 520f
> 0000050 d810 ff00 ffff ffff ffff ffff ffff ffff
> 0000060 3600 2700 f99f 6477 e8d9 ffff

I think you should list all the other sysfs parameters as well. See 
Michael's comments on patch 35.

> 
>  drivers/mtd/spi-nor/manuf-id-collisions.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/manuf-id-collisions.c b/drivers/mtd/spi-nor/manuf-id-collisions.c
> index bf7dba34f018..db31470ebf6a 100644
> --- a/drivers/mtd/spi-nor/manuf-id-collisions.c
> +++ b/drivers/mtd/spi-nor/manuf-id-collisions.c
> @@ -13,6 +13,10 @@ static const struct flash_info id_collision_parts[] = {
>  	{ "by25q128as", INFO(0x684018, 0, 64 * 1024, 256, SPI_NOR_SKIP_SFDP |
>  			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>  			     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
> +
> +	/* XTX (XTX Technology Limited) */
> +	{ "xt25f128b", INFO(0x0b4018, 0, 64 * 1024, 256, SPI_NOR_PARSE_SFDP |
> +			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },

I have not went and checked, but I assume these two flags can't be 
discovered via SFDP?

>  };
>  
>  const struct spi_nor_manufacturer spi_nor_manuf_id_collisions = {
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
