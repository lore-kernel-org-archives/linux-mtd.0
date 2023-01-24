Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41ECAC38142
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Jan 2023 10:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g2r2E37GFwhM2guBpS1ilDaJYoPi53RjfPTdl/v4IeI=; b=b63Ihc8/jZH5Gl
	Y8SLeHTjBkPkbVKEIMPt1uhwMgUdhwQ4hczadVoKCF49GoJwgrITVeTHTD5bJuiCODHtRqtdMC1a8
	WXgbYetVpCZdb3j87pAQmN6Ici6N4QOPCVVrAylW9Ec4Kuk3LFAOOAuSs0yvJreNoCClY48Qj9i1I
	huWxBcBpORcbvt9nvvlVOVJ84Rier3ilshjYdx2aSNqGBW0PpkZ/UVKXVOuMxTbwOyaQXnskqzhJP
	dgeYVBewG0srYPM8JIwDkRakPUg9zVM4PKNJu1n+zxDCbLmrJ0UAPlR0UNH9/h4XDUJMrTIGu1DZ2
	JI0z/xUDwUl3VJaqWb+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKGlw-003CPV-Mq; Tue, 24 Jan 2023 10:43:24 +0000
Received: from smtp-fw-33001.amazon.com ([207.171.190.10])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKGlt-003CNo-GV
	for linux-mtd@lists.infradead.org; Tue, 24 Jan 2023 10:43:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1674557001; x=1706093001;
  h=from:to:cc:subject:references:date:in-reply-to:
   message-id:mime-version;
  bh=1U5juJaPb30fEPviPWIKuhE2qdxYLM2FWTjsBl3qn0E=;
  b=dhn19tcDDiag89CqXYOGzZxTz3lyLnDyLf3I4h4x0e5g0GEkCBsyQuR1
   ABmV3jLs1nTVfVCr7lJPON7l3unQD82W9ZLRtTXa7fLIf47YIV9NQ/GGk
   8Wpfss3Uah/aZJRbbaKzoF44mNRlOdqX1JI1D0owSYXTKdS0MLJ/Rj/fx
   Q=;
X-IronPort-AV: E=Sophos;i="5.97,242,1669075200"; 
   d="scan'208";a="257403172"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-pdx-1box-2bm6-32cf6363.us-west-2.amazon.com) ([10.43.8.6])
  by smtp-border-fw-33001.sea14.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 10:43:11 +0000
Received: from EX13MTAUEE002.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
	by email-inbound-relay-pdx-1box-2bm6-32cf6363.us-west-2.amazon.com (Postfix) with ESMTPS id DB2DA80069;
	Tue, 24 Jan 2023 10:43:06 +0000 (UTC)
Received: from EX13D33UEE004.ant.amazon.com (10.43.62.107) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.45; Tue, 24 Jan 2023 10:43:06 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D33UEE004.ant.amazon.com (10.43.62.107) with Microsoft SMTP Server (TLS)
 id 15.0.1497.45; Tue, 24 Jan 2023 10:43:06 +0000
Received: from dev-dsk-ptyadav-1c-37607b33.eu-west-1.amazon.com (10.15.11.255)
 by mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP Server id
 15.0.1497.45 via Frontend Transport; Tue, 24 Jan 2023 10:43:05 +0000
Received: by dev-dsk-ptyadav-1c-37607b33.eu-west-1.amazon.com (Postfix, from userid 23027615)
	id B711220D95; Tue, 24 Jan 2023 11:43:04 +0100 (CET)
From: Pratyush Yadav <ptyadav@amazon.de>
To: Dhruva Gole <d-gole@ti.com>
CC: Tudor Ambarus <tudor.ambarus@linaro.org>, <Takahiro.Kuwano@infineon.com>,
	<tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>,
	<pratyush@kernel.org>, <michael@walle.cc>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <Bacem.Daassi@infineon.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: spansion: Consider reserved bits in
 CFR5 register
References: <493d9a10-aaf3-70f6-36c3-9a2cf39f0759@linaro.org>
	<20230110164703.83413-1-tudor.ambarus@linaro.org>
	<mafs0v8kxb9mb.fsf_-_@amazon.de>
	<e02d6aa5-2189-4afb-2521-6034feaa3460@ti.com>
Date: Tue, 24 Jan 2023 11:43:04 +0100
In-Reply-To: <e02d6aa5-2189-4afb-2521-6034feaa3460@ti.com> (Dhruva Gole's
	message of "Mon, 23 Jan 2023 22:01:07 +0530")
Message-ID: <mafs0tu0gfc1z.fsf_-_@amazon.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_024321_617912_390C5E2E 
X-CRM114-Status: GOOD (  24.71  )
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

On Mon, Jan 23 2023, Dhruva Gole wrote:

> Hi Pratyush,
>
> On 23/01/23 20:07, Pratyush Yadav wrote:
>> +Cc Dhruva
> I had already reviewed this, but now I have locally applied the patches,
> to linux master and built and tested - seems okay,
>> Hi Tudor,
>>
>> On Tue, Jan 10 2023, Tudor Ambarus wrote:
>>
>>> CFR5[6] is reserved bit and must be always 1. Set it to comply with flash
>>> requirements. While fixing SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_{EN, DS}
>>> definition, stop using magic numbers and describe the missing bit fields
>>> in CFR5 register. This is useful for both readability and future possible
>>> addition of Octal STR mode support.
>>>
>>> Fixes: c3266af101f2 ("mtd: spi-nor: spansion: add support for Cypress Semper flash")
>>> Cc: stable@vger.kernel.org
>>> Reported-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>> ---
>>>  drivers/mtd/spi-nor/spansion.c | 9 +++++++--
>>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>>> index b621cdfd506f..07fe0f6fdfe3 100644
>>> --- a/drivers/mtd/spi-nor/spansion.c
>>> +++ b/drivers/mtd/spi-nor/spansion.c
>>> @@ -21,8 +21,13 @@
>>>  #define SPINOR_REG_CYPRESS_CFR3V               0x00800004
>>>  #define SPINOR_REG_CYPRESS_CFR3V_PGSZ          BIT(4) /* Page size. */
>>>  #define SPINOR_REG_CYPRESS_CFR5V               0x00800006
>>> -#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN    0x3
>>> -#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS    0
>>> +#define SPINOR_REG_CYPRESS_CFR5_BIT6           BIT(6)
>> Perhaps comment here that this bit is reserved. Otherwise it is not
>> obvious what this does and why we are setting it without going through
>> git-blame. No need for a re-roll, I think it is fine if you add this
>> when applying.
>>
>>> +#define SPINOR_REG_CYPRESS_CFR5_DDR            BIT(1)
>>> +#define SPINOR_REG_CYPRESS_CFR5_OPI            BIT(0)
>>> +#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN                            \
>>> +       (SPINOR_REG_CYPRESS_CFR5_BIT6 | SPINOR_REG_CYPRESS_CFR5_DDR |   \
>>> +        SPINOR_REG_CYPRESS_CFR5_OPI)
>>> +#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS    SPINOR_REG_CYPRESS_CFR5_BIT6
>> I would say don't fix what isn't broken. But if you do, test it. Do you
>> or Takahiro have a Cypress S28* flash to test this change on? If no,
>> then perhaps Dhruva can help here since TI uses this flash on a bunch of
>> their boards?
>>
>> The change looks fine to me with the above comment added, I just would
>> like someone to test it once.
> Tested OSPI_S_FUNC_DD_RW_ERASESIZE_UBIFS from ltp-ddt and test seemed to pass on my
> AM625 SK EVM having an OSPI NOR S28HS512T Flash.

Thanks.

BTW, one interesting bit about this in case you didn't know already.
Since this is playing with Octal DTR enable/disable, you might also want
to double-check you are actually using Octal DTR mode. This can be done
by looking at the SPI NOR debugfs entry (usually in
/sys/kernel/debug/spi-nor). You can "cat params" and see what protocols
are being used, and make sure 8D-8D-8D is being used.

AM625 SK _should_ be using 8D-8D-8D mode already, but I think it is
useful if you know how to confirm this assumption :-)

>>
>> Reviewed-by: Pratyush Yadav <ptyadav@amazon.de>
> For this series,
>
> Tested-by: Dhruva Gole <d-gole@ti.com>
>
>>>  #define SPINOR_OP_CYPRESS_RD_FAST              0xee
>>>
>>>  /* Cypress SPI NOR flash operations. */

-- 
Regards,
Pratyush Yadav



Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
