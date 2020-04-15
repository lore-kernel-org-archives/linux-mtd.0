Return-Path: <SRS0=fMXC=57=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4050C2BA19
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Apr 2020 17:29:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 842A420784
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Apr 2020 17:29:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jw39zpOl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZsSNFVRt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 842A420784
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qq+dsJZN32VkUqUSWuP4iyBwQP3Y4uiSkMc95y4KNIA=; b=Jw39zpOlRFTS0u
	Yawi5qegDfxg+rXemkKmrjCvuC5ynrJV3pP1Ea6b6MyjkdChf0ghyfD6/pBL1c8PC+6//VLH8UEbO
	Dr8XCXaqqugPZeaLD01k4S8TNwrDKAwCsYZoGUpFXHU9AA7fPWrMmqbYIc3wpa61SCHhNtF5woWfj
	cMBYfRvw58rhcyhmp/GoHwtkC3R8O4WGaxCT6RD1gWVCPcBMlAS8JMbaqLht6U7xV+D3PSWq30NEE
	EJ2emEUOxe64qo1iwYaAkGwstSrMYc4roXnJGgFo9W+p5vKvB8yphcLcA0wHq40Y3iHVy5Opbu0r2
	1Hg3qimmUdAgErJ4FH9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOlqK-0007qb-BJ; Wed, 15 Apr 2020 17:28:56 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOlqG-0007ol-9o
 for linux-mtd@lists.infradead.org; Wed, 15 Apr 2020 17:28:54 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03FHSfVu052824;
 Wed, 15 Apr 2020 12:28:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1586971721;
 bh=QLsGKcCjfwvWY3KJRgsvPJIV5M3MdWnhqG+l9W3AiSo=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=ZsSNFVRtCBcd6a3zQa7X8J1XOw0jU1C+3cOvcRIRrLjBOhLKBoCizhWuEYbishlMc
 F+4OJrEDKb80dkGn4f8Rv9EvDRYYyczlFkifNAUjNdcl1wT1CHovv0f/whmAKRxrdU
 VmWx8JhmnrbnvEWetqoyII+3WXsPQ24q+o0P00p8=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03FHSfMi098043
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 15 Apr 2020 12:28:41 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Apr 2020 12:28:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Apr 2020 12:28:40 -0500
Received: from [10.250.132.177] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03FHSbVM103506;
 Wed, 15 Apr 2020 12:28:38 -0500
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for cy15x104q
To: Sascha Hauer <s.hauer@pengutronix.de>, <linux-mtd@lists.infradead.org>
References: <20200305120242.1391-1-s.hauer@pengutronix.de>
 <20200309084033.8752-1-s.hauer@pengutronix.de>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <8661b73d-bc4b-fa41-b5bf-6f3483d4148d@ti.com>
Date: Wed, 15 Apr 2020 22:58:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200309084033.8752-1-s.hauer@pengutronix.de>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_102852_441014_E43E4D95 
X-CRM114-Status: GOOD (  20.39  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 09/03/20 2:10 pm, Sascha Hauer wrote:
> The Cypress cy15b104q and cy15v104q are 4Mbit serial SPI F-RAM devices.
> Add support for them to the spi-nor driver.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
> 
> Changes since v1:
> - Instead of specifying 1024 sectors with a sector size of 512 specify
>   512 * 1024 sectos with a sector size of 1. The device has no idea of
>   sectors and is not erasable, so a sector size of 1 seems to better
>   reflect reality.
> 
>  drivers/mtd/spi-nor/spi-nor.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 4fc632ec18fe..a5c1d684364c 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2335,6 +2335,9 @@ static const struct flash_info spi_nor_ids[] = {
>  
>  	{ "at45db081d", INFO(0x1f2500, 0, 64 * 1024, 16, SECT_4K) },
>  
> +	/* Cypress */
> +	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1, SPI_NOR_NO_ERASE) },

This seems wrong

As the datasheet for the device says:

"Device ID
The CY15B104Q device can be interrogated for its manufacturer, product
identification, and die revision. The RDID opcode 9Fh allows
the user to read the manufacturer ID and product ID, both of which are
read-only bytes. The JEDEC-assigned manufacturer ID places
the Cypress (Ramtron) identifier in bank 7; therefore, there are six
bytes of the continuation code 7Fh followed by the single byte C2h.
There are two bytes of product ID, which includes a family code, a
density code, a sub code, and the product revision code."

I am not sure how are you reading 0x4 as the first byte. It should have
been 6 bytes of 0x7F followed by 0xc2 right?

Also 0x7F is continuation code and not actual device ID (See JEDEC
standard JEP106). You will have to extend spi_nor_read_id() function to
take care of continuation code and read more bytes in order to get the
actual Manuf/device ID

> +
>  	/* EON -- en25xxx */
>  	{ "en25f32",    INFO(0x1c3116, 0, 64 * 1024,   64, SECT_4K) },
>  	{ "en25p32",    INFO(0x1c2016, 0, 64 * 1024,   64, 0) },
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
