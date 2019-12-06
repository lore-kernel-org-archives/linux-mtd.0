Return-Path: <SRS0=BOQa=Z4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B9CC43603
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Dec 2019 09:32:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A51E21823
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Dec 2019 09:32:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cHBT5hPq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kjaIvJwF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A51E21823
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mL6K70uZz8Rnmi4/HLPI1iwymeS2KqGOy0ejO3Z3f8I=; b=cHBT5hPqQ1WMGi
	TxDC8tn9CTtC3wtlxcwZcUIVrNMwx2d5hziHYCA213a9g80wH4FR/7cSCTlf1um4iciW5A0Fgwczg
	aqoeNlet47uBaP9dDkll9W9nJv2pWZr42kTCKAHzgARRg0KovbESgtLZP6YuHHfldhsrAl9uyynrP
	Yc2EBYkV8/yvjjRnv+l2G9NdDTsVGhr/cQhJj1V6IqaOrkw1DID/I7+X+BPDbyTHamjz3S58ZrnRS
	4KXrL7341hRG8qCNi7qRZprRwiwEYg7gaF9J4MIVGJb1+a8IHqlalW0R6XvQWQD2dJ0F0KX8Ghrz7
	R+ZK+OHfQEZWm1DRT4Xg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1id9yS-0007yp-B4; Fri, 06 Dec 2019 09:32:32 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1id9yP-0007yH-93
 for linux-mtd@lists.infradead.org; Fri, 06 Dec 2019 09:32:30 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB69WIgh024250;
 Fri, 6 Dec 2019 03:32:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1575624738;
 bh=NYFG+Lvsr2YM0gqYd5cEG6Mr/SyvVQ86a1Rho1sT43Y=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=kjaIvJwFBkPjkYkjai2bYYOUWeUZNL+W9jVd167YeEZklvNKhcGY2HFO7hltZPy/v
 LNCXBYfJCu8uXM+qijXInVazPyhAhLXBABr3FzfgKyI/f+gOBvwKSpuUhGXze8kG02
 ZfBiK4/IU90DEYbKez07jYxy3xTxDqqrkI+BqQAA=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB69WIS4074328
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 6 Dec 2019 03:32:18 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 6 Dec
 2019 03:32:14 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 6 Dec 2019 03:32:14 -0600
Received: from [10.250.133.44] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB69WBdu086266;
 Fri, 6 Dec 2019 03:32:12 -0600
Subject: Re: [EXT] [PATCH 1/3] mtd: spi-nor: Split mt25qu512a (n25q512a) entry
 into two
To: Ashish Kumar <ashish.kumar@nxp.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
References: <20191205065935.5727-1-vigneshr@ti.com>
 <20191205065935.5727-2-vigneshr@ti.com>
 <VI1PR04MB40154C771556031768A4D48D955C0@VI1PR04MB4015.eurprd04.prod.outlook.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <8a7709b6-215c-939a-906d-0ed7c3c2dbd8@ti.com>
Date: Fri, 6 Dec 2019 15:02:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <VI1PR04MB40154C771556031768A4D48D955C0@VI1PR04MB4015.eurprd04.prod.outlook.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191206_013229_398185_75AAD12B 
X-CRM114-Status: GOOD (  15.06  )
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
Cc: Richard Weinberger <richard@nod.at>, John Garry <john.garry@huawei.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 12/5/2019 12:54 PM, Ashish Kumar wrote:
> Hi Vignesh,
[...]
>>  drivers/mtd/spi-nor/spi-nor.c | 9 +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index f4afe123e9dc..01efea022990 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -2459,15 +2459,16 @@ static const struct flash_info spi_nor_ids[] = {
>>         { "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K |
>> SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>>         { "n25q256ax1",  INFO(0x20bb19, 0, 64 * 1024,  512, SECT_4K |
>> SPI_NOR_QUAD_READ) },
>>         { "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR |
>> SPI_NOR_QUAD_READ) },
>> +       { "mt25qu512a",  INFO6(0x20bb20, 0x104400, 64 * 1024, 1024,
>> +                              SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
>> +                              SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> It seems you have moved back to my original patch [1], wrt mt25qu512a.
> 


Yes, it seems like n25q and mt25q are not really same... mt25q supports
stateless 4 byte addressing opcodes where as n25q does not. Hence we
cannot add SPI_NOR_4B_OPCODES to n25q's idcodes.
This patch is outcome of from U-Boot discussion here (I believe you were
cc'd as well):
https://patchwork.ozlabs.org/patch/1160501/

Regards
Vignesh

> Regards
> Ashish  
>> +       { "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K |
>> +                             SPI_NOR_QUAD_READ) },
>>         { "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR |
>> SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
>>         { "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR |
>> SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
>>         { "mt25ql02g",   INFO(0x20ba22, 0, 64 * 1024, 4096,
>>                               SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
>>                               NO_CHIP_ERASE) },
>> -       { "mt25qu512a (n25q512a)", INFO(0x20bb20, 0, 64 * 1024, 1024,
>> -                                       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
>> -                                       SPI_NOR_QUAD_READ |
>> -                                       SPI_NOR_4B_OPCODES) },
>>         { "mt25qu02g",   INFO(0x20bb22, 0, 64 * 1024, 4096, SECT_4K | USE_FSR |
>> SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
>>
>>         /* Micron */
>> --
>> 2.24.0
> [1]: http://patchwork.ozlabs.org/patch/1146197/
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
