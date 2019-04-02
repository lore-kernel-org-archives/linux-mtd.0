Return-Path: <SRS0=uocl=SE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1383FC43381
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 08:05:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D040720830
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 08:05:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ABJsKt14";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HlUwVuXN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D040720830
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ejHz8l5L+BtR1jcHuGYi3loZpRKQMpJ7DE7uNS8Wb/g=; b=ABJsKt143K3mfPqdLWvL/soGpb
	+ZIgIEOw9JvOmnPCPcbR3ngxSkXEcmZe/8TFz/ZKYLSNT4kCzjuVDc+UjzH9R3TEEMVEdo2AW2RXJ
	AAxWhNCzNKWGcVqLqk0i33sD8Mgj0OUGMzsnbwDDmY/GlapD33lEcOzQ2BKUqCvCaPSy0vQUP7qat
	gt2IFn0IKDXpdhmN8RSyAPKmEwQ6aY4f3xwsvCxLBNRNIi8OjE/x7utBMn+oAl4p7QP4WgNT/lQ7V
	vixX2ST4k69Cz2tYoqyOWKK3zVKEJcfRXbz2SX6OVGYPZnQbwLXtQS9Q2F/z+xFTOxDM3SA2Gmd9O
	yiDf8LyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBEQ2-0005tI-AI; Tue, 02 Apr 2019 08:05:18 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBEPz-0005sv-Nv
 for linux-mtd@lists.infradead.org; Tue, 02 Apr 2019 08:05:17 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3284xs7015148;
 Tue, 2 Apr 2019 03:04:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1554192299;
 bh=ZnmNwdtm2w9MeJdjQmrMQupvIYWHLD08s/A0Ctl+aKw=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=HlUwVuXNNJwVUYKMO68HJPaKnLxWjaIhV72DkT9Pi2SOspwDVrlYSs6azIMaWmhS5
 dOq8oZvAsF8F8wcj235haETQq64oSgglF/1eJNqE8HNeGGTTI7rx3ZPXi4gcf0Mh1v
 t8wdXT5LH7kox6SCZf8aRz6JXKjGOEFGUcHIRUIY=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3284xMB118982
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 2 Apr 2019 03:04:59 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 2 Apr
 2019 03:04:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 2 Apr 2019 03:04:58 -0500
Received: from [172.24.190.89] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3284tv8052645;
 Tue, 2 Apr 2019 03:04:56 -0500
Subject: Re: [PATCH] mtd: spi-nor: Add Micron MT25QU128 support
To: <wan.ahmad.zainie.wan.mohamad@intel.com>, <linux-mtd@lists.infradead.org>, 
 <marek.vasut@gmail.com>, <tudor.ambarus@microchip.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <bbrezillon@kernel.org>, <richard@nod.at>
References: <1554217172-30466-1-git-send-email-wan.ahmad.zainie.wan.mohamad@intel.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <c8202878-e33a-3d47-a8dc-43fd0df26417@ti.com>
Date: Tue, 2 Apr 2019 13:35:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <1554217172-30466-1-git-send-email-wan.ahmad.zainie.wan.mohamad@intel.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_010515_860017_0D540EBA 
X-CRM114-Status: GOOD (  15.84  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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



On 02/04/19 8:29 PM, wan.ahmad.zainie.wan.mohamad@intel.com wrote:
> From: Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>
> 
> Add support for Micron 128Mb Serial NOR Flash Memory.
> Datasheet is available: MT25Q_QLHS_U_128_ABA_0.pdf
> 

Could you add what board was this tested on and what modes were tested?

> Signed-off-by: Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index fae147452aff..626ac9e02241 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1881,6 +1881,7 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
>  	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
>  	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
>  	{ "mt25qu02g",   INFO(0x20bb22, 0, 64 * 1024, 4096, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
> +	{ "mt25qu128",   INFO(0x20bb18, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
>  

Per datasheet here[1] mt25qu128 does seem to support CHIP erase. So please drop NO_CHIP_ERASE.
Micron flash ID table is sorted by device ID. Could you insert the entry accordingly?
Also, please limit the line to 80 char like:

        { "mt25qu128",   INFO(0x20bb18, 0, 64 * 1024, 1024, SECT_4K | 
                         USE_FSR | SPI_NOR_QUAD_READ) },


[1] https://www.mouser.com/datasheet/2/671/MT25Q_QLHS_U_128_ABA_0-1387216.pdf

>  	/* Micron */
>  	{
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
