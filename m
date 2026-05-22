Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC41CD5BAF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2026 04:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0FRQ10r+oppKgfSjQETd/rktfOUUbgTT0fTTf0V9Po0=; b=gF5v1HkuBHYAAq
	WioydSNVl30oFsg/EU6uoI5gPoWv33COm4Zg5BHKJu3mf70i2swnaVTdvz59DEbn/p/rUsjhXx1Eh
	PA93Iju+WcnJT/2nlHfSapQIwZQhr81C4OBfQ2gVggQ70Qcb3hCPFGaOelMPC9QQz5IfP7E9GnqLD
	OKrir77ZCuLbh/7OdBrUVQsyNZDxflevwo5cepb5zm08r5VpMJwo0aYUcgj0CW14kJ4FaMfdg+Ujz
	Sw9DDeANIfIaXLK0GlEj6oboHltLi4uvELesLZhDa9yiRu9HrdEPbbr2ZnSKfQqJgPcUV4DO+GF76
	Yh3Xe7ofKJCBORe6TI0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQHq8-00000009nCc-1K9j;
	Fri, 22 May 2026 04:50:28 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQHq3-00000009nC2-3fPy
	for linux-mtd@lists.infradead.org;
	Fri, 22 May 2026 04:50:25 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2b4650d5f5cso27821625ad.0
        for <linux-mtd@lists.infradead.org>; Thu, 21 May 2026 21:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779425422; x=1780030222; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ygfgtK6c/ApVk6+sFwhRckWVmXDwPluvpIaEn4XkmaA=;
        b=aOMyy29b4nWqPWSyiGWbtwyStYR/Q2+fSe1sc7dMHVdqEGZx+ana0ZmfS/dtRAq+3v
         rcn3Y9rPBew6vtbY93Jj+ydlxflBHV7z9/JJPSGtRvFrTV1SRchbjZmJW4X5A0jEffJA
         0U29bKmZOa28JdAeZLO+d2OcJMc4N70GQzJt/MjQmjP8h1ZL4Venmg4p8lK8xsOeTWx2
         Y2inFCKjquBfKSMaMZ182T1tsOhWOuMNAjb6Lsu33WVOQTMSJHLZ+EBnPiKxp69BiSkA
         Wq9g1qD+jfKujyjgEuRu0aPI7vb7BWJzpUEwrbpgg65seXuD2CI8KpI5y85zuCFaWMoW
         b8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779425422; x=1780030222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ygfgtK6c/ApVk6+sFwhRckWVmXDwPluvpIaEn4XkmaA=;
        b=GsgT+nhi3UIhnJURRfmrAV8aYXR17370d+8N/w5rpIlnBwQZpKSzFA4RyP1XR54lwW
         tX/Tfh5qj5JeHh693MonyvxwAT0NyP/LE0d3PYIq0Es0s/uGd31K0PAFXawIArDShrqC
         LiYurK4KEONEz7Osy1qz04N75elLb4oHQ57M8UemGKapfJxLSoo9yF9tpyIjqDFXe2pR
         9KPcuiasS9UYG6w+Ho+JnA13GuqV7qVsxqOY6T12j+4Ife7wNAI3uNMyTnohlcoZbFuC
         G6xu6Mtt0B8cFlZD0s3h0gmeBpfnLuSqKCjLwRJKlueJ2AwA516c0Fd2clHFDRU2WYSC
         Mg+g==
X-Forwarded-Encrypted: i=1; AFNElJ8x2/H/QKs9vkDneWPgV+rqLqRdcEIGwOvRUOll/ZRL/VaxDydi+od7YtV3agR89eoIKOmOrlYoxb0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxhit6CBrLxYD4QGtAxckKwxm2njVB4nLDneC+1bTSFZ78F+la8
	Az0BWkvGNFv3Nb2M4GMhzQf7/Dkb1oyLDh8A+AK9Se9xZvGRO2EGMVSi
X-Gm-Gg: Acq92OExRW/ZLAH4Mne32RcR7eG0yox0NY9/cSvmwR3nqGSLMea7ssl290+2EqsajXk
	0TY0YuE7Gk07pg+/4PN/DVCdXMp8Hk+V4h8RwLRLr7vQQZj890KdkzroUD7Ru9QCJ6bDjq3b6s+
	NvksQcC7oc5mgCp1a9ZBVQUhTaNCCNzAKBcOoUH8uM53qIHMmcMJ5dLp+QZ+hD2DImLR48Y4aWP
	F3ugrO4pz74/JeX+C8y0sHxCHs/0/1ssU15HQTT23GIJrI4qSVQCdD7d9bG2a6pr+8Fd/mNdtpo
	blW6QNRHIYAbmQ2WLcxDFb1z7cFWcHVRPzYYyLUcNVdELSQVcK+M6A7Qkyw5O+onRV9fisDbqCl
	0qvGYygDav55WDTmQHMDSPyVTyHPKWxvRtsgoK+DV8Z708M7tNig/bbdbEsH+s8e5NvdBnAot8E
	KTsOUpj6aA9YnAoVvxyUdQ6h18eBEFDIxCp0H5w3oqAohX0O40gMrJEs72Bb/YSQLDtZRBOMjR8
	Q==
X-Received: by 2002:a17:902:cec7:b0:2b2:ccfb:8387 with SMTP id d9443c01a7336-2beb0613c3bmr21711645ad.28.1779425422247;
        Thu, 21 May 2026 21:50:22 -0700 (PDT)
Received: from [192.168.0.10] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58c3016sm2731775ad.56.2026.05.21.21.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 21:50:21 -0700 (PDT)
Message-ID: <c2fa6bfc-bf12-4953-a2e6-b7a424884e34@gmail.com>
Date: Fri, 22 May 2026 13:50:17 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Add JEDEC ID table entries for additional ISSI SPI-NOR
 devices.
To: Jeffrey Yu <jeyu@issi.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ji-Ho Kim <jhkim@issi.com>, "Mutya, Havish" <havish.mutya@amd.com>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
References: <LV8PR19MB85977D6569B526DB1B068CACB6382@LV8PR19MB8597.namprd19.prod.outlook.com>
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <LV8PR19MB85977D6569B526DB1B068CACB6382@LV8PR19MB8597.namprd19.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_215023_922623_B554BFC3 
X-CRM114-Status: GOOD (  10.38  )
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

Hi,

On 5/11/2026 3:06 PM, Jeffrey Yu wrote:
> Add JEDEC ID table entries for additional ISSI SPI-NOR
>  devices.
> 
> These parts previously not yet supported.
> With these entries, Linux software can match the device by JEDEC ID
> and use the existing ISSI SPI-NOR device handling.
> 
> Newly added devices include:
>   - IS25LP512MJ  (JEDEC 0x9d6020)
>     https://www.issi.com/WW/pdf/25LP-WP512MJ.pdf
>   - IS25WP512MJ  (JEDEC 0x9d7020)
>     https://www.issi.com/WW/pdf/25LP-WP512MJ.pdf
>   - IS25LP010E   (JEDEC 0x9d4011)
>     https://www.issi.com/WW/pdf/25LP-WP040E-020E-010E-512E-025E.pdf
>   - IS25LP020E   (JEDEC 0x9d4012)
>     https://www.issi.com/WW/pdf/25LP-WP040E-020E-010E-512E-025E.pdf
>   - IS25LP040E   (JEDEC 0x9d4013)
>     https://www.issi.com/WW/pdf/25LP-WP040E-020E-010E-512E-025E.pdf
>   - IS25LP01GJ   (JEDEC 0x9d6021)
>     https://www.issi.com/WW/pdf/25LP-WP01GJ.pdf
>   - IS25LP02GG   (JEDEC 0x9d6022)
>     https://www.issi.com/WW/pdf/25LP-WP02GG.pdf
>   - IS25LP02GJ   (JEDEC 0x9d6022)
>     https://www.issi.com/WW/pdf/25LP-WP02GJ.pdf
>   - IS25WP01GG   (JEDEC 0x9d7021)
>     https://www.issi.com/WW/pdf/25LP-WP01GG.pdf
>   - IS25WP01GJ   (JEDEC 0x9d7021)
>     https://www.issi.com/WW/pdf/25LP-WP01GJ.pdf
>   - IS25WJ128F   (JEDEC 0x9d7118)
>     https://www.issi.com/WW/pdf/25WJ128F.pdf
>   - IS25WP02GG   (JEDEC 0x9d7022)
>     https://www.issi.com/WW/pdf/25LP-WP02GG.pdf
>   - IS25WP02GJ   (JEDEC 0x9d7022)
>     https://www.issi.com/WW/pdf/25LP-WP02GJ.pdf
> 
> Signed-off-by: Jeff Yu <jeyu@issi.com>

Please read and follow the guideline [1].
Use Link: tags for datasheet references.

> ---
>  drivers/mtd/spi-nor/issi.c | 571 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 571 insertions(+)
>  create mode 100644 drivers/mtd/spi-nor/issi.c
> 
The issi.c is existing file. Patch must contain changes you made only.

There are many style errors in this patch.
Please run 'scripts/checkpatch.pl --strict' to detect and fix errors.

Thanks,
Takahiro

[1] https://docs.kernel.org/driver-api/mtd/spi-nor.html


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
