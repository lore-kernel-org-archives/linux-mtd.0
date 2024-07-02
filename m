Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD47C3064D
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jul 2024 05:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L3dobfWpcMYD3vXfqJ3L9Rv1a+U/sHh9r1jfADMwHdc=; b=n9NxYSSQTH+bjy
	UMGLWS5tjYqS02P4LrRXYpFau9VROwAzEHd1oecIfYQjww7Wcjk9id4yHiKxjjgT7Q3aBJmuYsYYH
	wwRzrmi/XBt28NnGUy4jLmZtM8GuAv2bmk8sZVtkr/zXk6SV2zm2khoUZDBXMJLZqJNlE4VEAHib4
	7Ix1rDgcXUyWAtJ9Yf9pCJPMZYxCvpyQPaX9j3/o07KEkJqmuqVc2r09LTPe+OMHbYjWE/FSpHqth
	F4gcdgoFMtJzB1I8mRqXGEikm8NxTt3vhkOe5jfYXy+BwdYlPdVWWmZtufZhAvkPFCB1LTRwqWbOT
	2GmeFTqUgmEBbasQ7j8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOVdR-00000005XwB-3iRb;
	Tue, 02 Jul 2024 05:00:57 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOVdN-00000005XvT-2Zld
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jul 2024 05:00:55 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-36279cf6414so2126607f8f.3
        for <linux-mtd@lists.infradead.org>; Mon, 01 Jul 2024 22:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719896452; x=1720501252; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rnm24fX3ACp6jY+bm6Eu7uHx1/D3EkceBo3lQmEL8aQ=;
        b=tKV3B0SOh7fwrUdzhF8KsKMT8paHsxlM+qBUYyEIXhjSDG9iPdm5rBLEOfjZtLRCvU
         ihpDzz7A0rj4h9wsAJXYs0BHc0OV83eAI4MZIwFhRmfG/GoCNcln+16LLD3ckrP1hgGU
         hY72bTvsSMSaTXy+4YqPCuACxvUzNq9GB4l6AxRLb+SHT4J8cicZNwy2k8UFGu5gJMy/
         Ddma+QfmH/rMEPeUtbkIUP0rdRASGEST67RMRCzxo1thdPPQ+qx1iX8rHyXQDFvXtTnk
         g2VasXTtjZsYvlj31bxC2e+sUCyh57U0lxdTm6gT/gdafX8VyJK7JOcWFLZscMT5M1TL
         31hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719896452; x=1720501252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rnm24fX3ACp6jY+bm6Eu7uHx1/D3EkceBo3lQmEL8aQ=;
        b=sloDzosZ0vxCrv+Wd/Ec6dTRHsELCkTAGQ4mFoJZzI8M6z1i0lPnRRbML3BkYTQThN
         MZit4ruCnvWIEC7nCaGgtka4brED1HxrsiRry6Q/QZGtO6ZO6I8plsYPgafdXxhFATf/
         xMDmzPVpfDQgNjiGVteuzjOfukBiDuAA56xmJQCrLO9Bhq8yaAorRnanOBctg2lTFSBm
         /51i2kTSDhQXpDKVGVL3cGplnnMfJY/EUkFzDhBBGSc32hCy6wS6och5O06KGwL5y6Bq
         DnRNF5xwAuiqLOOs/8AVbBhk9EYYBWkG/XNO8PYimaxax/nykImn9giZxU2l5Bc93R89
         dkJg==
X-Forwarded-Encrypted: i=1; AJvYcCWW5jcbeyodaHwyJgMkHmH4MZg5NpnTtwfe+Ab/swAZ2Qe16KVJHl1JJFxXG0VhzEsrxUB0AD/l5d6FWm8zXyTcOdGl/HJTKPkg75ynBw==
X-Gm-Message-State: AOJu0YxJ8wnCCfMGdKPyOmR9/tOEjV7fugzvAZrNbNztLj+XunWQsZBK
	Xngcnw8rVyawmpeQTobxJVgJi3s74JeQkQf5RtNrNmsA6R447kBfAu6Lt8bg58k=
X-Google-Smtp-Source: AGHT+IEcg+p7l64JGDDwcQheoiWKVppnJcQN5fXI7KKnVigl7fXrrsPqoGfLQMv4M+WgyBBjDPqvCA==
X-Received: by 2002:a05:6000:1b04:b0:35f:2550:e276 with SMTP id ffacd0b85a97d-367756a3afdmr4042716f8f.5.1719896451663;
        Mon, 01 Jul 2024 22:00:51 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a10305fsm11871090f8f.96.2024.07.01.22.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 22:00:51 -0700 (PDT)
Message-ID: <3bafcbea-6aa5-43ca-9d12-3916be3fe03d@linaro.org>
Date: Tue, 2 Jul 2024 06:00:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] dt-bindings: mtd: macronix,mx25l12833f: add
 SPI-NOR chip
To: Erez <erezgeva2@gmail.com>
Cc: Esben Haabendal <esben@geanix.com>, Erez Geva <erezgeva@nwtime.org>,
 linux-mtd@lists.infradead.org, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20240629103914.161530-1-erezgeva@nwtime.org>
 <20240629103914.161530-4-erezgeva@nwtime.org>
 <1c457520-07b7-4bde-b040-e8bca959a4f5@linaro.org>
 <CANeKEMOODBNZA6efh0E0Ga_KaVs5Y3WLcUftRhNwYHhnXO=GNw@mail.gmail.com>
 <CANeKEMO42rJt5Ob4_HDcZ3eEMvuMOPvRaFaLwL8SA65NtxSV7A@mail.gmail.com>
 <1d56c3b2-7adf-45b9-a509-956340f3f17b@linaro.org>
 <CANeKEMMe-Onpn7xWQHgWz1Ps_uQPEMa7HrKA00HpoKjG+DCJNQ@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CANeKEMMe-Onpn7xWQHgWz1Ps_uQPEMa7HrKA00HpoKjG+DCJNQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_220053_722827_206D53B2 
X-CRM114-Status: GOOD (  19.15  )
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



On 7/1/24 6:08 PM, Erez wrote:
> On Mon, 1 Jul 2024 at 12:15, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>
>>
>>
>> On 7/1/24 10:46 AM, Erez wrote:
>>> When using mx25l12805d, we do not read SFDP.
>>> As it uses the no-SFDP flags.
>>> When using mx25l12833f hardware with mx25l12805d driver, it did not
>>> try to read the SFDP.
>>> Yet mx25l12833f does have SFDP, when I remove the no-SFDP flags, the
>>> driver fetch the SFDP.
>>>
>>> Secondly SFDP does not contain OTP information.
>>>
>>> mx25l12805d has two OTP regions of 128 KiB and 384 KiB (yes asymmetric).
>>> While mx25l12833f has two OTP regions of 512 KiB.
>>>
>>> How do we handle it?
>>
>> You would first try to parse SFDP and initialize the flash based on
>> SFDP. If there's no SFDP then you fallback to the flags declared at
>> flash declaration. Esben had a try recently, see [1]. I don't know if
>> there's any progress in that direction.
>>
>> Also, you haven't mentioned anything about the testing. Do you have the
>> flash?
>>
>> [1]
>> https://lore.kernel.org/linux-mtd/20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com/
> 
> Looking at "mtd: spi-nor: macronix: workaround for device id re-use"
> I guess it can be applied to all Macronix devices.

No, no, we're going to do it individually just where it's needed.
Issuing unsupported commands is not that great.

> Adding something like the following in macronix_nor_default_init():
> 
> if (info>no_sfdp_flags)
>     info>no_sfdp_flags |= SPI_NOR_TRY_SFDP
> 
> It seems Macronix did many reuse of IDs.
> I saw it with "mx25l12833f" reusing "mx25l12805d".
> And Esben saw it with MX25L3233F reusing "MX25L3205D".
> 
> The only thing I notice is the flash using the same size.
> A sort of "backward" compatible.
> 
> Erez

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
