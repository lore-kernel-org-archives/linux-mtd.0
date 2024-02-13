Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B26AC4829A
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Feb 2024 11:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EDNWdGH1Fgdb5JnlvnR39IWpCeD1cHxtI+hFgC9Dzhs=; b=FhiSbvT5jpXRNS
	Z477iM6DocMKLz+P5tWEBGFUaJl9/1wbCGS7hmzTxy6XABcAaoPbRGiHfnRzeduEyYniOIJ/sEzr0
	ZtReXZTcqbUTZXCpgm6FwSZs1AJRTgATubGl4onsJPE0u6DzST7H2nAOjTIt+J63J4l9oMbd8+Hki
	DRI6F+gWFc+UHPIN+myOHw/4xXRsaKeS8SGThQYn2IT16j+SZ1BKGWe/y00FD51YIgJtwnO81IAr+
	U4K+ZHEAaOEBBQJc2O+EgMLm4kTmOd2vRl7UXpr5iCfdLNtyE/kNM4u+k3QFsz2JVbYp55T0qiItu
	hSngG1vL22NOShAHOBow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZrPf-000000095za-1bDX;
	Tue, 13 Feb 2024 11:57:23 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZrPc-000000095yz-2Zip
	for linux-mtd@lists.infradead.org;
	Tue, 13 Feb 2024 11:57:22 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-33ce2d1882fso28496f8f.2
        for <linux-mtd@lists.infradead.org>; Tue, 13 Feb 2024 03:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707825439; x=1708430239; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WzVXtifKzoPWvWy41F1BsusB4MNouwO00+RoQRAIJ5Y=;
        b=TSBjYE3yTXO14fooi6TaFCtwc1U3dzJLGuVPG5F0Z2llpCujP1cqRa30vxKRgexJvn
         dt0tdcjRVmm92hCnwQY9Owv4a5+8o70lBlnnwGvaQwzeXC+fKiEDjpZXaqrneVVj1oac
         vgFE5PgF1DPoOWMv7xtmA6hV3Ahx0jlNyFR6E7PVblyxLGk1XfAfoC1kLDEKDRP33SJ7
         fh/ku8y6et2FIYaMBmsm9HAx1BzPMvDEH72ktnzFfKOoYzVfrALhMsepSEUAJsdyitYd
         b7NVQ5sGUk231K4jEOoZuPSweKrjtFe59bUwxHFleTfBX2KtnGBBsAeRWrzwUJvzVkb5
         ZASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707825439; x=1708430239;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WzVXtifKzoPWvWy41F1BsusB4MNouwO00+RoQRAIJ5Y=;
        b=sCVPzON1qqechlaunWkCFfmDlGIhjlFVsUG2173IUc++cSohetCjIo1i2T2BOoK0DN
         6Me72hTrUnJSLKI7qssyxl2gl0cRVBb/mUPJeHsrAda9uAgfluQOHoGE2xdC79wyNS2j
         iIbpFymTqAI8y07gHhZw3dQLI6VMCfR5GgMjh9+YOtnM2T2QMbFe0fnwPkKSAmg1htTf
         xB08q9xaGRNr61BmEt0n4R5UHAmLN0JyvGfNCgEiPPOhzHtLz8c19zoP0NnOVwLkn4LG
         tDaSjVbgti2uZVwxXy+E7RL3QVyCW0j8ZR4zwYrqfeGlk/i3zKA0vD8B+vWSwEf4JKpf
         HaUg==
X-Forwarded-Encrypted: i=1; AJvYcCVUQhtvR59mncqZERCBTZeMUBeDJGbd711Xkm2SrfIOinYLq72DQbicCkrH+daTqkmhcOBlw2ftRbZRdxhnOL9fCrwLoar7k/ddjvFCSQ==
X-Gm-Message-State: AOJu0YypWvECzXMKlQprPmvvrvA5BgVHNos5SJmxfBNNqfKAXa8+cARl
	v6GYq6nkGkF9am9Sg/3rW8w9kd8UPO6TIzAL65xvDwjPk2RZVz49ewtnhSsNJIzJIuarSgnq08E
	8
X-Google-Smtp-Source: AGHT+IETAhWvQ9h2qIadjb+qX83sI5DVgMIQNalwTbdC8iHZrouroIKy/6rN8jqyiiWN2waevlnb8Q==
X-Received: by 2002:a5d:4983:0:b0:33b:4197:75dc with SMTP id r3-20020a5d4983000000b0033b419775dcmr7289673wrq.14.1707825438827;
        Tue, 13 Feb 2024 03:57:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXnD18s7ldMUMwENNepv0AJKymSbCZ9AVBAZbedzUiU0fuahInWmxqrmvXt0ZUDculRqMFO4Vfr+wZAB6x4Bq3DPk0Dol7P/Xy+3HON7exw0lX7On1ASfFLq/oQ56Rd9tY5Qg20ijmn9lQil/ew6R1E0dzLJ8PV9wJnZaW4gwtKWpQ7AvB5BJ5yq8jJBzgqQSXe3yMqQsH/9sNtLHwtdXl/mUKNiGnxUWhhy3qycXgplBe62qCkXaiTM2b9aHQ3QFYEnjl6no3ehsurabtjxx6rldQH+cXDfT1cFtIDRz+SYsk0IW+COlPFzI2kJFf/9MErB6+7GoZpkewejSgGOOP8079Sa30n8X+c1DlRHVG+M98zgifp/k9p+8KZXco2qfjvqui1bVRqVTUlOLSvg78M55ePdBXm0jg9UGvwEZaQosy8jOq0awDzNXsEP9xZ
Received: from [192.168.1.20] ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id x4-20020a5d6504000000b0033cda80f54dsm1268569wru.83.2024.02.13.03.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 03:57:18 -0800 (PST)
Message-ID: <52be1d88-51a1-4ec7-8aaf-6046f5a469f4@linaro.org>
Date: Tue, 13 Feb 2024 12:57:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] dt-bindings: memory-controller: st,stm32: add
 'power-domains' property
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 Conor Dooley <conor@kernel.org>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
 <20240212174822.77734-3-christophe.kerello@foss.st.com>
 <20240212-chemicals-skinny-18eda1cfe781@spud>
 <c57b8094-be08-4ae4-ba85-f48522e5d2a8@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <c57b8094-be08-4ae4-ba85-f48522e5d2a8@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_035720_711684_54CD29BE 
X-CRM114-Status: GOOD (  15.23  )
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

On 13/02/2024 11:57, Christophe Kerello wrote:
> 
> 
> On 2/12/24 19:33, Conor Dooley wrote:
>> On Mon, Feb 12, 2024 at 06:48:12PM +0100, Christophe Kerello wrote:
>>> From: Patrick Delaunay <patrick.delaunay@foss.st.com>
>>>
>>> On STM32MP25 SOC, STM32 FMC2 memory controller is in a power domain.
>>> Allow a single 'power-domains' entry for STM32 FMC2.
>>
>> This should be squashed with patch 1, since they both modify the same
>> file and this power-domain is part of the addition of mp25 support.
> 
> Hi Conor,
> 
> Ok, I will squash this patch with patch 1.
> 
>>
>> If the mp1 doesn't have power domains, shouldn't you constrain the
>> property to mp25 only?
>>
> 
> As this property is optional, I do not see the need to constrain the
> property to MP25 only, but if you think that it should be the case, I
> will do it.

The question is: is this property valid for the old/existing variant?

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
