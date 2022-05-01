Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354C7C433EF
	for <linux-mtd@archiver.kernel.org>; Sun,  1 May 2022 08:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QQWUYAR7DkL7n9cHCo8Vq9C9CrmguctlUCgQRfZEYZ4=; b=WbJhOnlyiV9waw
	peMHbGN92cbaUjsGZ/gWosLxX2YEMP4lIuAHOqmJbc1W4ROpwamv0UjK9IRgBnvt7iyS0qalj0AqI
	jcPlmF31dq7mfUmTRR13ppJhiXhk4B6P7Rl2Idzh1df3zCylZMxMOZ9O4Jq8dE0naQo1oCKGWc/B1
	SHaXdsS2/ujEL6L6S7CfpUwwOy4MhW3RqIEfrw43RYdeG5dMqXiz5ta3YHK+jM+VOSkaKo3oGMl8k
	1NmPDWzYdoNUEUcGw+qSFtMAd9zCv/o4RiQK037fvEAR0fT1oVvhL7mbgI0CLog7bUyYNEL4Myw9O
	vnSn2xs0FqsQfDvoRe9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nl4lg-00FtBa-Bl; Sun, 01 May 2022 08:17:24 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nl4le-00FtAv-38
 for linux-mtd@lists.infradead.org; Sun, 01 May 2022 08:17:23 +0000
Received: by mail-ed1-x535.google.com with SMTP id y21so13527363edo.2
 for <linux-mtd@lists.infradead.org>; Sun, 01 May 2022 01:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EYMxrPRY3J2WekXOQlUGmVM4fNTTeU4P6bnwFue9aN0=;
 b=pM4ivJZfiRe9iOTmARBovljjO2oq0pxe5QakrVO842DZpiF8Hg5fhgRsqzTPOk9rG0
 SOOEG94VQcn8py37Q8Rt0HGcDjjLrvEdjYaT647NMzowT2O4JiFZApNqxcSJKR4AJfCe
 pil4A8nCEpq/uvRz0WpR3qeRi6Hf9bQF98ZrNIa72HQodV+6b7K7odIz3/HWXTf0bCtL
 U4FOelqw2VksG0E82Hv4BQ1lsrOZs15lc0d9J9DIcR+7zKwV0p7/tEQDcc8s8+2rkEME
 unctWNewVWjFmz+FAQ9uEH/AQg1CsB7E8ksPtnYQi7IkelE0WJLDG9VgtUIMFO/FPD/V
 b85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EYMxrPRY3J2WekXOQlUGmVM4fNTTeU4P6bnwFue9aN0=;
 b=vxx9p9Q8kcObUNbwN4vRb5E+2IHDc1rK/9dlUnRzvK0xNpvDcBpIB/sUzMmZ9wdtvO
 GuO4F0Gyld/MLVE7x35cefsINVkQv1hrtiXikld70q0HwRosEj4EeUTw+7RzNKK24JJg
 SWUZktUsYd795AaeSbSzl3HsbwMZpT02UzeHnbOkUZmpH9BtCN31c6oBCUyMTvbLl8NB
 MqddFcjvjJPLvhmELu8GPPbUq0irlZXIYLZmm6yTymlrbxJsqQMRMta2d5ioJn9cNneS
 D3hyq30m6WlQ2py/bdSuJ7vZyozm2VIZoPOq7FSlT2EVHUgKL8ezwJ6cwPmkQcGaWM6h
 LoSA==
X-Gm-Message-State: AOAM530SYYFQ+wjoldOUy+Z90rV3g5ahUmJB2sQwuJ6NFOMSn1si9Fln
 PKmy3jd0eFns1IJCa6Eues/0fA==
X-Google-Smtp-Source: ABdhPJwJfKYprVtgSwMv1foq2/oCXs/sEvqyI1//Vt1pmWYFBXMcO/AaEcENrAF0CEIlNJkmrTdKZw==
X-Received: by 2002:a05:6402:11cd:b0:427:bda5:542f with SMTP id
 j13-20020a05640211cd00b00427bda5542fmr1369606edw.290.1651393039410; 
 Sun, 01 May 2022 01:17:19 -0700 (PDT)
Received: from [192.168.0.182] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 zp15-20020a17090684ef00b006f3ef214e4esm2335099ejb.180.2022.05.01.01.17.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 May 2022 01:17:18 -0700 (PDT)
Message-ID: <6c3ba4a7-80b0-5fd1-eb08-1f9e256b02c4@linaro.org>
Date: Sun, 1 May 2022 10:17:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: partitions: Add binding for
 Sercomm parser
Content-Language: en-US
To: Mikhail Zhilkin <csharper2005@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: NOGUCHI Hiroshi <drvlabo@gmail.com>, Karim <Karimdplay@gmail.com>,
 M <x1@disroot.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220406195557.1956-1-csharper2005@gmail.com>
 <20220406195946.2019-1-csharper2005@gmail.com>
 <8d0d8b27-35ff-3693-cf80-897b80c26b4e@linaro.org>
 <57bebf2f-af4c-b2d9-10e5-19e5104946fb@gmail.com>
 <29cfa017-bbaf-3aba-fe1d-06771957dbaa@linaro.org>
 <1b391399-984b-7a63-3265-62ef09caec39@gmail.com>
 <bd533827-b575-caad-c230-af060851b231@gmail.com>
 <db70e53b-7484-43bf-e9c8-b6a2dce1fbb5@linaro.org>
 <25da3f43-c46e-8108-2da9-0e4f2b7cc1a4@gmail.com>
 <b279040a-a782-a2ca-2acb-2d8f07709081@linaro.org>
 <1c19faf9-fc1c-9adf-d038-97b673a8f0be@gmail.com>
 <a84df850-149e-9656-43fa-1f040368a9f1@linaro.org>
 <0450d781-c506-c28e-a0e5-435bee16721f@gmail.com>
 <2e51842a-d2c9-8953-13aa-02ad3abb3f14@linaro.org>
 <ee5f293a-e59a-03d8-d9e4-ef35d33b5383@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ee5f293a-e59a-03d8-d9e4-ef35d33b5383@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_011722_178311_F7E46172 
X-CRM114-Status: GOOD (  10.50  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMzAvMDQvMjAyMiAyMDo1NCwgTWlraGFpbCBaaGlsa2luIHdyb3RlOgo+IMKgcGF0dGVyblBy
b3BlcnRpZXM6Cj4gwqDCoCAiQFswLTlhLWZdKyQiOgo+IC3CoMKgwqAgJHJlZjogInBhcnRpdGlv
bi55YW1sIyIKPiArwqDCoMKgIGFsbE9mOgo+ICvCoMKgwqDCoMKgIC0gJHJlZjogInBhcnRpdGlv
bi55YW1sIyIKPiArwqDCoMKgwqDCoCAtIGlmOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqAgcHJvcGVy
dGllczoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlOgo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjb250YWluczoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGNvbnN0OiBzZXJjb21tLHNjLXBhcnRpdGlvbnMKPiArwqDCoMKgwqDCoMKgwqAgdGhlbjoK
PiArwqDCoMKgwqDCoMKgwqDCoMKgIHByb3BlcnRpZXM6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc2VyY29tbSxzY3BhcnQtaWQ6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRlc2Ny
aXB0aW9uOiBQYXJ0aXRpb24gaWQgaW4gU2VyY29tbSBwYXJ0aXRpb24gbWFwLiBQYXJzZXIKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVzZXMgdGhpcyBpZCB0byBnZXQgcGFydGl0
aW9uIG9mZnNldCBhbmQgc2l6ZSB2YWx1ZXMgZnJvbQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZHluYW1pYyBwYXJ0aXRpb24gbWFwLgoKUGFydGl0aW9uIG9mZnNldCBhbmQgc2l6
ZSB2YWx1ZXMgYXJlIG5vdCBkZXJpdmVkIGZyb20gc2NwYXJ0LWlkLiBJIGFtCnNvcnJ5IGJ1dCBh
ZnRlciBhbGwgdGhlc2UgcXVlc3Rpb25zIC0gaXQncyB0aGUgdGhpcmQgdGltZSBub3cgLSB5b3UK
bmV2ZXIgYW5zd2VyIHdoeSBkbyB5b3UgbmVlZCB0aGlzIHByb3BlcnR5IGFuZCB3aGF0IGlzIGl0
IHVzZWQgZm9yLiBGcm9tCmFsbCB0aGUgZXhhbXBsZXMgaXQgY291bGQgYmUgc2ltcGx5IHJlbW92
ZWQgYW5kIHRoZSBwYXJ0aXRpb24gbWFwIHdpbGwKYmUgZXhhY3RseSB0aGUgc2FtZS4KCgpCZXN0
IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
