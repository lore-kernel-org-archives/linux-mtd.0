Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCC1CCF9E9
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 10:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y/9sLQXr2Jghof7OS6id+baxktV3xiBk1s1s8MVFZPI=; b=Xl0iH4v8t8RtV1
	31iI03Gsr7JgzTtgigWe9H4ydL9yAN38rvgfFpzelQeYp7gNfwj0RTs/NrRlVrijkEKdzFOZarfo9
	+TBj2nUaOutGciSKVOEgAH6dCiBIuW6mIydOJQzGHFypOZGY2NDZyvfUctO0wm9n7x2W7mwrnPcXg
	ZqGU0ags+gD/UNI9ZwDEnlqUgf26nMl49Sq/aMU/98zKRIG07KpvJ/KmfmsW+kd6oewuHpE9qZjuJ
	bEf4yTmQscQnqINvlOe52Jyr/gt5HPBbjW4VbdDvO2fPaiQE1PyC1dO+uQTCmOoOSNuOnNpOQiI/Q
	Z/0bfywt/sMv70rGaEyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stmAT-000000089FJ-3yy8;
	Thu, 26 Sep 2024 10:56:17 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stm6o-000000088SO-0Vmf
	for linux-mtd@lists.infradead.org;
	Thu, 26 Sep 2024 10:52:32 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a93a1cda54dso113154366b.2
        for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2024 03:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727347948; x=1727952748; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rJu6mYblkqkVcXR8JB08LsUmO1kDyu1sUwLdCteDGqk=;
        b=yjKcxaLaZ04+YO/LUQKB9a6RZQVDHDfKsptBUH7oM3TgR0gFlltTSnuNUCw2DV5N4v
         abL24b1o227MjpnSbjJT86dEKyigTbovD4FzhtZ+UwCm4i9urDDgLwRiBzj+Ks+XErD2
         OHJHDoWyLAzqxSZDmnSKtLcAklkqCDMLWOYhopXTKYSdxgh8YFc9KMKSDoYcInHBecj+
         00O0eF60k9ulI3W+owM5mumSY18WBY3MswI68hguiaiUkI4zGmNe1YKBUGSrZLP2TYhL
         D2dLcOZXrbIxkC6Zrt4M0AwllIr4wL8le3+P5iixCPGprfBq6b5q36IkkwnAq/mhjVJu
         ohJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727347948; x=1727952748;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rJu6mYblkqkVcXR8JB08LsUmO1kDyu1sUwLdCteDGqk=;
        b=P/2AHSQnuk5eJXSDvUOw7IRXs4BiNpprvRQl44yOxGNnG5EGND/PtuKusmBnTxuv/o
         +NbboNrYvQm9XZ/QPr0l+x5YOLanmH5wfa+Sn4D9Cd0XrLZPoNcvPTY2z1MkxP1bhR7V
         jVCaWriccL0gB1rxfNbvqMuy9/3rYEdfwj12iKIJmxFgxgkbIatEpb/pNnIZJTulp4IS
         FX+mT5BesXkEBauDtiUJ/qa0snLcDOOf8BG/BLBTJFAJcYP9ZIS2KExib5JPL9qSsQPO
         29ZF2JxQFJHZGLhb2MzjYbwmXM6yS/5EG3cNOykx/2CbIjGbhR0avwojZ4DuofCfEkpp
         wfTA==
X-Forwarded-Encrypted: i=1; AJvYcCUFpkeyP/UCtPl894Vi+UXRcqTce3SLLVSI/cBEg/fMhfl5GSAipfHkiGSMyXKOQ/iSPuM5FZHd+GI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxvHBg9ixgu/58NPEoboJoXdro97KIdzlea1ycJ9v0M4yw1vHFx
	9Kkwvvgc4KGBMU/SAJJCjPKYNvenr59eahoxYI/xgfUvBtfEjGHC4QK88e+8u0g=
X-Google-Smtp-Source: AGHT+IHqh7l0ziaE7Iee4IWJbL+JOqnqbMeKHuaoZ2CaR0fOIf16vkoIFCf4nL/NIj3W3r4REhw/AA==
X-Received: by 2002:a17:907:f78e:b0:a8a:3ece:d073 with SMTP id a640c23a62f3a-a93a0320106mr457384266b.10.1727347947978;
        Thu, 26 Sep 2024 03:52:27 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9393134bd2sm334386766b.214.2024.09.26.03.52.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 03:52:27 -0700 (PDT)
Message-ID: <2a38f567-8734-4295-95bd-c3ea65c0754b@linaro.org>
Date: Thu, 26 Sep 2024 11:52:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] mtd: spi-nor: macronix: workaround for device id
 re-use
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Esben Haabendal <esben@geanix.com>, Michael Walle <mwalle@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 linux-arm-kernel@lists.infradead.org
References: <20240711-macronix-mx25l3205d-fixups-v3-0-99353461dd2d@geanix.com>
 <D2NGXHZ2VTK0.M0AOB4CM7MHM@kernel.org> <87tte2hmq0.fsf@geanix.com>
 <2196b4e8-2c93-4a73-a717-28448d4668ab@linaro.org>
Content-Language: en-US
In-Reply-To: <2196b4e8-2c93-4a73-a717-28448d4668ab@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_035230_226434_3E5F7FB9 
X-CRM114-Status: GOOD (  26.98  )
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



On 9/26/24 11:47 AM, Tudor Ambarus wrote:
> Hi, Esben,
> 
> Thank you for the perseverance :D
> 
> On 9/26/24 8:56 AM, Esben Haabendal wrote:
>> "Michael Walle" <mwalle@kernel.org> writes:
>>
>>> Hi,
>>>
>>> On Thu Jul 11, 2024 at 3:00 PM CEST, Esben Haabendal wrote:
>>>> As a consequence, the SPI_NOR_SKIP_SFDP flag is no more, and all
>>>> drivers that have been doing optional SFDP is now marked explicitly to
>>>> do that using the SPI_NOR_TRY_SFDP.
>>>
>>> First, I haven't looked at your patchset at the moment. But I'd like
>>> to take the opportunity to discuss the following (and excuse me that
>>> I didn't had this idea before all your work on this).
>>>
>>> First, I'd like to see it the other way around, that is, doing SFDP
>>> by default and let the driver opt-out instead of opt-in. This will
>>> also align with the current "SFDP only driver", i.e. if a flash is
>>> not known we try SFDP anyway. Going forward, I'd say this is also
>>> the sane behavior and we don't have to add any flags if someone want
>>> to add support for an (older) flash with the same ID but without
>>> SFDP. With the current approach, we'd have to add the TRY_SFDP flag.
>>>
>>> Now we might play it safe and add that SPI_NOR_SKIP_SFDP to any
>>> flash which doesn't do the SFDP parsing (because it has size != 0
>>> and not any of the magic flags set) - or we might just go ahead and
>>> do the probing first for *any* flashes. Yes we might issue an
>>> unsupported opcode, but we already do that with the generic SFDP
>>> flash driver. So no big deal maybe (?). Vendors where we know for a
>>> fact that they don't have any SFDP (Everspin I'm looking at you),
>>> would of course set the SKIP_SFDP flag.
> 
> Issuing RDSFDP for flashes that don't support it shouldn't be too bad
> indeed, it's not recommended, but it shall be fine. What I'm worried
> about is flashes with wrong SFDP data (see all the SFDP fixup hooks that
> we have). So my suggestion is to play it safe unless one of you guys
> step up and commit that will fix or help fix each bug that results from
> this.
> 
> I'd like you to also consider the SFDP versions and how many parameters
> they are exposing. I can't tell exactly, but if I remember correctly,
> rev A had 9 dwords for BFPT, revB 16, and revC and other more. If we
> consider static init folowed by SFDP with rollback option, point 3/ in
> your cover letter, are we sure that all the parameters that are
> initialized before parsing SFDP are overwritten at SFDP parsing time? If
> yes, we shall be fine.
> 
> Esben, to speed up the things on both ends, I recommend you for v4 to
> draft just a core patch if you care, then you can handle the vendor
> drivers. Or send us some pseudocode and we can talk on that.
> 

To summarize, I like the idea too, as far as we can keep backward
compatibility.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
