Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742DDC71143
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Jun 2025 07:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N0SlnMhJVlVzRr2bDe0P+I8/W6hb8kUrTFf202Ss+AY=; b=ulzNYpkodPTmjG
	FOIQaLztUB9OoEbSzrhhc00eVhZcOjrdl68xaVg/tTGquhLYydgeoeYTGVplnCf/2idYHvWzj1IhL
	ba3apQdJ/mUbNYiYiRsdLIyZdjYVYm8Gr+mtNXlV1N7ZT1EnG8L1WMN22OvjidJcAhBylV3w1Vy8k
	tIi9Kb4qR/S+jolgWRKDiwTS4P9qpxyUMnd7Se70qqgvjWjfvS4H0X2nJyEQvHYQVOi8RhPd94Qg0
	F4Z09cWqLP/TAP7G+W+KEKelVWmeAeFehrekFm8tYM1RLnrnW72ZpDJZfIXBuZwdmBdfiDROYb0fk
	hpDh/B/xIDMVKgNjonRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPbzI-0000000COXE-2XdM;
	Thu, 12 Jun 2025 07:04:36 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPbyx-0000000COWE-3Bjf
	for linux-mtd@lists.infradead.org;
	Thu, 12 Jun 2025 07:04:16 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so1005860a12.0
        for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2025 00:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749711854; x=1750316654; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cVrksx/jDQRrCcgExDAxPHECjfjivgQza8wy1J6KkgU=;
        b=WjR5LKKjDhgx6aRzJ+PTlbc50cK+2lcgR1sJ9IiDrwRDA22iT5Mj6ZQT1fnoEn6Dpk
         xcl/07XR3rxBQPVWOHW9QO80skuGnARKR4iJQr7g99YFvgfPnCn5HaNJjy3MQOQDl6sF
         TGF/d8oBuESUtUmBF5as64/OGKXHQfWQdR2FxdOkgsptGpFBe1il7xvCYJVzsXxR18zM
         2ZjB9/YAdiBL+NHbazy8Wz0c9vlUthua34xRTcpB8qqpaMsxgXrg8GUcnubiUYaWDuFA
         AnL/WCLcG92OvsHxQt4TkXLczcYslXCOx0+xwFzyQeAyWvWRpI49/GrUZhHmy/t75y77
         t7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749711854; x=1750316654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cVrksx/jDQRrCcgExDAxPHECjfjivgQza8wy1J6KkgU=;
        b=pXSozIIL6zuhDSQxOYUm5FlGfPR5qtoqJkhrjEj2u4fXHmZYaoOwUtRXygod2KmkDr
         onM3kJDfRbrmZEyb7eh8E47ulqzAweY1xzrptSKSk1suukhbZyATx3bJV12Yi93SQeuG
         /bPHlahWAhR1QH379/9rRX8WGOwFQWc1wg/wGsJuYZEpHxxoGv0C2dpEQHX03MXZFFcp
         Csh+KSIHje+u5w7ZJkRUniGXLAkFX8/imlStQEkPN9Oj7NZ+lAHuFoJiTAoTENjT2oQ+
         6aUlzD5L1UrNre7m1lRuH7fZBvH4W1x7hAhQcLd4Fw7dSWvfIlr5xsiXw0p4iItAhOo8
         Xiew==
X-Forwarded-Encrypted: i=1; AJvYcCXjbcyRTwXojJSuliU0aaKvT1lr00QzcwkJud0T0TYVjIewZSwz6CD+DQf8QMX6/QBPnDov1IDUP24=@lists.infradead.org
X-Gm-Message-State: AOJu0YzTXDithBy9LkAsljwD35WK0qGNOVTKfwyoMwtQo5agN8/qritk
	jB6rVuhoD4YNJj1dJ4DYcqwNd7o6gMc4wQnyBZUjfOhB238ptJzSOeIR7WM8mLEiwqM=
X-Gm-Gg: ASbGncsvCnCKoeSfk1dPx6wiyrZeSutN9PBjwaaYUnP/96jbJJpbBXBT2f8d/hAegj+
	Y9C1gvk819PLp3C+1q5MGhXKR4h+cgcn76Dkj5GbAKnDIBVrog7e9cvbcBGIh41EG0jFnQWDB6j
	a0uWsQrJZZoFmirK3LYPjF18j4Cd1r7EeMZvKxN67j5ZNDe4eit+AGP0DoMGP8X0kvRUSpNjfhi
	owAevv0QiJpuZFrNrA0PK1Givl9wnBwQbo01obWn7d2QIAlRlfrdEbM/4RktUJx+MXeiOvpDwwy
	TKnrwahK7FnnmnwrMoGC7b41chLCe/2kijzoayWhM+zYX5AwtZTMnQoygDrPq9DO9Iw+9Mz7
X-Google-Smtp-Source: AGHT+IHmgu6xTR1U5od+qd7oyY666F4V+r3PulfiQSr8kUlv1IbjL6V5Xi0gsgYRvEO6WtZVnoGqvA==
X-Received: by 2002:a17:907:868b:b0:ad8:a329:b4a9 with SMTP id a640c23a62f3a-adea92b2c84mr201937066b.25.1749711850565;
        Thu, 12 Jun 2025 00:04:10 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adead8dc1e2sm85404066b.58.2025.06.12.00.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 00:04:10 -0700 (PDT)
Message-ID: <b00fb746-b4c6-4a84-90f3-700ab77fb335@linaro.org>
Date: Thu, 12 Jun 2025 08:04:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: spansion: Fixup params->set_4byte_addr_mode
 for SEMPER
To: Takahiro Kuwano <tkuw584924@gmail.com>, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20250605085535.17963-1-Takahiro.Kuwano@infineon.com>
 <0b0cc45f-e6c0-4020-9324-758cb815400b@linaro.org>
 <c1088cb5-2f12-4dd1-b3cd-42e4709ef05d@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <c1088cb5-2f12-4dd1-b3cd-42e4709ef05d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_000415_811738_29147FE2 
X-CRM114-Status: GOOD (  13.66  )
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



On 6/12/25 8:01 AM, Takahiro Kuwano wrote:
> On 6/10/2025 12:19 AM, Tudor Ambarus wrote:
>> Hi, Takahiro,
>>
>> On 6/5/25 9:55 AM, tkuw584924@gmail.com wrote:
>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>
>>> Infineon SEMPER flash family does not support E9h opcode as Exit 4-byte
>>> mode (EX4B). Therefore, params->set_4byte_addr_mode is not determined by
>>> BFPT parse. Fixup it up by introducing vendor specific EX4B opcode (B8h)
>>> and function.
>>>
>>> Fixes: c87c9b11c53ce ("mtd: spi-nor: spansion: Determine current address mode")
>>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>> ---
>>>  drivers/mtd/spi-nor/spansion.c | 29 +++++++++++++++++++++++++++++
>>>  1 file changed, 29 insertions(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>>> index bf08dbf5e742..9162b9297ce8 100644
>>> --- a/drivers/mtd/spi-nor/spansion.c
>>> +++ b/drivers/mtd/spi-nor/spansion.c
>>> @@ -17,6 +17,7 @@
>>>  
>>>  #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
>>>  #define SPINOR_OP_CLPEF		0x82	/* Clear program/erase failure flags */
>>> +#define SPINOR_OP_CYPRESS_EX4B	0xB8	/* Exit 4-byte address mode */
>>>  #define SPINOR_OP_CYPRESS_DIE_ERASE		0x61	/* Chip (die) erase */
>>>  #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
>>>  #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
>>> @@ -58,6 +59,13 @@
>>>  		   SPI_MEM_OP_DUMMY(ndummy, 0),				\
>>>  		   SPI_MEM_OP_DATA_IN(1, buf, 0))
>>>  
>>> +#define CYPRESS_NOR_EN4B_EX4B_OP(enable)				\
>>> +	SPI_MEM_OP(SPI_MEM_OP_CMD(enable ? SPINOR_OP_EN4B :		\
>>> +					   SPINOR_OP_CYPRESS_EX4B, 0),	\
>>
>> I wonder if it would make sense to have per vendor opcodes. Updating the
>> set_4byte_addr_mode() method wouldn't be needed in this case, you would
>> just need to use some nor->vendor->ops->ex4b opcode, right?
>>
> Do you mean introducing new vendor opcodes structure into nor or
> nor->params?

something like that. Maybe not right now, but something to have in mind
if we keep seeing vendor specific opcodes that are different than the
usual (BFPT-described?) ones.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
