Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2077C282EC
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Mar 2025 07:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3532H00TOD9du68Ke7Kz5xfJBe5bBrop53dGsBWk3j0=; b=0QQwFza+qAqKdz
	lXaMX+eAvcMRMK85IIlPRI9wGmdzVCyU7m16UwoTWBd3ooqEgtolS4Vbu1DZ/ZA2EwTsVBIoaj0gp
	UcQ03ilczqYvSa7ECfStB9t9lymR3BbybShNMixsgefzFriKXQe+JTY7/VOI3m3PJLE5fyAI4D90e
	OfKS0QfZNMQi9Eb7cI8H/jteU9L93Av4L4G1O2ZxhwrEwV9y7CqXCaZA+5wnd5/mV0ZiKVQ4pVQj8
	nW5tXis91n8vz+IULtSyDvjom54jyd8hyNL+pRwkwxncvSuqYaOVIADB4cioXlO03ZE7EUPbhN3To
	WTSq5xR/gzXU/siyy82g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuR5N-00000004t6Z-01Qe;
	Tue, 18 Mar 2025 07:10:01 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuR5K-00000004t60-1WiD
	for linux-mtd@lists.infradead.org;
	Tue, 18 Mar 2025 07:09:59 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43d0782d787so19924535e9.0
        for <linux-mtd@lists.infradead.org>; Tue, 18 Mar 2025 00:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742281796; x=1742886596; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2pX1FLmGF0QpaVz+3C9gkeV+HuMIyKRUJE6MVHoPVhA=;
        b=eXkaBGCk+0r+cb1UUQI7OIHmzF77R0sGCJxdhSh8VA/IhLLtAm6NMJk/FYcbJ/3ZsL
         JfJcE1qVXdq7JAO3qlGFTBRq26I49JSyLuJaus+rt/BM3lwX6Hn/H6XtUwZ5py/tq3wM
         WXiepYEmSxKVkJguqT34O3qnkIDaWfEyMH2OkSQbSEEDcqKBWZPYAT3SGzTKoo8bMqu6
         NoQXjPSf8X+W61jkpCtDAYuYyQo7AQAWokC/pi78Wg/0IbaHtOQ/JnMSiyJxDHnaf62V
         0e8eufsc/DyJDiwNkzQdZQ4fUI5OuSBdpLGw3lkWpOs2VLVKBnyp0XQHnmkblMfHbfMU
         fOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742281796; x=1742886596;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2pX1FLmGF0QpaVz+3C9gkeV+HuMIyKRUJE6MVHoPVhA=;
        b=LQhePlNz08ysDPeONJlj0VNZta6JMi2cl7z/lYlvMmIxM357y6Hd8/d08Sf3gBQ7Mu
         /ZV0beLAo3+xtfaxKZk5JX5PMpZQXRX97wSOwQsUsyjsFL0xlvK5QaOfYyzKhsmkXNtL
         wYCtPwJ/DnET8p940hVW3x8WhbJBMQyi0gp5K5oj8/Jg6iXTJDtUHSHn/3iSkMXjsXCE
         suqDNInGnflT6rLYVwUuLNsP+wBWGobBsDE/OZ0wp/hQd6JSMfFrYx4PGO6fu6aCsOOm
         pWKr13eO8O+9xrLlQU28fz1SqQC5KFTit930WiSDKlTrao0cqpYHDbGJSZVSm+D4HvAi
         Ydig==
X-Forwarded-Encrypted: i=1; AJvYcCUv7zwvSoxXg6QCEnsVzy288wOIIT7aPE6h1nTTwMjj5giDJEAKtt6jmRZdbjLpwCdtRtjC9tzK3sk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3vWVk5YxnC/Rac7OK5d0ExpbePAG2iZNgWVDG9GXaQiQP7ZXX
	xqLXTun9yfUWuwZFi3nZeEsumZaAaftl8tl7twMjAuGAAA41b188bnLwJvEo6S8=
X-Gm-Gg: ASbGncuPOpUEQ1dU+lml0IeQ4DVHTYjXZ8vipqIap+5BGlqO8xe3iy2rv+o2zCUrwyD
	dS1Js25ttZbvxykaKy3IUlTHOoKd5DhNbnlwNeR7xwXV4dlQuDwV8gI4Edl1dTQLdBlyJVutDrD
	8tByJRPiw0PQXnagpWfGFOLpRorL5FRdUekQt3llGstad6AdmNtFtSmmMVIlteDgKxaAMKimbJE
	v1aIMYuk/Es3Z4W22YjrqXecSgfBZDfAKuXlsC/MNasbrMK96RWyMdrj/warq0H0vP7H9z3uaiH
	FfxUH6pNZ4SkFedEa5tvTmUA+eAFUYB91apF7Rb7z7PKXb8wGCPBxg==
X-Google-Smtp-Source: AGHT+IGa8J4JxzKKGh0/XPpOyesw3o5rqSQlTd10QJ3OEEApVDmd/NM7aAXGbyEgafvjSSRXvrYOow==
X-Received: by 2002:a05:600c:450d:b0:43c:ea1a:720c with SMTP id 5b1f17b1804b1-43d3b9b2b2bmr7662605e9.18.1742281796357;
        Tue, 18 Mar 2025 00:09:56 -0700 (PDT)
Received: from [192.168.0.62] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffc3ee7sm125566505e9.19.2025.03.18.00.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 00:09:55 -0700 (PDT)
Message-ID: <4be8afd5-65a9-4cfa-89b5-42caea3a9f93@linaro.org>
Date: Tue, 18 Mar 2025 09:09:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: gigadevice: add lock flags for GD25Q128/256
 and GD25LQ128D
To: Jakub Czapiga <czapiga@google.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250317182047.2060036-1-czapiga@google.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <20250317182047.2060036-1-czapiga@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_000958_419917_49221E48 
X-CRM114-Status: GOOD (  13.46  )
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



On 17.03.2025 20:20, Jakub Czapiga wrote:
> Set appropriate FLASH lock feature flags.
> Set top-bottom protection configuration bit flags.
> 
> Modified chips:
> - GD25Q128 (+lock, +tb)
> - GD25Q256 (+lock)
> - GD25Q256D, GD25Q256E (+tb)
> - GD25LQ128D (+lock, +tb)
> 
> Signed-off-by: Jakub Czapiga <czapiga@google.com>
> ---
>  drivers/mtd/spi-nor/gigadevice.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
> index ef1edd0add70..8eec6557b036 100644
> --- a/drivers/mtd/spi-nor/gigadevice.c
> +++ b/drivers/mtd/spi-nor/gigadevice.c
> @@ -16,6 +16,7 @@ gd25q256_post_bfpt(struct spi_nor *nor,
>  	/*
>  	 * GD25Q256C supports the first version of JESD216 which does not define
>  	 * the Quad Enable methods. Overwrite the default Quad Enable method.
> +	 * Otherwise set TB to SR(6).
>  	 *
>  	 * GD25Q256 GENERATION | SFDP MAJOR VERSION | SFDP MINOR VERSION
>  	 *      GD25Q256C      | SFDP_JESD216_MAJOR | SFDP_JESD216_MINOR
> @@ -25,6 +26,8 @@ gd25q256_post_bfpt(struct spi_nor *nor,
>  	if (bfpt_header->major == SFDP_JESD216_MAJOR &&
>  	    bfpt_header->minor == SFDP_JESD216_MINOR)
>  		nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
> +	else
> +		nor->flags |= SNOR_F_HAS_SR_TB | SNOR_F_HAS_SR_TB_BIT6;

why do you tie locking by SFDP absence?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
