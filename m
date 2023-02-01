Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24A5C05027
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Feb 2023 07:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YR0ijZnT9jhJItxl8PGBmRhEhfXRxDUS1OC/p7qnNU8=; b=qfXCoBSquvaf1O
	beijjTY38SnCu/kscbzwlGIQRgqUu2we+/VK7R/mMxI4Pc2GFFlor4Apb4HhfTX3SA1xOIlRMfw5W
	0jhgAyypJs0B8eq2j9fXfoQCVtsDhSZnbKzq+q0OfyeGts0QysrpIccSeTYV4hu1KyvaEqBMWmnx2
	STS9nI+hY1w4LYwx1jEm6pt+6/qHwq9gQGv7sJ7P3DkJiFPrlWVJKujIrIoBjyzIMFdGEgCd4vYB6
	EwkjMj+9ilIIlXrADVZYJI1/7po47EaGFJTSk8qZhjgGF9tYTWX1WWHiv1wIReYgJzL98pN9OkS4r
	0x40HpX/7T/wZkA4vjHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN7KN-00AZqB-TK; Wed, 01 Feb 2023 07:14:43 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN7KK-00AZpO-PG
	for linux-mtd@lists.infradead.org; Wed, 01 Feb 2023 07:14:42 +0000
Received: by mail-pj1-x1034.google.com with SMTP id nm12-20020a17090b19cc00b0022c2155cc0bso1085228pjb.4
        for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2023 23:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R0g4NQe1aCHgCRTvEl02z86KS94f8ECDTiqslCJ76Lo=;
        b=YULnFVkEgbufS3L38Mpf7SDnHmMCfetj5/KjmgIKmRTuxlOpqYaBM2SfeMLHYl0OP8
         fFhc4SLcfe3MogXyMdUSPmSIrN7QrYlVy6HdtD8qpyxZlk/g2WdFv6IOE7XvG4bPrJYN
         fVsnXYqLRN7PXz2/P2O7R7zMdeYdZcrV4GoTzv+3zvAdmNLKw7a50Xs0P02ExSV1mM5G
         8EyZsDaJ71pkLi/W4jKih4GPxXe9JxRPHnxNzaySAP7lB7emK4/4gMg6zu07GlV7vi2/
         nB8+Jybf1zxkz5tVqk+sIXfCirmN9MJRX/MF0xO0r9bblKcBjQajQtpSezUGDC7RzWg8
         ybYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0g4NQe1aCHgCRTvEl02z86KS94f8ECDTiqslCJ76Lo=;
        b=adQpCCWEmi7eiZkGv9WQqLb2Luzx/k0KCjrY3a6zIxMZvm5g39gmHiVrm+s9JmZMzo
         GogoxUayANYaDTCOxxW6pr/P3r+7MFqgxA3kmVkc6px0wczAtJjKpggCunNeEaTFkmQK
         0a3AeDiiez9O9AJAPiNDzu6+KFnZZJcKEmL05cbU3UiMjf3iVG3mAzJQVzZQ0xaiW0FS
         T3m5eIvnmBhLXQepGxYpzlmBaj7A66MXb5JCud2vUBPFeMUulYg1TPbrM0pEhImIc+bo
         qXNkAHDO34gbtts65g2mrOgKPtZq3MrzWidf2jYv9Sv1hFks2KlASILHnU5nWeutsNey
         tVzw==
X-Gm-Message-State: AO0yUKX3SXy1KQxWxnMyKbH0G/B1o1/+yf1V6zli0shtn7JCvrL6/ypx
	r7sb3QkZyNd7zjzILpdczMg=
X-Google-Smtp-Source: AK7set+zX1I5Td1RK9VNQtrjF8E7cYW1MUA7eNsm8VbebFIOvlUVDRi+mpSspK9966f7RE8GqrVLrg==
X-Received: by 2002:a17:903:1108:b0:196:2124:c590 with SMTP id n8-20020a170903110800b001962124c590mr19429996plh.33.1675235677139;
        Tue, 31 Jan 2023 23:14:37 -0800 (PST)
Received: from [192.168.0.10] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id l16-20020a170903245000b0019896d29197sm2922480pls.46.2023.01.31.23.14.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 23:14:36 -0800 (PST)
Message-ID: <ac22752e-4251-b56b-bd86-06d7477d5565@gmail.com>
Date: Wed, 1 Feb 2023 16:14:33 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] mtd: spi-nor: spansion: Consider reserved bits in
 CFR5 register
To: Dhruva Gole <d-gole@ti.com>, Pratyush Yadav <ptyadav@amazon.de>,
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Takahiro.Kuwano@infineon.com, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, Bacem.Daassi@infineon.com, stable@vger.kernel.org
References: <493d9a10-aaf3-70f6-36c3-9a2cf39f0759@linaro.org>
 <20230110164703.83413-1-tudor.ambarus@linaro.org>
 <mafs0v8kxb9mb.fsf_-_@amazon.de>
 <e02d6aa5-2189-4afb-2521-6034feaa3460@ti.com>
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <e02d6aa5-2189-4afb-2521-6034feaa3460@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_231440_866564_E75EBDE4 
X-CRM114-Status: GOOD (  18.28  )
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

Hi Dhruva and Pratyush,

On 1/24/2023 1:31 AM, Dhruva Gole wrote:
> Hi Pratyush,
> 
> On 23/01/23 20:07, Pratyush Yadav wrote:
>> +Cc Dhruva
> I had already reviewed this, but now I have locally applied the patches,
> to linux master and built and tested - seems okay,
I had tested on my side as well. Sorry for the late reply.

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
>>
>> Reviewed-by: Pratyush Yadav <ptyadav@amazon.de>
> For this series,
> 
> Tested-by: Dhruva Gole <d-gole@ti.com>
> 
Thank you!

>>>  #define SPINOR_OP_CYPRESS_RD_FAST              0xee
>>>
>>>  /* Cypress SPI NOR flash operations. */
>>> --
>>> 2.34.1
>>>
>>>
> 
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
