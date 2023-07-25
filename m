Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64B6C0015E
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jul 2023 10:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=moqzuokr2J7fvU2XBZYIx0qKNsETK3xqqC5JcxMXd+8=; b=WFjyHQ4l2VGB19
	tqtJ6/WQHNUvVLAj0+hKfMVHOdcyAgmc3z8o1pptCxDrl6A70ShvEnVBSBA171nQq5gf26akTakS/
	32/LSXjioeNYZpkC+Vpnl8BPuBtMVqWqOl8cGDgt3KwhGlpzIFXTWFybO3wi8nAW0RurHhg3uANup
	GBIyRzkL4Xp2mpZkHASaHw+f2Li1gmrS4FyXxU9CfMWTwMcr4Cp+cthOyocMCmz5rDxR3vu65GRzU
	CdI3D6fQpjTx30H12h6BVuX6QnL4cjj1aC0pnJZEqbn7Xwh9wOp37eetJGbcr3bRVpTelGGNafKRE
	n236GrqMniZ8fqUtqEIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOFcW-007DdK-1C;
	Tue, 25 Jul 2023 10:50:24 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOFcT-007DZb-0l
	for linux-mtd@lists.infradead.org;
	Tue, 25 Jul 2023 10:50:22 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-991f956fb5aso794895466b.0
        for <linux-mtd@lists.infradead.org>; Tue, 25 Jul 2023 03:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690282217; x=1690887017;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g6DsjiXvYbcX2UeQHL5DRT8/VykSfWp8RfV6+hpR4TQ=;
        b=vPXEzKSFXTYbeakksMla4g9ApexNLigmHZEc4kAMcY2THWptzVIpyJCvslor/NJLqC
         dcGputVtmOOB6PZJ1B+Tdv99kNX2qTt/Jg54Vl0UGgEesM0PWqP+46YlyV2gBowD1X+z
         lIuDMNM7uaJMkLGMHYAqH/Uz/K66br7uyzZ5WCNOn038x0vYet6GtYquF+3zJgghB1mf
         3K+OUPZCvFcnn82+gFQVc0VZUVzSejXnz6c6gpxY2LCu4/OWCaAtqYXpMOiImc91MidC
         m7oA8G9TOGrO2njWA6DGg5vf9HSZwDXFaYWW7SFPed5gRS023bXhrX/uv9iwMmLOsPfB
         HxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690282217; x=1690887017;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g6DsjiXvYbcX2UeQHL5DRT8/VykSfWp8RfV6+hpR4TQ=;
        b=Ru/xfK480hl73HfUhs6KpW6Ijyumety2AGYknZurxKZI7BZ2w7WBAutcA20tHeCUmd
         qqTi34Ze67qDS/7eOrW5A05vrIbfIJdyU7RMoz+KHIwNXgg+VpQ7JzYrCaw6s9yJTFOV
         h0ZE4dKgXgcqQqdi2j0LXRc+8T0QfHNrkzJ+eY/kccbT+BUwjdllpBVkJLrgPokEDEbR
         8E/yR2Mwj+41tDgp3Pq0PuPY7b9fBe9ThMa9ozqRXusUzUIBMQ6RyghpxSYu+6fqwN5K
         yY53koSZbvUr9sL9lTShaNoD0qHvK6/01FyOYwA0A8T919O7TG8HFjbZCcEIge/t/2nR
         7xLw==
X-Gm-Message-State: ABy/qLYOlQz184BcR5HjBvnDdS+WyfIYvSVaBhWfyLeSSTlolGjqJqR6
	KsepDhh9sVB0q9ILIY9/zhsPUg==
X-Google-Smtp-Source: APBJJlFaiRa5eulZ3s9cbEaidKdAKggCXnOMUi0uBz+C+0HlXDkiMqLDSsfcBOvCmtNDYIHdvKLoSQ==
X-Received: by 2002:a17:906:283:b0:99b:b3a1:437b with SMTP id 3-20020a170906028300b0099bb3a1437bmr893419ejf.40.1690282217436;
        Tue, 25 Jul 2023 03:50:17 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id e13-20020a170906248d00b0099307a5c564sm8027512ejb.55.2023.07.25.03.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 03:50:16 -0700 (PDT)
Message-ID: <c8304bb6-7e53-3ee0-2fe0-104446e6f6b8@linaro.org>
Date: Tue, 25 Jul 2023 11:50:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 0/2] Add octal DTR support for Macronix flash
Content-Language: en-US
To: liao jaime <jaimeliao.tw@gmail.com>
Cc: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw
References: <20230725022302.210275-1-jaimeliao.tw@gmail.com>
 <15276c56-011c-1b55-d905-d0fbb822c4ef@linaro.org>
 <e2058fb379fb0b0d80b2b8c0d07c23ce@walle.cc>
 <be262828-b36b-1d2b-519c-c6951b063aac@linaro.org>
 <CAAQoYRkSoT4=g-YqTAdAbDckS=h1y9DuPXtHbE68_RQ5z2YBOw@mail.gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAAQoYRkSoT4=g-YqTAdAbDckS=h1y9DuPXtHbE68_RQ5z2YBOw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_035021_313829_C9D1F660 
X-CRM114-Status: GOOD (  18.52  )
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



On 7/25/23 10:25, liao jaime wrote:
> Hi Tudor
> 

Hi,

>>
>> On 7/25/23 09:28, Michael Walle wrote:
>>> Am 2023-07-25 10:01, schrieb Tudor Ambarus:
>>>> On 7/25/23 03:23, Jaime Liao wrote:
>>>>> From: JaimeLiao <jaimeliao.tw@gmail.com>
>>>>>
>>>>> This series add method for Macronix Octal DTR Eable/Disable
>>>>> and add Macronix Octal flash support.
>>>>
>>>> Do all these flashes swap the bytes in octal DTR mode? If yes,
>>>> you should add the infrastructure so that controllers can swap
>>>> the bytes back, otherwise you'll break bootloaders which work
>>>> in 1-1-1 mode, and breaking the boot chain is unacceptable.
> No, only parts of flashes.
> MX25UM51345G : flash without swap bytes in octal dtr mode
> MX25UM51245G : flash will swap bytes in octal dtr mode
> So that I hope flashes without swap the bytes can be support.

Flashes that don't swap bytes by default are ok with the current
support that exists in spimem. So please start with these first.

> And I will send new patch for mention flashes which swap the bytes
> in Octal DTR mode.

The flashes that swap bytes by default won't be accepted until we
figure out how to sync the configuration between the flash and the
SPI controller.
> 
>>>
>>> It might also be the SPI controller. Was the zynq SPI controller
>>> used before with octal flashes?
>>>
>>
>> No, it's the macronix flashes that swap the bytes by default. At least
>> the one which I've worked with few years ago. Some controllers can
>> swap the bytes back, but they have to be informed from mtd.
> Yes, it should inform mtd.
> 

mtd shall inform the SPI controller and agree on the configuration.
Maybe some bootloaders can use octal DTR and the swap is not needed
at the controller level, as some bootloaders may handle swapped data.
So it should be a configuration choice and a configuration agreement
between mtd and spi.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
