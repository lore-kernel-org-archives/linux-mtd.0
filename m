Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C829C678DC
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 10:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TAYb2pnPmK/aYkZ/ZMXTbdKa01QFLiG9GsclsxeU2IE=; b=DmNnAYF96D+u6R
	eh8eOCTdmXsLYY8wjhpGpjRxULiqbCQiIuXZP5z/G5sPak4krIhN/ghmpwV3hx+zoD+PHc2JbCr7C
	YlwcrO8ojJctgCVLqofc6O7McGviDhLWkFyq/HKIypHBG8emws44Zl5i+Ptk8HVzTGFuE6GPwQt18
	qi2MsuXVihYxwYdXhRDF7iNIMcVMjVNA/mxy0B5cTXdR5RKtyqqKOLPM8YwYFumft8K5bUwS0fSMi
	ADiheIecixn+EXMWloMmu7ZhO/B6SlGWxuHbC+PnglB0nv1MHM/f/yn1TL9tvZmiPotgbd5wmsN7q
	s8uPSDLZHdeD5G4tyhcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWwNl-008BTA-1H;
	Fri, 18 Aug 2023 10:07:05 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWwNi-008BS9-13
	for linux-mtd@lists.infradead.org;
	Fri, 18 Aug 2023 10:07:03 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso92050366b.1
        for <linux-mtd@lists.infradead.org>; Fri, 18 Aug 2023 03:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692353219; x=1692958019;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NRPn7DVJy1IzT1J4y0QSoIJ53dNaOjnAATCxnZANpH8=;
        b=BYoG3l+xTLT+cKgggpsRpzQX5a9bTEBVIl8/DRDjwbcvzN1rlymOq9sz5onzjeg/I3
         9rivSujoQi9QIloUA7oKL7CLIp61qSES6itf2PAOt/VYU/Z417tZOnhMl/pbQzsRw7+6
         9zek04RAxD4HWsRE+aPqI99lGWQJwowo0uVvnbuo4JPzTKLwhNf4uBAHOahhYtMCBxfh
         0Vn+YWTtvEE283Lf/vzykG9Jk87tVVvLG6EI7tzIwV+NVweJC80d7bjq/VnGyFEvXi0h
         L//ZdJ4QnGgci4xDjN/w8oJzKJFhSxWjn1HPL8XMg3uw1urBcACFqDcKTtN9sm7p6tev
         H13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692353219; x=1692958019;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NRPn7DVJy1IzT1J4y0QSoIJ53dNaOjnAATCxnZANpH8=;
        b=GqcHATS1UBZuYzvqBFW3QiTSxO0Soaf0cTpY7syHAjclcCNpQoj6DG/4W6ZqNKy+pP
         /dUbiAp3ORlaerZhem1sQEaeV9znybqi7fGQxn9k4tb+bT+umdik9W4oAt4cZgiJzOI1
         z6pPbcMPT+PHo9gsDJW6SKgT+S8copYBXa53CxS8kEc0enVBVW0W+YNQFGB8AkJyjNhM
         v1THOknLIT7xmd7QEHX+hxTSOTPGctdwo7Cfn2c5Nkw+MprXj9iZiZNiyT9bP/mNqpcm
         KBuaq0LeEI3LxjrzHJKNuNLqzbmP/2h1acJCeBi2Poi7GJoPxhG6OLTrk6cjTYVKJOj+
         KKaw==
X-Gm-Message-State: AOJu0YxUlQaEezhGYXKJzvsZbTIJh/pSAoYD8DmC8vpKEPCWmiDpgbn2
	uhIXZPQUctL0TmFQEpRmvJ7UFb5BCA41eYhAbkQ=
X-Google-Smtp-Source: AGHT+IHTsshkSJ0xmBldAGBHtsiWsEVqENyMKZHmNdAiSiRA+fdGOAJ3IAVaKNh5K2ePQNJ5m2QWMw==
X-Received: by 2002:a17:906:150:b0:99d:ddae:f75e with SMTP id 16-20020a170906015000b0099dddaef75emr1647793ejh.57.1692353219125;
        Fri, 18 Aug 2023 03:06:59 -0700 (PDT)
Received: from [192.168.0.173] ([79.115.63.195])
        by smtp.gmail.com with ESMTPSA id lg5-20020a170906f88500b009937dbabbd5sm985810ejb.220.2023.08.18.03.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Aug 2023 03:06:58 -0700 (PDT)
Message-ID: <d3707bc2-0163-5be3-0031-e27835da6012@linaro.org>
Date: Fri, 18 Aug 2023 13:06:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4] mtd: spi-nor: Add support for sst26vf032b flash
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Michael Walle <michael@walle.cc>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>,
 linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230808075001.223150-1-miquel.raynal@bootlin.com>
 <e618ba6c48d67469b9a2c19ee8bb5a1c@walle.cc> <20230808102401.26631155@xps-13>
 <b2153d9bc6be2923f38a170afd82ba6f@walle.cc> <20230808173059.5fbea615@xps-13>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <20230808173059.5fbea615@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_030702_381132_969CB355 
X-CRM114-Status: GOOD (  16.51  )
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



On 08.08.2023 18:30, Miquel Raynal wrote:
> Hi Michael,
> 
> michael@walle.cc wrote on Tue, 08 Aug 2023 10:35:08 +0200:
> 
>> Hi,
>>
>>>> Mhh, this flash has vendor tables. The sst26vf global unlock should
>>>> be discoverable. There is a table with all supported opcodes, which
>>>> could be used to see whether this flash needs the global unlock.  
>>>
>>> Is this logic already existing in the core?  
>>
>> No unfortunately not.
>>
>>> Do you have a pointer?  
>>
>> It seems that we'd need to have some kind of parser support for
>> vendor specific SFPD tables. Then look for the sst25vf family
>> and the availability of the global unlock command, if both is
>> satisfied, set the locking ops.
> 
> Do you mind if we actually take that one which, on this regard should
> be absolutely identical to the existing 64b entry?
> 
> If one ever brings the logic you described I'll be pleased to test it
> as long as I have the board.
> 

I'm fine with it. For the moment these entries are not supper annoying
to maintain, but would be great if we use as much of the vendor tables
in the future if possible.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
