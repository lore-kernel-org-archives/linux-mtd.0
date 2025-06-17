Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6FAC71136
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Jun 2025 14:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mXrdFy/qIvvy7I2DZvNnVJ3b/2BXJpvGlWQsoXknYEA=; b=Ff++ZFE2XFL4Eg
	17jHg70tq9Ns2EyWSU4y4eit77HIkYkAWqyEHF9i+9EVCZ6H02s5Z/6MVxDYprGKEmy0lPP+fz+4k
	lca3x11LDWdQpfahyb+K2FTsXj8NQbFECAIoz58yJjssRSbhMGQjV9+4SBPMy4PeZ3iXjwLjT6Y0p
	e4t61dbfRK9xrtaTm9Gaib1dm5ShK1DH1rcm4uMtQbHOURRaAs5lfUPNOghH3dpCAUnLdLWXKwUDX
	nYUYhN9lBhPF9teq73Qs0o3vX7c5usdC6NyjJzYmcSh4ASh0dkzDANX7b/KG/JHdMK9W4hrIjDYvq
	W7thb6y+YDOf3JlLSn7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXOr-00000007ZvG-1UBW;
	Tue, 17 Jun 2025 14:34:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWnF-00000007RVp-41Xx
	for linux-mtd@bombadil.infradead.org;
	Tue, 17 Jun 2025 13:56:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6GYGO3PqUAk6wYvDYU50sloIAHeesfDNcgv1p6PqGVE=; b=ccqdlpGrEpwv6FinhaCZRTEgrV
	iq9+fdcsosK2erMpdzdK8xzIzyE2tu5j+xGFgMMp//OiEqUFBI2lI5pl0ATsc/mx6WoDsp4+EKn+g
	W8ira6X1qNoABgZutsTtOOKK5l6zdNJiIdyeNQj0xBWXoiyNuKG5o3WLzgRAo3gObU58lWUEvZoOf
	UdJPZwn6YIKZ/zllNRl9Lpsf2LoXndig2NKx2vGiDVaHAe13XL5cmSEALmqudVbdb7JkGzkPiMkYY
	mLfocNszv8eEdxAZCw98JkmTtPcmVsCB/4Y/EZdAbq+oeMQpYV7hKwbH4O16mohySR3hhka65/FpA
	MYx2bZIQ==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWnC-00000003oeL-46rl
	for linux-mtd@lists.infradead.org;
	Tue, 17 Jun 2025 13:56:05 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-234b9dfb842so52243265ad.1
        for <linux-mtd@lists.infradead.org>; Tue, 17 Jun 2025 06:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750168560; x=1750773360; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=6GYGO3PqUAk6wYvDYU50sloIAHeesfDNcgv1p6PqGVE=;
        b=IikzyNsxjk1QlnvxufA8IPLOXYi1TeROxdVDMrRk/xJcaYKU8DU0GN90QkU4g5fmte
         cHBVkCQAekEfPC39nEalwIm1ZFkb7C9FgyVBySsA8X0KLbMwrYVs24iSziW2W5wEN8hH
         6/KJAQ1njvQ6Yr5W2m1H8eLJVeML03TY5KXo/UxnyDE7IFgHR42oK8oULaS0tNnu6xcg
         v8T+afqdghqhuCc3Zp3ymnLe2wxvyVdq66AH5ckSerixRQbqdSvhAd+d9PxGuEUBlJtR
         qNQvFm0TMs2LF5ldwLxdmOKZ5KjExuDUgG3htQG/RjdUjyWVZoB38FH6+whBetKxPdfu
         3OGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750168560; x=1750773360;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GYGO3PqUAk6wYvDYU50sloIAHeesfDNcgv1p6PqGVE=;
        b=NycOouvyFVGFXWRQXMd3tVqlNZXa7xA2euYh+wsC46rffijTe8qRci8XvtpWIvapx0
         T+0PzuoZ3pkluH/ChFCuAgSV5t7jASRrrcrygOkpKHZ0EF9ndfNF0TdhZdo/mpNk4sME
         uLqEKWPpouhtwKh14ollqUsvikJOZac7CeRybJ855VTMuRVzrKCyZMJnwcSorCuN/N/4
         7So7ppNty7N6RbAi/vx7ecGu3fKirGhDlU4i11kTvtralebFd7lB1ljtYWTKU7PXZnAD
         xKCSCVH3pUkPZcUMQ4IQS4R6jIUe3fmjPSpk8PQOftYmaj5+ylXKltnfQaNnBavbVIN3
         cS8g==
X-Forwarded-Encrypted: i=1; AJvYcCV8UyxVQV4HZ65Tnz/0HXsLs6VSYNQThM4qJCKc2ZpF1q4WDNtyyHhx84WTFhpvHM5a7nyDUkNYmE8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz976Xy1LS1MpJm9c1kG5cR9fKY+kefy/89Kk+1JnyYIB1Kbwuu
	KJ9JC1X7MDAUGSnSsTZSO1a9mgtb7o2kWk58aO2kn0tDLtFLVg0vfgzJ
X-Gm-Gg: ASbGnctKIecj+EptDUexlNPu1buaTZkJLccov3QutZN51mrb02gidiKav9onPjgMGRK
	mIrB5JKLDtuN4xWOc5tGBVkbyXNaDcYemItRRPyeeMDcz6T1/mwtmYicd+RmXqAiqCvuXCftC1t
	ck4ejwjImdkdm1uSisOizFQDcHokchgOJcOK2uco6GBEoNoFgcHx697tICQyVUrJWfh7tJDZ7cS
	wCF025CroQlZsOuQWJDgELqcb2yL2Sz6IYcNcIadHllOj1NSgX4U5C9KNFTk8gwKLtWexZ8y9Ji
	5ZIw7UGDBAEhlDynEKYcykkaYAldx6xlyJltjEMpPiH+F6nDHTOAaTC78vi8DP87uC4NbXutncp
	HuPUdKrcvlOwHQEC/mqGuhk9H/77zFyA8kAJ6n3H8nNx0+A==
X-Google-Smtp-Source: AGHT+IGK7D4booCXbCr49e61/5A1KX1h+PhquGHVhMJUA/w/iZawxZj5a96MB+d/7THhsOmVdE/MXw==
X-Received: by 2002:a17:902:ebc6:b0:235:1b3e:c01c with SMTP id d9443c01a7336-2366b3c3a6dmr210183925ad.39.1750168559664;
        Tue, 17 Jun 2025 06:55:59 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88c04bsm79621145ad.10.2025.06.17.06.55.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 06:55:59 -0700 (PDT)
Message-ID: <fe5d74d2-225f-4718-b6bd-8f3055ecc49d@roeck-us.net>
Date: Tue, 17 Jun 2025 06:55:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "mtd: core: always create master device"
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Michael Walle <mwalle@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, pratyush <pratyush@kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Alexander Usyskin <alexander.usyskin@intel.com>
References: <20250613180722.1268159-1-miquel.raynal@bootlin.com>
 <b16dbc82976e2454afb6aa53ea97bd0f@kernel.org>
 <1923752382.134392168.1750062114160.JavaMail.zimbra@nod.at>
 <deb4072f-f6b3-4d7c-b19b-109570183aa9@roeck-us.net>
 <87plf2mqyf.fsf@bootlin.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <87plf2mqyf.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_145603_098992_9F57921F 
X-CRM114-Status: GOOD (  13.18  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gNi8xNy8yNSAwNjozNSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSwKPiAKPiBPbiAxNi8w
Ni8yMDI1IGF0IDA5OjQ5OjU1IC0wNywgR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0
PiB3cm90ZToKPiAKPj4gT24gNi8xNi8yNSAwMToyMSwgUmljaGFyZCBXZWluYmVyZ2VyIHdyb3Rl
Ogo+Pj4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+Pj4+IFZvbjogIk1pY2hhZWwg
V2FsbGUiIDxtd2FsbGVAa2VybmVsLm9yZz4KPj4+Pj4gVGhpcyByZXZlcnRzIGNvbW1pdCAwYWE3
YjM5MGZjNDBhODcxMjY3YTIzMjhiYmJlZmNhOGIzN2FkMzA3Lgo+Pj4+Pgo+Pj4+PiBTaWduZWQt
b2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+Pj4+Cj4+
Pj4gU2hvdWxkIHRoaXMgaGF2ZSBhIEZpeGVzIHRhZz8KPj4+IFNpbmNlIHdlJ3JlIGluIHRoZSBz
YW1lIHJlbGVhc2UgY3ljbGUgbm8gYmFjay1wb3J0aW5nIGlzIG5lZWRlZC4KPj4+Cj4+Cj4+IFRo
aXMgYXBwbGllcyB0byBTdGFibGU6IHRhZ3MsIGJ1dCBub3QgdG8gRml4ZXM6LiBBIHBhdGNoIGZp
eGluZyBhCj4+IHByZXZpb3VzIHBhdGNoIGZyb20gdGhlIHNhbWUgcmVsZWFzZSBjeWNsZSBzaG91
bGQgc3RpbGwgYmUgdGFnZ2VkCj4+IHdpdGggRml4ZXM6Lgo+IAo+IEFsbCByaWdodCwgSSdsbCBh
ZGQgdGhlIEZpeGVzIGFuZCBzZW5kIGEgdjIuCj4gCj4gSW4gdGhlIG1lYW4gdGltZSwgYW55IGFj
aydzIHRvIHByb3ZpZGUgZm9sa3M/IEknZCBsaWtlIHRvIG1lcmdlIGl0IHRoaXMKPiB3ZWVrIGFu
ZCBhdm9pZCBvdGhlciBidWcgcmVwb3J0cy4KPiAKCkhlcmUgYXJlIGZ1bGwgdGVzdCByZXN1bHRz
OgoKQnVpbGQgcmVzdWx0czoKCXRvdGFsOiAxNjQgcGFzczogMTY0IGZhaWw6IDAKUWVtdSB0ZXN0
IHJlc3VsdHM6Cgl0b3RhbDogNjM3IHBhc3M6IDYzNyBmYWlsOiAwClVuaXQgdGVzdCByZXN1bHRz
OgoJcGFzczogNTk2Mzc5IGZhaWw6IDAKCkkgc2VudCBhIFRlc3RlZC1ieTogdGFnIG9uIHRoZSBw
YXRjaCBhIG1pbnV0ZSBhZ28uCgpBbmQsIHllcywgSSB0aGluayB0aGlzIHNob3VsZCBiZSBhcHBs
aWVkIGFzIHNvb24gYXMgcG9zc2libGUuCgpBY2tlZC1ieTogR3VlbnRlciBSb2VjayA8bGludXhA
cm9lY2stdXMubmV0PgoKR3VlbnRlcgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
