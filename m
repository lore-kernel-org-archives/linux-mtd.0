Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB09C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Dec 2023 07:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CtwzkAkgtD3r8SrKn2lSj8Q0r8lVrw5B9IBcJrVmWew=; b=ISLGrGiI+ha/pq
	uSRS+VykPvaHa1pyn6LMAGtc8sslChWArVP5OnkM7Z1wa77uN19d/IiwOH1Bx0g+/ldZGtGdLZ8J5
	7hb7n956jmwxhULR+PfWFhtEgdDX0vwmRD0vEX3dMDSJiDIywyC6aoN+nO9nFvCranoP6xd8h8KxO
	voUqP0tYPppXK19ei6o5qp8srLEtKsNXQAn4zcG1O2yUZY8BbiQwrOWEK7axR1NdKgNGQFsn3SGtQ
	ktmNExWJrTnAFTf9ON9hgZihPkOIkQzmcqb024aippN9O2ZFOj5iO/kEm8eil5jxZUwfKFG63KZ3V
	LUbra8e4C0UMR6zJp4GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE2Ni-002GNq-09;
	Fri, 15 Dec 2023 07:13:10 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE2Ne-002GMy-1S
	for linux-mtd@lists.infradead.org;
	Fri, 15 Dec 2023 07:13:08 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40c6d5d8085so187305e9.3
        for <linux-mtd@lists.infradead.org>; Thu, 14 Dec 2023 23:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702624381; x=1703229181; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ajTdCJMKgixA/TMnGJqOsnKjF3dyteyJa0OdZeM21GI=;
        b=rcNzC3hwU+7qp5r1I2maBVelBLI63qXHOBAhPzSUrk8dyT1xTAw2IBvuqSxttsHdTC
         ZYABZdwbaEX/pvigjMJhlYWMcluUWtSUcyQU2q9J7zXDyWA9biznj4pU8WBhkqEn4wpB
         Mb1SbmP2xwKcZ9VKnTqCFVFIKKv0/S5oJzLURYec6ob6zULJJFAzu8Waq7hkKWTey9A4
         lp/ZiNupJDao3+flqjnU7C++oGj9HmB3cBzVsxTl4tzVGGG/CxDD9+nEsx05U0tx766K
         s3xgikMlJ+m2va6mmh8f6m3WY6Ig2jUCDocEoKb6E5HykRgLg2GMYyRRtUUbrbdAVUNO
         hvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702624381; x=1703229181;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ajTdCJMKgixA/TMnGJqOsnKjF3dyteyJa0OdZeM21GI=;
        b=jVbJYGzW2+gAc046urBdlKASll2hBz7fliffbta0nmlyBg9N0cHuO0MAnuU1L0iEks
         R0gDUKBWsrqYbrP3e3b7Kjhdh5Us5LAN4xJzlcrwnWNFgu5JyXSPyEHm+xl41k+A4RHv
         noP9qHN7bdItgUO4rcb8+ocKb2bzXfbprseiOr239lAkolCdYa5MSu6Pzm3BmpXuzgfB
         ld7QhqlYUGlEwj9pSW3UjX9bwDygtg7vuJdkTr7zTcTM0IDlwcpmFdiIm4js46yg3FSH
         /F8pY32vgeAKV74Z3YjLoeVz8m/s9op9Y0cmsLziXnzVdDuvK4/hOaU0VnlVc1McAq0m
         jt/Q==
X-Gm-Message-State: AOJu0YzW8ec0VCI00wmtOQC8x2D/sRIBs4YyFUPz5A4/ROK9jQmrvmcm
	sh8sQ9H58toPSEqv/OhkztW0yQ==
X-Google-Smtp-Source: AGHT+IFYJfdtJBjHAihHOzk2EIeXwEcdbPPmaYk21b2SOL0GR4BqGFS6bKD4pu1WOQsBfoRC3V0cVA==
X-Received: by 2002:a05:600c:5022:b0:40c:3f87:32f8 with SMTP id n34-20020a05600c502200b0040c3f8732f8mr3489219wmr.277.1702624381241;
        Thu, 14 Dec 2023 23:13:01 -0800 (PST)
Received: from [192.168.2.173] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id o5-20020a05600c510500b0040c1d2c6331sm27964721wms.32.2023.12.14.23.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 23:13:00 -0800 (PST)
Message-ID: <4ee2ec06-f582-4cfa-aad4-d25e95c2ac23@linaro.org>
Date: Fri, 15 Dec 2023 09:12:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] mtd: spi-nor: sfdp: Get the 1-1-8 protocol from
 BFPT
Content-Language: en-US
To: liao jaime <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, pratyush@kernel.org, michael@walle.cc,
 miquel.raynal@bootlin.com, leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
References: <20231214073344.66644-1-jaimeliao.tw@gmail.com>
 <20231214073344.66644-2-jaimeliao.tw@gmail.com>
 <a55b1338-d15c-4d1c-8b81-0d7a3913ec0a@linaro.org>
 <CAAQoYRmCpYJNSZrriM1SbJvXGUjz=e8k8pRnB2cb-y4C=pHe8Q@mail.gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAAQoYRmCpYJNSZrriM1SbJvXGUjz=e8k8pRnB2cb-y4C=pHe8Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_231306_500357_3910B0D7 
X-CRM114-Status: GOOD (  19.79  )
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



On 15.12.2023 08:59, liao jaime wrote:
> Hi Tudor
> 

Hi!
> 
>>
>> Hi, Jaime,
>>
>> Please update the commit subject to indicate that you parse 4BAIT as well.
> Got it.
> 
>>
>> On 14.12.2023 09:33, Jaime Liao wrote:
>>> From: JaimeLiao <jaimeliao@mxic.com.tw>
>>>
>>> BFPT 17th DWORD contains the informations about 1-1-8,
>>
>> Please run checkpatch on further submissions:
>> ./scripts/checkpatch.pl --strict 000*
>> WARNING: 'informations' may be misspelled - perhaps 'information'?
>> #6:
>> BFPT 17th DWORD contains the informations about 1-1-8,
>>                              ^^^^^^^^^^^^
>>
>> total: 0 errors, 1 warnings, 0 checks, 46 lines checked
>>
>>
>>> Parse BFPT 17 DWORD instruction to determine
>>> whether flash support 1-1-8, and set its dummy cycle
>>> accordingly.
>>>
>>> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
>>> ---
>>>  drivers/mtd/spi-nor/sfdp.c | 13 ++++++++++++-
>>>  drivers/mtd/spi-nor/sfdp.h |  3 +++
>>>  2 files changed, 15 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
>>> index b3b11dfed789..c55f39978762 100644
>>> --- a/drivers/mtd/spi-nor/sfdp.c
>>> +++ b/drivers/mtd/spi-nor/sfdp.c
>>> @@ -446,6 +446,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>>>       u32 dword;
>>>       u16 half;
>>>       u8 erase_mask;
>>> +     u8 dummy, opcode;
>>>
>>>       /* JESD216 Basic Flash Parameter Table length is at least 9 DWORDs. */
>>>       if (bfpt_header->length < BFPT_DWORD_MAX_JESD216)
>>> @@ -525,7 +526,6 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>>>       for (i = 0; i < ARRAY_SIZE(sfdp_bfpt_erases); i++) {
>>>               const struct sfdp_bfpt_erase *er = &sfdp_bfpt_erases[i];
>>>               u32 erasesize;
>>> -             u8 opcode;
>>>
>>>               half = bfpt.dwords[er->dword] >> er->shift;
>>>               erasesize = half & 0xff;
>>> @@ -631,6 +631,16 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>>>       if (bfpt_header->length == BFPT_DWORD_MAX_JESD216B)
>>>               return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
>>>
>>> +     /* Parse 1-1-8 read instruction */
>>> +     opcode = FIELD_GET(BFPT_DWORD17_RD_1_1_8_CMD, bfpt.dwords[SFDP_DWORD(17)]);
>>> +     if (opcode) {
>>> +             dummy = FIELD_GET(BFPT_DWORD17_RD_1_1_8_DUMMY, bfpt.dwords[SFDP_DWORD(17)]);
>>> +             nor->params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_8;
>>> +             spi_nor_set_read_settings(&nor->params->reads[SNOR_CMD_READ_1_1_8],
>>> +                                       0, dummy, opcode,
>>> +                                       SNOR_PROTO_1_1_8);
>>> +     }
>>
>> You missed the mode clocks. You missed to parse 1-8-8. Please check how
>> the read settings are parsed and set in parse_bfpt() and do the same
>> here. See:
>> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/tree/drivers/mtd/spi-nor/sfdp.c?h=spi-nor/next#n502
> Macronix Flash didn't support 1-8-8 feature.
> So that I have no sample for validate it.

don't worry, add it anyway. Specify in the commit message that you
validated just 1-1-8.

> About read setting in parse_bfpt(), that is a good way for scan and
> set for each protocol.
> But 1-1-8 support judgement is not a single bit.

oh the horror. And then it becomes a single bit judgement in bfpt dword
21. Nice consistency :).

> 1-1-8 read instruction could determine wether 1-1-8 support or not.

Right. Then introduce a dedicated logic for these 2.

> 
>>
>>> +
>>>       /* 8D-8D-8D command extension. */
>>>       switch (bfpt.dwords[SFDP_DWORD(18)] & BFPT_DWORD18_CMD_EXT_MASK) {
>>>       case BFPT_DWORD18_CMD_EXT_REP:
>>> @@ -968,6 +978,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
>>>               { SNOR_HWCAPS_READ_1_1_1_DTR,   BIT(13) },
>>>               { SNOR_HWCAPS_READ_1_2_2_DTR,   BIT(14) },
>>>               { SNOR_HWCAPS_READ_1_4_4_DTR,   BIT(15) },
>>> +             { SNOR_HWCAPS_READ_1_1_8,       BIT(20) },
>>
>> let's set 1-8-8 as well please
>>
>>>       };
>>>       static const struct sfdp_4bait programs[] = {
>>>               { SNOR_HWCAPS_PP,               BIT(6) },
>>> diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
>>> index 6eb99e1cdd61..584a05f9931d 100644
>>> --- a/drivers/mtd/spi-nor/sfdp.h
>>> +++ b/drivers/mtd/spi-nor/sfdp.h
>>> @@ -118,6 +118,9 @@ struct sfdp_bfpt {
>>>       (BFPT_DWORD16_EN4B_EN4B | BFPT_DWORD16_EX4B_EX4B)
>>>  #define BFPT_DWORD16_SWRST_EN_RST            BIT(12)
>>>
>>> +#define BFPT_DWORD17_RD_1_1_8_CMD            GENMASK(31, 24)
>>> +#define BFPT_DWORD17_RD_1_1_8_DUMMY          GENMASK(20, 16)
>>> +
>>>  #define BFPT_DWORD18_CMD_EXT_MASK            GENMASK(30, 29)
>>>  #define BFPT_DWORD18_CMD_EXT_REP             (0x0UL << 29) /* Repeat */
>>>  #define BFPT_DWORD18_CMD_EXT_INV             (0x1UL << 29) /* Invert */
> 
> 
> Thanks
> Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
