Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5469FC77B7A
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 15:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uv2TILn1Qa72n57QG7HnZUHDBt++lBjZ/boNS9ydYqM=; b=GteyRQXzzpIHNk
	Up6zcY0dEPL6pbpz/iG7nv6/NT7+Hfo9B44vYnTEGd+3WukxgGtxfUx81GWcBgcuHhvfpZkQ5jaLt
	iq/mk3eB1pUXzbXTVZwpl3+AtL/S8w7pNithg73Mnl/Tt1NnShNH4uEyxYmhhxKbgr7Zb1x6nb4V9
	BP2SIPKZf0WcvYD9TaYy1XWHgJY+bOdQS1JFfck7uZ3plCFWjUp2QNLB3UhHltFbawZ7Zk4GfGm3e
	fqtkutwEpt0/sJq1U6DMWWs3IHRYkoXqFhICtrkd7GfRXziq6RXTZUwwmuEGvqKIjf7WMv2JCnFtY
	ClmbxsiGCl+1PhFTRWAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6ulO-006MLn-1N;
	Wed, 07 Jun 2023 15:07:54 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6ulK-006MJB-27
	for linux-mtd@lists.infradead.org;
	Wed, 07 Jun 2023 15:07:53 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9741caaf9d4so1109372066b.0
        for <linux-mtd@lists.infradead.org>; Wed, 07 Jun 2023 08:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686150467; x=1688742467;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3pEWmF5LkerK8vtfqr7UM8riIZv0wnrEgKW36Y8tAnE=;
        b=s/r+BIg8+uPRyororIUyKPf/P2dgCGgyWzqrSvh4HJRTsOQnt8ScwbYgXWWHRH7+kk
         xGokX5VMhVdZG9fWurcsMyYnqB66VE+dtxM5Wx2Zi22yqrqOVCYoS5UP64Fm7GXm6Yw5
         GxYE3/Z41SoVG5DZVRgSoot6lKgl5cpwBKT6HEYdhacqkf1PbDLiA4IFkdgRBcvk/OiG
         toipGCgcGCY9LqkpAd+RnPsdHtFtbIyqhAYti0bZFMb7WTbPhXX4jAmHpOBIRvGMt+Rx
         t39TfV0vfzY9/7JmsHu4HyeOEsUTlKWTbPmZFcEw6tOC5+PW7PTG1NN1/V0DQrUGubFL
         JoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686150467; x=1688742467;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3pEWmF5LkerK8vtfqr7UM8riIZv0wnrEgKW36Y8tAnE=;
        b=eGxQTuz6Bu81hDjO2+/5XFRL5LtTMZoyekHYKr0Rb2RjPvZHw2t9jQmdkgqJV/hZA5
         oMpCdlMn1KZkEA7nStt1pt9ArGMhBSKGfRGI4EAOhSssV/cfZtQhpRxU4KurMV/Oxuxq
         d52419yGvu6N6qxIbnNKUhi0SGQlWXPZ33e2Gmjtg9OGwZR8U8DHPB/q5LEKSewXnXn/
         /MxT/QOekim0sVXFTY7iRsI2fumsPU6ZlTl0/xaQUph7LF9mMguKWW8j8DsV8/2baOcz
         l32NeOc6Sqrzy6UYxCF7rxfDNgxA+MVUM6iDWflTeWIdEisKcFric25smQIV+fxd724M
         +weA==
X-Gm-Message-State: AC+VfDxB8jrIx3yanm5auYhVga76KYtXGRWZmBZmh1ry7RQPQHj/FB2x
	eVB5ozSKLs30rxfKwzaVkeu5iw==
X-Google-Smtp-Source: ACHHUZ6jNU3FR44kx1P4nQzUDhzkZwXyb6WTXFN9fPcxgb3oW7TCYQPqoPFf6j/hfLL4ghktHSV8Kw==
X-Received: by 2002:a17:907:7282:b0:96a:ee54:9f20 with SMTP id dt2-20020a170907728200b0096aee549f20mr6922708ejc.37.1686150466661;
        Wed, 07 Jun 2023 08:07:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id lt3-20020a170906fa8300b009788d8389e9sm281874ejb.169.2023.06.07.08.07.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 08:07:46 -0700 (PDT)
Message-ID: <88740a95-d7b0-e5d0-62db-65b41c66c5bc@linaro.org>
Date: Wed, 7 Jun 2023 17:07:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v1] dt-bindings: nand: meson: Fix 'nand-rb' property
Content-Language: en-US
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 oxffffaa@gmail.com, kernel@sberdevices.ru, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230606193507.35024-1-AVKrasnov@sberdevices.ru>
 <20230607095802.3adcd4f9@xps-13>
 <166bdc27-f77c-9076-f866-180cfa5bff76@sberdevices.ru>
 <08da4e86-433a-7d2e-25ff-ffa24221abdf@linaro.org>
 <835a3587-1e0f-64d7-1d1a-b639ae8b7307@sberdevices.ru>
 <2ca6e619-1d57-8fff-6176-9ee890e0d167@linaro.org>
 <5ca9eb2b-4bc8-5883-a029-3eeca905fe6e@sberdevices.ru>
 <20230607113605.50a992bb@xps-13>
 <6c1973d1-38c0-6048-90ad-da2f60df8238@sberdevices.ru>
 <9105207b-0dfb-346f-422f-984cf3454f90@linaro.org>
 <57ccf7ac-7d94-8a66-7a0e-abfe14f7df2c@sberdevices.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <57ccf7ac-7d94-8a66-7a0e-abfe14f7df2c@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_080750_696950_BD49745E 
X-CRM114-Status: GOOD (  12.10  )
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

On 07/06/2023 16:55, Arseniy Krasnov wrote:
>>>> The bindings and your driver internal representation are two different
>>>> things. Anyway, as mentioned above, wiring the RB line to one die and
>>>> not the other would be valid hardware design and would require the rb
>>>> property to be in the chip node. Please perform a per-chip property read
>>>> in the driver as well.
>>>
>>> Done, I resend both patches (bindings + driver update) as a single patchset. Your review comments
>>> for driver code were also fixed.
>>
>> No, please send new version, not the same. New version means with fixed
>> comments and with patch changelog.
> 
> Sorry, Yes, I mean new version, here it is:
> https://lore.kernel.org/linux-mtd/20230607145026.2899547-1-AVKrasnov@sberdevices.ru/
> 
> There I fixed bindings and tested it.

I still see v1 and there is no changelog. So it's the same?

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
