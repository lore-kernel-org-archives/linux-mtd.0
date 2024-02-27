Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB15C54798
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Feb 2024 10:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rtbcR2h5Wg4Plvcm1IqPodisXK4PrK23mLHE5PeLNlQ=; b=awWoSLoK4TkGyd
	FTvYl+36lggRZSOV4rrcRuVJhrocj8Ngs3aSCQOf1vf+Uj8atmO2y+6eXSLEfLCga8QFO85TpzneO
	Aphz5iXEbfLF9Bu0l3kdM9xJMNGTJuXRT6MAU/b5Kf7oFVjPqfZm0jkW/HbvecZ8Br0xI93uI284W
	t0O/Dg4sldVeWBY6sm+b3GTjYiwccFgbU3iy85AcK2eiY/dHE2P6nM5zGl/INO/du7REnrI36/oei
	aOyV0IkBuALjidvWBpXeSaRbcoDKX3+017v9DNFyN2hFh52tNdf/FVCuICBqlqv9dJbWjWaoSrd0L
	/YVRqD5wp0rJmhta9lSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reuOE-00000004eoz-43WF;
	Tue, 27 Feb 2024 10:08:46 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reuO2-00000004eiJ-3xVf
	for linux-mtd@lists.infradead.org;
	Tue, 27 Feb 2024 10:08:44 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a36126ee41eso485075266b.2
        for <linux-mtd@lists.infradead.org>; Tue, 27 Feb 2024 02:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709028501; x=1709633301; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ooc5SS3j03ORm6wAIXAzAUPoc8fJQ9XOTzT5/SJVA8Y=;
        b=S8wjwDALZREULsisCkw9gmf5+UXlP8D5pg2t2GgY1+Of+EP8tv7kxn5IyXJbJXBlEe
         7YwHh0HbB6GmHLcaNKc1GMOzr4jCKpRhw8ahiHSD2ahKBzYvgsJWUfhGPZE5f1qFd4K7
         vX7DwS3z+cxQV4VxXBYqnD+pdZ8Xyrm88nXGRbVLPr2s1lb/UDL2SQAurylpN9V5qcAU
         LkSNW+MCjrRXkVQkFjIdcTSD74bmiz4qPXbzhGasKxO3xSu2iyllZGCvTcNNvV6puvns
         sANh3rHxiKow3eYBpbuNcDN6/LspaeBsKIWj2sQ8AYchqYD5C3A7HT1MIALUHwNp+kgG
         lqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709028501; x=1709633301;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ooc5SS3j03ORm6wAIXAzAUPoc8fJQ9XOTzT5/SJVA8Y=;
        b=Tt8WKMcQ4yLsMZvjjTkJxg7w/YoyCa07q6XWWlL2g7ZNu8vAE5vJNvqBZOuFvV3+yr
         riTDyDEH7PcHfFgrQ1BANLxRBmObEcNhLCPUfjQHtBZT3Pd3tSpEP0pPadQodex8OAzD
         dUmhVnUcVKvNJa+FG+J9DsGkI9RzSdjdZFvSwSob4pesohmRpXazk9qOUh4gtl3SoZYH
         rB9NT172eV3txVZNoxnyS9Dq8lPcrTywtJXjuvfGzPte0SEMIKno1l0NPHD8l6pn9/3Q
         7X0bvfQ3np8bCmE7qn4FsdeeuxPtFH641ZPBJhjs6+0pamKz1CR5Pf+N1Yh2O1TIMAGp
         zGyA==
X-Forwarded-Encrypted: i=1; AJvYcCXQih6/9dkgYy4Ki4gSLaEI+NND/oEltXL4WWONMBomi5mA2C2WlhhoWCdOKTOGy8y4U5UygtKZTZlWI+/zJ/s7LkZJOcADBy73H9WWjA==
X-Gm-Message-State: AOJu0YzAdCPWxjL3MX8nHPuVa7wHH0yYzSTiywg5j6ur45plZ3Gu3miv
	+TyX9jofytaOi1qjHQ1uxRfGTnDpQ4uUvFSkX3F8+xMJcXZK9naNQTxc21U8LA4=
X-Google-Smtp-Source: AGHT+IE1EiV8Igbb2EVKLcncUtmKcFbSvxFWmJNfpS/Isp1yWRgR1sxzZOpH5nj0WUOH1E7n+jeMtQ==
X-Received: by 2002:a17:906:7d86:b0:a3c:36ae:6c96 with SMTP id v6-20020a1709067d8600b00a3c36ae6c96mr5271008ejo.42.1709028501368;
        Tue, 27 Feb 2024 02:08:21 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id tb16-20020a1709078b9000b00a43d1968921sm5696ejc.190.2024.02.27.02.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 02:08:20 -0800 (PST)
Message-ID: <ddc5c922-8587-492c-93b0-9fd6f584d081@linaro.org>
Date: Tue, 27 Feb 2024 10:08:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for BoHong bh25q128as
Content-Language: en-US
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 David Bauer <mail@david-bauer.net>
References: <20240220200325.19089-1-ansuelsmth@gmail.com>
 <f7c45e7b-993c-444b-8710-042da7512bbf@linaro.org>
 <65d9d08f.df0a0220.988bb.3177@mx.google.com>
 <CZEVS9033HET.1NPH0K6PQLR87@kernel.org>
 <4d117770-6e0c-412f-ac1a-d9ba84b5b4ba@linaro.org>
 <65ddac61.5d0a0220.a0c6e.35bf@mx.google.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <65ddac61.5d0a0220.a0c6e.35bf@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_020843_241275_A2826E8E 
X-CRM114-Status: GOOD (  16.09  )
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



On 2/27/24 09:33, Christian Marangi wrote:
> On Mon, Feb 26, 2024 at 10:53:34AM +0200, Tudor Ambarus wrote:
>>
>>
>> On 26.02.2024 10:51, Michael Walle wrote:
>>> Hi,
>>>
>>> On Sat Feb 24, 2024 at 12:18 PM CET, Christian Marangi wrote:
>>>> The user just tested this and It seems there is a problem in JEDEC id?
>>>>
>>>> [    0.726451] spi spi0.0: setup: ignoring unsupported mode bits a00
>>>
>>> What SPI controller is used in this case?
>>>
>>>> [    0.732850] spi-nor spi0.0: unrecognized JEDEC id bytes: 68 40 18 68 40 18
>>>> [    0.739725] spi-nor: probe of spi0.0 failed with error -2
>>>
>>> And what kernel version is this? This should only happen if the SFDP
>>> header is wrong, but according to your dump, it is correct.
>>>
>>
>> I assume the test was done on an older kernel, where the identification
>> of the flash based on SFDP is not yet available.
> 
> The test has been done on 5.15 and 6.1. The support for this was
> introduced later? Can you point me to the commits so I can backport
> them?
> 

Use git blame.

773bbe104497 ("mtd: spi-nor: add generic flash driver")

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
