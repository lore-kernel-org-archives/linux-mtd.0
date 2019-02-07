Return-Path: <SRS0=ZMJ0=QO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C1B7C282C2
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 10:07:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A00221872
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 10:07:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IolE+5dv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A00221872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HehvoD6zoNwt+9Rafe9pU6ny6+hHgK0f9OrgozXqdws=; b=IolE+5dvTQhYsf
	lllJ6jXB/2h/pCT2LBqDOEx0R9ziyHTpImTV7/TTtpFbudDNdTQck9Z12wHHP7/wMQgVEP9pt3/9M
	KN0Q+H2vd+8pavufVX9diZ1oBvWPkEAno8l2DBT7qswYkUuo1+gGFvuVEnVfP8MC1QmbjWzXgACUa
	quEyjKxy+lWeFODmzlpKxjH+9WgHblqLEzqer0dYQw7id8NkbE26dZgggmJuC4fYWMYy1I5vB4A4+
	/GfnLv+ap+yk16PpplpJpWlCeEePnPtqlp+2R1IzqUnw9J5EhiMUq6eBA4+UfB+VIQsKiP3kaC2Um
	kRtHKnXxx7j6bV1iPD8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grgaI-00009w-H3; Thu, 07 Feb 2019 10:07:06 +0000
Received: from skedge04.snt-world.com ([91.208.41.69])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grgaE-0008QZ-L3
 for linux-mtd@lists.infradead.org; Thu, 07 Feb 2019 10:07:04 +0000
Received: from sntmail10s.snt-is.com (unknown [10.203.32.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id 89B6065A738;
 Thu,  7 Feb 2019 11:06:57 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail10s.snt-is.com
 (10.203.32.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Thu, 7 Feb 2019
 11:06:57 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%5]) with mapi id
 15.01.1466.003; Thu, 7 Feb 2019 11:06:57 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Add support for EN25Q80A
Thread-Topic: [PATCH 1/2] mtd: spi-nor: Add support for EN25Q80A
Thread-Index: AQHUsvEnBk05JSMTaE23Hh40f7Dva6XOJEMAgAX+zQA=
Date: Thu, 7 Feb 2019 10:06:56 +0000
Message-ID: <52338dfe-aca1-503d-6871-c4be09f1f3ac@kontron.de>
References: <20190123075538.12681-1-frieder.schrempf@kontron.de>
 <f0b2c97b-419a-1e3e-4624-52c60fe32065@microchip.com>
In-Reply-To: <f0b2c97b-419a-1e3e-4624-52c60fe32065@microchip.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.42]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <16C277EE8EFCF64CAACF83042236BCC0@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 89B6065A738.ADAF4
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bbrezillon@kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, marek.vasut@gmail.com, richard@nod.at,
 tudor.ambarus@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_020703_016450_461D8BA5 
X-CRM114-Status: GOOD (  20.62  )
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
Cc: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

On 03.02.19 14:33, Tudor.Ambarus@microchip.com wrote:
> Hi, Frieder,
> 
> On 01/23/2019 09:56 AM, Schrempf Frieder wrote:
>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>
>> This adds support for the EON EN25Q80A, a 8Mb SPI NOR chip.
> 
> I would suggest to specify who is using this flash and how did you test it. This
> way we will not end up with support for flashes that are not actually used.

Ok. The flash is used by a board that I plan to upstream. Maybe I should 
just resubmit this together with the actual board support patches?

Likewise for my other patch (MX25V8035F), this is for another board I 
plan to upstream soon.

> 
>>
>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>> ---
>>   drivers/mtd/spi-nor/spi-nor.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index 6e13bbd1aaa5..aa8a04293a25 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -1737,6 +1737,8 @@ static const struct flash_info spi_nor_ids[] = {
>>   	/* EON -- en25xxx */
>>   	{ "en25f32",    INFO(0x1c3116, 0, 64 * 1024,   64, SECT_4K) },
>>   	{ "en25p32",    INFO(0x1c2016, 0, 64 * 1024,   64, 0) },
>> +	{ "en25q80a",   INFO(0x1c3014, 0, 64 * 1024,   16,
>> +			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> 
> I'm reading EN25Q80A Rev. H, Issue Date: 2012/10/23
>   datasheet. I don't see the bfpt table described, so probably it doesn't support
> it. The flash advertises SPINOR_OP_READ_1_4_4 (0xeb), but not
> SPINOR_OP_READ_1_1_4 (0x6b). In spi_nor_init_params(), when SPI_NOR_QUAD_READ is
> set, we assume that SNOR_HWCAPS_READ_1_1_4 is supported, so we will use 0x6b for
> quad reads. I can't see how the flash works with 0x6b, unless there is a bfpt
> table that indicates support for 0xebh.
> 
> If it does support bfpt, set just SECT_4K | SPI_NOR_DUAL_READ, the latter will
> trigger the bfpt parsing.

Thanks for explaining this. I missed the point, that SPI_NOR_QUAD_READ 
actually requires support for SPINOR_OP_READ_1_1_4.

> 
> If you will resubmit, please order the entry in alphabetical order, by name.

Ok.

Thanks,
Frieder
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
