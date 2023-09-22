Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80327CD484C
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 18:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vMPIbx2hPssk9Eku2Sp+RrbGY8CupbhmEigExvFGTok=; b=eecF4/XbOk527TqjXnxkMR3Bw/
	b/SdvSKmPP+djvr1pf1xJlvvq1XuawWHhyh58pXWi2WkXxZ2hyWjeL6BPPDnMCjDEutjcm32c0cK8
	DhOHhfrsMZQhteR5paHYKW9t0yWqT3o9BD2lVvSMWhbhYVXMZliRZyCoDwnn4XxgIw/0SJA2AQFAo
	ZgIPtaYnUUt6VU0/D39p0QdwXqtN7Ovhw3YLgLGaJ5x2FcNmhBjEX47douOO7RnJdbl80ZIDo5KjP
	4NMp6cnV9O7oD+DIULg/Zn0mMym/Gj4ZGDx7UzncKz6YW9xWJf8oVHOTpb5+WZDZ9ZyBMOvrby/hT
	WiB8lPBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjkzt-009d9A-30;
	Fri, 22 Sep 2023 18:35:25 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjkzq-009d7l-21
	for linux-mtd@lists.infradead.org;
	Fri, 22 Sep 2023 18:35:23 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-32001d16a14so2464715f8f.1
        for <linux-mtd@lists.infradead.org>; Fri, 22 Sep 2023 11:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695407720; x=1696012520; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J9ePrVfdNy/JzYRXiuwdT/jgHodsIKRvT6Kq8KoBVSc=;
        b=AXqRc3FZAs3u19/nl4iv/m3HaquaVFgUxJ2/5lAnbpenHf+Hj+R9yZ9X62vA12nGp/
         2xJKMN12jYSE3BW76eVhic5I2fLSKb0+wC/FqtcFWu/foHZcI8NM9jkFopY61ZaPEl8F
         Jz6Z8IUhRuxRxLZCzxfV7rZj/RM94q0LRA5CBpePpNFIEpiiJVPKxR2VUq8/5EW1Ufm2
         UKviA3G07ZrNKjNXPfIeMbnyyDtPhjyFBx92anPJGhHYiGTLveOxvRc0xPOtgljFn8WU
         7d29qsFy72M6TGYDm3IGDaq0ppiQ6QCc7Mtver4stfXGsfU20Luh0j6I2pvrDSLWMUpq
         DFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695407720; x=1696012520;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J9ePrVfdNy/JzYRXiuwdT/jgHodsIKRvT6Kq8KoBVSc=;
        b=JgykYKefpq3tSVyHV0Zfr04Dr1jo30aMn5Tg02HLmEv0xZRe0ohyPEAvZFvWe3s6IS
         DGWZHD84P2nAaYm6QUaD291bAcwTaaHG6yJ0o2ITti7jQHRDd6ChhwOmcTmaO61totXg
         WihGJDRQL8GwJbwESej0AeYwp4QRsGfCbrqih+LUnWokSOvADclf/EeASvXZX+pnUvP3
         wVpqMGwkcn9Ot/FDCEcjzZXxLednaijkxJB77TOboCrIlYGo0WcEoGuw48WCQeyvk9OC
         P+W3ynJ6QcqPTzZOxqtrllTasLOrfWMiaRdM+AzHh65qIO9J5KUC/ARrJFRN3Dto+V7F
         YSKA==
X-Gm-Message-State: AOJu0Yzj2fZom7fSgtuG4RTR/Befb3bU5OjttFUdXLonzsi0pEEfkSkv
	x1tSPe22P6rlkiH5NWZPZjf7Xw==
X-Google-Smtp-Source: AGHT+IGHNHeD3T2yar23Ec3UH67UtsxfVcBnSqULhmwaYiv+OLl4leNTFgBuPq0hiT5BDrQsK26dyQ==
X-Received: by 2002:a5d:60c5:0:b0:31f:b91f:23ef with SMTP id x5-20020a5d60c5000000b0031fb91f23efmr441114wrt.51.1695407719864;
        Fri, 22 Sep 2023 11:35:19 -0700 (PDT)
Received: from [192.168.192.175] (181.red-88-28-23.dynamicip.rima-tde.net. [88.28.23.181])
        by smtp.gmail.com with ESMTPSA id m16-20020a5d4a10000000b003200c918c81sm5000406wrq.112.2023.09.22.11.35.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 11:35:19 -0700 (PDT)
Message-ID: <52ba27b9-79d5-f9cc-450f-fe831e65769a@linaro.org>
Date: Fri, 22 Sep 2023 20:35:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/6] mtd: parsers: ar7: remove support
Content-Language: en-US
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mips@vger.kernel.org,
 Jonas Gorski <jonas.gorski@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230922061530.3121-1-wsa+renesas@sang-engineering.com>
 <20230922061530.3121-3-wsa+renesas@sang-engineering.com>
 <20230922163903.3f49ea2a@xps-13> <ZQ3VA/2pAC3Do1Xd@ninjato>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ZQ3VA/2pAC3Do1Xd@ninjato>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_113522_666508_EA95C646 
X-CRM114-Status: GOOD (  13.36  )
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

On 22/9/23 19:55, Wolfram Sang wrote:
> 
>> I'm not sure it is wise to merge defconfig changes through mtd. Would
>> you mind sending this change aside to avoid potential conflicts? Each
>> patch can live on their own anyway.
> 
> Yup, I can send a seperate patch for it.
> 
>>>   drivers/mtd/parsers/Kconfig    |   5 --
>>>   drivers/mtd/parsers/Makefile   |   1 -
>>>   drivers/mtd/parsers/ar7part.c  | 129 ---------------------------------
>>
>> Do you have other changes related to this file in your tree? It failed
>> to apply on my side.
> 
> No change. Plain v6.6-rc2. I used "--irreversible-delete", though. Maybe
> this is causing issues? As I stated in the cover-letter, I wonder if all
> this should go via MIPS. But there hasn't been any discussion about it
> yet.

MIPS tree for the whole series certainly makes sense.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
