Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E1AC04AA7
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Sep 2023 16:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sOO2PoYpNM35bYUaDqgyKdQhVB0MKi3H41ucsAZMXcw=; b=t/ZUMTpeV3MP1C
	LK6HGjcJ2kUY50LTS4bUE1btVxtrJyS3+7taehpq6/6BL/q6y7jP6wdXa1wbVR4YvhZm1c3s87aen
	bOvLFuyqtvMOu6R04+DgvNUBrS32Rg2ZSatCpqNUintVgsag+YmEp/g7JAiSzrNf7+RLfSWIQarEO
	e4AbOr2WbwHzDN34/DMUZ/j9we9mSKAxcYX3QFmE006Akw0kJtPusp83QeyST16WfHTEY6/SDd3/D
	wSUfYXNSvx+fscSAwDI70TLbl1gYLls5SC+rH5F9qCSoR7eYgymtKob3oQCHfpYKtLjTtNjnt6zhg
	fzADYbHfcWJ/ofn0cx4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiztX-003bt1-0B;
	Wed, 20 Sep 2023 16:17:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiztT-003bs0-0O;
	Wed, 20 Sep 2023 16:17:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695226660; x=1726762660;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=oOoaB1KS0Eiipp5IcFf75B/P4E+oA/gb1k22OBoC38o=;
  b=ck27bFnAFK8wFvdPRscmFImPC67rKDRByhPcN22P3JnXgqFbp8C8Mcao
   ZpvoqQFqtrWCvUuwas9QYMIBmNC5L5ziPFtt+707rEMUa0RvlI52sadKL
   UcnKpDG2j+gvdKWTfsDRakFmnoTNiHlsK23KycfCG4zrdYRUDH1GwkNBp
   eaukE+6kFVfVWVqN32ZiFeHS7T5NzrFVaPFCxJ/X/jOEY3A1Cqt9g6qLl
   BP7ijC3vB64R71H6+QOynIr3A7zaJSdWb+1Sz7hXLfkQ3s+feCmmZQt7n
   D4ou+Wyfnr/sznBf3Slt+5gq1h9/hq9yH6opTOUqhe30r6I/mvQO4qDfq
   Q==;
X-CSE-ConnectionGUID: kv4cb7CyT2KXaEGqaQkOVg==
X-CSE-MsgGUID: JH7tRU/ATMaibGX1tMOLYQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="236244815"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Sep 2023 09:17:35 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 20 Sep 2023 09:16:53 -0700
Received: from [10.171.246.35] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Wed, 20 Sep 2023 09:16:51 -0700
Message-ID: <4c9b0dff-6350-376b-60ac-c36f98378a51@microchip.com>
Date: Wed, 20 Sep 2023 18:16:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] mtd: spi-nor: atmel: add at25ff321a entry
Content-Language: en-US, fr-FR
To: Tudor Ambarus <tudor.ambarus@linaro.org>, <miquel.raynal@bootlin.com>,
	<linux-mtd@lists.infradead.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230908151400.164470-1-nicolas.ferre@microchip.com>
 <8d72820d-bbaa-abc8-4448-87f0f054c381@linaro.org>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <8d72820d-bbaa-abc8-4448-87f0f054c381@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_091739_293525_E322B4F8 
X-CRM114-Status: GOOD (  21.79  )
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

On 19/09/2023 at 18:12, Tudor Ambarus wrote:
> On 08.09.2023 18:14, nicolas.ferre@microchip.com wrote:
>> From: Nicolas Ferre <nicolas.ferre@microchip.com>
>>
>> Add the at25ff321a 4MB SPI flash which is able to provide
>> SFDP informations.
>> Datasheet: https://www.renesas.com/us/en/document/dst/at25ff321a-datasheet
>>
>> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
>> ---

[..]

>>   drivers/mtd/spi-nor/atmel.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
>> index 58968c1e7d2f..c94d52951481 100644
>> --- a/drivers/mtd/spi-nor/atmel.c
>> +++ b/drivers/mtd/spi-nor/atmel.c
>> @@ -184,6 +184,10 @@ static const struct flash_info atmel_nor_parts[] = {
>>                FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
>>                NO_SFDP_FLAGS(SECT_4K)
>>                .fixups = &atmel_nor_global_protection_fixups },
>> +     { "at25ff321a", INFO(0x1f4708, 0, 64 * 1024,  64)
>> +             FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
>> +             PARSE_SFDP
>> +             .fixups = &atmel_nor_global_protection_fixups },
> 
> We have recently changed how the flash entries are defined. Would you
> please try the following changes instead?
> 
> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
> index 95f0e139284e..44218716d81e 100644
> --- a/drivers/mtd/spi-nor/atmel.c
> +++ b/drivers/mtd/spi-nor/atmel.c
> @@ -213,6 +213,12 @@ static const struct flash_info atmel_nor_parts[] = {
>                  .flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
>                  .no_sfdp_flags = SECT_4K,
>                  .fixups = &atmel_nor_global_protection_fixups
> +       }, {
> +               .id = SNOR_ID(0x1f, 0x47, 0x08),
> +               .name = "at25ff321a",
> +               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,

Here, I added:

                .no_sfdp_flags = SECT_4K,

to match the other devices of the family... I checked on the datasheet, 
4K sectors are okay, but I don't know exactly if this is eligible to the 
"no_sfdb_flags" property... forgive me, I didn't check further knowing 
that you might have better view on this than me ;-)

> +               .fixups = &atmel_nor_global_protection_fixups
> +       }, {
>          }, {
>                  .id = SNOR_ID(0x1f, 0x48, 0x00),
>                  .name = "at25df641",

That works perfectly well (I can re-post the test results as my previous 
patch if needed): do you want me to send the updated patch with your 
Suggested-by tag or you can send yours, tell me what you prefer.

Thanks for the heads-up on this update that I hadn't noticed. Best regards,
   Nicolas


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
