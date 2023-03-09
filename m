Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC37C64EC4
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Mar 2023 15:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OL+sqh2T8gjX8CJccCm9GaQRzELkyTcqf/LTemR06OY=; b=vip1CSCeq7m8ZN
	SxswbJthlAMsqTbblmrQQArlf9E7LARGRZQc98PP1j1sRLzUbDYE9nmqRQP1R6izG5dOkad9Sm9ER
	9U0uaxUt9MbnQLlZZnfSa5vDq7mVYvn/A4mppWCetoVBm7oTv0GfDbtfIOlTsed6tQGinv8PF9h6I
	ZP+OJJSGJOj5OdazXBKAg1ASONYgmyFfCE2zmhFSimJ57TVAkM+YXAu6AIo8fM7OOTLld3F1AlOS6
	qg1++XhxZ0qIpcG+zLpFTDBNjBTU4bH4Fqgm5Ug+w6RpCK07/qO8nmrFsOiq7T+9QiiOWO9JYR8gV
	24G5NDcDAdBasYFu+dYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paIdm-00B5JM-Ls; Thu, 09 Mar 2023 15:57:15 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paIOH-00Aydg-OU
	for linux-mtd@lists.infradead.org; Thu, 09 Mar 2023 15:41:17 +0000
Received: by mail-wm1-x333.google.com with SMTP id ay29-20020a05600c1e1d00b003e9f4c2b623so3904131wmb.3
        for <linux-mtd@lists.infradead.org>; Thu, 09 Mar 2023 07:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678376469;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=thHKQQTXmNqo7+agzCDK9DfO3aLKYlwKu3AriL3BjPg=;
        b=gJ2r1RFLFeBfkIT/MugmSb5mkRuueMrpeZW9ljS6WJwcDSNGf609jDWEGhUDaHEezx
         cZ2rzK8O84Ns9L3RtlsXsMJRPxISQd1EIm/PK9KtKi5sy/DnsXChGUZ+rDKG6diE8pR1
         bvqxe64DPNRU+Y3LVE795yrOjPTh/8LMBVj/AFkzsYU6KDhfcV18n1doWjxTyXqEyBrA
         xdb5EG61TWJtW1P5i7IQkl6EAZy5htVaEvuJJZhD92utvd6odYUZwwcIcRg7H2ZYWCkt
         sN8F8s+f/2dKAKUwUrpJ19SobSCbYCghvKAu424U1Jj7fh2YzZxH3g7DP6XiW1U2c1T/
         LT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678376469;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=thHKQQTXmNqo7+agzCDK9DfO3aLKYlwKu3AriL3BjPg=;
        b=65Hcq5lPWFevPihEZow9P6f/M85Y2CJ66Uq5OtaxQ/pPw860Wj75Dkx678Frh8V2Iu
         GxFTY3KzcDHCmIvaF/x1b6ARnMqWZPnvpYyNG6poFf2K2ywIkzxdaOrrDXOetFQ5NzsR
         HQELR8ui0HPkcfQPmW8VBtWujW3ZAoC3bGnO5E9CHUmtD3eIye0vT2x4V/Lmwc6m72NB
         qRD16p4/JoVxDCWFapAVZto3kZqTPDXyv+r6/jKSsxFp8hmV9rCwszo0fXN0tloC1ZYu
         VCHs17cokEdWqYEJOhKa3zoWavSucEsSNbuSXpRBdWvz8N0wOGCtb9e4domQoC2dZJkB
         UAQw==
X-Gm-Message-State: AO0yUKVUIwMI+IjJNgHj+jwZVIAACGHyxciHzx8tW34uBN1HTQ5ahgQr
	aOP9xULDpFVtBKnVbqO+GnF5jw==
X-Google-Smtp-Source: AK7set85qnSSVIK+/VfxFa63URER6rmyYNQB/XVwahWExbs8/RUsgm9XOIYiq9V5NrA4EQ+yUhQcHA==
X-Received: by 2002:a05:600c:4ecf:b0:3eb:399d:ab1a with SMTP id g15-20020a05600c4ecf00b003eb399dab1amr19180672wmq.21.1678376469612;
        Thu, 09 Mar 2023 07:41:09 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id 18-20020a05600c229200b003dc4a47605fsm257344wmf.8.2023.03.09.07.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 07:41:09 -0800 (PST)
Message-ID: <99ff644b-7734-44a4-6b3e-493dab843334@linaro.org>
Date: Thu, 9 Mar 2023 17:41:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: Serge Semin <fancer.lancer@gmail.com>, Sergiu.Moga@microchip.com,
 Mark Brown <broonie@kernel.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
 Claudiu.Beznea@microchip.com, chin-ting_kuo@aspeedtech.com, clg@kaod.org,
 joel@jms.id.au, andrew@aj.id.au, kdasu.kdev@gmail.com, han.xu@nxp.com,
 john.garry@huawei.com, matthias.bgg@gmail.com, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, haibo.chen@nxp.com,
 yogeshgaur.83@gmail.com, heiko@sntech.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, michal.simek@xilinx.com,
 bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
 <20220925220304.buk3yuqoh6vszfci@mobilestation>
 <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
 <20220926172454.kbpzck7med5bopre@mobilestation>
 <1766f6ef-d9d8-04f7-a6bf-0ea6bc0b3d23@linaro.org>
 <f647e713a65f5d3f0f2e3af95c4d0a89@walle.cc>
 <1849e2c8-54f5-9e56-4ed8-8b0e4a826d04@linaro.org>
 <302ecf0421fe4c99fca3eb0ca2f66127@walle.cc>
 <5183a184-c72d-3acd-70cd-6aa1e31533f5@linaro.org>
 <03a9f117316ab81f1b5a18100f771e65@walle.cc>
 <6c2090bf-d102-a333-3a83-03abe81ff70e@linaro.org>
 <460ef5ff3846b409b322ca53559e2476@walle.cc>
 <b8b61fc0-1e4f-146b-2036-03fda5359585@linaro.org>
 <bf57f3aafc3e0a02c81dab905ce9497e@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <bf57f3aafc3e0a02c81dab905ce9497e@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_074113_907275_DD76E542 
X-CRM114-Status: GOOD (  17.40  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 09.03.2023 16:01, Michael Walle wrote:
> Am 2023-03-09 14:54, schrieb Tudor Ambarus:
>> On 09.03.2023 15:33, Michael Walle wrote:
>>>>>> The controllers that can talk in dummy ncycles don't need the
>>>>>> dummy.{buswidth, dtr} fields.
>>>>>>
>>>>>> The controllers that can't talk in dummy cycles, but only on a "byte"
>>>>>> boundary need both buswidth and dtr fields. Assume a flash needs 32
>>>>>> dummy cycles for an op on 8D-8D-8D mode. If the controller does 
>>>>>> not have
>>>>>> the buswidth and dtr info, it can't convert the dummy ncycles to 
>>>>>> nbytes.
>>>>>> If he knows only that buswidth is 8, it will convert ncycles to 4 
>>>>>> bytes.
>>>>>> If dtr is also specified it converts ncycles to 2 bytes.
>>>>>
>>>>> No they don't need it. Lets take your semper flash and assume it needs
>>>>> 12 latency cycles. SPI-NOR will set ncycles to 12 *regardless of 
>>>>> the mode
>>>>> or dtr setting*. The controller then knows we need 12 clock cycles. 
>>>>> It has
>>>>> then to figure out how that can be achieved. E.g. if it can only do 
>>>>> the
>>>>> "old" byte programming and is in quad mode, good for it. It will 
>>>>> send 6
>>>>> dummy bytes, which will result in 12 dummy clock cycles, because 1 
>>>>> byte
>>>>> takes two clock cycles in quad SDR mode. If its in octal mode, send 12
>>>>> bytes. If its in dual mode, send 3 bytes. Obiously, it cannot be in
>>>>> single bit mode, because it cannot send 1.5 bytes..
>>>>>
>>>>
>>>> You miss the fact that you can have 1-1-4. What buswidth do you use
>>>> for dummy, the address buswidth or the data buswidth?
>>>
>>> Doesn't matter, does it? The driver is free to chose, 1, 4, or anything
>>> else. You don't sample any data during the dummy phase.
>>> To answer your question: single for instruction, single for address,
>>> whatever you choose for dummy as long as there are ncycles space between
>>> address and data, and quad for data.
>>
>> Huh? How does the controller chose, based on what?
> 
> Based on its own capabilities. It can choose either way. In the end

Okay, I'll go again through all the spi controllers and check if we can
determine the dummy nbytes based on controller caps. Thanks!

> what matters is how many clock cycles there are between the address
> and data phase. And you only need to convey that information to the
> SPI controller - your new ncycles.
> 
> -michael
> 
>>> Depending on the capabilites of the hardware it will likely be 1 or 4.
>>>
>>>> What happens if crazy protocols like 1S-1S-8D appear? What buswidth
>>>> and transfer mode are you going to use for dummy?
>>>
>>> Also doesn't matter. What matters is how many dummy clock cycles you
>>> do. Again, they don't depent on the mode. You just have to count
>>> the clock cycles between the address and the data phase (and that is
>>> what your ncycle parameter will tell the controller).
>>>
>>>> And please don't tell me that "we're going to assume that
>>>> dummy.buswidth = address.buswidth because that's what we currently do
>>>> in SPI NOR", because I'm not convinced that the assumption is correct.
>>>
>>> No, it doesn't matter :)
>>>
>>> -michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
