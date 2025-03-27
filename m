Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B81C3600E
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Mar 2025 10:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ls4214EHxdGHkK09dRFxqa0foZ09stpV0IirEkIfY6s=; b=2C1iiYV68AUpSN
	w1qgria8c/4CsAXpe/sMqk+uh48a+kLg76c0igGM2xhegvAkEqO2JrzHjxTfgqI51VG/GD7/x4Pw9
	r3gZVWDv2Eg39FFFaWxzmGZM5DljXeNKncFjIhW2vtZSfYo+psvg6TxZfd7nQVz7tv4vpW537OwUs
	J4VlJ/uPNfpJvma7LNqSJPDaD1c9qmQyuTbklHDZIYcGN5YlU8X49y+p0d/o0mrjcXb+Nf1gJcl88
	21eDUWV9BhlfNGn0KzuY18V08Nz1nTGKdWSuLHEBzm5/MPqwE5hYFRbY79bM0N4CatItW7FRg7Lg6
	hNSWMeR60sRjI8YrqVLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txkiV-0000000AjX9-2D7r;
	Thu, 27 Mar 2025 10:44:07 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txkiS-0000000AjWd-2THN
	for linux-mtd@lists.infradead.org;
	Thu, 27 Mar 2025 10:44:05 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-227d6b530d8so15651635ad.3
        for <linux-mtd@lists.infradead.org>; Thu, 27 Mar 2025 03:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743072243; x=1743677043; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uTJyz617q7cxczcoiG5Izuzs8qnkruFS6Mj8VArUtXY=;
        b=bv4C7l5Dez5fJKpBN6ucR/UzyKAOe07Hlt3hM4L/AiCjfT1yncg1i3CjFee3CAsayz
         KqvUjQRPjLaeNOxF7S6zidLDRr7exdSooHIOelaAs70v2fwQfPmqpytKvjEG3vSNVu1e
         IJl8sHorVQBqizX3/wuI3NB+vtTo+HMuvv+14pIXJGKF3spo/CrUChbIALEf7/GbN+cS
         BgdeyAFP5oTIFOUjAfIbCLLAheOXn+auwQrs0XpXHONz2KYIpON8A3/cT6NDyOLTTKza
         FHeUJDhC/FEah9lJwEisPC4Gdixlm65L1Z05hk/8lnoREM8f3QBZ001kTfONSV3noOaY
         5VzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743072243; x=1743677043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uTJyz617q7cxczcoiG5Izuzs8qnkruFS6Mj8VArUtXY=;
        b=KZQiJeBjRDVSdZz1lf3C9hLdvm902MKXQ3Z3qeyb2sfegbRhLyVEKea0HNKdE2n1hw
         HR864++wUIdzCkwZRlP70F7L0gV6jejlIr5/UID9LttW8OiwBu8/P4admCFkitfdpVFQ
         aAdz+1WQLFs1BBJlVTGiBH/7qJFVhRPyWKM9gqRdnX+IEUqVxipSKYahbQxCBm5XhZRU
         rxCs/Y2oantrVx8XwnZPrShtd+SmbWlEW0pZ4XHIUsYieVTk48TC0T48MQT2IEXAZbc1
         TRwytyGD3zRzfmolKSSTmJYIhwtAS+nuGidewNEHLUwPIcq/JvV1ZEKxf9y0mx5D8xmu
         4X5g==
X-Forwarded-Encrypted: i=1; AJvYcCVyWoj5GZtRlAf9JoK7d13WYm/izvHGW5vFCJ3Er9mtnG6BfjUFkD968KjlKOVhgIiqRRsgsJfJ59Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YyXriMUn1QAJRzb9j+1wb3cjMgZnCMIR2Y2gmnpEW5YnVAIEtP1
	aRnYBY3EqvJN5+Zn1rApDS6LnhFCkKCJL24AN9TAmhqVbMtNxe2oC/NmRA==
X-Gm-Gg: ASbGncsel8fTBT3AHhkDKCVw1DI8pSjKorKzNpaakiFHcCIb7AgeJsxss78mrA/xcud
	x+28MfBRxfjtP6MpJzoJKVuXE5YQFSeYmT5TrOo94iPorhZzaGqpPeAoFS3wnjuEkybTH0GTyYB
	NUAZgzk9gTujQVEufcYcVUDNZGYTMnwl67zJ9Ym7J+3zEgiyp0FiJPyB1qsvFM+JvcSvm7VjZf5
	vDBtPp45Ej+upXS/Xl9Xu0VnHYqbgx4Y18YrQVtjwpaGiXf89dMGHPukys02B3exgmAwaRkgMyA
	+QOdc9uRcxuAL7SgSSU/XkcW1ehIKbAErXAILtvKq3spCTRDE1nbImC2u/Na6Zvxbx5C8Q+x3GQ
	+1gJd3XN/4rq/5Tb7hx2G
X-Google-Smtp-Source: AGHT+IHq/Y6uC/Z00BLfu9Yma5EAHMzO0zuQt7fcToR0/FheLKLnTEahpmMne9PLwBs+vl8u3GLHEA==
X-Received: by 2002:a05:6a20:4389:b0:1ee:dcd3:80d7 with SMTP id adf61e73a8af0-1fea2c2a320mr6373055637.0.1743072242982;
        Thu, 27 Mar 2025 03:44:02 -0700 (PDT)
Received: from [192.168.0.11] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a282be07sm12565149a12.34.2025.03.27.03.43.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 03:44:02 -0700 (PDT)
Message-ID: <e1baa67a-d62a-477f-9ccd-83cc2dae501a@gmail.com>
Date: Thu, 27 Mar 2025 19:43:57 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mtd: spi-nor: use rdid-dummy-ncycles DT property
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Michael Walle <mwalle@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bacem Daassi <Bacem.Daassi@infineon.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
 Mark Brown <broonie@kernel.org>
References: <20250319-snor-rdid-dummy-ncycles-v1-0-fbf64e4c226a@infineon.com>
 <20250319-snor-rdid-dummy-ncycles-v1-2-fbf64e4c226a@infineon.com>
 <20250319233024.GA2625856-robh@kernel.org>
 <a3818477-5a67-43ad-8961-88fa02916968@linaro.org>
 <CAL_JsqKtz5+R1kjEzjo6bVicOX2c=UauC0_STAF0T02rSDqO+w@mail.gmail.com>
 <50de19f7-2021-433e-b8f8-d928ed7d5d57@linaro.org>
 <D8LSAUU0358V.2H1D7QXB9WBOF@kernel.org>
 <be8e5758-8f85-4476-b6c0-4400c8151cbe@linaro.org>
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <be8e5758-8f85-4476-b6c0-4400c8151cbe@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_034404_649053_699E7E5B 
X-CRM114-Status: GOOD (  27.45  )
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

On 3/26/2025 11:44 PM, Tudor Ambarus wrote:
> Hi, Michael,
> 
> Sorry, I somehow missed your replies.
> 
> On 3/21/25 8:00 AM, Michael Walle wrote:
> 
> cut
> 
>>>>> The
>>>>> problem that I see with that is that we no longer bind against the
>>>>> generic jedec,spi-nor compatible, so people need to update their DT in
>>>>> case they use/plug-in a different flash on their board.
>>>>
>>>> This chip is clearly *not* compatible with a generic chip.
>>>
>>> I think it is compatible. The chip defines the SFDP (serial flash
>>> discoverable parameters) tables. At probe time we parse those tables and
>>> initialize the flash based on them.
>>
>> I disagree. It's not compatible with "jedec,spi-nor", which is
>> defined as
>>
> 
> cut
> 
>>
>> See my first reply, on how to possibly fix this mess (new
>> compatible if accepted, just use RDSFDP sequence which is backed by
>> the standard and do some fingerprinting).
>>
> 
> this won't work unless there's a unique parameter or ID in the sfdp or
> vendors tables, which I doubt. Takahiro to confirm.
> 
No, cyrs17b doesn't have it.

>> FWIW, a new (or rather different) compatible is needed because we
>> cannot distinguish between random data returned during the dummy
>> cycles and a proper manufacturer id. So there is no way we could fix
>> this in the core itself.
> 
> Yes, I agree, new compatible it is then.
> 
> cut
> 
>>> I think the property vs compatible decision resumes at whether we
>>> consider that the dummy cycles requirement for Read ID is/will be
>>> generic or not.
>>
>> It is not generic. Because it will break autodetection. And that is
>> the whole purpose of this. Adding that property means, we can just
>> autodetect flashes within this 'group'. And personally, I think this
>> is a bad precedent.
>>
> 
> yes, I agree.
> 
>>> I noticed that with higher frequencies or protocol modes (e.g, octal
>>> DTR), flashes tend to require more dummy cycles. I think with time,
>>> we'll have more flashes with such requirement. Takahiro can jump in and
>>> tell if it's already the case with IFX.
>>
>> But hopefully not with RDID. Again this doesn't play nice with other
>> flashes (or all flashes for now). Instead of adding random delay
>> cycles one should rather define a max clock speed for this opcode.
> 
> This could work, yes. But not for this flash. Or maybe encourage vendors
> to either contribute and enlarge the SFDP database or define their own
> vendor tables for all the flash properties that are not covered yet.
> It's strange how Block Protection is not yet covered by SFDP after all
> these years.
> 
> Thanks,
> ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
