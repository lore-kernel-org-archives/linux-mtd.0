Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367F6C30653
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2024 12:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NagcmaBnRdNtGtKbZSlrZo0KJgUyZ9fKi+oRMZwhtYo=; b=CdWy+WYpBQ2NiT
	OjNkMx+ck582uu8OpPBeEdsc0hHZpsCezYuoZ3i6+KpzsA2tvipjDTJicv+lwkAZuG+qIbtYpT7bV
	gaaj5xLDMtaO9gIToPX+2ZxpCuO7wAUZW/NWYHLkO/BGMHBC0W4c501dcpnhus8QVR5F59YvLNXdL
	vOuzC2v1f7w39l9z3Yhh+px9iPGdr3C+6Vzo0CwLeU5E/NhVyCoBu866P/Lgc3Qcl50o368BzVIVW
	nPGT/iv2QshWjreEmPtpCzOH7fvLVFn8CIZLwkIUYdQPDBNr+nz0YLm3XbFQ+LE2hDkC1mcj1DB6q
	pHLkEcg9s5zx/GsKbqiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGXD-00000003Lig-3Goc;
	Mon, 01 Jul 2024 12:53:31 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGX9-00000003LhS-3UK8
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jul 2024 12:53:29 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-362bc731810so2417608f8f.1
        for <linux-mtd@lists.infradead.org>; Mon, 01 Jul 2024 05:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719838406; x=1720443206; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/8E2zTSxKsdYTXl/eFQJuC6tkBg5mMtLfz++9IP/rJs=;
        b=PuvenzMNRRMmbbkeCQVqKH3raeqadv9uoL0MzE8MZ2GXO/NxHqS3Z03TCgdS2Za6Te
         FOYgssv/tb/MlaUSbOKBN7I5BLgH4ynLTh+N7GmTj7wPU7PBtUQFRxA6cxuqCL27fFKX
         aE0XJbnAphFhXY/vNN4jiQvHPTy3Chl4kgfbDvn33t2mOhnOJe3mqNI2mzRIgGe14Y2E
         nYRdV2GlUygX9je8h97kCILTLRQtv6IHhW9lhCJI6/74tsnM3l6nN+NKrkObp4LqZk9y
         JI43+DoCU5fR72kmVLWNonX+NkIGe7VNmsu3FuU6vxj2aNwjFSixO88SA2TEBjvKPpk4
         aQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719838406; x=1720443206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/8E2zTSxKsdYTXl/eFQJuC6tkBg5mMtLfz++9IP/rJs=;
        b=a+CHFFhXwBgGfmgLQl7FKOBg3cT6tytZSATRFpwQ0L+gBcEELXQRMUoo82ZXn2hQ9C
         Yb2b3A861PQGN5s+Wak3+AnGcV0D8qydxBRp/2O4vUFWXFF6Sy32Nx5o4Vvm8N7KNqRt
         Eu5ihVyWOWIOESWNiiD9g0mtHAXQswc/IngW5v84Kc7NHUJtd8rNCNZz6ulaatAfIjR0
         Zm+Z5YugSMpkv1OBZp8/vqaOg8CEaflLg4xLks06sIuxgHbSdNnzNlcKVJQZvLoE1h7F
         d39wWKXhcQSn1udykSH89FMBrRUDs0Krmi5o3mZSVDYCmgc+9qrU8ZbUZqxOd6fGAmbN
         CXZA==
X-Forwarded-Encrypted: i=1; AJvYcCUDDpTNXF5gs6GP/BPTzSBAHh8XtZoSv6fneqplGitEJBbq0BGrCFqHiCEL5nFIxvxCFPCQDrS0/l79DxGZockD0EYfZ6c1IqlGJuJMqw==
X-Gm-Message-State: AOJu0YyCWHg5fLt8vtY/FnrqlE+etJktKfFvF1zLTUdTvOpRMwX+FiJ4
	K3a2Os+lgw5a81jgjoP6S6uMAQHbaNfv/fqknpTh5y8P9Pl83991tY+DcrSgAf8=
X-Google-Smtp-Source: AGHT+IFsN5M7EmHtq0/p5K+Huwk+NrUQg51/5m34mJW9idpCbT3p95cPzf2wdQfK7yooDdM0biGapw==
X-Received: by 2002:adf:fe51:0:b0:367:40e6:46a7 with SMTP id ffacd0b85a97d-367756aaceemr3735232f8f.28.1719838406050;
        Mon, 01 Jul 2024 05:53:26 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0d9ef3sm10034544f8f.46.2024.07.01.05.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 05:53:25 -0700 (PDT)
Message-ID: <be8daf89-14a9-41ad-9403-8e550e5ae284@linaro.org>
Date: Mon, 1 Jul 2024 13:53:23 +0100
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
 <04f5162d-8a95-45ce-a891-3f711b27a469@linaro.org>
 <CANeKEMPAng8K1Gbab-MXP0KodS=r1Bzstsvg4zadWdu1O7wqWg@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CANeKEMPAng8K1Gbab-MXP0KodS=r1Bzstsvg4zadWdu1O7wqWg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_055327_909282_2DFC4081 
X-CRM114-Status: GOOD (  23.22  )
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



On 7/1/24 12:03 PM, Erez wrote:
> On Mon, 1 Jul 2024 at 12:23, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>
>>
>>
>> On 7/1/24 11:15 AM, Tudor Ambarus wrote:
>>>
>>>
>>> On 7/1/24 10:46 AM, Erez wrote:
>>>> When using mx25l12805d, we do not read SFDP.
>>>> As it uses the no-SFDP flags.
>>>> When using mx25l12833f hardware with mx25l12805d driver, it did not
>>>> try to read the SFDP.
>>>> Yet mx25l12833f does have SFDP, when I remove the no-SFDP flags, the
>>>> driver fetch the SFDP.
>>>>
>>>> Secondly SFDP does not contain OTP information.
>>>>
>>>> mx25l12805d has two OTP regions of 128 KiB and 384 KiB (yes asymmetric).
>>>> While mx25l12833f has two OTP regions of 512 KiB.
>>>>
>>>> How do we handle it?
>>>
>>> You would first try to parse SFDP and initialize the flash based on
>>> SFDP. If there's no SFDP then you fallback to the flags declared at
>>> flash declaration. Esben had a try recently, see [1]. I don't know if
>>> there's any progress in that direction.
>>>
>>
>> And you can then decide which OTP org to use based on whether SFDP is
>> present or not.
> 
> That can work, but sound like a hack.

It's not a hack, we're just doing our best to dynamically identify the
flash.

> Is that really that important to hack?

we push really hard against new compatibles. Users shouldn't care about
what SPI NOR flash is there.

> Just for OTP, that very few use?
> And if in the future Macronix adds a newer one with the same JEDEC ID,
> but a different OTP size?

we'll compare SFDP data and choose based on the differences. This is not
encouraged. Instead ask for unique IDs or choose other flash.

> Macronix does not consult with the Linux Kernel on these matters.
> 

I'm complaining about unique flash IDs for years now. Hopefully vendors
have learnt their lesson. I didn't see new flash designs reusing old IDs.

> Anyhow as I do not have the hardware anymore, I can not do more
> changes and test them.
> 

Be aware that we're not queuing patches without some minimal tests. If
you don't have the hardware, contact mchp and see if they care,
otherwise we're wasting our time. Here are the minimum testing requirements:
https://docs.kernel.org/driver-api/mtd/spi-nor.html#minimum-testing-requirements
For OTP we'll also need some OTP tests.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
