Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D96DCF8552
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Nov 2025 08:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G2ZW36DMPnghXa0LAgyPjH3HTDHptKfDwvSYPOPKN14=; b=fRF+gBFZQZMo8/
	mtyrnumA7BozQ168cYbqkJuy4hemn4KhXI1tRGZHlX+gGMBbK9kiYKNdEamLgBX/7GHJaVrC1o2n+
	QuwE5q7BBdhwd503RJY523PSiGC2YPTfKNS+tj1E41/XRhYMtFaSZMEtBMHq3Tghh4Hk9PkgdLWkG
	KQZwFdqrBiw62JT/JSUv3i75goRC5JCfTWcYOxPI+Mdd2xA3fPeR9+Ck8Z4qi20rPCr1/Utp869yU
	9P3cl0dXYdk5QbUjGm0gwcB/Nh5ViBaIEXAuKYJLwUBUf/YTJfwWeHx/ydo6aiOcuyppWXbS1Mi9r
	wJdpa28GmPF17Abvqr8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLzfb-00000006KZH-3Efm;
	Thu, 20 Nov 2025 08:05:35 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLzfZ-00000006KYs-1jlJ
	for linux-mtd@lists.infradead.org;
	Thu, 20 Nov 2025 08:05:35 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-42b3c965ca9so304961f8f.1
        for <linux-mtd@lists.infradead.org>; Thu, 20 Nov 2025 00:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763625931; x=1764230731; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8PztCW99nsI9W45kahbPszZ32SfHFrWK98zZmX/7wnE=;
        b=fHXBTLXkM1QZeM4umyFTAuf0mpixTg//TttX8qHDEFZkDRMqrrCWo7NvsuBB6gvpvc
         /lNX3tMoHQY6xXa3mkL3v5eqzRI7y/qjnXgXs+ev2Nk02uocJw/84Dcuh6bVr0s/2jmS
         NI6H7Q78ydmsuWJ7cK7ow3hmzacq30awLlxs0lrI8SnhFggwCil5x1b8p63RYRY0zpzj
         9jcyL7LiwFmypq0oQlI9wDsT88Ag855Rbaej7In3sGRR96O7IFpkR6q3wh/TGKcCL4ia
         OQXjkCeW0IoPGpbfLTdMvjOaMRME3J13Dkii0k7Ym0ycmet5h4R+78VRRr1lHafeBp+j
         3XVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763625931; x=1764230731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8PztCW99nsI9W45kahbPszZ32SfHFrWK98zZmX/7wnE=;
        b=Po4kxiTaxFW7MZBXGXoMuLjP3Kr68IJK1/iZGGPygJ9cs90TGQhjhBQ/2EauX98Pom
         qhHSgb2KtJVlGTqTSlnxMNOVFnU5GW/HjCyDP2xxzAdVZZYqDTlHIGZXH49qWjrUhSsW
         8t/bYeNSRhl2gdEBKQ9ABf+g8vcgV98u9PDAtWSNJG+xTIz/tFjpawJb0W//O8rjbw41
         YtKMw1s1fhTFaar/BkyZhfcbeiJ0HIwII9SZeni9+8HllUM023CjggCArqBWFDY373gW
         qJ/3Q9tNimZg9UZuDOlTFFbj8ynalyaO63ou283DCf/sUElAjvdoi5jEjiR+h1QFQftI
         oY+g==
X-Forwarded-Encrypted: i=1; AJvYcCU74odfxyG0mc3lGJ6rVUD/ei+tpP7jp0geO5diABsOmhANjzE2yBDtqWRowbk8Ow1HDCfjGGzq3QM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxaqypWNwZ6mpLeN5Pl2MTKj7RQ2LDCvZBVECDRYUnRtC4kHI7R
	QyAM7lR0OJx5iZXeNBmLy7VolLR5iOCoOdcjUdqh4OpM9yZdgQYeYBFlXupsbTSkGd0=
X-Gm-Gg: ASbGnctnNzQnAGSWCy4VQBzyUT2TipqF6aSfrti7XU37M4GhC6QB28qwiFTmRmaOIpg
	AonARSoC1nVvaagigL/kaKPlBflwJmVw+kwwh4YLpLi2lwop60T+uWUxnTKFAwFzDxpzpd0kHZv
	xoY8hcW3Xuy3q3sAzwI5phIWkYiZpz6J/FeoWoHwQml2D5bwz1CL+lPDCjdYa8l8X1iwWSOY2OP
	J6xW2awZ5aQrqRth0VEChY8tr6MpqkFcKsh4PnWaJSw/f5rFziHwFjyE/3khdzIv16gOGSpI2hT
	M1zkgXcPGdV+HYIPzy3VA24EAqHRXx5sZ7gk/v+QqsbBOSz7N7dqVDpLw1Iut/46sD7MAQL9ziG
	VuvXJRGGKRX8OAcptPQDKXLypBTWFvPJbmPYuJL3XdFqQbFfj+fPXne4g2QX1MDTcnMb1GqMSDI
	+1jAZM3vgcasp343lQ
X-Google-Smtp-Source: AGHT+IE5v+9a80Zn9J2fmQEfUzMbSA47PM8PvbAZc/vWxwU72hK4Du32I64ZpwzSWFiC0CaXw3Jplw==
X-Received: by 2002:a05:6000:26d0:b0:42b:3023:66a6 with SMTP id ffacd0b85a97d-42cbb2aa131mr1087403f8f.40.1763625931093;
        Thu, 20 Nov 2025 00:05:31 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34ffesm4477241f8f.10.2025.11.20.00.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 00:05:30 -0800 (PST)
Message-ID: <f8981eae-3f1b-48e6-b74c-95810af3e5f0@linaro.org>
Date: Thu, 20 Nov 2025 10:05:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/28] mtd: spinand: Fix kernel doc
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
 <20251031-winbond-v6-17-rc1-oddr-v1-4-be42de23ebf1@bootlin.com>
 <efb8bba5-8805-4c95-ba1b-3bde46a4e528@linaro.org>
 <87v7j6aqlr.fsf@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <87v7j6aqlr.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_000534_019594_75F22087 
X-CRM114-Status: GOOD (  14.46  )
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



On 11/19/25 7:18 PM, Miquel Raynal wrote:
> On 05/11/2025 at 16:57:39 +01, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> 
>> On 10/31/25 6:26 PM, Miquel Raynal wrote:
>>> The @data buffer is 5 bytes, not 4, it has been extended for the need of
>>> devices with an extra ID bytes.
>>>
>>> Fixes: 34a956739d29 ("mtd: spinand: Add support for 5-byte IDs")
>>
>> no fixes tag for documentation.
>>
>> with that:
>> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>
>> (commit msg can be updated to smth like "update kernel doc comment"
>> too)
> 
> I partially disagree. Tell me if I'm wrong, but may I guess that you
> have backports in mind? As opposed to backporting comment fixes which


yes, I was thinking on stable rules, where trivial fixes like this,
are not accepted. But you didn't cc stable, so I think that's fine.

> might not make much sense indeed, _fixing_ a comment makes sense. We
> know that stable maintainers, even though they ask people to Cc stable
> for backports, they automatically pick with the help of AI almost any
> commit with a Fixes tag. I believe it is wrong to not mark such commit
> and even change the title (because "fix" in the title may also lead to
> an automatic backport) to circumvent their tooling. The tooling must
> adapt, not the accuracy of the commits. Plus, backporting this kind of
> commit is harmless, so I wouldn't care too much?

okay

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
