Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64876C7EE29
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 14:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+bkppL6WGRMoe9WVn29svr1FWq5oIY8z8Id6Z3YCEcM=; b=4tuGDlMHPcurlJ
	5jDu6ASjNJ4XonEDAFkYFkPIskLDHQp/tps2jLtbc9V++nqRexnQMulGGvKKT5zhbzWmQFbTOXJDG
	ET9uToSAbHAONQTw7vfmnlfVva/nfG5LPnddVKlMmjjs9C4GoYGpyTPE89al1BvUHo4Ra955Z0sVB
	L2FVQQmB5cvobKFOw2CfyzPX/u4XX0QW5CrPPYAfjVgdeFqL+pEx7fS3u6jZ5Yrpie6vHKh6eqBWg
	09nQTzlEH5teOQ+IxlgWxWpkNSHx2KaUDVHrnOrcwrQlWXoz9zo4wpJbk/OtbhOD+28TlBZgogWyK
	2eTaXI/gmZvY4mKIEJFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6ucX-006KXY-1v;
	Wed, 07 Jun 2023 14:58:45 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6ucT-006KUL-1p
	for linux-mtd@lists.infradead.org;
	Wed, 07 Jun 2023 14:58:44 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-973f78329e3so1214730366b.3
        for <linux-mtd@lists.infradead.org>; Wed, 07 Jun 2023 07:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686149913; x=1688741913;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gJjTaZ/9cZA9GnMjrlFxN0BcpW9ecqXexzGH0t5m7pg=;
        b=QZtp60wD+75gS8sutSysW1Gt5v97dtcxNep2QtjO8YjTnwodJlOnvSVKHI9xa8kYtr
         DLvw+vYLWItGs39/ssYBe6cGf3k1K86bMckozzamLHDw8So1t81h1NuirKkpAACPOosL
         3+IHpGoghgtv+K5fQNtJMk7KRb4NZrlVVeqDpDQiCwF45+OQdMYsf18vErJE0e4+o1qq
         +99a7XbNwoEjshZltQVZbDB+bVs9ZuRjhEHU2xfzruJb/OMmzhUEsY87IASFlbxxnmPQ
         tw3V+IR8IPYE4cTPSTNj+nmOoeuyIlRwASCc5eLMnhlRt6OyFR80XImfkn/TJ8UHOLtw
         ebXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686149913; x=1688741913;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gJjTaZ/9cZA9GnMjrlFxN0BcpW9ecqXexzGH0t5m7pg=;
        b=O7BgcV5uGBLqQfAxx7mU2o/FqcUdWcSTzINQ9Odz1+r0wNUgksnlP7fJyKGCj6QPJR
         tdLB9xY2/mTfHOcmbvW0JhT3MvQWsKjtCoOPRvJY+gqM7Jht5rFVKaW+mmjcWPqqfkak
         fXyHJF/Mq90mr2hsOuQ7lWvCLg6aw7YVkerruFUaBDiR8XS/NDTAJ4gyJhJ2wJFNv3B3
         1IV37PnNBGHQX8kJxH3OrE8J8df4CKtir9ImHParyXQE3+ZErN/D9676VdqlkPZp6ish
         aYOwRMflJL99HY5RK1Iw0TYJRqjxyBVCKX1SFx6Yj0aeNR9fOpiNMR21KX05lnuW4YZ8
         tjEA==
X-Gm-Message-State: AC+VfDwP0f3Usj/R3tnlJCwyxPrT0M4q0zbv2/E42ukWZ7qhTM+V+Nf6
	KLsTYDAjNd9EWTikSnJTxCe+1g==
X-Google-Smtp-Source: ACHHUZ6wzBYezPQx+NTgUt4QVORBO0tD9ssE0IbCfRYurBIDs8W2LBeRt9iNG8JBmBTHHs8zUMPPHA==
X-Received: by 2002:a17:907:1c17:b0:971:2ead:e161 with SMTP id nc23-20020a1709071c1700b009712eade161mr6874357ejc.6.1686149912938;
        Wed, 07 Jun 2023 07:58:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id bv13-20020a170906b1cd00b00978743b54bdsm1822713ejb.78.2023.06.07.07.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 07:58:32 -0700 (PDT)
Message-ID: <9105207b-0dfb-346f-422f-984cf3454f90@linaro.org>
Date: Wed, 7 Jun 2023 16:58:30 +0200
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6c1973d1-38c0-6048-90ad-da2f60df8238@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_075841_603914_457759B8 
X-CRM114-Status: GOOD (  16.62  )
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

On 07/06/2023 16:52, Arseniy Krasnov wrote:
> 
> 
> On 07.06.2023 12:36, Miquel Raynal wrote:
>> Hi Arseniy,
>>
>> avkrasnov@sberdevices.ru wrote on Wed, 7 Jun 2023 12:04:29 +0300:
>>
>>> On 07.06.2023 12:08, Krzysztof Kozlowski wrote:
>>>> On 07/06/2023 10:57, Arseniy Krasnov wrote:  
>>>>>
>>>>>
>>>>> On 07.06.2023 11:53, Krzysztof Kozlowski wrote:  
>>>>>> On 07/06/2023 10:40, Arseniy Krasnov wrote:  
>>>>>>> Hello Miquel, 
>>>>>>>
>>>>>>> On 07.06.2023 10:58, Miquel Raynal wrote:
>>>>>>>  
>>>>>>>> Hi Arseniy,
>>>>>>>>
>>>>>>>> AVKrasnov@sberdevices.ru wrote on Tue, 6 Jun 2023 22:35:07 +0300:
>>>>>>>>  
>>>>>>>>> Add description of 'nand-rb' property. Use "Fixes" because this property
>>>>>>>>> must be supported since the beginning. For this controller 'nand-rb' is
>>>>>>>>> stored in the controller node (not in chip), because it has only single
>>>>>>>>> r/b wire for all chips.  
>>>>>>>>
>>>>>>>> Sorry if I mislead you in the first place, but you could definitely
>>>>>>>> have two chips and only one with RB wired. It needs to be defined in
>>>>>>>> the chips.  
>>>>>>>
>>>>>>> Ok, so to clarify: is it ok, that in bindings this property will be placed in the
>>>>>>> chip, but in driver, i'm trying to read it from the controller node (thus  in
>>>>>>> dts file it will be also in controller node)?  
>>
>> The bindings and your driver internal representation are two different
>> things. Anyway, as mentioned above, wiring the RB line to one die and
>> not the other would be valid hardware design and would require the rb
>> property to be in the chip node. Please perform a per-chip property read
>> in the driver as well.
> 
> Done, I resend both patches (bindings + driver update) as a single patchset. Your review comments
> for driver code were also fixed.

No, please send new version, not the same. New version means with fixed
comments and with patch changelog.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
