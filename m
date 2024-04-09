Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EB3C67861
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2024 08:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TgNcbaTeN2yFTAgAp1udHuDAAWXBuyv5qDabpM6MRyw=; b=q/3Hi1kP+SgcWxwIPTBKDmii0C
	SY5AgavazSYg4saDZoLVrDmE+hC7UJAdhPEXh5/3lIVwolM87iT3KXqnDhYx+HdkZSVGnNkqHjjk6
	QkPxnwgjz739ZR6YaS5sYxA9G06HsAqBd7gjCjzMdUXXzW8qh2plUve57/9yBblLFr06GwLzeDNsv
	BzipK+MyGAZbCNOUTv5EZtVKmmdjOv5sgapc/1Aek8rq+aDsVtsNXePmIWVK9nDU+6VI6rzf0fxFe
	0tw5Owo0x4Ik12+yyW9NEb56Iz6KcRIh1ZRh/pRVDEcbSVtgiFLI2ZhIcf5pBZI4wMwanac+Kz0c6
	fWzijlrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru6xW-000000010s7-1k12;
	Tue, 09 Apr 2024 08:36:02 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru6xU-000000010qN-0L5M
	for linux-mtd@lists.infradead.org;
	Tue, 09 Apr 2024 08:36:01 +0000
Received: from [192.168.0.106] (unknown [114.249.187.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 500C83F0FA;
	Tue,  9 Apr 2024 08:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1712651756;
	bh=kAciCQDQ2/JDe5pZ6ETvcXCash8EICt7rZPd6O1olpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type;
	b=HpR4kZ9fmlhwV2NdUIMM+gat5fD1FUoYtAkk2iREFO3bLRJf4ziuJ/XnZ7KLXfb2o
	 idiqTYw1/1H42NznXI8NaxzhoZgv9d5MxUkqnPzNEC8Zm7QwXOfQ5/Po4MfSiSEd2y
	 6R/QBY9S18EK6LGCjc5j+hOKtJByTDKHyc4xY76i/orRbzfEJptr7PCNmMEbawMJhL
	 MCfkb1Vqk1ESm7xi+AbiA5JrcmgXGPl15QAj5+WjjKm4boB+Aj8UCcoC4JF/WIUESf
	 I/vzF8t2bN8mo6HIY1o0IrT/YsHQNAxxd54CZON9ilWY3KbpuGMMO1l/TnM7EA+GqY
	 UtJc9qx/dfSFw==
Message-ID: <81551ca3-532d-43c8-859e-c3d9be8d6e9d@canonical.com>
Date: Tue, 9 Apr 2024 16:35:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add support for infineon
 cy15v102qsn
To: Michael Walle <mwalle@kernel.org>, linux-mtd@lists.infradead.org,
 tudor.ambarus@linaro.org, pratyush@kernel.org
References: <20240408124328.777375-1-hui.wang@canonical.com>
 <D0ER81J5LHKW.N4T3BI3FRLDB@kernel.org>
Content-Language: en-US
From: Hui Wang <hui.wang@canonical.com>
In-Reply-To: <D0ER81J5LHKW.N4T3BI3FRLDB@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_013600_355359_294AFF86 
X-CRM114-Status: GOOD (  16.86  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On 4/8/24 20:53, Michael Walle wrote:
> Hi,
>
> On Mon Apr 8, 2024 at 2:43 PM CEST, Hui Wang wrote:
>> It is 2Mbit F-RAM which is logically organized as 256K x 8.
> Please have a look at drivers/misc/at25.c. I'm trying to get rid of
> the NO_ERASE flag. This is more of an EEPROM like device. The at25
> driver already have some kind of FRAM type support.
After reading your comment, I checked the drivers/misc/at25.c, I found 
It couldn't work on my hardware. In my case, the F-RAM is under a spi 
bus (spi-nxp-fspi.c) which only supports spi_mem transfer mode. So 
currently, the mtd/spi-nor is the only choice.
>> Signed-off-by: Hui Wang <hui.wang@canonical.com>
>> ---
>>   drivers/mtd/spi-nor/spansion.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>> index 6cc237c24e07..5dc94926b2cb 100644
>> --- a/drivers/mtd/spi-nor/spansion.c
>> +++ b/drivers/mtd/spi-nor/spansion.c
>> @@ -981,6 +981,12 @@ static const struct flash_info spansion_nor_parts[] = {
>>   		.name = "s28hs02gt",
>>   		.mfr_flags = USE_CLPEF,
>>   		.fixups = &s28hx_t_fixups,
>> +	}, {
>> +		.id = SNOR_ID(0x48, 0x51, 0x80, 0x06, 0x00, 0x00),
> This doesn't look like a JEDEC id. The datasheet says it is a 11bit
> manufacturer id?
>
> -michael

 From the page 82 of datasheet, the Device ID is 0000000006805148, and 
the ID read by spi_nor_read_id() matches it (id[0] is 0x48, id[1] is 
0x51, ...).

Thanks,

Hui.

>
>> +		.name = "cy15v102qsn",
>> +		.size = SZ_256K,
>> +		.sector_size = SZ_256K,
>> +		.flags = SPI_NOR_NO_ERASE,
>>   	}, {
>>   		.id = SNOR_ID(0xef, 0x40, 0x13),
>>   		.name = "s25fl004k",

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
