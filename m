Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892AEC05027
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Jan 2023 16:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iSuTlZTMmgVBBm4ECSIW3DCzOO0bF1+AdcIXD0i+6oc=; b=ohj70bV7Urn+7N
	gzfPBtKXasay1CFiqcbf2XjDeuxhnvEfO9JqcpoMnfiBMYOmX8w2gLLLy9Ykv9YCrdSaxnEKO+4iX
	dbd7qXc+zK2m0Gf2kOY9jz1RD84rRkymy4B7DO+Yhwdf0b2C8DjXig+/aJnrkBfB8pJ+U8GFxZj07
	KRQSeAZEfctjNRAI81WqRJIoWGrYVsD1x4kb3WTOm7LH0AbtfYnF2JvL0egPdpR7BRd1e72U0GZZP
	dXGzj43nocDX3g0tPvjhwkKRfpFH7a6Z2lw7YKus16Sl8NGE8WAyb+6CmtCMtfRT1l6WRyBg60rJe
	ZWjtFNZOydBLjNBOIaIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJznm-000ac8-UN; Mon, 23 Jan 2023 16:36:10 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzjF-000Yk8-FB
	for linux-mtd@lists.infradead.org; Mon, 23 Jan 2023 16:31:31 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30NGVEpX015400;
	Mon, 23 Jan 2023 10:31:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674491474;
	bh=jqUyptc1UZcarQd5uBVWecXhYALGA39x8JahMAYBZQM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=igcmBsQfla9MPJGa+ZBfusVmeoXgsTjoC/PO7lLq2XGLqwUNn6Hgx0a1sjI9FXXuO
	 gwhytRCHMjwCOUN4eYAeyNyJ2ZoaCaRzyQ2vaI9N90a8uXDxV/8OE7YLVwDi3BO173
	 qBEa0fSRtaktOPb4a7Ap+ktEbgx9di6OmIJa9FLk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30NGVEK8125529
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Jan 2023 10:31:14 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 23
 Jan 2023 10:31:13 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 23 Jan 2023 10:31:13 -0600
Received: from [10.250.234.171] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30NGV8M4003491;
	Mon, 23 Jan 2023 10:31:09 -0600
Message-ID: <e02d6aa5-2189-4afb-2521-6034feaa3460@ti.com>
Date: Mon, 23 Jan 2023 22:01:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] mtd: spi-nor: spansion: Consider reserved bits in
 CFR5 register
Content-Language: en-US
To: Pratyush Yadav <ptyadav@amazon.de>,
        Tudor Ambarus
	<tudor.ambarus@linaro.org>
CC: <Takahiro.Kuwano@infineon.com>, <tkuw584924@gmail.com>,
        <linux-mtd@lists.infradead.org>, <pratyush@kernel.org>,
        <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <Bacem.Daassi@infineon.com>, <stable@vger.kernel.org>
References: <493d9a10-aaf3-70f6-36c3-9a2cf39f0759@linaro.org>
 <20230110164703.83413-1-tudor.ambarus@linaro.org>
 <mafs0v8kxb9mb.fsf_-_@amazon.de>
From: Dhruva Gole <d-gole@ti.com>
In-Reply-To: <mafs0v8kxb9mb.fsf_-_@amazon.de>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_083129_691374_4C3F5CB4 
X-CRM114-Status: GOOD (  21.40  )
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

Hi Pratyush,

On 23/01/23 20:07, Pratyush Yadav wrote:
> +Cc Dhruva
I had already reviewed this, but now I have locally applied the patches,
to linux master and built and tested - seems okay,
> Hi Tudor,
>
> On Tue, Jan 10 2023, Tudor Ambarus wrote:
>
>> CFR5[6] is reserved bit and must be always 1. Set it to comply with flash
>> requirements. While fixing SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_{EN, DS}
>> definition, stop using magic numbers and describe the missing bit fields
>> in CFR5 register. This is useful for both readability and future possible
>> addition of Octal STR mode support.
>>
>> Fixes: c3266af101f2 ("mtd: spi-nor: spansion: add support for Cypress Semper flash")
>> Cc: stable@vger.kernel.org
>> Reported-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  drivers/mtd/spi-nor/spansion.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>> index b621cdfd506f..07fe0f6fdfe3 100644
>> --- a/drivers/mtd/spi-nor/spansion.c
>> +++ b/drivers/mtd/spi-nor/spansion.c
>> @@ -21,8 +21,13 @@
>>  #define SPINOR_REG_CYPRESS_CFR3V               0x00800004
>>  #define SPINOR_REG_CYPRESS_CFR3V_PGSZ          BIT(4) /* Page size. */
>>  #define SPINOR_REG_CYPRESS_CFR5V               0x00800006
>> -#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN    0x3
>> -#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS    0
>> +#define SPINOR_REG_CYPRESS_CFR5_BIT6           BIT(6)
> Perhaps comment here that this bit is reserved. Otherwise it is not
> obvious what this does and why we are setting it without going through
> git-blame. No need for a re-roll, I think it is fine if you add this
> when applying.
>
>> +#define SPINOR_REG_CYPRESS_CFR5_DDR            BIT(1)
>> +#define SPINOR_REG_CYPRESS_CFR5_OPI            BIT(0)
>> +#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN                            \
>> +       (SPINOR_REG_CYPRESS_CFR5_BIT6 | SPINOR_REG_CYPRESS_CFR5_DDR |   \
>> +        SPINOR_REG_CYPRESS_CFR5_OPI)
>> +#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS    SPINOR_REG_CYPRESS_CFR5_BIT6
> I would say don't fix what isn't broken. But if you do, test it. Do you
> or Takahiro have a Cypress S28* flash to test this change on? If no,
> then perhaps Dhruva can help here since TI uses this flash on a bunch of
> their boards?
>
> The change looks fine to me with the above comment added, I just would
> like someone to test it once.
Tested OSPI_S_FUNC_DD_RW_ERASESIZE_UBIFS from ltp-ddt and test seemed to pass on my
AM625 SK EVM having an OSPI NOR S28HS512T Flash.
>
> Reviewed-by: Pratyush Yadav <ptyadav@amazon.de>
For this series,

Tested-by: Dhruva Gole <d-gole@ti.com>

>>  #define SPINOR_OP_CYPRESS_RD_FAST              0xee
>>
>>  /* Cypress SPI NOR flash operations. */
>> --
>> 2.34.1
>>
>>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
