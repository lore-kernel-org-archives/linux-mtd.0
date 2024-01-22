Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E369C4725D
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jan 2024 06:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dp+wXwqi+fbfbC/JiD4Q5qfX0CXlLmE9Yzh8e7/3mJk=; b=K960TzGpj90XSf
	f7crDpC/O3BOyuChQguv1bFDYpP8u9V3QT1xblRp4J4gavaC1voxFJ5AgA4htYv10ihWao23FAwNu
	9h4H/4Ph/pB5PVsPnRSEdbKUYktNoM0iV5+zCNb8jaasnXlA+EHiny+ozNi9RjyAEEtwE5M/P/6+y
	jriNhG40AyGxEUWOpqG21WKtiwPri5z6hUpIWJxqhwlshiC//2lAETokvEmwhDt2GpvYo/8+6ER5S
	AnN96FbpY1Zd45z5EAgQMo19xf5K4Tzc0aaVsy80qwHboyZlgKZP2TbqWBSETJaf67L7B8LS9G931
	AvAZLSAJdcpdQ2hYs4pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRnhP-00AitQ-02;
	Mon, 22 Jan 2024 06:22:23 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRnhJ-00Aism-2C
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jan 2024 06:22:21 +0000
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3bda6c92ce7so1802706b6e.2
        for <linux-mtd@lists.infradead.org>; Sun, 21 Jan 2024 22:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705904473; x=1706509273; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bOUvrfJMtFQiu+APkiSNEq21pDYlm0+yFD3itYMGbKU=;
        b=G4URsqdK4UyS9nJ8B2c/xLrLQ8y7iY+wKv9j2UIomhl0KhVPMKryzD0PQfu78cWOLB
         YQ3lKUbQ4WKwrNeIoS2+bFIRYFaEa9T5zZuAGSzn7S73ehQkjKSz3/QPGghbHGpDasqA
         qG0Dns0vz0uuupflKBsHbMNO8eS6pZxG7Nwt6pARpnha8zTkKFeMRO/K9YcIjAYdYEXq
         FGusNFU9IOlZxdD1MfZGDykxObB0fbw77UXTcKmjM8ifJ8ZFfR4kppgolFCcvm0xuRU8
         9gAj+BnH+wQomggCvY1AdjxOXMO2nPYDlxGi6gdtiyc5JxTibvtu2D8+gj1LrGuSxiVt
         qNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705904473; x=1706509273;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bOUvrfJMtFQiu+APkiSNEq21pDYlm0+yFD3itYMGbKU=;
        b=bn+k2ZJY4c0OTQ+ESeS0isCuRNIxHjoIcNuLZAWQWg8Uq1Zv1batizj23gG3Dvr2lZ
         aWz53zmL0OhCc2qe8+hcNlNazKbXZBCk2MJCWIhFJk3op7S2y60BRNfNtEW0rWRYlwci
         5Fhgt64B4BkOGTvPzkYr424dW/9Dc4jsJJofzuoc3rxdAOYj/iH6ALIPuzWswtP/N7aP
         DvzFg+ER1qgMIJZvQIPk317edS1P2Wqy+zi04M+OmiekvhuJ0k7lhLueFXsc3ExOTYgl
         3T4Yt4UDqQIC53XLKw4Q9aaIjIUQp1hRk+VxShpbQSdMyVv1Wnwyq2sy3h4XX3+9P2zH
         v2bA==
X-Gm-Message-State: AOJu0Yzr0VSc905k0nFy8CotozkG0NDb6AIsTKF2+3ipLONwB1D8XO2g
	soAEJ3ZbxXcoihoY/6hU6stgZ0Txhtp3UQnjJBJfZuxwyj03YvWDf7AqVg6vY2s=
X-Google-Smtp-Source: AGHT+IHiiWSWHMAuT/uXZCmNUeGYNGRNw8x3kzfBHMhQYQVfqLWMUHXSt3FfdxF6WDBOd3dxxuzVSQ==
X-Received: by 2002:a05:6808:11c5:b0:3bd:ac25:a179 with SMTP id p5-20020a05680811c500b003bdac25a179mr4141385oiv.10.1705904473254;
        Sun, 21 Jan 2024 22:21:13 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id fd37-20020a056a002ea500b006dbe4452741sm691415pfb.72.2024.01.21.22.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jan 2024 22:21:13 -0800 (PST)
Message-ID: <66b923af-8d10-42ac-8a24-b967d716be99@linaro.org>
Date: Mon, 22 Jan 2024 08:21:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] mtd: hyperbus: Add support for Infineon S26Hx-T
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>, geert+renesas@glider.be,
 Mark Brown <broonie@kernel.org>, s.shtylyov@omp.ru
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, d-gole@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
References: <cover.1680663252.git.Takahiro.Kuwano@infineon.com>
 <d94273b2-9516-2b80-308f-9fd1fdd2b4d5@linaro.org>
 <158830c6-d492-4967-a543-c0f5f8428d8b@linaro.org>
In-Reply-To: <158830c6-d492-4967-a543-c0f5f8428d8b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_222217_747302_95FECEA8 
X-CRM114-Status: GOOD (  15.45  )
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

Ah, Sergei's email was bouncing, I updated his email address.

Sergei, would you please read the thread? Thanks!

On 22.01.2024 08:11, Tudor Ambarus wrote:
> + Sergei, Geert, Mark & linux-spi
> 
> Hi, Sergei,
> 
> On 23.05.2023 07:22, Tudor Ambarus wrote:
>> Hi, Takahiro, Vignesh,
>>
>>
>> On 07.04.2023 09:11, tkuw584924@gmail.com wrote:
>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>
>>> This sereis adds support for Infineon S26HL-T/S26HS-T flash family.
>>> https://www.infineon.com/dgdl/Infineon-S26HS01GTGABHM020-DataSheet-v01_00-EN.pdf?fileId=8ac78c8c7f2a768a017f52f2f5182c91
>>>
>>> This family supports two interface modes, SPI mode and Hyperbus mode. The mode
>>> can be switched at rutime. The default mode is selected by ordering option
>>> and non-volatile user configuration. In hyperbus mode, the device is compatible
>>> with S26KL-S/S26KS-S hyperflash family that supports hyperbus only so one of
>>> use cases of S26Hx-T is replacement of (or migration from) S26Kx-S. This patch
>>> set focuses on particular usage that the device is pre-configured as hyperbus
>>> mode for compatibility with S26Kx-S.
>>
>> I'm questioning the overall hyperbus software architecture, not your
>> patches per se. IMO hyperbus framework should have been written on top
>> of SPIMEM and the controllers be placed in drivers/spi/. So I'd first
>> address the SPIMEM adoption before adding/accepting new support. Would
>> love to hear more from Vignesh.
>>
> 
> RPC is the only multi IO SPI controller that's upstreamed and capable of
> dealing with hyperflashes, but there are others which are not upstreamed
> yet (microchip).
> 
> Struct ``struct rpcif_op`` [1] duplicates the contents of ``struct
> spi_mem_op`` [2] which could have been avoided if hyperflash driver was
> extended with SPI MEM support. This way the RPC hyperbus driver, which
> is an SPI controller, could have been moved to drivers/spi.
> 
> Sergei, do you remember why we haven't used SPI MEM for hyberbus since
> the beginning? Was it something that we aimed for in a future patch set?
> 
> Thanks,
> ta
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/tree/include/memory/renesas-rpc-if.h?h=mtd/for-6.8#n22
> 
> [2]
> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/tree/include/linux/spi/spi-mem.h?h=mtd/for-6.8#n99
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
