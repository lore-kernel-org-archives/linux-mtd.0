Return-Path: <SRS0=eog2=KW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5388C47089
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 08:58:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86E5561001
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 08:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86E5561001
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UrcFFbb/ybF10AbBi2sXYVH3pu9hItr4P5l1NOgnYLA=; b=Gvlv035jqHD7Vf/0uVN+8jJvgO
	dYERTHgUj83CgcFRNivqQ6DnC/plSI5OY+dr2sfZgCCJxMC7BxMmpYc3Qv961qDVKrvFQVVCqWMMX
	IXzDmIaTlI5eRQSo/ns5HhVNBampV1t2uvmCXiJjZz8LY1HTfXhti3loByu7ds7/DCd/uQcRKN/Lv
	Bva5vAH44uXml6VoaARLdkYEPTD26Qj4QCJu/MTx5nRAm7cDpqtzd6tLZYGZOBM+Q8e91e92zWtr6
	gp/G+VfoObQgiwNWZWCkxJVX34hnTfQto9bJ4Zpn1e7Tja0FfjYxOR73zMp8rrguk5PBR4GOMAuhT
	gmsjq0TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmBpj-0045NZ-Ox; Thu, 27 May 2021 08:57:40 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmBna-00448J-Sf
 for linux-mtd@lists.infradead.org; Thu, 27 May 2021 08:55:28 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14R8tNFO022640;
 Thu, 27 May 2021 03:55:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1622105723;
 bh=K6eMFOHEUvNcLz89WRRcZR6IpOH/ULeDLIn6bsztCY8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=mTM0XOQUc4CFJH+VzkzmKD5KL8ATuZXxivK51Wxkt4c7lSyjwTLq//pGgXmURnc50
 NW9SPfqQZJS9YXEQF+zzkYrxtFRGnN97+oz9Sl5xvNXyf4cSP7s4uc/UN93yiPcwau
 7Db6ELXuLQ6cKB+zPyN5TmNoCQQzErwUgzKljEjw=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14R8tNPI030193
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 27 May 2021 03:55:23 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 27
 May 2021 03:55:22 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 27 May 2021 03:55:22 -0500
Received: from [10.250.234.148] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14R8tHRm083184;
 Thu, 27 May 2021 03:55:18 -0500
Subject: Re: [PATCH 2/2] mtd: spi-nor: macronix: Fix name for mx66l51235f
To: Tudor Ambarus <tudor.ambarus@microchip.com>, <michael@walle.cc>,
 <p.yadav@ti.com>, <masonccyang@mxic.com.tw>, <zhengxunli@mxic.com.tw>,
 <ycllin@mxic.com.tw>, <juliensu@mxic.com.tw>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20210402082031.19055-1-tudor.ambarus@microchip.com>
 <20210402082031.19055-3-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <6c673b45-ce66-bdce-a860-5c32b9149bd5@ti.com>
Date: Thu, 27 May 2021 14:25:17 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210402082031.19055-3-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_015527_074514_7D55273E 
X-CRM114-Status: GOOD (  18.00  )
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



On 4/2/21 1:50 PM, Tudor Ambarus wrote:
> According to macronix website, there is no mx66l51235l part number.
> The chip detected as such is actually mx66l51235f. Rename the flash.
> Do not update the mx66l51235l name from the spi_nor_dev_ids[], since
> there are dt that are using this compatible.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

>  drivers/mtd/spi-nor/macronix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 42c2cf31702e..c8167de55e55 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -72,7 +72,7 @@ static const struct flash_info macronix_parts[] = {
>  			      SECT_4K | SPI_NOR_DUAL_READ |
>  			      SPI_NOR_QUAD_READ) },
>  	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
> -	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024,
> +	{ "mx66l51235f", INFO(0xc2201a, 0, 64 * 1024, 1024,
>  			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>  			      SPI_NOR_4B_OPCODES) },
>  	{ "mx66u51235f", INFO(0xc2253a, 0, 64 * 1024, 1024,
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
